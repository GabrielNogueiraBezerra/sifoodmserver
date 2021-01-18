unit impressao;

interface

uses
  FireDAC.Comp.Client, comprovante;

type
{$TYPEINFO ON}
  TImpressao = class
  private
    FCodigo: Integer;
    FCodigoEmpresa: Integer;
    FTituloImpressao: String;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoEmpresa(const Value: Integer);

    procedure criaComprovante;

  protected
    QueryCabecalho: TFDQuery;
    QueryItens: TFDQuery;

    comprovante: TComprovante;

    procedure iniciaComprovante; dynamic; abstract;
    function iniciaQuerys: Boolean; dynamic; abstract;
    procedure imprimeCabecalho; dynamic; abstract;
    procedure imprimeItens; dynamic; abstract;
    procedure fechaComprovante; dynamic; abstract;

  public
    procedure executaRelatorio;
    property Codigo: Integer read FCodigo write SetCodigo;
    property CodigoEmpresa: Integer read FCodigoEmpresa write SetCodigoEmpresa;

    constructor create(Codigo, CodigoEmpresa: Integer; TituloImpressao: String);

  end;

implementation

{ TImpressao }

constructor TImpressao.create(Codigo, CodigoEmpresa: Integer;
  TituloImpressao: String);
begin
  FCodigo := Codigo;
  FCodigoEmpresa := CodigoEmpresa;
  FTituloImpressao := TituloImpressao;
end;

procedure TImpressao.criaComprovante;
begin
  comprovante := TComprovante.create(FCodigoEmpresa);
  comprovante.titulo := FTituloImpressao;
  comprovante.CorteParcialComprovante := true;
end;

procedure TImpressao.executaRelatorio;
var
  imprime: Boolean;
begin
  imprime := iniciaQuerys;

  if imprime then
  begin
    criaComprovante;
    iniciaComprovante;
    imprimeCabecalho;
    imprimeItens;
    fechaComprovante;
  end;
end;

procedure TImpressao.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TImpressao.SetCodigoEmpresa(const Value: Integer);
begin
  FCodigoEmpresa := Value;
end;

end.
