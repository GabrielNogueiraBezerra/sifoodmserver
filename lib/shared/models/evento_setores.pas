unit evento_setores;

interface

uses
  evento, uDWJSONObject;

type
{$TYPEINFO ON}
  TEventoSetores = class(TEvento)
  protected
    function rtfGet(var Params: TDWParams): String; override;
  end;

implementation

uses
  uConexaoFiredac, FireDAC.Comp.Client, System.SysUtils, FireDAC.Stan.Param;

{ TEventoSetores }

function TEventoSetores.rtfGet(var Params: TDWParams): String;
var
  Query: TFDQuery;
begin
  try

    Query := TConexaoFiredac.getInstancia.prepareStatement
      (' select * from SP_SFM_BUSCA_SETORES ');
    Query.Open;

    Result := Query.FieldByName('RESULT').AsString;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

  except
    on E: Exception do
    begin
      Result := messageError('Não foi possível buscar dados de setores.');

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível buscar setores, mensagem retornada: ' + E.message);
    end;
  end;
end;

initialization

TEventoSetores.ClassName;

end.
