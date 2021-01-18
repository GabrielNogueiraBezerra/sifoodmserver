unit imprime_comanda;

interface

type
{$TYPEINFO ON}
  TImprimeComanda = class
  private
    FCodigo: Integer;
    FCodigoEmpresa: Integer;
    FCodigoVendedor: Integer;
  public
    constructor Create(Codigo, CodigoEmpresa, CodigoVendedor: Integer);

    procedure execute;
  end;

implementation

uses
  uConexaoFiredac, FireDAC.Comp.Client, System.SysUtils, impressao,
  comandaProduto, utils, comanda, FireDAC.Stan.Param;

{ TImprimeComanda }

constructor TImprimeComanda.Create(Codigo, CodigoEmpresa, CodigoVendedor
  : Integer);
begin
  FCodigo := Codigo;
  FCodigoEmpresa := CodigoEmpresa;
  FCodigoVendedor := CodigoVendedor;
end;

procedure TImprimeComanda.execute;
var
  Query: TFDQuery;
  comandaPorProduto: Boolean;
  comanda: TImpressao;
  comandaProduto: TComandaProduto;
begin

  try
    Query := TConexaoFiredac.getInstancia.prepareStatement
      (' select  coalesce(P.USAR_IMP_PROD_COMANDA_COZINHA, ' + quotedstr('N') +
      ') as USAR_IMP_PROD_COMANDA_COZINHA from PARAMETROS P where P.COD_EMP = :CODEMP  ');
    Query.ParamByName('CODEMP').AsInteger := FCodigoEmpresa;
    Query.Open;

    comandaPorProduto := Query.FieldByName('USAR_IMP_PROD_COMANDA_COZINHA')
      .AsString = 'S';

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);
  except
    on E: Exception do
    begin

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível consultar parametros da empresa, mensagem retornada: '
        + E.message);
      exit;
    end;
  end;

  try
    if comandaPorProduto then
    begin
      comandaProduto := TComandaProduto.Create(FCodigo, FCodigoEmpresa,
        FCodigoVendedor);
      comandaProduto.executaRelatorio;
    end
    else
    begin

      if readArqIni('ConfiguracaoLocal', 'ImprimeCozinha', 'N') = 'S' then
      begin
        comanda := TComandaCozinha.Create(FCodigo, FCodigoEmpresa, '', 0,
          FCodigoVendedor);
        comanda.executaRelatorio;
      end;

      if readArqIni('ConfiguracaoLocal', 'ImprimeBalcao', 'N') = 'S' then
      begin
        comanda := TComandaCozinha.Create(FCodigo, FCodigoEmpresa, '', 1,
          FCodigoVendedor);
        comanda.executaRelatorio;
      end;

    end;

    Query := TConexaoFiredac.getInstancia.prepareStatement
      (' update ITENS_CONTA_CLIENTE ICC set ICC.IMPRESSO = :IMPRESSO ' +
      'where ICC.CODIGO = :CODIGO and ICC.COD_VEND = ' +
      ':CODVEND and ICC.COD_EMP = :CODEMP ');
    Query.ParamByName('impresso').AsString := 'S';
    Query.ParamByName('codigo').AsInteger := FCodigo;
    Query.ParamByName('CODVEND').AsInteger := FCodigoVendedor;
    Query.ParamByName('CODEMP').AsInteger := FCodigoEmpresa;
    Query.ExecSQL;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);
  except
    on E: Exception do
    begin

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      if comandaPorProduto then
        raise Exception.Create
          ('Não foi possível imprimir a comanda por produto, mensagem retornada: '
          + E.message)
      else
        raise Exception.Create
          ('Não foi possível imprimir a comanda, mensagem retornada: ' +
          E.message);
    end;
  end;
end;

end.
