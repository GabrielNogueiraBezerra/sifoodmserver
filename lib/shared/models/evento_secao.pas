unit evento_secao;

interface

uses
  evento, uDWJSONObject;

type
{$TYPEINFO ON}
  TEventoSecao = class(TEvento)
  protected
    function rtfGet(var Params: TDWParams): String; override;
  end;

implementation

uses
  uConexaoFiredac, FireDAC.Comp.Client, System.SysUtils,
  FireDAC.Stan.Param;

{ TEventoSecao }

function TEventoSecao.rtfGet(var Params: TDWParams): String;
var
  Query: TFDQuery;
begin
  try

    Query := TConexaoFiredac.getInstancia.prepareStatement
      (' select * from SP_SFM_BUSCA_SECOES ');
    Query.Open;

    Result := Query.FieldByName('RESULT').AsString;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

  except
    on E: Exception do
    begin
      Result := messageError('N�o foi poss�vel buscar dados das se��es.');

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('N�o foi poss�vel buscar se��es, mensagem retornada: ' + E.message);
    end;
  end;
end;

initialization

TEventoSecao.ClassName;

end.
