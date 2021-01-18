unit evento_adicional;

interface

uses
  evento, uDWJSONObject;

type
{$TYPEINFO ON}
  TEventoAdicional = class(TEvento)
  protected
    function rtfGet(var Params: TDWParams): String; override;
  end;

implementation

uses
  uConexaoFiredac, FireDAC.Comp.Client, System.SysUtils, FireDAC.Stan.Param;

{ TEventoAdicional }

function TEventoAdicional.rtfGet(var Params: TDWParams): String;
var
  Query: TFDQuery;
begin
  try

    Query := TConexaoFiredac.getInstancia.prepareStatement
      (' select *  from SP_SFM_BUSCA_ADICIONAIS_PRODUTO(:ICODPRO, :ICODEMP, :PESQUISA, :page)   ');

    Query.ParamByName('ICODPRO').AsInteger := Params.ItemsString['codpro']
      .AsInteger;
    Query.ParamByName('ICODEMP').AsInteger := Params.ItemsString['codemp']
      .AsInteger;
    Query.ParamByName('PESQUISA').AsString := Params.ItemsString
      ['pesquisa'].AsString;
    Query.ParamByName('PAGE').AsInteger := Params.ItemsString['page'].AsInteger;
    Query.Open;

    Result := Query.FieldByName('RESULT').AsString;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

  except
    on E: Exception do
    begin
      Result := messageError('Não foi possível buscar adicionais.');

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível buscar adicionais, mensagem retornada: ' +
        E.message);

    end;
  end;
end;

initialization

TEventoAdicional.ClassName;

end.
