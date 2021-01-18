unit dashboard_repository;

interface

uses
  System.SysUtils, System.Classes, IdUDPServer, IdGlobal, IdSocketHandle,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.AppEvnts, Vcl.Menus, IdBaseComponent, IdComponent,
  IdUDPBase, Vcl.StdCtrls;

type
  Tdashboard_repository_dm = class(TDataModule)
    IdUDPServer: TIdUDPServer;
    pmMenu: TPopupMenu;
    pmiRestauraApp: TMenuItem;
    N1: TMenuItem;
    pmiSairAPP: TMenuItem;
    ApplicationEvents: TApplicationEvents;
    TrayIcon: TTrayIcon;
    Timer: TTimer;
    procedure DataModuleCreate(Sender: TObject);
    procedure IdUDPServerUDPRead(AThread: TIdUDPListenerThread;
      const AData: TIdBytes; ABinding: TIdSocketHandle);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
  private
    { Private declarations }
    FIdAplicativo: Integer;
  public
    { Public declarations }
    FListaIps: TStringList;
    portaServico: Integer;

    function ConsultaEmpresas: TStrings;
    function ConsultaLicenca(CNPJ: String): String;
    function ConsultaChave(Src: String): String;
    function ValidaChave(Src, CNPJ: String): Boolean;
    procedure carregaLicencas;

    procedure DeletaChave(CNPJ: String);
    procedure InsereChave(Src, CNPJ: String);
    procedure carregaIps;

    procedure addResponse(value: String);
    procedure addRequest(value: String);

  end;

var
  dashboard_repository_dm: Tdashboard_repository_dm;
  requestDashboard: TMemo;
  responseDashboard: TMemo;

implementation

uses
  uRESTDWPoolerDB, uConexaoFiredac, uConexaoRest, utils, IdStack;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ Tdashboard_repository_dm }

procedure Tdashboard_repository_dm.addRequest(value: String);
var
  DataHora: TDateTime;
begin
  if value <> '' then
  begin
    DataHora := Now;
    requestDashboard.lines.add(datetimetostr(DataHora) + '. ' + value);
  end;
end;

procedure Tdashboard_repository_dm.addResponse(value: String);
var
  DataHora: TDateTime;
begin
  if value <> '' then
  begin
    DataHora := Now;
    responseDashboard.lines.add(datetimetostr(DataHora) + '. ' + value);
  end;
end;

procedure Tdashboard_repository_dm.ApplicationEventsException(Sender: TObject;
  E: Exception);
begin
  addResponse(E.message);
end;

procedure Tdashboard_repository_dm.carregaIps;
begin
  FListaIps := TStringList.Create;
  FListaIps.AddStrings(GStack.LocalAddresses);
end;

procedure Tdashboard_repository_dm.carregaLicencas;
var
  Query, QueryInsert: TFDQuery;
  QueryRest: TRESTDWClientSQL;
  sCNPJEmpresas: String;
begin
  if verificaInternet then
  begin
    try

      Query := TConexaoFiredac.getInstancia.prepareStatement
        (' delete from LICENCAS L where L.SISTEMA_ID = :idsistema ');
      Query.ParamByName('idsistema').AsInteger := FIdAplicativo;
      Query.ExecSQL;

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

    except
      on E: Exception do
      begin
        if Assigned(Query) then
          TConexaoFiredac.getInstancia.closeConnection(Query);

        raise Exception.Create
          ('Não foi possível deletar licenças, mensagem retornada: ' +
          E.message);
      end;
    end;

    try
      Query := TConexaoFiredac.getInstancia.prepareStatement
        (' select E.CNPJ_EMP from EMPRESA E ');
      Query.Open;
      Query.Last;
      Query.First;

      while not Query.EOF do
      begin

        try
          QueryRest := TConexaoRest.getInstancia.prepareStatement
            ('select ID, CHAVE from LICENCAS where replace(replace(replace(CNPJ, '
            + quotedstr('.') + ', ' + quotedstr('') + '), ' + quotedstr('-') +
            ', ' + quotedstr('') + '), ' + quotedstr('/') + ', ' + quotedstr('')
            + ') = :cnpj and SISTEMA_ID = :idsistema');
          QueryRest.ParamByName('cnpj').AsString :=
            Query.FieldByName('CNPJ_EMP').AsString;
          QueryRest.ParamByName('idsistema').AsInteger := FIdAplicativo;

          QueryRest.Open;

          if QueryRest.RecordCount > 0 then
          begin
            QueryInsert := TConexaoFiredac.getInstancia.prepareStatement
              ('insert into LICENCAS (CHAVE, SISTEMA_ID, CNPJ) values ' +
              '(:CHAVE, :SISTEMA_ID, :CNPJ)');
            QueryInsert.ParamByName('chave').AsString :=
              QueryRest.FieldByName('CHAVE').AsString;
            QueryInsert.ParamByName('sistema_id').AsInteger := FIdAplicativo;
            QueryInsert.ParamByName('cnpj').AsString :=
              Trim(FormataCNPJ(RemoveChar(Query.FieldByName('CNPJ_EMP')
              .AsString)));
            QueryInsert.ExecSQL;

            if Assigned(QueryInsert) then
              TConexaoFiredac.getInstancia.closeConnection(QueryInsert);
          end;

          if Assigned(QueryRest) then
            TConexaoRest.getInstancia.closeConnection(QueryRest);
        except
          on E: Exception do
          begin

            if Assigned(QueryInsert) then
              TConexaoFiredac.getInstancia.closeConnection(QueryInsert);

            if Assigned(QueryRest) then
              TConexaoRest.getInstancia.closeConnection(QueryRest);

            raise Exception.Create
              ('Não foi possível inserir chaves, mensagem retornada: ' +
              E.message);
          end;
        end;

        Query.Next;
      end;

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);
    except
      on E: Exception do
      begin
        if Assigned(Query) then
          TConexaoFiredac.getInstancia.closeConnection(Query);

        raise Exception.Create
          ('Não foi possível consultar empresas, mensagem retornada: ' +
          E.message);
      end;
    end;
  end;
end;

function Tdashboard_repository_dm.ConsultaChave(Src: String): String;
var
  Query: TFDQuery;
begin
  try
    if Src <> '' then
    begin

      Query := TConexaoFiredac.getInstancia.prepareStatement
        (' select PROC.RESULT from SP_DECRYPT_CHAVE(:key, :SRC, ' +
        quotedstr('D') + ') PROC ');
      Query.ParamByName('key').AsString :=
        'IUAYSGEF165!9NCXM$WYQUEGBNAFS@7B21N8IAL*SIWGG1?H7K8K0 0JEBAIEYEQ/BCY';
      Query.ParamByName('SRC').AsString := Src;
      Query.Open;

      Result := Query.FieldByName('RESULT').AsString;

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);
    end
    else
    begin
      Result := '';
    end;

  except
    on E: Exception do
    begin

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível buscar empresas, mensagem retornada: ' + E.message);
    end;
  end;
end;

function Tdashboard_repository_dm.ConsultaEmpresas: TStrings;
var
  Query: TFDQuery;
begin
  Result := TStringList.Create;

  try
    Query := TConexaoFiredac.getInstancia.prepareStatement
      ('select E.CNPJ_EMP, E.FANTASIA_EMP from EMPRESA E ');
    Query.Open;
    while not Query.EOF do
    begin
      Result.add(FormataCNPJ(Query.FieldByName('CNPJ_EMP').AsString) + ' - ' +
        Query.FieldByName('FANTASIA_EMP').AsString);
      Query.Next;
    end;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

  except
    on E: Exception do
    begin

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível buscar empresas, mensagem retornada: ' + E.message);
    end;
  end;
end;

function Tdashboard_repository_dm.ConsultaLicenca(CNPJ: String): String;
var
  Query: TFDQuery;
begin
  try
    Query := TConexaoFiredac.getInstancia.prepareStatement
      (' select L.CHAVE from LICENCAS L where L.SISTEMA_ID = :SISTEMA_ID ' +
      ' and replace(replace(replace(L.CNPJ, ' + quotedstr('.') + ', ' +
      quotedstr('') + '), ' + quotedstr('-') + ', ' + quotedstr('') + '), ' +
      quotedstr('/') + ', ' + quotedstr('') + ') = :CNPJ ');

    Query.ParamByName('SISTEMA_ID').AsInteger := FIdAplicativo;
    Query.ParamByName('CNPJ').AsString := CNPJ;

    Query.Open;

    Result := Query.FieldByName('CHAVE').AsString;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

  except
    on E: Exception do
    begin

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível buscar chave de licença, mensagem retornada: ' +
        E.message);
    end;
  end;
end;

procedure Tdashboard_repository_dm.DataModuleCreate(Sender: TObject);
var
  servidorSI: Boolean;
begin

  servidorSI := readArqIni('ConfiguracaoLocal', 'sifoodhomologacao', '0') = '1';

  if servidorSI then
    TConexaoRest.getInstancia.config('10.0.3.254', 3305, 100000,
      'TServerMethodDM.RESTDWPoolerFD')
  else
    TConexaoRest.getInstancia.config('gruposi.com.br', 3305, 100000,
      'TServerMethodDM.RESTDWPoolerFD');

  FIdAplicativo := 5;
end;

procedure Tdashboard_repository_dm.DeletaChave(CNPJ: String);
var
  Query: TFDQuery;
begin
  try

    Query := TConexaoFiredac.getInstancia.prepareStatement
      ('delete from LICENCAS L where L.SISTEMA_ID = :SISTEMA_ID and L.CNPJ = :CNPJ');

    Query.ParamByName('SISTEMA_ID').AsInteger := FIdAplicativo;
    Query.ParamByName('CNPJ').AsString := CNPJ;

    Query.ExecSQL;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

  except
    on E: Exception do
    begin

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível excluir chave de licença, mensagem retornada: ' +
        E.message);
    end;
  end;
end;

procedure Tdashboard_repository_dm.IdUDPServerUDPRead
  (AThread: TIdUDPListenerThread; const AData: TIdBytes;
  ABinding: TIdSocketHandle);
var
  sJson: String;
  I: Integer;
begin
  try
    addRequest('Requisitando IP e PORTA');

    sJson := '{';
    sJson := sJson + '"ips": [';
    for I := 0 to FListaIps.count - 1 do
    begin
      sJson := sJson + '{';
      sJson := sJson + '"ip":"' + FListaIps[I] + '"';
      if I = FListaIps.count - 1 then
        sJson := sJson + '}'
      else
        sJson := sJson + '},';
    end;
    sJson := sJson + '],';
    sJson := sJson + '"porta_server":' + inttostr(portaServico) + ',';
    sJson := sJson + '"ip_aplicativo":"' + ABinding.PeerIP + '"';
    sJson := sJson + '}';
    ABinding.SendTo(ABinding.PeerIP, ABinding.PeerPort, sJson,
      ABinding.IPVersion);

  except
    on E: Exception do
    begin
      raise Exception.Create
        ('Não foi possível enviar dados do aplicativo, mensagem retornada: ' +
        E.message);
    end;
  end;
end;

procedure Tdashboard_repository_dm.InsereChave(Src, CNPJ: String);
var
  Query: TFDQuery;
begin
  try

    Query := TConexaoFiredac.getInstancia.prepareStatement
      ('insert into LICENCAS (CHAVE, SISTEMA_ID, CNPJ) values ' +
      '(:SRC, :SISTEMA_ID, :CNPJ)');

    Query.ParamByName('SRC').AsString := Src;
    Query.ParamByName('SISTEMA_ID').AsInteger := FIdAplicativo;
    Query.ParamByName('CNPJ').AsString := CNPJ;

    Query.ExecSQL;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

  except
    on E: Exception do
    begin

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível inserir chave de licença, mensagem retornada: ' +
        E.message);
    end;
  end;
end;

function Tdashboard_repository_dm.ValidaChave(Src, CNPJ: String): Boolean;
var
  Query: TFDQuery;
begin
  Result := false;

  try

    if Src <> '' then
    begin

      Query := TConexaoFiredac.getInstancia.prepareStatement
        (' select PROC.RETORNO, PROC.STATUS, PROC.QUANT_MAQUINAS, PROC.DATA_VENCIMENTO '
        + ' from SP_VALIDA_CHAVE(:SRC, :KEY, :SISTEMAID, :CNPJEMP, :IGRAVALICENCA, null) PROC ');
      Query.ParamByName('SRC').AsString := Src;
      Query.ParamByName('KEY').AsString :=
        'IUAYSGEF165!9NCXM$WYQUEGBNAFS@7B21N8IAL*SIWGG1?H7K8K0 0JEBAIEYEQ/BCY';
      Query.ParamByName('SISTEMAID').AsInteger := 5;
      Query.ParamByName('CNPJEMP').AsString := CNPJ;
      Query.ParamByName('IGRAVALICENCA').AsString := 'N';

      Query.Open;

      Result := Query.FieldByName('STATUS').AsInteger = 0;

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

    end;

  except
    on E: Exception do
    begin

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível validar chave de licença, mensagem retornada: ' +
        E.message);
    end;
  end;
end;

end.
