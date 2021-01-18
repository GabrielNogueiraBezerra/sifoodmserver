unit evento_comanda_transferencia;

interface

uses
  evento, uDWJSONObject;

type
{$TYPEINFO ON}
  TEventoComandaTransferencia = class(TEvento)
  protected
    function rtfGet(var Params: TDWParams): String; override;
  end;

implementation

uses
  uConexaoFiredac, FireDAC.Comp.Client, System.SysUtils, utils,
  FireDAC.Stan.Param;

{ TEventoComandaTransferencia }

function TEventoComandaTransferencia.rtfGet(var Params: TDWParams): String;
var
  Query: TFDQuery;
begin
  try

    Query := TConexaoFiredac.getInstancia.prepareStatement
      ('select * from SP_SFM_BUSCA_COMANDA_TRANSF(:CONTA, :CODEMP, :CODCAI)  ');
    Query.ParamByName('CONTA').AsInteger := Params.ItemsString['conta']
      .AsInteger;
    Query.ParamByName('CODEMP').AsInteger := Params.ItemsString['codemp']
      .AsInteger;
    Query.ParamByName('CODCAI').AsInteger :=
      strtoint(readArqIni('ConfiguracaoLocal', 'caixa', '1'));

    Query.Open;

    Result := Query.FieldByName('RESULT').AsString;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

  except
    on E: Exception do
    begin
      Result := messageError('Não foi possível consultar comanda.');
    end;
  end;
end;

initialization

TEventoComandaTransferencia.ClassName;

end.
