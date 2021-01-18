unit evento_conferencia_resumida;

interface

uses
  evento, uDWJSONObject;

type
{$TYPEINFO ON}
  TEventoConferenciaResumida = class(TEvento)
  protected
    function rtfGet(var Params: TDWParams): String; override;
  end;

implementation

uses
  uConexaoFiredac, FireDAC.Comp.Client, impressao, conferencia_resumida,
  System.SysUtils,
  FireDAC.Stan.Param;

{ TEventoConferenciaResumida }

function TEventoConferenciaResumida.rtfGet(var Params: TDWParams): String;
var
  conferenciaResumida: TImpressao;
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

    conferenciaResumida := TConferenciaResumida.Create
      (Params.ItemsString['codigo'].AsInteger,
      Params.ItemsString['codemp'].AsInteger, 'CONFERENCIA DE CONTA RESUMIDA');

    conferenciaResumida.executaRelatorio;

    Result := '{"status":0}';

  except
    on E: Exception do
    begin
      Result := messageError('Não foi possível imprimir conferencia resumida.');

      raise Exception.Create
        ('Não foi possível imprimir conferencia resumida, mensagem retornada: '
        + E.message);

    end;
  end;
end;

initialization

TEventoConferenciaResumida.ClassName;

end.
