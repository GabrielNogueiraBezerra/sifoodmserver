unit licenca;

interface

type
{$TYPEINFO ON}
  TLicenca = class
  private
    FQuantidadeMaquinas: Integer;
    FVencimento: TDate;
    FChave: String;
    procedure SetQuantidadeMaquinas(const Value: Integer);
    procedure SetVencimento(const Value: TDate);
    procedure SetChave(const Value: String);
  public
    constructor create(Value: String);
  published
    property Chave: String read FChave write SetChave;
    property QuantidadeMaquinas: Integer read FQuantidadeMaquinas
      write SetQuantidadeMaquinas;
    property Vencimento: TDate read FVencimento write SetVencimento;
  end;

implementation

uses
  System.SysUtils;

{ TLicenca }

constructor TLicenca.create(Value: String);
var
  sData: String;
begin
  if Value <> '' then
  begin
    Chave := Value;
    FQuantidadeMaquinas := strtointdef(Copy(Value, 15, 3), 0);
    sData := Copy(Value, 18, 6);
    sData := Copy(sData, 1, 2) + '/' + Copy(sData, 3, 2) + '/20' +
      Copy(sData, 5, 2);

    if Trim(sData) = '00/00/2000' then
      FVencimento := 0
    else
    begin
      try
        FVencimento := StrToDateDef(sData, 0);
      except
        FVencimento := 0
      end;
    end;
  end
  else
  begin
    Chave := '';
  end;
end;

procedure TLicenca.SetChave(const Value: String);
begin
  FChave := Value;
end;

procedure TLicenca.SetQuantidadeMaquinas(const Value: Integer);
begin
  FQuantidadeMaquinas := Value;
end;

procedure TLicenca.SetVencimento(const Value: TDate);
begin
  FVencimento := Value;
end;

end.
