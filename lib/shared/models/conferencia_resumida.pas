unit conferencia_resumida;

interface

uses
  impressao;

type
{$TYPEINFO ON}
  TConferenciaResumida = class(TImpressao)
  private
    FImprimeConferenciaMesaEmUmaLinha: Boolean;
  protected
    procedure iniciaComprovante; override;
    function iniciaQuerys: Boolean; override;
    procedure imprimeCabecalho; override;
    procedure imprimeItens; override;
    procedure fechaComprovante; override;
  public
    constructor create(Codigo, CodigoEmpresa: Integer;
      TituloImpressao: String); overload;
  end;

implementation

uses
  uConexaoFiredac, utils, System.AnsiStrings, System.SysUtils,
  FireDAC.Comp.Client, FireDAC.Stan.Param;

{ TConferenciaResumida }

constructor TConferenciaResumida.create(Codigo, CodigoEmpresa: Integer;
  TituloImpressao: String);
begin
  inherited create(Codigo, CodigoEmpresa, TituloImpressao);

  FImprimeConferenciaMesaEmUmaLinha := readArqIni('ConfiguracaoLocal',
    'ItemConferenciaMesaEmUmaLinha', '0') = '1';
end;

procedure TConferenciaResumida.fechaComprovante;
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

procedure TConferenciaResumida.imprimeCabecalho;
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

procedure TConferenciaResumida.imprimeItens;
var
  TotalRegistros: Integer;
  Valor, Total: String;
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

    if QueryItens.FieldByName('CONTA_ORIGEM').AsInteger > 0 then
      comprovante.imprimeTextoComprovante
        (comprovante.boldText('TRANSF. DA COMANDA: ' +
        FormataStringD(inttostr(QueryItens.FieldByName('CONTA_ORIGEM')
        .AsInteger), '3', '0')), 'C', false)
    else
    begin
      Query := TConexaoFiredac.getInstancia.prepareStatement
        ('select * ' +
        'from SP_SFM_BUSCA_ADICIONAIS_CC(:COD, :CODEMP, 0, :CODPRO)');

      Query.close;
      Query.ParamByName('cod').AsInteger := Codigo;
      Query.ParamByName('codemp').AsInteger := CodigoEmpresa;
      Query.ParamByName('CODPRO').AsInteger := QueryItens.FieldByName('COD_PRO')
        .AsInteger;
      Query.Open;
      Query.First;

      if Query.RecordCount > 0 then
      begin
        comprovante.imprimeTextoComprovante('ADICIONAIS', 'E', false);

        while not Query.eof do
        begin

          Valor := currtostrf(Query.FieldByName('VALOR').AsCurrency,
            ffnumber, 2);
          Total := currtostrf(Query.FieldByName('TOTAL').AsCurrency,
            ffnumber, 2);

          if FImprimeConferenciaMesaEmUmaLinha then
          begin
            if QueryCabecalho.FieldByName('DISCRIMINAR_VALOR_POR_ADIC_REST')
              .AsString = 'S' then
              comprovante.imprimeTextoComprovante
                (Query.FieldByName('DESC_CUPOM').Text + ' ' +
                FormataStringD(Query.FieldByName('QUANT').AsString, '6', ' ') +
                ' ' + FormataStringD(Valor, '10', ' ') + ' ' +
                FormataStringD(Total, '13', ' '), 'E', false, 'C')
            else
              comprovante.imprimeTextoComprovante
                (Query.FieldByName('DESC_CUPOM').Text + ' ' +
                FormataStringD(Query.FieldByName('QUANT').AsString, '6', ' ') +
                ' ' + FormataStringD(Valor, '10', ' '), 'E', false, 'C');

          end
          else
          begin

            if QueryCabecalho.FieldByName('DISCRIMINAR_VALOR_POR_ADIC_REST')
              .AsString = 'S' then
              comprovante.imprimeTextoComprovanteValor
                (Query.FieldByName('DESC_CUPOM').Text,
                FormataStringD(Query.FieldByName('QUANT').AsString, '4', ' ') +
                ' ' + FormataStringD(Valor, '11', ' ') + ' ' +
                FormataStringD(Total, '12', ' '), 'C', false)
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
        (' select sum(PFP.VALOR) as VALOR ' + 'from PARCIAL_FORMAS_PAG PFP ' +
        'inner join PARCIAL_FORMAS_PAG_ITEM_CC PFPIC on ' +
        'PFPIC.COD_PARC_FORMA_PAG = PFP.COD_PARC ' +
        'inner join CONTA_CLIENTE CC on (CC.CODIGO = PFPIC.COD_CONTA_CLIENTE) '
        + 'inner join ITENS_CONTA_CLIENTE ICC on (ICC.CODIGO = ' +
        'PFPIC.COD_CONTA_CLIENTE and ICC.ORDEM = PFPIC.ORDEM) ' +
        'where PFPIC.COD_CONTA_CLIENTE = :ICODIGO and ' +
        'ICC.COD_PRO = :ICODPRO and ' + 'CC.COD_EMP = :ICODEMP      ');
      Query.close;
      Query.ParamByName('ICODIGO').AsInteger := Codigo;
      Query.ParamByName('ICODPRO').AsInteger :=
        QueryItens.FieldByName('COD_PRO').AsInteger;
      Query.ParamByName('ICODEMP').AsInteger := CodigoEmpresa;
      Query.Open;
      Query.First;

      if Query.RecordCount > 0 then
      begin
        if Query.FieldByName('VALOR').AsCurrency > 0 then
        begin
          comprovante.imprimeTextoComprovante('PARCIAIS', 'E', false);

          while not Query.eof do
          begin
            comprovante.imprimeTextoComprovanteValor('PARCIAL: ',
              currtostrf(Query.FieldByName('VALOR').AsCurrency, ffnumber, 2),
              'C', false);
            Query.Next;
          end;
        end;
      end;

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);
    end;

    if TotalRegistros > 0 then
      (comprovante.linhaPontilhada);

    QueryItens.Next;
  end;

  QueryItens.EnableControls;
end;

procedure TConferenciaResumida.iniciaComprovante;
begin
  inherited;
  comprovante.abreComprovante;
end;

function TConferenciaResumida.iniciaQuerys: Boolean;
begin
  QueryCabecalho := TConexaoFiredac.getInstancia.prepareStatement
    ('select * from SP_SFM_CABECALHO_CONFERENCIA(:ICODIGO, :ICODEMP)');
  QueryCabecalho.ParamByName('ICODIGO').AsInteger := Codigo;
  QueryCabecalho.ParamByName('ICODEMP').AsInteger := CodigoEmpresa;
  QueryCabecalho.Open;

  QueryItens := TConexaoFiredac.getInstancia.prepareStatement
    ('select * from SP_SFM_CONFERENCIA_RESUMIDA(:ICODIGO, :ICODEMP)  ');
  QueryItens.ParamByName('ICODIGO').AsInteger := Codigo;
  QueryItens.ParamByName('ICODEMP').AsInteger := CodigoEmpresa;
  QueryItens.Open;

  Result := QueryItens.RecordCount > 0;
end;

end.
