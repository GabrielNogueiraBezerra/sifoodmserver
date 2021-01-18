unit evento_comandas;

interface

uses
  evento, uDWJSONObject;

type
{$TYPEINFO ON}
  TEventoComandas = class(TEvento)
  protected
    function rtfGet(var Params: TDWParams): String; override;
  end;

implementation

uses
  uConexaoFiredac, FireDAC.Comp.Client, System.SysUtils,
  FireDAC.Stan.Param;

{ TEventoComandas }

function TEventoComandas.rtfGet(var Params: TDWParams): String;
var
  Query: TFDQuery;
begin
  try

    Query := TConexaoFiredac.getInstancia.prepareStatement
      (' select * from SP_SFM_BUSCA_COMANDAS(:CODVEND, :CODEMP, :MOSTRATODAS, :PAGE, :PESQUISA) ');

    Query.ParamByName('CODVEND').AsInteger := Params.ItemsString['codvend']
      .AsInteger;
    Query.ParamByName('CODEMP').AsInteger := Params.ItemsString['codemp']
      .AsInteger;
    Query.ParamByName('MOSTRATODAS').AsString :=
      AnsiUpperCase(Params.ItemsString['mostratodas'].AsString);
    Query.ParamByName('PAGE').AsInteger := Params.ItemsString['page'].AsInteger;
    Query.ParamByName('PESQUISA').AsString := Params.ItemsString
      ['pesquisa'].AsString;
    Query.Open;

    Result := Query.FieldByName('RESULT').AsString;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

  except
    on E: Exception do
    begin
      Result := messageError('Não foi possível buscar comandas.');

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível buscar comandas, mensagem retornada: ' + E.message);
    end;
  end;
end;

initialization

TEventoComandas.ClassName;

end.
