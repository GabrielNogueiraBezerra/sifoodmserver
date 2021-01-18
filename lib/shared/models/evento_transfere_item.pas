unit evento_transfere_item;

interface

uses
  evento, uDWJSONObject;

type
  TEventoTransfereItem = class(TEvento)
  protected
    function rtfGet(var Params: TDWParams): String; override;
  end;

implementation

uses
  uConexaoFiredac, FireDAC.Comp.Client, System.SysUtils, FireDAC.Stan.Param,
  System.JSON;

{ TEventoTransfereItem }

function TEventoTransfereItem.rtfGet(var Params: TDWParams): String;
var
  Query: TFDQuery;
  JSON, JSONItem: TJSONObject;
  JSONArray: TJSONArray;
  I: Integer;
begin
  try
    if Params.ItemsString['data'] <> nil then
    begin

      JSON := TJSONObject.ParseJSONValue
        (TEncoding.ASCII.GetBytes('{"itens" : ' + Params.ItemsString['data']
        .AsString + '}'), 0) as TJSONObject;

      if JSON <> nil then
      begin

        JSONArray := JSON.get('itens').JsonValue as TJSONArray;

        for I := 0 to JSONArray.count - 1 do
        begin
          JSONItem := JSONArray.Items[I].GetValue<TJSONObject>;

          Query := TConexaoFiredac.getInstancia.prepareStatement
            (' execute procedure SP_TRANSFERE_ITEM_CONTA(:NEWCOD, :OLDCOD, :OLDORDEM, :QUANTIDADE) ');

          Query.ParamByName('NEWCOD').AsInteger := Params.ItemsString
            ['codigonovo'].AsInteger;
          Query.ParamByName('OLDCOD').AsInteger := Params.ItemsString
            ['codigoantigo'].AsInteger;
          Query.ParamByName('OLDORDEM').AsInteger :=
            JSONItem.GetValue<Integer>('ordem');
          Query.ParamByName('QUANTIDADE').AsCurrency :=
            JSONItem.GetValue<Currency>('quantidade');

          Query.ExecSQL;

          if Assigned(Query) then
            TConexaoFiredac.getInstancia.closeConnection(Query);

        end;
      end;
    end;

    Result := '{"status":0}';
  except
    on E: Exception do
    begin
      Result := messageError('Não foi possível transferir o item.');

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível transferir todos o item, mensagem retornada: ' +
        E.message);
    end;
  end;
end;

initialization

TEventoTransfereItem.ClassName;

end.
