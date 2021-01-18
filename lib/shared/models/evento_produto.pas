unit evento_produto;

interface

uses
  evento, uDWJSONObject;

type
{$TYPEINFO ON}
  TEventoProduto = class(TEvento)
  protected
    function rtfGet(var Params: TDWParams): String; override;
  end;

implementation

uses
  uConexaoFiredac, FireDAC.Comp.Client, System.SysUtils, FireDAC.Stan.Param;

{ TEventoProduto }

function TEventoProduto.rtfGet(var Params: TDWParams): String;
var
  Query: TFDQuery;
begin
  try

    Query := TConexaoFiredac.getInstancia.prepareStatement
      (' select * from SP_SFM_BUSCA_PRODUTO(:ICODPRO, :ICODEMP) ');
    Query.ParamByName('ICODPRO').AsInteger := Params.ItemsString['codpro']
      .AsInteger;
    Query.ParamByName('ICODEMP').AsInteger := Params.ItemsString['codemp']
      .AsInteger;
    Query.Open;

    Result := Query.FieldByName('RESULT').AsString;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

  except
    on E: Exception do
    begin
      Result := messageError('Não foi possível buscar produto.');

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível buscar produto, mensagem retornada: ' + E.message);

    end;
  end;
end;

initialization

TEventoProduto.ClassName;

end.
