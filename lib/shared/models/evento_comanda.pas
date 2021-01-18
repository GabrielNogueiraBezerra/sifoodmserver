unit evento_comanda;

interface

uses
  evento, uDWJSONObject;

type
{$TYPEINFO ON}
  TEventoComanda = class(TEvento)
  protected
    function rtfGet(var Params: TDWParams): String; override;
    function rtfPut(var Params: TDWParams): String; override;
  end;

implementation

uses
  FireDAC.Stan.Param, uConexaoFiredac, FireDAC.Comp.Client, utils,
  System.SysUtils, System.JSON;

{ TEventoComanda }

function TEventoComanda.rtfGet(var Params: TDWParams): String;
var
  Query: TFDQuery;
begin
  try

    Query := TConexaoFiredac.getInstancia.prepareStatement
      (' select * from SP_SFM_BUSCA_MESA(:CODSETOR, ' +
      ':DESCMESA, :CODEMP, :CODVEND, :CODCAI, :CONTA, :TOTALPESSOAS)   ');

    Query.ParamByName('CODSETOR').AsInteger := Params.ItemsString['codsetor']
      .AsInteger;
    Query.ParamByName('DESCMESA').AsString :=
      AnsiUpperCase(Params.ItemsString['descmesa'].AsString);
    Query.ParamByName('CODEMP').AsInteger := Params.ItemsString['codemp']
      .AsInteger;
    Query.ParamByName('CODVEND').AsInteger := Params.ItemsString['codvend']
      .AsInteger;
    Query.ParamByName('CODCAI').AsInteger :=
      strtoint(readArqIni('ConfiguracaoLocal', 'caixa', '1'));
    Query.ParamByName('CONTA').AsInteger := Params.ItemsString['conta']
      .AsInteger;
    Query.ParamByName('TOTALPESSOAS').AsInteger := Params.ItemsString
      ['totalpessoas'].AsInteger;
    Query.Open;

    Result := Query.FieldByName('RESULT').AsString;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

  except
    on E: Exception do
    begin
      Result := messageError('Não foi possível buscar comanda.');

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível buscar comanda, mensagem retornada: ' + E.message);
    end;
  end;
end;

function TEventoComanda.rtfPut(var Params: TDWParams): String;
var
  Query: TFDQuery;
  JSON: TJSONObject;
begin
  try

    if Params.ItemsString['data'] <> nil then
    begin

      JSON := TJSONObject.ParseJSONValue
        (TEncoding.ASCII.GetBytes(Params.ItemsString['data'].AsString), 0)
        as TJSONObject;

      Query := TConexaoFiredac.getInstancia.prepareStatement
        ('select CC.STATUS ' +
        'from CONTA_CLIENTE CC where CC.CODIGO = :CODIGO');
      Query.ParamByName('CODIGO').AsInteger := JSON.getValue<Integer>('codigo');

      Query.Open;

      if Query.FieldByName('STATUS').AsInteger <> 0 then
      begin
        if Query.FieldByName('STATUS').AsInteger = 1 then
          Result := messageError('Essa comanda foi encerrada.');

        if Query.FieldByName('STATUS').AsInteger = 2 then
          Result := messageError('Essa comanda foi cancelada.');
        exit;
      end;

      Query := TConexaoFiredac.getInstancia.prepareStatement
        (' execute procedure SP_SFM_ALTERA_COMANDA(:CODIGO, :DESCRICAO, :NUMERO_PESSOAS)     ');

      Query.ParamByName('CODIGO').AsInteger := JSON.getValue<Integer>('codigo');
      Query.ParamByName('DESCRICAO').AsString :=
        JSON.getValue<String>('descricao');
      Query.ParamByName('NUMERO_PESSOAS').AsInteger :=
        JSON.getValue<Integer>('numero_pessoas');
      Query.ExecSQL;

      Result := '{"status":0}';

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      exit;
    end;

    Result := messageError
      ('Não foi possível buscar comanda, mensagem retornada: data não encontrada');

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

    raise Exception.Create
      ('Não foi possível buscar comanda, mensagem retornada: data não encontrada');

  except
    on E: Exception do
    begin
      Result := messageError('Não foi possível salvar comanda.');

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível buscar comanda, mensagem retornada: ' + E.message);
    end;
  end;
end;

initialization

TEventoComanda.ClassName;

end.
