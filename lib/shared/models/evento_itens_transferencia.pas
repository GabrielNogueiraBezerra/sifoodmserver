unit evento_itens_transferencia;

interface

uses
  evento, uDWJSONObject;

type
{$TYPEINFO ON}
  TEventoItensTransferencia = class(TEvento)
  protected
    function rtfGet(var Params: TDWParams): String; override;
  end;

implementation

uses
  FireDAC.Stan.Param, uConexaoFiredac, FireDAC.Comp.Client, utils,
  System.SysUtils, System.JSON;

{ TEventoItensTransferencia }

function TEventoItensTransferencia.rtfGet(var Params: TDWParams): String;
var
  Query: TFDQuery;
  Resultado: String;
  TotalRegistros: Integer;

  procedure addNode(node: String; value: Integer; Virgula: boolean); overload;
  begin
    Resultado := Resultado + '"' + node + '":' + inttostr(value);

    if Virgula then
      Resultado := Resultado + ',';
  end;

  procedure addNode(node: String; value: String; Virgula: boolean); overload;
  begin
    Resultado := Resultado + '"' + node + '":"' + value + '"';

    if Virgula then
      Resultado := Resultado + ',';
  end;

  procedure addNode(node: String; value: Currency; Virgula: boolean); overload;
  begin
    Resultado := Resultado + '"' + node + '":' +
      replace(replace(currtostr(value), '.', ''), ',', '.');

    if Virgula then
      Resultado := Resultado + ',';
  end;

begin
  try

    Query := TConexaoFiredac.getInstancia.prepareStatement
      ('select * ' +
      'from SP_SFM_TODOS_ITENS_COMANDA(:ICODIGO, :ICODEMP, :ICODVEND)');
    Query.ParamByName('ICODIGO').AsInteger := Params.ItemsString['codigo']
      .AsInteger;
    Query.ParamByName('ICODEMP').AsInteger := Params.ItemsString['codemp']
      .AsInteger;
    Query.ParamByName('ICODVEND').AsInteger := Params.ItemsString['codvend']
      .AsInteger;
    Query.Open;
    Query.Last;
    Query.First;

    TotalRegistros := Query.RecordCount;

    Resultado := '{';
    addNode('status', 0, true);
    Resultado := Resultado + '"itens_comanda" : [';

    while not Query.eof do
    begin

      inc(TotalRegistros, -1);

      Resultado := Resultado + '{';

      addNode('cod_pro', Query.FieldByName('cod_pro').AsInteger, true);
      addNode('desc_cupom', Query.FieldByName('desc_cupom').AsString, true);
      addNode('quant', Query.FieldByName('quant').AsCurrency, true);
      addNode('valor', Query.FieldByName('valor').AsCurrency, true);
      addNode('total_parcial', Query.FieldByName('total_parcial')
        .AsCurrency, true);
      addNode('cancelado', Query.FieldByName('cancelado').AsInteger, true);
      addNode('impresso', Query.FieldByName('impresso').AsString, true);
      addNode('observacao', Query.FieldByName('observacao').AsString, true);
      addNode('total', Query.FieldByName('total').AsCurrency, true);
      addNode('ordem', Query.FieldByName('ordem').AsInteger, false);

      if TotalRegistros = 0 then
        Resultado := Resultado + '}'
      else
        Resultado := Resultado + '},';

      Query.next;
    end;

    Resultado := Resultado + ']';

    Resultado := Resultado + '}';

    Result := Resultado;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);
  except
    on E: Exception do
    begin
      Result := messageError('Não foi possível buscar itens da comanda.');

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível buscar itens da comanda, mensagem retornada: ' +
        E.message);
    end;
  end;
end;

initialization

TEventoItensTransferencia.ClassName;

end.
