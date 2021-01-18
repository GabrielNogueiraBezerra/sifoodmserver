unit evento_produto_secao;

interface

uses
  evento, uDWJSONObject;

type
{$TYPEINFO ON}
  TEventoProdutoSecao = class(TEvento)
  protected
    function rtfGet(var Params: TDWParams): String; override;
  end;

implementation

uses
  uConexaoFiredac, FireDAC.Comp.Client, System.SysUtils, FireDAC.Stan.Param;

{ TEventoProdutoSecao }

function TEventoProdutoSecao.rtfGet(var Params: TDWParams): String;
var
  Query: TFDQuery;
begin
  try

    Query := TConexaoFiredac.getInstancia.prepareStatement
      (' select * from SP_SFM_BUSCA_PRODUTOS_SECAO(:CODSEC, :PAGE, :PESQUISA, :CODEMP) ');
    Query.ParamByName('CODSEC').AsInteger := Params.ItemsString['codsec']
      .AsInteger;
    Query.ParamByName('PAGE').AsInteger := Params.ItemsString['page'].AsInteger;
    Query.ParamByName('CODEMP').AsInteger := Params.ItemsString['codemp']
      .AsInteger;
    Query.ParamByName('PESQUISA').AsString := Params.ItemsString
      ['pesquisa'].AsString;
    Query.Open;

    Result := Query.FieldByName('RESULT').AsString;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

  except
    on E: Exception do
    begin
      Result := messageError('Não foi possível buscar dados das seções.');

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível buscar produtos, mensagem retornada: ' + E.message);

    end;
  end;
end;

initialization

TEventoProdutoSecao.ClassName;

end.
