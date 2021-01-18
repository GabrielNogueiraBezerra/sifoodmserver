unit utils;

interface

uses
  System.Classes;

const
  Caractere: array [1 .. 106] of Char = ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
    'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
    'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '!', '#',
    '$', '%', '&', '/', '(', ')', '=', '?', '>', '^', '@', '£', '§', '{', '[',
    ']', '}', '´', '<', '~', '+', '*', '`', '''', 'ª', 'º', '¢', '-', '_', ',',
    '.', ';', ':', '|', '\', '¹', '²', '³', '¬', '°', '¨', ' ', 'a', 'b', 'c',
    'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
    's', 't', 'u', 'v', 'w', 'x', 'y', 'z');

const
  Subst: array [1 .. 106] of string = ('!9@8', '@7!7', '#4$5', '$5%4', '%8$8',
    '^1%1', '&3^5', '*7&6', '(6*6', ')3(3', '-2)8', '=1-7', '+0-9', '/0@1',
    '\9$7', '!3@2', '@3&6', '#1*4', '$2#4', '%6(8', '^9!5', '&4=4', '*3@4',
    '(8*4', ')4!7', '-0^5', '=1@9', '+2!0', '/8%2', '\7@5', '!3@7', '@4!8',
    '#7&4', '$6$3', '%2&7', '^1*3', '&1@0', '*3$9', '#3^1', '!4-2', '&6(5',
    '!5@8', ')7!8', '4&1-', 'a2$1', '*9z6', '@7c3', '1%^5', '0&*6', '$5^6',
    '!18)', '(38)', '@30&', '#69]', '[70]', '{26}', '-93#', 'l52h', 'h71i',
    'w80&', '%50%', '#401', '@87-', 'b46x', 'r55^', '!2*2', 'o08y', '&89)',
    '%03%', '\59q', 't85*', '^29-', '@02%', '#99)', '#255', '@23~', '~91t',
    '6%4n', '~5a1', '0=+0', 'Za*a', '%yB-', 'Xc#C', 'wl#d', 'V*@e', '&UF)',
    '!tG$', '-sh@', '%rij', '%QJ)', '%pk&', '@oL*', '!nm=', '!MN*', '@lO-',
    '$kpy', 'Ojq;', ':Ir-', 'h:;s', 'Gx%T', 'f}{U', 'E#tv', 'd1W+', '&cxk',
    'pby$', 'aZ()');

function iif(Condition: Boolean; Value1, Value2: Variant): Variant;
function getApplicationPath: String;
function pathArqIni: String;
procedure writeArqIni(Section: String; Ident: String; Value: String);
function readArqIni(Section: String; Ident: String;
  DefaultValue: String): String;
function criptografa(Palavra: string): string;
function descriptografa(Palavra: string): string;
function getBuildInfo: String;
function removeChar(const Texto: string): string;
function alinhamento(iTamanhoRestoDesc, iColunas: Integer): Integer;
function space(Tamanho: Integer): string;
function FormataStringD(Valor, Tamanho, Complemento: string): string;
function FormataStringE(Valor, Tamanho, Complemento: string): string;
function Explode(Str, separador: string): TStringList;
function FormataCNPJ(cnpj: string): string;
function EliminaCaracter(stext: string): string;
function Replace(Value: String; oldValue: String; newValue: String): String;
function verificaInternet: Boolean;

implementation

uses
  System.SysUtils, Vcl.Forms, System.IniFiles, Vcl.Dialogs, System.Types,
  Winapi.Windows, Wininet;

function verificaInternet: Boolean;
var
  flags: DWORD;
begin
  Result := InternetGetConnectedState(@flags, 0);
end;

function Replace(Value: String; oldValue: String; newValue: String): String;
begin
  Result := StringReplace(Value, oldValue, newValue,
    [rfReplaceAll, rfIgnoreCase]);
end;

function EliminaCaracter(stext: string): string;
var
  npos: Integer;
begin
  Result := '';
  npos := 1;
  while npos <= length(stext) do
  begin
    if (stext[npos] = '.') or (stext[npos] = '-') or (stext[npos] = '/') or
      (stext[npos] = ')') or (stext[npos] = '(') or (stext[npos] = ',') then
    begin
      inc(npos);
    end
    else
    begin
      Result := Result + stext[npos];
      inc(npos);
    end;
  end;
end;

function FormataCNPJ(cnpj: string): string;
var
  sAux, sCNPJ: string;
begin
  sAux := EliminaCaracter(cnpj);
  case length(sAux) of
    11:
      begin
        sCNPJ := Copy(sAux, 1, 3) + '.' + Copy(sAux, 4, 3) + '.' +
          Copy(sAux, 7, 3) + '-' + Copy(sAux, 10, 2);
        Result := sCNPJ;
      end;
    14:
      begin
        sCNPJ := Copy(sAux, 1, 2) + '.' + Copy(sAux, 3, 3) + '.' +
          Copy(sAux, 6, 3) + '/' + Copy(sAux, 9, 4) + '-' + Copy(sAux, 13, 2);
        Result := sCNPJ;
      end;
  else
    Result := '';
  end;
end;

function Explode(Str, separador: string): TStringList;
var
  p: Integer;
begin
  Result := TStringList.Create;
  p := Pos(separador, Str);

  while (p > 0) do
  begin
    Result.Add(Copy(Str, 1, p - 1));
    Delete(Str, 1, p + length(separador) - 1);
    p := Pos(separador, Str);
  end;

  if (Str <> '') then
    Result.Add(Str);
end;

function space(Tamanho: Integer): string;
begin
  Result := StringOfChar(' ', Tamanho);
end;

function FormataStringD(Valor, Tamanho, Complemento: string): string;
var
  X, Y: Integer;
begin
  Y := length(Valor);
  for X := Y to StrToInt(Tamanho) do
  begin
    if (X <> StrToInt(Tamanho)) then
      Valor := Complemento + Valor
    else
      Valor := '' + Valor;
  end;
  Result := Valor;
end;

function FormataStringE(Valor, Tamanho, Complemento: string): string;
var
  X, Y: Integer;
begin
  Y := length(Valor);
  for X := Y to StrToInt(Tamanho) do
  begin
    if (X <> StrToInt(Tamanho)) then
      Valor := Valor + Complemento
    else
      Valor := Valor + '';
  end;
  Result := Valor;
end;

function getApplicationPath: String;
begin
  Result := ExtractFilePath(Application.ExeName);
end;

function iif(Condition: Boolean; Value1, Value2: Variant): Variant;
begin
  if (Condition) then
    Result := Value1
  else
    Result := Value2;
end;

function alinhamento(iTamanhoRestoDesc, iColunas: Integer): Integer;
begin
  if iColunas > iTamanhoRestoDesc then
    Result := iColunas - iTamanhoRestoDesc
  else
    Result := iTamanhoRestoDesc - iColunas;
end;

function removeChar(const Texto: string): string;
var
  C: Char;
begin
  Result := '';
  for C in Texto do
    if CharInSet(C, ['0' .. '9']) then
      Result := Result + C;
end;

function pathArqIni: String;
begin
  Result := getApplicationPath + 'CnfComercio.ini';
end;

procedure writeArqIni(Section: String; Ident: String; Value: String);

var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(pathArqIni);

  try
    try
      ArqIni.WriteString(Section, Ident, Value);
    except
      on e: Exception do
      begin
        showmessage('Ocorreu um problema ao gravar no arquivo INI: ' +
          e.message);
      end;
    end;
  finally
    ArqIni.Free;
  end;
end;

function readArqIni(Section: String; Ident: String;
  DefaultValue: String): String;

var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(pathArqIni);

  try
    try
      Result := ArqIni.ReadString(Section, Ident, DefaultValue);
    except
      on e: Exception do
      begin
        Result := DefaultValue;
        showmessage('Ocorreu um problema ao ler o arquivo INI: ' + e.message);
      end;
    end;
  finally
    ArqIni.Free;
  end;
end;

function getBuildInfo: String;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
  V1, V2, V3, V4: Word;
  Prog: string;
begin
  try
    Prog := Application.ExeName;
    VerInfoSize := GetFileVersionInfoSize(pchar(Prog), Dummy);
    GetMem(VerInfo, VerInfoSize);
    GetFileVersionInfo(pchar(Prog), 0, VerInfoSize, VerInfo);
    VerQueryValue(VerInfo, '', Pointer(VerValue), VerValueSize);

    with VerValue^ do
    begin
      V1 := dwFileVersionMS shr 16;
      V2 := dwFileVersionMS and $FFFF;
      V3 := dwFileVersionLS shr 16;
      V4 := dwFileVersionLS and $FFFF;
    end;

    FreeMem(VerInfo, VerInfoSize);
    Result := Copy(IntToStr(100 + V1), 3, 2) + '.' + Copy(IntToStr(100 + V2), 3,
      2) + '.' + Copy(IntToStr(100 + V3), 3, 2) + '.' +
      Copy(IntToStr(100 + V4), 3, 2);
  except
  end;
end;

function descriptografa(Palavra: string): string;
var
  iVetor: Integer;
  iContador: Integer;
  iContAux: Integer;
  sAuxiliar: string;
begin
  Result := '';
  iContAux := 0;
  sAuxiliar := '';

  for iVetor := 1 to length(Palavra) do
  begin
    for iContador := 1 to 106 do
    begin
      if (Copy(Palavra, iContAux + 1, 4) = Subst[iContador]) then
      begin
        sAuxiliar := sAuxiliar + Caractere[iContador];
      end;
    end;

    inc(iContAux, 4);
  end;

  Result := sAuxiliar;
end;

function criptografa(Palavra: string): string;
var
  vet: Integer;
  ct: Integer;
  aux: string;
begin
  Result := '';
  aux := '';

  for vet := 1 to length(Palavra) do
  begin
    for ct := 1 to 106 do
    begin
      if (Palavra[vet] = Caractere[ct]) then
      begin
        aux := aux + Subst[ct];
      end;
    end;
  end;

  Result := aux;
end;

end.
