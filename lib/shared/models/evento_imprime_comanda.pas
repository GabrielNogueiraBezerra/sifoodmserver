unit evento_imprime_comanda;

interface

uses
  evento, uDWJSONObject;

type
{$TYPEINFO ON}
  TEventoImprimeComanda = class(TEvento)
  protected
    function rtfGet(var Params: TDWParams): String; override;
  end;

implementation

uses
  uConexaoFiredac, FireDAC.Comp.Client, System.SysUtils, imprime_comanda,
  FireDAC.Stan.Param;

{ TEventoImprimeComanda }

function TEventoImprimeComanda.rtfGet(var Params: TDWParams): String;
var
  impressao: TImprimeComanda;
  Query: TFDQuery;
begin
  try

    Query := TConexaoFiredac.getInstancia.prepareStatement
      ('select CC.STATUS ' + 'from CONTA_CLIENTE CC where CC.CODIGO = :CODIGO');
    Query.ParamByName('CODIGO').AsInteger := Params.ItemsString['codigo']
      .AsInteger;

    Query.Open;

    if Query.FieldByName('STATUS').AsInteger <> 0 then
    begin
      if Query.FieldByName('STATUS').AsInteger = 1 then
        Result := messageError('Essa comanda foi encerrada.');

      if Query.FieldByName('STATUS').AsInteger = 2 then
        Result := messageError('Essa comanda foi cancelada.');
      exit;
    end;

    impressao := TImprimeComanda.Create(Params.ItemsString['codigo'].AsInteger,
      Params.ItemsString['codemp'].AsInteger, Params.ItemsString['codvend']
      .AsInteger);

    impressao.execute;

    Result := '{"status":0}';

  except
    on E: Exception do
    begin
      Result := messageError('Não foi possível imprimir comanda.');

      raise Exception.Create
        ('Não foi possível imprimir comanda. Mensagem retornada: ' + E.message);
    end;
  end;
end;

initialization

TEventoImprimeComanda.ClassName;

end.
