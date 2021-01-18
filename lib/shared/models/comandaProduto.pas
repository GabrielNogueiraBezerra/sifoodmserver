unit comandaProduto;

interface

uses
  FireDAC.Comp.Client;

type
{$TYPEINFO ON}
  TComandaProduto = class
  private
    FCodigo: Integer;
    FCodigoEmpresa: Integer;
    FCodigoVendedor: Integer;
    QueryCabecalho: TFDQuery;

    procedure iniciaQuerys;
    procedure _executaRelatorio;
    procedure encerraRelatorio;
  public
    constructor create(Codigo, CodigoEmpresa, CodigoVendedor: Integer);
    procedure executaRelatorio;
  end;

implementation

uses
  uConexaoFiredac, System.SysUtils, comprovante, utils, FireDAC.Stan.Param;

{ TComandaProduto }

constructor TComandaProduto.create(Codigo, CodigoEmpresa, CodigoVendedor
  : Integer);
begin
  FCodigo := Codigo;
  FCodigoEmpresa := CodigoEmpresa;
  FCodigoVendedor := CodigoVendedor;
end;

procedure TComandaProduto.encerraRelatorio;
begin
  if Assigned(QueryCabecalho) then
    TConexaoFiredac.getInstancia.closeConnection(QueryCabecalho);
end;

procedure TComandaProduto.executaRelatorio;
begin
  iniciaQuerys;
  _executaRelatorio;
  encerraRelatorio;
end;

procedure TComandaProduto.iniciaQuerys;
begin
  try
    QueryCabecalho := TConexaoFiredac.getInstancia.prepareStatement
      ('select * from SP_SFM_CABECALHO_COMANDA(:ICODIGO, :ICODEMP, :ICODVEND)');
    QueryCabecalho.ParamByName('ICODIGO').AsInteger := FCodigo;
    QueryCabecalho.ParamByName('ICODEMP').AsInteger := FCodigoEmpresa;
    QueryCabecalho.ParamByName('ICODVEND').AsInteger := FCodigoVendedor;

    QueryCabecalho.Open;
  except
    on E: Exception do
    begin
      raise Exception.create
        ('Não foi possível iniciar querys comanda por produto. Mensagem retornada: '
        + E.message);
    end;
  end;

end;

procedure TComandaProduto._executaRelatorio;
var
  QueryImpressoras, QueryProdutos, QueryImpressoraCaminhos, QueryAdicionais,
    QueryAlteraProdutos: TFDQuery;
  comprovante: TComprovante;
begin
  try

    QueryImpressoras := TConexaoFiredac.getInstancia.prepareStatement
      ('select * from SP_SFM_BUSCA_IMP_COMANDA(:ICODIGO, :ICODEMP) ');
    QueryImpressoras.ParamByName('ICODIGO').AsInteger := FCodigo;
    QueryImpressoras.ParamByName('ICODEMP').AsInteger := FCodigoEmpresa;
    QueryImpressoras.Open;
    QueryImpressoras.Last;
    QueryImpressoras.First;

    while not QueryImpressoras.EOF do
    begin
      QueryProdutos := TConexaoFiredac.getInstancia.prepareStatement
        ('select * from SP_SFM_BUSCA_ITENS_COMANDA_PRO(:ICODIGO, :ICODEMP, :ICODIMP, :ICODVEND)');
      QueryProdutos.ParamByName('ICODIGO').AsInteger := FCodigo;
      QueryProdutos.ParamByName('ICODEMP').AsInteger := FCodigoEmpresa;
      QueryProdutos.ParamByName('ICODIMP').AsInteger :=
        QueryImpressoras.FieldByName('COD_IMP').AsInteger;
      QueryProdutos.ParamByName('ICODVEND').AsInteger := FCodigoVendedor;

      QueryProdutos.Open;
      QueryProdutos.Last;
      QueryProdutos.First;

      if QueryCabecalho.FieldByName('COD_SETOR').isNull then
        QueryImpressoraCaminhos := TConexaoFiredac.getInstancia.prepareStatement
          (' select * from IMPRESSORAS_CAMINHO where COD_IMP = :CODIMP ')
      else
        QueryImpressoraCaminhos := TConexaoFiredac.getInstancia.prepareStatement
          (' select * from IMPRESSORAS_CAMINHO where COD_IMP = ' +
          ':CODIMP and COD_SETOR = ' + QueryCabecalho.FieldByName('COD_SETOR')
          .AsString);

      QueryImpressoraCaminhos.ParamByName('CODIMP').AsInteger :=
        QueryImpressoras.FieldByName('COD_IMP').AsInteger;;
      QueryImpressoraCaminhos.Open;
      QueryImpressoraCaminhos.Last;
      QueryImpressoraCaminhos.First;

      while not QueryImpressoraCaminhos.EOF do
      begin

        comprovante := TComprovante.create(FCodigoEmpresa);
        comprovante.Cabecalho := false;
        comprovante.CorteParcialComprovante := true;
        comprovante.usaTitulo := false;

        comprovante.abreComprovante(true,
          QueryImpressoraCaminhos.FieldByName('MODELO').AsString,
          QueryImpressoraCaminhos.FieldByName('PAGINADECODIGO').AsString,
          QueryImpressoraCaminhos.FieldByName('PORTA').AsString,
          DesCriptografa(QueryImpressoraCaminhos.FieldByName('PARAMSSTRING')
          .AsString), QueryImpressoraCaminhos.FieldByName('COLUNAS').AsString,
          QueryImpressoraCaminhos.FieldByName('ESPACO_ENTRE_LINHAS').AsString,
          QueryImpressoraCaminhos.FieldByName('CONTROLE_PORTA').AsString,
          QueryImpressoraCaminhos.FieldByName('CORTARPAPEL').AsString);

        comprovante.imprimeTextoComprovante(comprovante.linhaSimples);

        if comprovante.NumeroColunas < 40 then
        begin
          comprovante.imprimeTextoComprovante
            (comprovante.boldText('COMANDA ' + QueryImpressoras.FieldByName
            ('nome_imp').AsString), 'E', false);
        end
        else
        begin
          comprovante.imprimeTextoComprovante
            (comprovante.expandedText(comprovante.boldText('COMANDA ' +
            QueryImpressoras.FieldByName('nome_imp').AsString)), 'C', false);
        end;

        comprovante.imprimeTextoComprovante(comprovante.linhaSimples);

        case QueryCabecalho.FieldByName('MODELO_COMANDA').AsInteger of
          0:
            begin
              comprovante.imprimeTextoComprovante
                ('COMANDA: ' + QueryCabecalho.FieldByName('CONTA').AsString,
                'E', false);

              if (QueryCabecalho.FieldByName('DESC_MESA').AsString) <> '' then
                comprovante.imprimeTextoComprovante
                  ('DESC. COMANDA: ' + QueryCabecalho.FieldByName('DESC_MESA')
                  .AsString, 'E', false);

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
                (comprovante.boldText(comprovante.expandedText('GARCOM: ' +
                QueryCabecalho.FieldByName('nome_vend').AsString)), 'C', false);

              if (QueryCabecalho.FieldByName('DESC_MESA').AsString) <> '' then
                comprovante.imprimeTextoComprovante
                  ('DESC. COMANDA: ' + QueryCabecalho.FieldByName('DESC_MESA')
                  .AsString, 'C', false);

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
            comprovante.imprimeTextoComprovanteEspaco
              ('ITEM    DESCRICAO', 'QTD');
        end
        else
        begin
          if comprovante.NumeroColunas < 40 then
            comprovante.imprimeTextoComprovanteEspaco('DESC', 'QTD')
          else
            comprovante.imprimeTextoComprovanteEspaco('DESCRICAO', 'QTD');
        end;

        comprovante.imprimeTextoComprovante(comprovante.linhaSimples);

        { PRODUTOS }

        while not QueryProdutos.EOF do
        begin
          case QueryCabecalho.FieldByName('MODELO_COMANDA').AsInteger of
            0:
              begin
                if QueryCabecalho.FieldByName('IMP_REF_ITEM_COMANDA_COZINHA')
                  .AsString = 'S' then
                begin
                  if QueryCabecalho.FieldByName
                    ('IMPRIME_NOME_TD_PRODUTO_COZ_BAR').AsString = 'S' then
                    comprovante.imprimeTextoComprovanteValor
                      (FormataStringE(QueryProdutos.FieldByName('ORDEM')
                      .AsString, '8', ' ') +
                      (Trim(QueryProdutos.FieldByName('DESC_CUPOM').AsString)),
                      CurrToStr(QueryProdutos.FieldByName('QUANT').AsCurrency),
                      'N', true)
                  else
                    comprovante.imprimeTextoComprovanteValor
                      (FormataStringE(QueryProdutos.FieldByName('ORDEM')
                      .AsString, '8', ' ') +
                      Copy(Trim(QueryProdutos.FieldByName('DESC_CUPOM')
                      .AsString), 1, (comprovante.NumeroColunas) -
                      length('ITEM    ') - 4),
                      CurrToStr(QueryProdutos.FieldByName('QUANT').AsCurrency));
                end
                else
                begin
                  if QueryCabecalho.FieldByName
                    ('IMPRIME_NOME_TD_PRODUTO_COZ_BAR').AsString = 'S' then
                    comprovante.imprimeTextoComprovanteValor
                      (Trim(QueryProdutos.FieldByName('DESC_CUPOM').AsString),
                      CurrToStr(QueryProdutos.FieldByName('QUANT').AsCurrency),
                      'N', true)
                  else
                    comprovante.imprimeTextoComprovanteValor
                      (Copy(Trim(QueryProdutos.FieldByName('DESC_CUPOM')
                      .AsString), 1, (comprovante.NumeroColunas) - 4),
                      CurrToStr(QueryProdutos.FieldByName('QUANT').AsCurrency));
                end;
              end;
            1:
              begin
                if QueryCabecalho.FieldByName('IMP_REF_ITEM_COMANDA_COZINHA')
                  .AsString = 'S' then
                begin

                  if QueryCabecalho.FieldByName
                    ('IMPRIME_NOME_TD_PRODUTO_COZ_BAR').AsString = 'S' then
                    comprovante.imprimeTextoComprovanteValor
                      (FormataStringE(QueryProdutos.FieldByName('ORDEM')
                      .AsString, '8', ' ') +
                      Trim(QueryProdutos.FieldByName('DESC_CUPOM').AsString),
                      CurrToStr(QueryProdutos.FieldByName('QUANT').AsCurrency),
                      'E', true)
                  else
                    comprovante.imprimeTextoComprovanteValor
                      (FormataStringE(QueryProdutos.FieldByName('ORDEM')
                      .AsString, '8', ' ') +
                      Copy(Trim(QueryProdutos.FieldByName('DESC_CUPOM')
                      .AsString), 1, (comprovante.NumeroColunas) -
                      length('ITEM    ') - 4),
                      CurrToStr(QueryProdutos.FieldByName('QUANT')
                      .AsCurrency), 'E');
                end
                else
                begin

                  if QueryCabecalho.FieldByName
                    ('IMPRIME_NOME_TD_PRODUTO_COZ_BAR').AsString = 'S' then
                    comprovante.imprimeTextoComprovanteValor
                      (Trim(QueryProdutos.FieldByName('DESC_CUPOM').AsString),
                      CurrToStr(QueryProdutos.FieldByName('QUANT').AsCurrency),
                      'E', true)
                  else
                    comprovante.imprimeTextoComprovanteValor
                      (Copy(Trim(QueryProdutos.FieldByName('DESC_CUPOM')
                      .AsString), 1, (comprovante.NumeroColunas) - 4),
                      CurrToStr(QueryProdutos.FieldByName('QUANT')
                      .AsCurrency), 'E');
                end;
              end;
          end;

          QueryAdicionais := TConexaoFiredac.getInstancia.prepareStatement
            ('select * ' +
            'from SP_SFM_BUSCA_ADICIONAIS_CC(:COD, :CODEMP, :ORDEM_ITEM, 0)');
          QueryAdicionais.close;
          QueryAdicionais.ParamByName('cod').AsInteger := FCodigo;
          QueryAdicionais.ParamByName('codemp').AsInteger := FCodigoEmpresa;
          QueryAdicionais.ParamByName('ORDEM_ITEM').AsInteger :=
            QueryProdutos.FieldByName('ORDEM_ITEM').AsInteger;
          QueryAdicionais.Open;
          QueryAdicionais.First;

          while not QueryAdicionais.EOF do
          begin
            comprovante.imprimeTextoComprovanteValor
              (Trim(QueryAdicionais.FieldByName('DESC_CUPOM').AsString),
              CurrToStr(QueryAdicionais.FieldByName('QUANT').AsCurrency));

            QueryAdicionais.next;
          end;

          if Assigned(QueryAdicionais) then
            TConexaoFiredac.getInstancia.closeConnection(QueryAdicionais);

          if (QueryProdutos.FieldByName('observacao').AsString <> '') and
            (QueryCabecalho.FieldByName('IMPRIMIR_OBS_COMANDA_COZINHA')
            .AsString = 'S') then
            comprovante.imprimeTextoComprovante
              ('OBSERVACAO: ' + QueryProdutos.FieldByName('observacao')
              .AsString, 'E', true);

          if QueryProdutos.FieldByName('DESC_COMPOSICAO').AsString <> '' then
            comprovante.imprimeTextoComprovante
              ('COMPOSICAO: ' + QueryProdutos.FieldByName('DESC_COMPOSICAO')
              .AsString, 'E', true, 'N');

          if (QueryCabecalho.FieldByName('IMPRIME_NOME_TD_PRODUTO_COZ_BAR')
            .AsString = 'S') and (QueryCabecalho.FieldByName('MODELO_COMANDA')
            .AsInteger = 1) then
            comprovante.imprimeTextoComprovante(comprovante.linhaSimples);

          QueryProdutos.next;
        end;

        if Assigned(QueryProdutos) then
          TConexaoFiredac.getInstancia.closeConnection(QueryProdutos);

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
          comprovante.imprimeTextoComprovante
            ('SETOR: ' + QueryCabecalho.FieldByName('fantasia_emp').AsString);

        if QueryCabecalho.FieldByName('RETIRA_ESPACO_COMPROVANTE').AsString = 'S'
        then
          comprovante.fechaComprovante(false, false, 0)
        else
          comprovante.fechaComprovante(false, false, 8);

        comprovante.free;

        QueryImpressoraCaminhos.next;
      end;

      if Assigned(QueryImpressoraCaminhos) then
        TConexaoFiredac.getInstancia.closeConnection(QueryImpressoraCaminhos);

      QueryImpressoras.next;
    end;

    if Assigned(QueryImpressoras) then
      TConexaoFiredac.getInstancia.closeConnection(QueryImpressoras);

    QueryAlteraProdutos := TConexaoFiredac.getInstancia.prepareStatement
      ('update ITENS_CONTA_CLIENTE ICC set ICC.IMPRESSO = :IMPRESSO ' +
      'where ICC.CODIGO = :CODIGO and ICC.COD_EMP = :CODEMP and ' +
      'ICC.COD_VEND = :CODVEND   ');
    QueryAlteraProdutos.ParamByName('IMPRESSO').AsString := 'S';
    QueryAlteraProdutos.ParamByName('CODIGO').AsInteger := FCodigo;
    QueryAlteraProdutos.ParamByName('CODEMP').AsInteger := FCodigoEmpresa;
    QueryAlteraProdutos.ParamByName('CODVEND').AsInteger := FCodigoVendedor;
    QueryAlteraProdutos.ExecSQL;

    if Assigned(QueryAlteraProdutos) then
      TConexaoFiredac.getInstancia.closeConnection(QueryAlteraProdutos);

  except
    on E: Exception do
    begin

      if Assigned(QueryProdutos) then
        TConexaoFiredac.getInstancia.closeConnection(QueryProdutos);

      if Assigned(QueryAdicionais) then
        TConexaoFiredac.getInstancia.closeConnection(QueryAdicionais);

      if Assigned(QueryCabecalho) then
        TConexaoFiredac.getInstancia.closeConnection(QueryCabecalho);

      if Assigned(QueryImpressoraCaminhos) then
        TConexaoFiredac.getInstancia.closeConnection(QueryImpressoraCaminhos);

      if Assigned(QueryImpressoras) then
        TConexaoFiredac.getInstancia.closeConnection(QueryImpressoras);

      if Assigned(QueryAlteraProdutos) then
        TConexaoFiredac.getInstancia.closeConnection(QueryAlteraProdutos);

      raise Exception.create
        ('Não foi possível imprimir itens da comanda por produto. Mensagem retornada: '
        + E.message);
    end;
  end;
end;

end.
