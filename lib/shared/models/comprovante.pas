unit comprovante;

interface

uses
  System.SysUtils, System.Classes, StrUtils, Vcl.Forms,
  ACBrPosPrinter, utils;

type
{$TYPEINFO ON}
  TComprovante = class(TObject)
  private
    ACBrPosPrinter: TACBrPosPrinter;
    FComprovante: TStringList;
    FTitulo: String;
    FNumeroColunas: Integer;
    FImpressora: String;
    FAssinatura: String;
    FCabecalho: Boolean;
    FTipoTitulo: String;
    FUsaTitulo: Boolean;
    FCorteParcialComprovante: Boolean;
    FCodigoEmpresa: Integer;

    procedure dadosEmpresa;
    procedure configuraImpressora(const configuraManual: Boolean = false;
      const Modelo: String = ''; const PaginaCodigo: String = '';
      const Porta: String = ''; const ParamString: String = '';
      const Colunas: String = ''; const EspacoEntreLinhas: String = '';
      const ControlePorta: String = ''; const CortaPapel: String = '');
    procedure setNumeroColunas(const Value: Integer);
    procedure setImpressora(const Value: String);
    procedure setTitulo(const Value: String);
    procedure setAssinatura(const Value: String);
    procedure setCabecalho(const Value: Boolean);
    procedure tituloCabecalho;
    procedure setTipoTitulo(const Value: String);

    function corteTotal: String;
    function corteParcial: String;
    function numeroColunasT(TipoLetra: String): Integer;
    function tipoFonteTextoComprovante(Texto, TipoFonte: String): String;
    function alinhamentoTextoComprovante(Texto, TipoAlinhamento
      : String): String;
    procedure setUsaTitulo(const Value: Boolean);
    function tipoEfeitoLetra(Texto, efeitoLetra: String): String;
    procedure SeCorteParcialComprovante(const Value: Boolean);
  public

    constructor Create(CodigoEmpresa: Integer);

    destructor Destroy; override;

    procedure Clear;
    procedure linhaAssinatura;
    procedure linha;
    procedure abreComprovante(const configuraManual: Boolean = false;
      const Modelo: String = ''; const PaginaCodigo: String = '';
      const Porta: String = ''; const ParamString: String = '';
      const Colunas: String = ''; const EspacoEntreLinhas: String = '';
      const ControlePorta: String = ''; const CortaPapel: String = '');
    procedure imprimeTextoComprovante(Texto: String;
      const Alinhamento: String = 'E'; const quebraLinhaTexto: Boolean = false;
      const TipoFonte: String = 'N'; const efeitoLetra: String = 'N');
    procedure imprimeTextoComprovanteValor(Texto: String; Valor: String;
      TipoLetra: String = 'N'; CortaTexto: Boolean = false;
      efeitoLetra: String = 'N');
    procedure imprimeTextoComprovanteEspaco(PrimeiroTexto: String;
      SegundoTexto: String);
    procedure imprimeTextoComprovanteCentroDireita(Texto: String; Valor: String;
      const TipoLetra: String = 'N');
    procedure fechaComprovante(const assinatura: Boolean = false;
      const operadorCaixa: Boolean = false; const totalAvancoPapel: Integer = 1;
      const imprimeComprovante: Boolean = true);
    procedure linhaCompleta;
    procedure LinhaCompletaPersonalizada(iTipoLinha: Integer);
    procedure avancoManual(iTotalLinhas: Integer);
    procedure imprimeTextoTitulo(titulo: String);
    procedure imprimeTextoNegrito(Texto: String;
      const Alinhamento: String = 'E');

    function centerText(Texto: String): String;
    function leftText(Texto: String): String;
    function rightText(Texto: String): String;
    function boldText(Texto: String): String;
    function expandedText(Texto: String): String;
    function fontBText(Texto: String): String;
    function condensedText(Texto: String): String;
    function sublinhadoText(Texto: String): String;
    function linhaSimples: String;
    function linhaDupla: String;
    function linhaPontilhada: String;
    function linhaPontilhadaPor2: String;

  published
    property NumeroColunas: Integer read FNumeroColunas write setNumeroColunas;
    property titulo: String read FTitulo write setTitulo;
    property Impressora: String read FImpressora write setImpressora;
    property assinatura: String read FAssinatura write setAssinatura;
    property cabecalho: Boolean read FCabecalho write setCabecalho;
    property tipoTitulo: String read FTipoTitulo write setTipoTitulo;
    property usaTitulo: Boolean read FUsaTitulo write setUsaTitulo;
    property CorteParcialComprovante: Boolean read FCorteParcialComprovante
      write SeCorteParcialComprovante;
  end;

implementation

uses
  FireDAC.Stan.Param, uConexaoFiredac, FireDAC.Comp.Client;

{ TComprovante }

procedure TComprovante.abreComprovante(const configuraManual: Boolean;
  const Modelo: String; const PaginaCodigo: String; const Porta: String;
  const ParamString: String; const Colunas: String;
  const EspacoEntreLinhas: String; const ControlePorta: String;
  const CortaPapel: String);
begin
  configuraImpressora(configuraManual, Modelo, PaginaCodigo, Porta, ParamString,
    Colunas, EspacoEntreLinhas, ControlePorta, CortaPapel);
  if FCabecalho then
    dadosEmpresa;

  if FUsaTitulo then
    tituloCabecalho;
end;

procedure TComprovante.linha;
begin
  FComprovante.add(' ');
end;

procedure TComprovante.linhaAssinatura;
var
  I: Integer;
  sAssinatura: String;
begin
  sAssinatura := '';
  avancoManual(2);

  for I := 0 to (FNumeroColunas) do
  begin
    sAssinatura := sAssinatura + '_';
  end;

  if FNumeroColunas < 40 then
  begin
    FComprovante.add(leftText(fontBText(sAssinatura)));
    FComprovante.add('     ' + leftText(fontBText(FAssinatura)));
  end
  else
  begin
    FComprovante.add(centerText(fontBText(sAssinatura)));
    FComprovante.add(centerText(fontBText(FAssinatura)));
  end;
end;

procedure TComprovante.linhaCompleta;
var
  linha: String;
  I: Integer;
begin
  for I := 0 to (FNumeroColunas) do
  begin
    linha := linha + '_';
  end;

  FComprovante.add(linha);
end;

procedure TComprovante.LinhaCompletaPersonalizada(iTipoLinha: Integer);
var
  linha: String;
  I: Integer;
begin
  for I := 0 to (FNumeroColunas - 1) do
  begin
    case iTipoLinha of
      0:
        linha := linha + '_';
      1:
        linha := linha + '-';
      2:
        linha := linha + '=';
      3:
        linha := linha + '*';
    end;
  end;

  FComprovante.add(linha);
end;

function TComprovante.alinhamentoTextoComprovante(Texto, TipoAlinhamento
  : String): String;
begin
  Texto := Trim(Texto);
  case AnsiIndexStr(TipoAlinhamento, ['E', 'D', 'C']) of
    0, -1:
      result := leftText(Texto);
    1:
      result := rightText(Texto);
    2:
      result := centerText(Texto);
  end;
end;

procedure TComprovante.avancoManual(iTotalLinhas: Integer);
var
  I: Integer;
begin
  for I := 0 to iTotalLinhas do
  begin
    FComprovante.add(' ');
  end;
end;

function TComprovante.boldText(Texto: String): String;
begin
  result := '<n>' + Texto + '</n>';
end;

function TComprovante.centerText(Texto: String): String;
begin
  result := '</ce>' + Texto + '</ae>';
end;

procedure TComprovante.Clear;
begin
  FreeAndNil(FComprovante);
  FTitulo := '';
  FNumeroColunas := 0;
end;

function TComprovante.condensedText(Texto: String): String;
begin
  result := '<c>' + Texto + '</c></ae>';
end;

procedure TComprovante.configuraImpressora(const configuraManual: Boolean;
  const Modelo: String; const PaginaCodigo: String; const Porta: String;
  const ParamString: String; const Colunas: String;
  const EspacoEntreLinhas: String; const ControlePorta: String;
  const CortaPapel: String);
begin
  { Configura Impressora }
  ACBrPosPrinter.Desativar;
  if configuraManual then
  begin
    if Modelo <> '' then
      ACBrPosPrinter.Modelo := TACBrPosPrinterModelo(StrToInt(Modelo));

    if PaginaCodigo <> '' then
      ACBrPosPrinter.PaginaDeCodigo :=
        TACBrPosPaginaCodigo(StrToInt(PaginaCodigo));

    if Porta <> '' then
      ACBrPosPrinter.Porta := Porta;

    if ParamString <> '' then
      ACBrPosPrinter.Device.ParamsString := ParamString;

    if Colunas <> '' then
      ACBrPosPrinter.ColunasFonteNormal := StrToInt(Colunas);

    FNumeroColunas := StrToInt(Colunas);

    if EspacoEntreLinhas <> '' then
      ACBrPosPrinter.EspacoEntreLinhas := StrToInt(EspacoEntreLinhas);

    ACBrPosPrinter.ControlePorta := true;

    ACBrPosPrinter.CortaPapel := true;

  end
  else
  begin
    ACBrPosPrinter.Desativar;
    ACBrPosPrinter.Modelo := TACBrPosPrinterModelo
      (StrToInt(readArqIni('Impressora' + FImpressora, 'Modelo', '0')));
    ACBrPosPrinter.PaginaDeCodigo :=
      TACBrPosPaginaCodigo(StrToInt(readArqIni('Impressora' + FImpressora,
      'PaginaDeCodigo', '0')));
    ACBrPosPrinter.Porta := Trim(readArqIni('Impressora' + FImpressora,
      'Porta', ''));

    ACBrPosPrinter.Device.ParamsString :=
      DesCriptografa(readArqIni('Impressora' + FImpressora,
      'ParamsString', ''));

    ACBrPosPrinter.ColunasFonteNormal :=
      StrToInt(readArqIni('Impressora' + FImpressora, 'Colunas', '48'));

    ACBrPosPrinter.EspacoEntreLinhas :=
      StrToInt(readArqIni('Impressora' + FImpressora,
      'EspacoEntreLinhas', '0'));
    ACBrPosPrinter.ControlePorta :=
      Trim(readArqIni('Impressora' + FImpressora, 'ControlePorta', '1')) = '1';
    ACBrPosPrinter.CortaPapel :=
      Trim(readArqIni('Impressora' + FImpressora, 'CortarPapel', '1')) = '1';
  end;

  if not ACBrPosPrinter.Ativo then
    ACBrPosPrinter.Ativar;
end;

function TComprovante.corteParcial: String;
begin
  result := '</corte_parcial>';
end;

function TComprovante.corteTotal: String;
begin
  result := '</corte_total>';
end;

constructor TComprovante.Create(CodigoEmpresa: Integer);
begin

  ACBrPosPrinter := TACBrPosPrinter.Create(nil);

  FComprovante := TStringList.Create;
  FImpressora := 'PADRAO';
  FAssinatura := 'ASSINATURA';
  FTitulo := 'RECIBO';
  FCabecalho := true;
  FTipoTitulo := 'P';
  FUsaTitulo := true;
  FCorteParcialComprovante := false;
  FCodigoEmpresa := CodigoEmpresa;

  FNumeroColunas :=
    StrToInt(RemoveChar(Trim(readArqIni('Impressora' + FImpressora,
    'Colunas', '48'))));
end;

procedure TComprovante.dadosEmpresa;
var
  sRazaoEmp, sEndNumBaiEmp, sCepCidEstEmp, sCNPJEmp, sIEEmp: string;
  sTelEmp: string;
  Query: TFDQuery;
begin

  { Busca dados da empresa }

  Query := TConexaoFiredac.getInstancia.prepareStatement
    ('select FJ_EMP, FANTASIA_EMP, END_EMP, NUMERO_EMP NUM_EMP, BAI_EMP, CEP_EMP, '
    + 'CID_EMP, EST_EMP, CNPJ_EMP, INSC_EMP, TEL_EMP from EMPRESA E ' +
    'where COD_EMP = :CODEMP');
  Query.ParamByName('CODEMP').AsInteger := FCodigoEmpresa;
  Query.Open;

  sRazaoEmp := copy(Trim(Query.fieldbyname('fantasia_emp').AsString), 1, 64);
  sEndNumBaiEmp := copy(Query.fieldbyname('end_emp').AsString + ', ' +
    Query.fieldbyname('num_emp').AsString + ', ' + Query.fieldbyname('bai_emp')
    .AsString, 1, 64);
  sCepCidEstEmp := copy(Query.fieldbyname('cep_emp').AsString + ' - ' +
    Query.fieldbyname('cid_emp').AsString + ' - ' + Query.fieldbyname('est_emp')
    .AsString, 1, 64);

  if Trim(Query.fieldbyname('fj_emp').AsString) = 'F' then
    sCNPJEmp := 'CNPJ: ' + copy(Query.fieldbyname('cnpj_emp').AsString, 1, 3) +
      '.' + copy(Query.fieldbyname('cnpj_emp').AsString, 4, 3) + '.' +
      copy(Query.fieldbyname('cnpj_emp').AsString, 7, 3) + '-' +
      copy(Query.fieldbyname('cnpj_emp').AsString, 10, 2)
  else
    sCNPJEmp := copy(Query.fieldbyname('cnpj_emp').AsString, 1, 2) + '.' +
      copy(Query.fieldbyname('cnpj_emp').AsString, 3, 3) + '.' +
      copy(Query.fieldbyname('cnpj_emp').AsString, 6, 3) + '/' +
      copy(Query.fieldbyname('cnpj_emp').AsString, 9, 4) + '-' +
      copy(Query.fieldbyname('cnpj_emp').AsString, 13, 2);

  sIEEmp := 'IE: ' + Trim(Query.fieldbyname('insc_emp').AsString);

  sTelEmp := 'TEL.: ' + Trim(Query.fieldbyname('TEL_EMP').AsString);

  if Assigned(Query) then
    TConexaoFiredac.getInstancia.closeConnection(Query);

  if FNumeroColunas < 40 then
  begin
    FComprovante.add(leftText(copy(sRazaoEmp, 1, FNumeroColunas)));
    FComprovante.add(leftText(copy(sTelEmp, 1, FNumeroColunas)));
    FComprovante.add(leftText(copy(sEndNumBaiEmp, 1, FNumeroColunas)));
    FComprovante.add(leftText(copy(sCepCidEstEmp, 1, FNumeroColunas)));
    FComprovante.add(leftText(copy(sCNPJEmp + '  ' + sIEEmp, 1,
      FNumeroColunas)));
    FComprovante.add(linhaSimples);
    FComprovante.add(leftText(fontBText('Emissao: ' + DateToStr(date) + '  ' +
      timetostr(time))));
    FComprovante.add(linhaSimples);
  end
  else
  begin
    FComprovante.add(centerText(copy(sRazaoEmp, 1, FNumeroColunas)));
    FComprovante.add(centerText(copy(sTelEmp, 1, FNumeroColunas)));
    FComprovante.add(centerText(copy(sEndNumBaiEmp, 1, FNumeroColunas)));
    FComprovante.add(centerText(copy(sCepCidEstEmp, 1, FNumeroColunas)));
    FComprovante.add(centerText(copy(sCNPJEmp + '  ' + sIEEmp, 1,
      FNumeroColunas)));
    FComprovante.add(linhaSimples);
    FComprovante.add(leftText(fontBText('Emissao: ' + DateToStr(date) + '  ' +
      timetostr(time))));
    FComprovante.add(linhaSimples);
  end;
end;

destructor TComprovante.Destroy;
begin
  Self.Clear;
  inherited;
end;

function TComprovante.expandedText(Texto: String): String;
begin
  result := '<e>' + Texto + '</e>';
end;

procedure TComprovante.fechaComprovante(const assinatura,
  operadorCaixa: Boolean; const totalAvancoPapel: Integer;
  const imprimeComprovante: Boolean);
begin
  if assinatura then
    linhaAssinatura;

  avancoManual(totalAvancoPapel);

  if FCorteParcialComprovante then
    FComprovante.add(corteParcial)
  else
    FComprovante.add(corteTotal);

  if imprimeComprovante then
    ACBrPosPrinter.Imprimir(AnsiString(FComprovante.Text));

  FreeAndNil(FComprovante);
  ACBrPosPrinter.Desativar;
end;

function TComprovante.fontBText(Texto: String): String;
begin
  result := '</fb>' + Texto + '</fn>';
end;

procedure TComprovante.imprimeTextoComprovante(Texto: String;
  const Alinhamento: String; const quebraLinhaTexto: Boolean;
  const TipoFonte: String; const efeitoLetra: String);
var
  iTotalCaracteres, iNumeroCaracteres: Integer;
begin
  if quebraLinhaTexto then
  begin
    iTotalCaracteres := length(Trim(Texto));
    iNumeroCaracteres := 1;

    while iTotalCaracteres > 0 do
    begin
      FComprovante.add
        (tipoEfeitoLetra(tipoFonteTextoComprovante(alinhamentoTextoComprovante
        (copy(Texto, iNumeroCaracteres, numeroColunasT(TipoFonte)),
        Alinhamento), TipoFonte), efeitoLetra));

      iTotalCaracteres := iTotalCaracteres - numeroColunasT(TipoFonte);
      iNumeroCaracteres := iNumeroCaracteres + numeroColunasT(TipoFonte);
      Application.ProcessMessages;
    end;

  end
  else
  begin
    Texto := copy(Trim(Texto), 1, numeroColunasT(TipoFonte));
    FComprovante.add(tipoEfeitoLetra(tipoFonteTextoComprovante
      (alinhamentoTextoComprovante(Texto, Alinhamento), TipoFonte),
      efeitoLetra));
  end;
end;

procedure TComprovante.imprimeTextoComprovanteCentroDireita(Texto,
  Valor: String; const TipoLetra: String);
var
  I: Integer;
  sColunas, sColunasResto: String;
begin
  sColunas := '';

  for I := 0 to (numeroColunasT(TipoLetra) div 3) + 3 do
    sColunas := sColunas + ' ';

  sColunasResto := '';

  for I := 0 to (numeroColunasT(TipoLetra) - (length(sColunas) + length(Texto) +
    length(Valor))) - 1 do
    sColunasResto := sColunasResto + ' ';

  Texto := boldText(Trim(tipoFonteTextoComprovante(Texto, TipoLetra)));
  Valor := boldText(Trim(tipoFonteTextoComprovante(Valor, TipoLetra)));

  FComprovante.add(sColunas + Texto + sColunasResto + Valor);
end;

procedure TComprovante.imprimeTextoComprovanteEspaco(PrimeiroTexto,
  SegundoTexto: String);
var
  iTamanhoEspaco: Integer;
begin
  iTamanhoEspaco := Alinhamento(length(PrimeiroTexto) + length(SegundoTexto),
    FNumeroColunas);

  FComprovante.add(PrimeiroTexto + Space(iTamanhoEspaco) + SegundoTexto);
end;

procedure TComprovante.imprimeTextoComprovanteValor(Texto: String;
  Valor: String; TipoLetra: String; CortaTexto: Boolean; efeitoLetra: String);
var
  TamanhoResto: Integer;
  iTotalCaracteres, iNumeroCaracteres: Integer;
begin

  if CortaTexto then
  begin
    Texto := Trim(Texto);
    iTotalCaracteres := length(Texto) + length(Valor);

    iNumeroCaracteres := 1;

    while iTotalCaracteres > 0 do
    begin
      if (iTotalCaracteres > numeroColunasT(TipoLetra)) then
      begin
        FComprovante.add
          (tipoEfeitoLetra(tipoFonteTextoComprovante(leftText(Trim(copy(Texto,
          iNumeroCaracteres, numeroColunasT(TipoLetra)))), TipoLetra),
          efeitoLetra));
      end
      else
      begin
        Self.imprimeTextoComprovanteValor(copy(Texto, iNumeroCaracteres,
          numeroColunasT(TipoLetra)), Valor, TipoLetra, false);
      end;

      iTotalCaracteres := iTotalCaracteres - numeroColunasT(TipoLetra);
      iNumeroCaracteres := iNumeroCaracteres + numeroColunasT(TipoLetra);
      Application.ProcessMessages;
    end;
  end
  else
  begin

    Texto := Trim(Texto);

    TamanhoResto := Alinhamento(length(Valor) +
      length(copy(FormataStringE(Texto, inttostr(numeroColunasT(TipoLetra)),
      ' '), 1, (numeroColunasT(TipoLetra)))), numeroColunasT(TipoLetra));

    FComprovante.add(tipoEfeitoLetra(tipoFonteTextoComprovante
      (leftText(copy(copy(FormataStringE(Texto,
      inttostr(numeroColunasT(TipoLetra)), ' '), 1, numeroColunasT(TipoLetra)),
      1, length(copy(FormataStringE(Texto, inttostr(numeroColunasT(TipoLetra)),
      ' '), 1, numeroColunasT(TipoLetra))) - TamanhoResto) +
      FormataStringD(Valor, '0', ' ')), TipoLetra), efeitoLetra));
  end;

end;

procedure TComprovante.imprimeTextoNegrito(Texto: String;
  const Alinhamento: String);
begin
  Texto := boldText(Trim(Texto));
  case AnsiIndexStr(Alinhamento, ['E', 'D', 'C']) of
    0, -1:
      FComprovante.add(leftText(Trim(Texto)));
    1:
      FComprovante.add(rightText(Trim(Texto)));
    2:
      FComprovante.add(centerText(Trim(Texto)));
  end;
end;

procedure TComprovante.imprimeTextoTitulo(titulo: String);
begin

  FComprovante.add(linhaSimples);

  if Trim(titulo) <> '' then
    if FNumeroColunas < 40 then
    begin
      FComprovante.add(centerText(expandedText(copy(titulo, 1, 16))));

      if (Trim(copy(titulo, 17, 16)) <> '') and
        (length(Trim(copy(titulo, 17, 16))) >= 2) then
        FComprovante.add(expandedText(centerText(Trim(copy(titulo, 17, 16)))));
    end
    else
    begin
      FComprovante.add(expandedText(centerText(copy(titulo, 1, 24))));

      if (Trim(copy(titulo, 25, 24)) <> '') and
        (length(Trim(copy(titulo, 25, 24))) >= 2) then
        FComprovante.add(expandedText(centerText(Trim(copy(titulo, 25, 24)))));
    end;

  FComprovante.add(linhaSimples);
end;

function TComprovante.leftText(Texto: String): String;
begin
  result := '</ae>' + Texto;
end;

function TComprovante.linhaDupla: String;
begin
  result := '</linha_dupla>';
end;

function TComprovante.linhaPontilhada: String;
var
  I: Integer;
  sLinha: String;
begin
  for I := 0 to numeroColunasT('C') - 1 do
  begin
    sLinha := sLinha + '.';
  end;

  FComprovante.add(leftText(fontBText(sLinha)));
end;

function TComprovante.linhaPontilhadaPor2: String;
var
  I: Integer;
  sLinha: String;
begin
  for I := 0 to (numeroColunasT('C') - 1) div 2 do
  begin
    sLinha := sLinha + '.';
  end;

  FComprovante.add(centerText(fontBText(sLinha)));
end;

function TComprovante.linhaSimples: String;
begin
  result := '</fn></ae></linha_simples>';
end;

function TComprovante.numeroColunasT(TipoLetra: String): Integer;
begin
  case AnsiIndexStr(TipoLetra, ['N', 'C', 'E']) of
    0:
      result := FNumeroColunas;
    1:
      result := ((FNumeroColunas * 134) div 100);
    2:
      result := (FNumeroColunas div 2);
  else
    result := FNumeroColunas;
  end;
end;

function TComprovante.rightText(Texto: String): String;
begin
  result := '</ad>' + Texto + '</ae>';
end;

procedure TComprovante.SeCorteParcialComprovante(const Value: Boolean);
begin
  FCorteParcialComprovante := Value;
end;

procedure TComprovante.setAssinatura(const Value: String);
begin
  FAssinatura := Value;
end;

procedure TComprovante.setCabecalho(const Value: Boolean);
begin
  FCabecalho := Value;
end;

procedure TComprovante.setImpressora(const Value: String);
begin
  FImpressora := Value;

  FNumeroColunas :=
    StrToInt(RemoveChar(Trim(readArqIni('Impressora' + FImpressora,
    'Colunas', '48'))));
end;

procedure TComprovante.setNumeroColunas(const Value: Integer);
begin
  FNumeroColunas := Value;
end;

procedure TComprovante.setTipoTitulo(const Value: String);
begin
  FTipoTitulo := Value;
end;

procedure TComprovante.setTitulo(const Value: String);
begin
  FTitulo := Value;
end;

procedure TComprovante.setUsaTitulo(const Value: Boolean);
begin
  FUsaTitulo := Value;
end;

function TComprovante.sublinhadoText(Texto: String): String;
begin
  result := '<S>' + Texto + '</S></ae>';
end;

function TComprovante.tipoEfeitoLetra(Texto, efeitoLetra: String): String;
begin
  Texto := Trim(Texto);
  case AnsiIndexStr(efeitoLetra, ['N', 'S']) of
    0, -1:
      result := Texto;
    1:
      result := sublinhadoText(Texto);
  end;
end;

function TComprovante.tipoFonteTextoComprovante(Texto,
  TipoFonte: String): String;
begin
  Texto := Trim(Texto);
  case AnsiIndexStr(TipoFonte, ['N', 'C', 'E']) of
    0, -1:
      result := Texto;
    1:
      result := condensedText(Texto);
    2:
      result := expandedText(Texto);
  end;
end;

procedure TComprovante.tituloCabecalho;
begin
  if Trim(FTitulo) <> '' then
  begin
    case AnsiIndexStr(FTipoTitulo, ['P', 'G']) of
      0:
        begin
          if FNumeroColunas < 40 then
            FComprovante.add(boldText(leftText(FTitulo)))
          else
            FComprovante.add(boldText(centerText(FTitulo)));
        end;
      1:
        begin
          if FNumeroColunas < 40 then
          begin
            FComprovante.add(leftText(expandedText(copy(FTitulo, 1, 16))));

            if (Trim(copy(FTitulo, 17, 16)) <> '') and
              (length(Trim(copy(FTitulo, 17, 16))) >= 2) then
              FComprovante.add
                (expandedText(leftText(Trim(copy(FTitulo, 17, 16)))));
          end
          else
          begin
            FComprovante.add(expandedText(centerText(copy(FTitulo, 1, 24))));

            if (Trim(copy(FTitulo, 25, 24)) <> '') and
              (length(Trim(copy(FTitulo, 25, 24))) >= 2) then
              FComprovante.add
                (expandedText(centerText(Trim(copy(FTitulo, 25, 24)))));
          end;
        end;
    end;
  end;
  FComprovante.add(linhaSimples);
end;

end.
