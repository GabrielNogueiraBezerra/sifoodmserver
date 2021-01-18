unit evento_quantidade_comandas;

interface

uses
  evento, uDWJSONObject;

type
{$TYPEINFO ON}
  TEventoQuantidadeComandas = class(TEvento)
  protected
    function rtfGet(var Params: TDWParams): String; override;
  end;

implementation

uses
  FireDAC.Stan.Param, uConexaoFiredac, FireDAC.Comp.Client, System.SysUtils;

{ TEventoQuantidadeComandas }

function TEventoQuantidadeComandas.rtfGet(var Params: TDWParams): String;
var
  Query: TFDQuery;
begin
  try

    Query := TConexaoFiredac.getInstancia.prepareStatement
      (' select * from SP_SFM_BUSCA_QTD_COMANDAS(:ICODVEND, :ICODEMP)   ');

    Query.ParamByName('ICODVEND').AsInteger := Params.ItemsString['codvend']
      .AsInteger;
    Query.ParamByName('ICODEMP').AsInteger := Params.ItemsString['codemp']
      .AsInteger;
    Query.Open;

    Result := '{"status":0,"quantidade":' + Query.FieldByName('TOTAL_REGISTROS')
      .AsString + '}';

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

  except
    on E: Exception do
    begin
      Result := messageError('Não foi possível buscar quantidade de comandas.');

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível buscar quantidade de comandas, mensagem retornada: '
        + E.message);
    end;
  end;
end;

initialization

TEventoQuantidadeComandas.ClassName;

end.
