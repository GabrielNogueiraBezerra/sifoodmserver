unit evento_login;

interface

uses
  evento, uDWJSONObject;

type
{$TYPEINFO ON}
  TEventoLogin = class(TEvento)
  protected
    function rtfGet(var Params: TDWParams): String; override;
  end;

implementation

uses
  uConexaoFiredac, FireDAC.Comp.Client, utils, System.SysUtils,
  FireDAC.Stan.Param;

{ TEventoLogin }

function TEventoLogin.rtfGet(var Params: TDWParams): String;
var
  Query: TFDQuery;
begin
  try

    Query := TConexaoFiredac.getInstancia.prepareStatement
      (' select P.RESULT from SP_SFM_LOGIN(:NOMEUSU, :SENHAUSU, :KEY, :NUMEROSERIE, :SISTEMAID) P ');
    Query.ParamByName('NOMEUSU').AsString :=
      AnsiUpperCase(Params.ItemsString['usuario'].AsString);
    Query.ParamByName('SENHAUSU').AsString :=
      Criptografa(Params.ItemsString['senha'].AsString);
    Query.ParamByName('KEY').AsString :=
      'IUAYSGEF165!9NCXM$WYQUEGBNAFS@7B21N8IAL*SIWGG1?H7K8K0 0JEBAIEYEQ/BCY';
    Query.ParamByName('NUMEROSERIE').AsString := Params.ItemsString
      ['numeroserie'].AsString;
    Query.ParamByName('SISTEMAID').AsInteger := 5;
    Query.Open;

    result := Query.FieldByName('RESULT').AsString;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);
  except
    on E: Exception do
    begin

      result := messageError('Não foi possível realizar login.');

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível realizar login, mensagem retornada: ' + E.message);
    end;
  end;

end;

initialization

TEventoLogin.ClassName;

end.
