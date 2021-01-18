unit conferencia_detalhada;

interface

uses
  impressao;

type
{$TYPEINFO ON}
  TConferenciaDetalhada = class(TImpressao)
  private
    FImprimeConferenciaMesaEmUmaLinha: Boolean;
  protected
    function iniciaQuerys: Boolean; override;
    procedure iniciaComprovante; override;
    procedure imprimeCabecalho; override;
    procedure imprimeItens; override;
    procedure fechaComprovante; override;
  public
    constructor create(Codigo, CodigoEmpresa: Integer;
      TituloImpressao: String); overload;
  end;

implementation

{ TConferenciaDetalhada }

uses
  FireDAC.Stan.Param, uConexaoFiredac, utils, System.SysUtils,
  FireDAC.Comp.Client;

constructor TConferenciaDetalhada.create(Codigo, CodigoEmpresa: Integer;
  TituloImpressao: String);
begin
  inherited create(Codigo, CodigoEmpresa, TituloImpressao);

  FImprimeConferenciaMesaEmUmaLinha := readArqIni('ConfiguracaoLocal',
    'ItemConferenciaMesaEmUmaLinha', '0') = '1';
end;

procedure TConferenciaDetalhada.fechaComprovante;
var
  Query: TFDQuery;
begin
  inherited;

  Query := TConexaoFiredac.getInstancia.prepareStatement
    ('select * from SP_SFM_PARCIAIS_CONTA(:ICODIGO, :ICODEMP)  ');
  Query.ParamByName('ICODIGO').AsInteger := Codigo;
  Query.ParamByName('ICODEMP').AsInteger := CodigoEmpresa;
  Query.Open;
  Query.Last;
  Query.First;

  if Query.RecordCount > 0 then
  begin
    comprovante.imprimeTextoTitulo('PARCIAIS');

    while not Query.eof do
    begin
      if Trim(Query.FieldByName('HISTORICO').AsString) <> '' then
      begin
        comprovante.imprimeTextoComprovante
          (FormataStringD(Query.FieldByName('ordem').AsString, '4', '0') + ' ' +
          FormataStringE(Copy(Query.FieldByName('historico').AsString, 1, 27),
          '27', ' '));
        comprovante.imprimeTextoComprovante
          ('     ' + TimeToStr(Query.FieldByName('data_hora').AsDateTime) +
          '   ' + FormataStringD(currtostrf(Query.FieldByName('valor')
          .AsCurrency, ffCurrency, 2), '16', ' '));
      end
      else
        comprovante.imprimeTextoComprovanteValor
          (FormataStringD(Query.FieldByName('ordem').AsString, '4', '0'),
          TimeToStr(Query.FieldByName('data_hora').AsDateTime) + ' ' +
          FormataStringD(currtostrf(Query.FieldByName('valor').AsCurrency,
          ffCurrency, 2), '9', ' '));

      Query.Next;
    end;
  end;

  if Query <> nil then
    TConexaoFiredac.getInstancia.closeConnection(Query);

  comprovante.imprimeTextoTitulo('TOTAIS');

  comprovante.imprimeTextoComprovanteValor('TOTAL BRUTO: ',
    '(+) ' + currtostrf(QueryCabecalho.FieldByName('TOTAL_BRUTO').AsCurrency,
    ffCurrency, 2));

  comprovante.imprimeTextoComprovanteValor('TAXA DE SERVICO: ',
    '(+) ' + currtostrf(QueryCabecalho.FieldByName('TOTAL_TAXA_SERVICO')
    .AsCurrency, ffCurrency, 2));

  comprovante.imprimeTextoComprovanteValor('TOTAL PARCIAL: ',
    '(-) ' + currtostrf(QueryCabecalho.FieldByName('TOTAL_PARCIAL').AsCurrency,
    ffCurrency, 2));

  comprovante.imprimeTextoComprovante(comprovante.linhaSimples);

  comprovante.imprimeTextoComprovanteValor('TOTAL A PAGAR: ',
    '(=) ' + currtostrf(QueryCabecalho.FieldByName('TOTAL_LIQUIDO').AsCurrency,
    ffCurrency, 2));

  if QueryCabecalho.FieldByName('TOTAL_POR_PESSOA').AsCurrency > 0 then
    comprovante.imprimeTextoComprovanteValor('TOTAL PAGAR P/PESSOA: ',
      currtostrf(QueryCabecalho.FieldByName('TOTAL_POR_PESSOA').AsCurrency,
      ffCurrency, 2));

  if QueryCabecalho.FieldByName('RETIRA_ESPACO_COMPROVANTE').AsString = 'S' then
    comprovante.fechaComprovante(false, false, 0)
  else
    comprovante.fechaComprovante(false, false, 8);

  if QueryCabecalho.FieldByName('BLOQ_MESA_EMITIR_CONFERENCIA').AsString = 'S'
  then
  begin
    Query := TConexaoFiredac.getInstancia.prepareStatement
      ('UPDATE CONTA_CLIENTE SET CONFERENCIA_EMITIDA = ' + quotedstr('S') +
      ' WHERE CODIGO = ' + inttostr(Codigo));
    Query.ExecSQL;

    if Query <> nil then
      TConexaoFiredac.getInstancia.closeConnection(Query);
  end;

  if QueryCabecalho <> nil then
    TConexaoFiredac.getInstancia.closeConnection(QueryCabecalho);

  if QueryItens <> nil then
    TConexaoFiredac.getInstancia.closeConnection(QueryItens);
end;

procedure TConferenciaDetalhada.imprimeCabecalho;
begin
  inherited;

  comprovante.imprimeTextoComprovanteValor('COMANDA: ',
    FormataStringD(Trim(QueryCabecalho.FieldByName('CONTA').AsString),
    '3', '0'));

  if Trim(QueryCabecalho.FieldByName('DESC_MESA').AsString) <> '' then
    comprovante.imprimeTextoComprovanteValor('DESC. COMANDA: ',
      Trim(QueryCabecalho.FieldByName('DESC_MESA').AsString));

  if Trim(QueryCabecalho.FieldByName('NUM_PESSOAS').AsString) <> '' then
    if StrToInt(QueryCabecalho.FieldByName('NUM_PESSOAS').AsString) > 0 then
      comprovante.imprimeTextoComprovanteValor('NUM.PESSOAS: ',
        Trim(QueryCabecalho.FieldByName('NUM_PESSOAS').AsString));

  comprovante.imprimeTextoComprovanteValor('DATA ABERTURA: ',
    QueryCabecalho.FieldByName('DATA_ABERTURA').AsString);

  comprovante.imprimeTextoComprovanteValor('HORA ABERTURA: ',
    QueryCabecalho.FieldByName('HORA_ABERTURA').AsString);

  comprovante.imprimeTextoComprovante(comprovante.linhaSimples);

  if comprovante.NumeroColunas < 40 then
  begin
    comprovante.imprimeTextoComprovante('ITEM  DESCRICAO', 'E', false);
    comprovante.imprimeTextoComprovanteEspaco('', 'QTD    VALOR     TOTAL');
  end
  else
    comprovante.imprimeTextoComprovanteEspaco('ITEM  DESCRICAO',
      'QTD    VALOR     TOTAL');

  comprovante.imprimeTextoComprovante(comprovante.linhaSimples);
end;

procedure TConferenciaDetalhada.imprimeItens;
var
  TotalRegistros: Integer;
  Valor, Quantidade, Total, TotalAdicional: String;
  Query: TFDQuery;
begin
  inherited;

  QueryItens.DisableControls;
  TotalRegistros := QueryItens.RecordCount;

  while not QueryItens.eof do
  begin
    TotalRegistros := TotalRegistros - 1;

    Valor := currtostrf(QueryItens.FieldByName('VALOR').AsCurrency,
      ffnumber, 2);
    Total := currtostrf(QueryItens.FieldByName('TOTAL').AsCurrency,
      ffnumber, 2);

    if FImprimeConferenciaMesaEmUmaLinha then
      comprovante.imprimeTextoComprovanteValor
        (QueryItens.FieldByName('DESC_CUPOM').AsString,
        FormataStringE(QueryItens.FieldByName('QUANT').AsString, '11', ' ') +
        FormataStringE(Valor, '11', ' ') + FormataStringE(Total, '0', ' '), 'C',
        false, 'S')
    else
    begin
      comprovante.imprimeTextoComprovante(QueryItens.FieldByName('ORDEM')
        .AsString + ' ' + QueryItens.FieldByName('DESC_CUPOM').AsString,
        'E', false);

      comprovante.imprimeTextoComprovanteValor('',
        FormataStringE(QueryItens.FieldByName('QUANT').AsString, '5', ' ') +
        FormataStringE(Valor, '10', ' ') + FormataStringE(Total, '0', ' '))
    end;

    Query := TConexaoFiredac.getInstancia.prepareStatement
      ('select * ' +
      'from SP_SFM_BUSCA_ADICIONAIS_CC(:COD, :CODEMP, :ORDEM, 0)');

    Query.close;
    Query.ParamByName('cod').AsInteger := Codigo;
    Query.ParamByName('codemp').AsInteger := CodigoEmpresa;
    Query.ParamByName('ordem').AsInteger := QueryItens.FieldByName('ORDEM')
      .AsInteger;
    Query.Open;
    Query.First;

    if Query.RecordCount > 0 then
    begin
      comprovante.imprimeTextoComprovante('ADICIONAIS', 'E', false);

      while not Query.eof do
      begin

        Valor := currtostrf(Query.FieldByName('VALOR').AsCurrency, ffnumber, 2);
        TotalAdicional := currtostrf(Query.FieldByName('TOTAL').AsCurrency,
          ffnumber, 2);

        if FImprimeConferenciaMesaEmUmaLinha then
        begin
          if QueryCabecalho.FieldByName('DISCRIMINAR_VALOR_POR_ADIC_REST')
            .AsString = 'S' then
            comprovante.imprimeTextoComprovante(Query.FieldByName('DESC_CUPOM')
              .Text + ' ' + FormataStringD(Query.FieldByName('QUANT').AsString,
              '6', ' ') + ' ' + FormataStringD(Valor, '10', ' ') + ' ' +
              FormataStringD(TotalAdicional, '13', ' '), 'E', false, 'C')
          else
            comprovante.imprimeTextoComprovante(Query.FieldByName('DESC_CUPOM')
              .Text + ' ' + FormataStringD(Query.FieldByName('QUANT').AsString,
              '6', ' ') + ' ' + FormataStringD(Valor, '10', ' '), 'E',
              false, 'C');

        end
        else
        begin

          if QueryCabecalho.FieldByName('DISCRIMINAR_VALOR_POR_ADIC_REST')
            .AsString = 'S' then
            comprovante.imprimeTextoComprovanteValor
              (Query.FieldByName('DESC_CUPOM').Text,
              FormataStringD(Query.FieldByName('QUANT').AsString, '4', ' ') +
              ' ' + FormataStringD(Valor, '11', ' ') + ' ' +
              FormataStringD(TotalAdicional, '12', ' '), 'C', false)
          else
            comprovante.imprimeTextoComprovanteValor
              (Query.FieldByName('DESC_CUPOM').Text,
              FormataStringD(Query.FieldByName('QUANT').AsString, '4', ' ') +
              ' ' + FormataStringD(Valor, '11', ' '), 'C', false);

        end;

        if Query.FieldByName('CANCELADO').AsInteger = 1 then
          comprovante.imprimeTextoComprovante('ADICIONAL CANCELADO', 'C',
            false, 'C');

        Query.Next;
      end;
    end;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

    Query := TConexaoFiredac.getInstancia.prepareStatement
      (' select * from SP_SFM_PARCIAIS_ITEM_CC(:ICODIGO, ' +
      ':ICODEMP, :ITOTAL, :IORDEM, :IQUANT)');
    Query.ParamByName('ICODIGO').AsInteger := Codigo;
    Query.ParamByName('ICODEMP').AsInteger := CodigoEmpresa;
    Query.ParamByName('ITOTAL').AsCurrency := QueryItens.FieldByName('TOTAL')
      .AsCurrency;
    Query.ParamByName('IORDEM').AsInteger := QueryItens.FieldByName('ORDEM')
      .AsInteger;
    Query.ParamByName('IQUANT').AsCurrency := QueryItens.FieldByName('QUANT')
      .AsCurrency;
    Query.Open;
    Query.Last;
    Query.First;

    if Query.RecordCount > 0 then
    begin
      comprovante.imprimeTextoComprovante('PARCIAIS', 'E', false);

      while not Query.eof do
      begin
        comprovante.imprimeTextoComprovanteValor('PARCIAL: ',
          FormataStringD(Query.FieldByName('QUANTIDADE').AsString, '4', ' ') +
          ' ' + FormataStringD(currtostrf(Query.FieldByName('VALOR').AsCurrency,
          ffnumber, 2), '11', ' '), 'C', false);
        Query.Next;
      end;
    end;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

    if Trim(QueryItens.FieldByName('NOME_VEND').AsString) <> '' then
      comprovante.imprimeTextoComprovante
        ('GARCOM: ' + QueryItens.FieldByName('NOME_VEND').AsString + '     ' +
        'HORA: ' + TimeToStr(QueryItens.FieldByName('HORA').AsDateTime),
        'C', false);

    if QueryItens.FieldByName('CANCELADO').AsInteger = 1 then
      comprovante.imprimeTextoComprovanteValor('CANCELADO', '-' + Total, 'N');

    if QueryItens.FieldByName('CONTA_ORIGEM').AsInteger > 0 then
      comprovante.imprimeTextoComprovante
        (comprovante.boldText('TRANSF. DA COMANDA: ' +
        FormataStringD(inttostr(QueryItens.FieldByName('CONTA_ORIGEM')
        .AsInteger), '3', '0')), 'C', false);

    if TotalRegistros > 0 then
      (comprovante.linhaPontilhada);

    QueryItens.Next;
  end;

  QueryItens.EnableControls;
end;

procedure TConferenciaDetalhada.iniciaComprovante;
begin
  inherited;
  comprovante.abreComprovante;
end;

function TConferenciaDetalhada.iniciaQuerys: Boolean;
begin
  inherited;

  QueryCabecalho := TConexaoFiredac.getInstancia.prepareStatement
    ('select * from SP_SFM_CABECALHO_CONFERENCIA(:ICODIGO, :ICODEMP)');
  QueryCabecalho.ParamByName('ICODIGO').AsInteger := Codigo;
  QueryCabecalho.ParamByName('ICODEMP').AsInteger := CodigoEmpresa;
  QueryCabecalho.Open;

  QueryItens := TConexaoFiredac.getInstancia.prepareStatement
    ('select * from SP_SFM_CONFERENCIA_DETALHADA(:ICODIGO, :ICODEMP)');
  QueryItens.ParamByName('ICODIGO').AsInteger := Codigo;
  QueryItens.ParamByName('ICODEMP').AsInteger := CodigoEmpresa;
  QueryItens.Open;
  QueryItens.Last;
  QueryItens.First;

  Result := QueryItens.RecordCount > 0;

end;

end.
