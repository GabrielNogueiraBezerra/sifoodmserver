unit evento_busca_comanda;

interface

uses
  evento, uDWJSONObject;

type
{$TYPEINFO ON}
  TEventoBuscaComanda = class(TEvento)
  protected
    function rtfGet(var Params: TDWParams): String; override;
  end;

implementation

uses
  uConexaoFiredac, FireDAC.Comp.Client, System.SysUtils,
  FireDAC.Stan.Param;

{ TEventoBuscaComanda }

function TEventoBuscaComanda.rtfGet(var Params: TDWParams): String;
var
  Query: TFDQuery;
begin
  try

    Query := TConexaoFiredac.getInstancia.prepareStatement
      (' select * from SP_SFM_BUSCA_COMANDA(:ICODIGO) ');
    Query.ParamByName('ICODIGO').AsInteger := Params.ItemsString['codigo']
      .AsInteger;

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

initialization

TEventoBuscaComanda.ClassName;

end.
