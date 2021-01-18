unit comanda;

interface

uses
  impressao;

type
{$TYPEINFO ON}
  TComandaCozinha = class(TImpressao)
  private
    FTipoComanda: Integer;
    FCodigoVendedor: Integer;
    FImpressora: String;
  protected
    function iniciaQuerys: Boolean; override;
    procedure iniciaComprovante; override;
    procedure imprimeCabecalho; override;
    procedure imprimeItens; override;
    procedure fechaComprovante; override;
  public
    constructor create(Codigo, CodigoEmpresa: Integer; TituloImpressao: String;
      TipoComanda, CodigoVendedor: Integer); overload;
  end;

implementation

uses
  uConexaoFiredac, System.SysUtils, utils, FireDAC.Comp.Client,
  FireDAC.Stan.Param;

{ TComandaCozinha }

constructor TComandaCozinha.create(Codigo, CodigoEmpresa: Integer;
  TituloImpressao: String; TipoComanda, CodigoVendedor: Integer);
begin
  inherited create(Codigo, CodigoEmpresa, TituloImpressao);

  FTipoComanda := TipoComanda;
  FCodigoVendedor := CodigoVendedor;

  if TipoComanda = 0 then
    FImpressora := 'COZINHA'
  else
    FImpressora := 'BALCAO';
end;

procedure TComandaCozinha.fechaComprovante;
begin
  inherited;

  if not((QueryCabecalho.FieldByName('MODELO_COMANDA').AsInteger = 1) and
    (QueryCabecalho.FieldByName('IMPRIME_NOME_TD_PRODUTO_COZ_BAR')
    .AsString = 'S')) then
    comprovante.imprimeTextoComprovante(comprovante.linhaSimples);

  if QueryCabecalho.FieldByName('MODELO_COMANDA').AsInteger = 1 then
    comprovante.imprimeTextoComprovante
      (comprovante.boldText(comprovante.expandedText('COMANDA: ' +
      QueryCabecalho.FieldByName('CONTA').AsString)), 'C', false);

  if QueryCabecalho.FieldByName('IMPRIME_SETOR_COZINHA_BALCAO').AsString = 'S'
  then
    comprovante.imprimeTextoComprovante('SETOR: ' + QueryCabecalho.FieldByName
      ('fantasia_emp').AsString);

  if QueryCabecalho.FieldByName('RETIRA_ESPACO_COMPROVANTE').AsString = 'S' then
    comprovante.fechaComprovante(false, false, 0)
  else
    comprovante.fechaComprovante(false, false, 8);

  if QueryCabecalho <> nil then
    TConexaoFiredac.getInstancia.closeConnection(QueryCabecalho);

  if QueryItens <> nil then
    TConexaoFiredac.getInstancia.closeConnection(QueryItens);
end;

procedure TComandaCozinha.imprimeCabecalho;
begin
  inherited;
  comprovante.imprimeTextoComprovante(comprovante.linhaSimples);

  if comprovante.NumeroColunas < 40 then
    comprovante.imprimeTextoComprovante
      (comprovante.boldText('COMANDA ' + FImpressora), 'E', false)
  else
    comprovante.imprimeTextoComprovante
      (comprovante.expandedText(comprovante.boldText('COMANDA ' + FImpressora)),
      'C', false);

  comprovante.imprimeTextoComprovante(comprovante.linhaSimples);

  case QueryCabecalho.FieldByName('MODELO_COMANDA').AsInteger of
    0:
      begin
        comprovante.imprimeTextoComprovante
          ('COMANDA: ' + QueryCabecalho.FieldByName('CONTA').AsString,
          'E', false);

        if Trim(QueryCabecalho.FieldByName('DESC_MESA').AsString) <> '' then
          comprovante.imprimeTextoComprovante('DESC. COMANDA: ' +
            QueryCabecalho.FieldByName('DESC_MESA').AsString, 'E', false);

        comprovante.imprimeTextoComprovante
          ('GARCOM: ' + QueryCabecalho.FieldByName('nome_vend').AsString,
          'E', false);

        comprovante.imprimeTextoComprovante('DATA: ' + DateToStr(Date),
          'E', false);

        comprovante.imprimeTextoComprovante('HORA: ' + TimeToStr(Time),
          'E', false);
      end;
    1:
      begin
        comprovante.imprimeTextoComprovante
          ('GARCOM: ' + QueryCabecalho.FieldByName('nome_vend').AsString,
          'C', false);

        if Trim(QueryCabecalho.FieldByName('desc_mesa').AsString) <> '' then
          comprovante.imprimeTextoComprovante('DESC. COMANDA: ' +
            QueryCabecalho.FieldByName('desc_mesa').AsString, 'C', false);

        comprovante.imprimeTextoComprovante('DATA: ' + DateToStr(Date),
          'C', false);

        comprovante.imprimeTextoComprovante('HORA: ' + TimeToStr(Time),
          'C', false);
      end;
  end;

  comprovante.imprimeTextoComprovante(comprovante.linhaSimples);

  if QueryCabecalho.FieldByName('IMP_REF_ITEM_COMANDA_COZINHA').AsString = 'S'
  then
  begin
    if comprovante.NumeroColunas < 40 then
      comprovante.imprimeTextoComprovanteEspaco('ITEM    DESC', 'QTD')
    else
      comprovante.imprimeTextoComprovanteEspaco('ITEM    DESCRICAO', 'QTD');
  end
  else
  begin
    if comprovante.NumeroColunas < 40 then
      comprovante.imprimeTextoComprovanteEspaco('DESC', 'QTD')
    else
      comprovante.imprimeTextoComprovanteEspaco('DESCRICAO', 'QTD');
  end;

  comprovante.imprimeTextoComprovante(comprovante.linhaSimples);
end;

procedure TComandaCozinha.imprimeItens;
var
  Query: TFDQuery;
begin
  inherited;

  QueryItens.DisableControls;

  while not QueryItens.eof do
  begin

    case QueryCabecalho.FieldByName('MODELO_COMANDA').AsInteger of
      0:
        begin
          if QueryCabecalho.FieldByName('IMP_REF_ITEM_COMANDA_COZINHA')
            .AsString = 'S' then
          begin
            if QueryCabecalho.FieldByName('IMPRIME_NOME_TD_PRODUTO_COZ_BAR')
              .AsString = 'S' then
              comprovante.imprimeTextoComprovanteValor
                (FormataStringE(QueryItens.FieldByName('ORDEM').AsString, '8',
                ' ') + Trim(QueryItens.FieldByName('DESC_CUPOM').AsString),
                CurrToStr(QueryItens.FieldByName('QUANT').AsCurrency),
                'N', true)
            else
              comprovante.imprimeTextoComprovanteValor
                (FormataStringE(QueryItens.FieldByName('ORDEM').AsString, '8',
                ' ') + Copy(Trim(QueryItens.FieldByName('DESC_CUPOM').AsString),
                1, (comprovante.NumeroColunas) - length('ITEM    ') - 4),
                CurrToStr(QueryItens.FieldByName('QUANT').AsCurrency));
          end
          else
          begin
            if QueryCabecalho.FieldByName('IMPRIME_NOME_TD_PRODUTO_COZ_BAR')
              .AsString = 'S' then
              comprovante.imprimeTextoComprovanteValor
                (Trim(QueryItens.FieldByName('DESC_CUPOM').AsString),
                CurrToStr(QueryItens.FieldByName('QUANT').AsCurrency),
                'N', true)
            else
              comprovante.imprimeTextoComprovanteValor
                (Copy(Trim(QueryItens.FieldByName('DESC_CUPOM').AsString), 1,
                (comprovante.NumeroColunas) - 4),
                CurrToStr(QueryItens.FieldByName('QUANT').AsCurrency));
          end;
        end;
      1:
        begin
          if QueryCabecalho.FieldByName('IMP_REF_ITEM_COMANDA_COZINHA')
            .AsString = 'S' then
          begin

            if QueryCabecalho.FieldByName('IMPRIME_NOME_TD_PRODUTO_COZ_BAR')
              .AsString = 'S' then
              comprovante.imprimeTextoComprovanteValor
                (FormataStringE(QueryItens.FieldByName('ORDEM').AsString, '4',
                ' ') + Trim(QueryItens.FieldByName('DESC_CUPOM').AsString),
                CurrToStr(QueryItens.FieldByName('QUANT').AsCurrency),
                'E', true)
            else
              comprovante.imprimeTextoComprovanteValor
                (FormataStringE(QueryItens.FieldByName('ORDEM').AsString, '4',
                ' ') + Copy(Trim(QueryItens.FieldByName('DESC_CUPOM').AsString),
                1, (comprovante.NumeroColunas) - length('ITEM    ') - 4),
                CurrToStr(QueryItens.FieldByName('QUANT').AsCurrency), 'E');
          end
          else
          begin

            if QueryCabecalho.FieldByName('IMPRIME_NOME_TD_PRODUTO_COZ_BAR')
              .AsString = 'S' then
              comprovante.imprimeTextoComprovanteValor
                (Trim(QueryItens.FieldByName('DESC_CUPOM').AsString),
                CurrToStr(QueryItens.FieldByName('QUANT').AsCurrency),
                'E', true)
            else
              comprovante.imprimeTextoComprovanteValor
                (Copy(Trim(QueryItens.FieldByName('DESC_CUPOM').AsString), 1,
                (comprovante.NumeroColunas) - 4),
                CurrToStr(QueryItens.FieldByName('QUANT').AsCurrency), 'E');
          end;
        end;
    end;

    Query := TConexaoFiredac.getInstancia.prepareStatement
      ('select * ' +
      'from SP_SFM_BUSCA_ADICIONAIS_CC(:COD, :CODEMP, :ORDEM, 0)');

    Query.close;
    Query.ParamByName('cod').AsInteger := Codigo;
    Query.ParamByName('codemp').AsInteger := CodigoEmpresa;
    Query.ParamByName('ordem').AsInteger := QueryItens.FieldByName('ORDEM_ITEM')
      .AsInteger;
    Query.Open;
    Query.First;

    while not Query.eof do
    begin
      comprovante.imprimeTextoComprovanteValor
        (Trim(Query.FieldByName('DESC_CUPOM').AsString),
        CurrToStr(Query.FieldByName('QUANT').AsCurrency));

      Query.next;
    end;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

    if (QueryItens.FieldByName('observacao').AsString <> '') and
      (QueryCabecalho.FieldByName('IMPRIMIR_OBS_COMANDA_COZINHA').AsString = 'S')
    then
      comprovante.imprimeTextoComprovante
        ('OBSERVACAO: ' + QueryItens.FieldByName('observacao').AsString,
        'E', true);

    if QueryItens.FieldByName('DESC_COMPOSICAO').AsString <> '' then
      comprovante.imprimeTextoComprovante
        ('COMPOSICAO: ' + QueryItens.FieldByName('DESC_COMPOSICAO').AsString,
        'E', true, 'N');

    if (QueryCabecalho.FieldByName('IMPRIME_NOME_TD_PRODUTO_COZ_BAR')
      .AsString = 'S') and (QueryCabecalho.FieldByName('MODELO_COMANDA')
      .AsInteger = 1) then
      comprovante.imprimeTextoComprovante(comprovante.linhaSimples);

    QueryItens.next;
  end;

end;

procedure TComandaCozinha.iniciaComprovante;
begin
  inherited;
  comprovante.Cabecalho := false;
  comprovante.usaTitulo := false;
  comprovante.impressora := FImpressora;
  comprovante.abreComprovante;
end;

function TComandaCozinha.iniciaQuerys: Boolean;
begin
  try
    QueryCabecalho := TConexaoFiredac.getInstancia.prepareStatement
      ('select * from SP_SFM_CABECALHO_COMANDA(:ICODIGO, :ICODEMP, :ICODVEND)');
    QueryCabecalho.ParamByName('ICODIGO').AsInteger := Codigo;
    QueryCabecalho.ParamByName('ICODEMP').AsInteger := CodigoEmpresa;
    QueryCabecalho.ParamByName('ICODVEND').AsInteger := FCodigoVendedor;
    QueryCabecalho.Open;

    QueryItens := TConexaoFiredac.getInstancia.prepareStatement
      ('select * from SP_SFM_ITENS_COMANDA(:ICODIGO, :ICODEMP, :ITIPO, :ICODVEND)');
    QueryItens.ParamByName('ICODIGO').AsInteger := Codigo;
    QueryItens.ParamByName('ICODEMP').AsInteger := CodigoEmpresa;
    QueryItens.ParamByName('ITIPO').AsInteger := FTipoComanda;
    QueryItens.ParamByName('ICODVEND').AsInteger := FCodigoVendedor;
    QueryItens.Open;
    QueryItens.Last;
    QueryItens.First;

    Result := QueryItens.RecordCount > 0;
  except
    on E: Exception do
    begin
      Result := false;

      if Assigned(QueryCabecalho) then
        TConexaoFiredac.getInstancia.closeConnection(QueryCabecalho);

      if Assigned(QueryItens) then
        TConexaoFiredac.getInstancia.closeConnection(QueryItens);

      raise Exception.create('Não foi possível imprimir comanda ' + FImpressora
        + '. Mensagem retornada: ' + E.message);
    end;
  end;

end;

end.
