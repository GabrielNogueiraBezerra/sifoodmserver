unit webservice_repository;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uDWDatamodule, uDWAbout, uRESTDWServerEvents, uRESTDWBase, uDWJSONObject,
  Vcl.ExtCtrls, Vcl.Menus, uDWConsts, IdGlobal, Vcl.StdCtrls, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, Vcl.AppEvnts, IdStack,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Def, FireDAC.Phys,
  FireDAC.Comp.Client;

type
  Twebservice_repository_dm = class(TServerMethodDataModule)
    Eventos: TDWServerEvents;
    Service: TRESTServicePooler;
    procedure ServerMethodDataModuleCreate(Sender: TObject);

    procedure EventosEventsusuariosReplyEventByType(var Params: TDWParams;
      var Result: string; const RequestType: TRequestType;
      var StatusCode: Integer; RequestHeader: TStringList);
    procedure EventosEventscomandasReplyEventByType(var Params: TDWParams;
      var Result: string; const RequestType: TRequestType;
      var StatusCode: Integer; RequestHeader: TStringList);
    procedure EventosEventssetoresReplyEventByType(var Params: TDWParams;
      var Result: string; const RequestType: TRequestType;
      var StatusCode: Integer; RequestHeader: TStringList);
    procedure EventosEventscomandaReplyEventByType(var Params: TDWParams;
      var Result: string; const RequestType: TRequestType;
      var StatusCode: Integer; RequestHeader: TStringList);
    procedure EventosEventssecoesReplyEventByType(var Params: TDWParams;
      var Result: string; const RequestType: TRequestType;
      var StatusCode: Integer; RequestHeader: TStringList);
    procedure EventosEventsprodutosReplyEventByType(var Params: TDWParams;
      var Result: string; const RequestType: TRequestType;
      var StatusCode: Integer; RequestHeader: TStringList);
    procedure EventosEventsconferenciaDetalhadaReplyEventByType
      (var Params: TDWParams; var Result: string;
      const RequestType: TRequestType; var StatusCode: Integer;
      RequestHeader: TStringList);
    procedure EventosEventsconferenciaResumidaReplyEventByType
      (var Params: TDWParams; var Result: string;
      const RequestType: TRequestType; var StatusCode: Integer;
      RequestHeader: TStringList);
    procedure EventosEventsitensComandaReplyEventByType(var Params: TDWParams;
      var Result: string; const RequestType: TRequestType;
      var StatusCode: Integer; RequestHeader: TStringList);
    procedure EventosEventsadicionaisReplyEventByType(var Params: TDWParams;
      var Result: string; const RequestType: TRequestType;
      var StatusCode: Integer; RequestHeader: TStringList);
    procedure EventosEventsimprimeComandaReplyEventByType(var Params: TDWParams;
      var Result: string; const RequestType: TRequestType;
      var StatusCode: Integer; RequestHeader: TStringList);
    procedure EventosEventsconsultaComandaReplyEventByType
      (var Params: TDWParams; var Result: string;
      const RequestType: TRequestType; var StatusCode: Integer;
      RequestHeader: TStringList);
    procedure EventosEventstransfereItemReplyEventByType(var Params: TDWParams;
      var Result: string; const RequestType: TRequestType;
      var StatusCode: Integer; RequestHeader: TStringList);
    procedure EventosEventsprodutoReplyEventByType(var Params: TDWParams;
      var Result: string; const RequestType: TRequestType;
      var StatusCode: Integer; RequestHeader: TStringList);
    procedure EventosEventsitensTransferenciaReplyEventByType
      (var Params: TDWParams; var Result: string;
      const RequestType: TRequestType; var StatusCode: Integer;
      RequestHeader: TStringList);
    procedure EventosEventsquantidade_comandasReplyEventByType
      (var Params: TDWParams; var Result: string;
      const RequestType: TRequestType; var StatusCode: Integer;
      RequestHeader: TStringList);
    procedure TrimAppMemorySize;
    procedure EventosEventsbuscaComandaReplyEventByType(var Params: TDWParams;
      var Result: string; const RequestType: TRequestType;
      var StatusCode: Integer; RequestHeader: TStringList);
  public
    procedure addResponse(value: String);
    procedure addRequest(value: String);

    procedure iniciaServico(Port: Integer);
    procedure encerraServico;
    function execute_event(NameUnit, NameClass: String;
      const RequestType: TRequestType; var Params: TDWParams): String;
  end;

var
  webservice_repository_dm: Twebservice_repository_dm;
  requestWebservice: TMemo;
  responseWebservice: TMemo;

implementation

uses
  System.JSON, evento, System.Rtti, System.TypInfo;

{$R *.dfm}
{ Tdashboard_repository_dm }

procedure Twebservice_repository_dm.addRequest(value: String);
var
  DataHora: TDateTime;
begin
  if value <> '' then
  begin
    DataHora := Now;
    requestWebservice.lines.add(datetimetostr(DataHora) + '. ' + value);
  end;
end;

procedure Twebservice_repository_dm.addResponse(value: String);
var
  DataHora: TDateTime;
begin
  if value <> '' then
  begin
    DataHora := Now;
    responseWebservice.lines.add(datetimetostr(DataHora) + '. ' + value);
  end;
end;

procedure Twebservice_repository_dm.encerraServico;
begin
  if Service.Active then
    Service.Active := false;
end;

function Twebservice_repository_dm.execute_event(NameUnit, NameClass: String;
  const RequestType: TRequestType; var Params: TDWParams): String;
var
  evento: TEvento;
  RttiContext: TRttiContext;
  RttiInstanceType: TRttiInstanceType;
  RttiMethod: TRttiMethod;
  Instance: TValue;
begin
  try

    addRequest(GetEnumName(TypeInfo(TRequestType), Integer(RequestType)) + ' ' +
      NameUnit);

    RttiContext := TRttiContext.Create;
    RttiInstanceType := RttiContext.FindType('evento_' + NameUnit + '.' +
      NameClass).AsInstance;

    RttiMethod := RttiInstanceType.GetMethod('Create');
    Instance := RttiMethod.Invoke(RttiInstanceType.MetaclassType, []);

    evento := (Instance.AsObject as TEvento);
    Result := evento.rtfEvento(RequestType, Params);

  except
    on E: Exception do
    begin
      addResponse(E.message);
    end;
  end;
end;

procedure Twebservice_repository_dm.EventosEventsadicionaisReplyEventByType
  (var Params: TDWParams; var Result: string; const RequestType: TRequestType;
  var StatusCode: Integer; RequestHeader: TStringList);
begin
  Result := execute_event('adicional', 'TEventoAdicional', RequestType, Params);
end;

procedure Twebservice_repository_dm.EventosEventsbuscaComandaReplyEventByType
  (var Params: TDWParams; var Result: string; const RequestType: TRequestType;
  var StatusCode: Integer; RequestHeader: TStringList);
begin
  Result := execute_event('busca_comanda', 'TEventoBuscaComanda',
    RequestType, Params);
end;

procedure Twebservice_repository_dm.EventosEventscomandaReplyEventByType
  (var Params: TDWParams; var Result: string; const RequestType: TRequestType;
  var StatusCode: Integer; RequestHeader: TStringList);
begin
  Result := execute_event('comanda', 'TEventoComanda', RequestType, Params);
end;

procedure Twebservice_repository_dm.EventosEventscomandasReplyEventByType
  (var Params: TDWParams; var Result: string; const RequestType: TRequestType;
  var StatusCode: Integer; RequestHeader: TStringList);
begin
  Result := execute_event('comandas', 'TEventoComandas', RequestType, Params);
end;

procedure Twebservice_repository_dm.
  EventosEventsconferenciaDetalhadaReplyEventByType(var Params: TDWParams;
  var Result: string; const RequestType: TRequestType; var StatusCode: Integer;
  RequestHeader: TStringList);
begin
  Result := execute_event('conferencia_detalhada',
    'TEventoConferenciaDetalhada', RequestType, Params);
end;

procedure Twebservice_repository_dm.
  EventosEventsconferenciaResumidaReplyEventByType(var Params: TDWParams;
  var Result: string; const RequestType: TRequestType; var StatusCode: Integer;
  RequestHeader: TStringList);
begin
  Result := execute_event('conferencia_resumida', 'TEventoConferenciaResumida',
    RequestType, Params);
end;

procedure Twebservice_repository_dm.EventosEventsconsultaComandaReplyEventByType
  (var Params: TDWParams; var Result: string; const RequestType: TRequestType;
  var StatusCode: Integer; RequestHeader: TStringList);
begin
  Result := execute_event('comanda_transferencia',
    'TEventoComandaTransferencia', RequestType, Params);
end;

procedure Twebservice_repository_dm.EventosEventsimprimeComandaReplyEventByType
  (var Params: TDWParams; var Result: string; const RequestType: TRequestType;
  var StatusCode: Integer; RequestHeader: TStringList);
begin
  Result := execute_event('imprime_comanda', 'TEventoImprimeComanda',
    RequestType, Params);
end;

procedure Twebservice_repository_dm.EventosEventsitensComandaReplyEventByType
  (var Params: TDWParams; var Result: string; const RequestType: TRequestType;
  var StatusCode: Integer; RequestHeader: TStringList);
begin
  Result := execute_event('itens_comanda', 'TEventoItensComanda',
    RequestType, Params);
end;

procedure Twebservice_repository_dm.
  EventosEventsitensTransferenciaReplyEventByType(var Params: TDWParams;
  var Result: string; const RequestType: TRequestType; var StatusCode: Integer;
  RequestHeader: TStringList);
begin
  Result := execute_event('itens_transferencia', 'TEventoItensTransferencia',
    RequestType, Params);
end;

procedure Twebservice_repository_dm.EventosEventsprodutoReplyEventByType
  (var Params: TDWParams; var Result: string; const RequestType: TRequestType;
  var StatusCode: Integer; RequestHeader: TStringList);
begin
  Result := execute_event('produto', 'TEventoProduto', RequestType, Params);
end;

procedure Twebservice_repository_dm.EventosEventsprodutosReplyEventByType
  (var Params: TDWParams; var Result: string; const RequestType: TRequestType;
  var StatusCode: Integer; RequestHeader: TStringList);
begin
  Result := execute_event('produto_secao', 'TEventoProdutoSecao',
    RequestType, Params);
end;

procedure Twebservice_repository_dm.
  EventosEventsquantidade_comandasReplyEventByType(var Params: TDWParams;
  var Result: string; const RequestType: TRequestType; var StatusCode: Integer;
  RequestHeader: TStringList);
begin
  Result := execute_event('quantidade_comandas', 'TEventoQuantidadeComandas',
    RequestType, Params);
end;

procedure Twebservice_repository_dm.EventosEventssecoesReplyEventByType
  (var Params: TDWParams; var Result: string; const RequestType: TRequestType;
  var StatusCode: Integer; RequestHeader: TStringList);
begin
  Result := execute_event('secao', 'TEventoSecao', RequestType, Params);
end;

procedure Twebservice_repository_dm.EventosEventssetoresReplyEventByType
  (var Params: TDWParams; var Result: string; const RequestType: TRequestType;
  var StatusCode: Integer; RequestHeader: TStringList);
begin
  Result := execute_event('setores', 'TEventoSetores', RequestType, Params);
end;

procedure Twebservice_repository_dm.EventosEventstransfereItemReplyEventByType
  (var Params: TDWParams; var Result: string; const RequestType: TRequestType;
  var StatusCode: Integer; RequestHeader: TStringList);
begin
  Result := execute_event('transfere_item', 'TEventoTransfereItem',
    RequestType, Params);
end;

procedure Twebservice_repository_dm.EventosEventsusuariosReplyEventByType
  (var Params: TDWParams; var Result: string; const RequestType: TRequestType;
  var StatusCode: Integer; RequestHeader: TStringList);
begin
  Result := execute_event('login', 'TEventoLogin', RequestType, Params);
end;

procedure Twebservice_repository_dm.iniciaServico(Port: Integer);
begin
  Service.Active := false;

  if not Service.Active Then
  begin
    Service.ServerParams.HasAuthentication := false;
    Service.ServicePort := Port;
    Service.ForceWelcomeAccess := false;
    Service.Active := true;

    addRequest('Aceitando requisições...');
  end;
end;

procedure Twebservice_repository_dm.ServerMethodDataModuleCreate
  (Sender: TObject);
begin
  Service.ServerMethodClass := Twebservice_repository_dm;
  Service.Active := false;
end;

procedure Twebservice_repository_dm.TrimAppMemorySize;
var
  MainHandle: THandle;
begin
  try
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID);
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF);
    CloseHandle(MainHandle);
  except
  end;
  Application.ProcessMessages;
end;

end.
