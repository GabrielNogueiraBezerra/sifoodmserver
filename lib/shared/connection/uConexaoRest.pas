unit uConexaoRest;

interface

uses
  System.Generics.Collections, uRESTDWPoolerDB,
  uRESTDWServerEvents, uRESTDWBase;

type
{$TYPEINFO ON}
  TConexaoRest = class
  private
    FClientPooler: String;
    FConnections: TList<TRESTDWDatabase>;
    FPoolerService: String;
    FPoolerPort: Integer;
    FRequestTimeOut: Integer;
    constructor Create;
    function getConnection: TRESTDWDatabase;

    class var FInstancia: TConexaoRest;
  public
    function prepareStatement(const Value: String): TRESTDWClientSQL;
    procedure closeConnection(Query: TRESTDWClientSQL);
    procedure config(PoolerService: String; PoolerPort, RequestTimeOut: Integer;
      ClientPooler: String);
    class function getInstancia: TConexaoRest;
  end;

implementation

uses System.SysUtils, Vcl.Controls, uDWConstsCharset;

{ TConexaoRest }

procedure TConexaoRest.closeConnection(Query: TRESTDWClientSQL);
begin
  try
    if Assigned(Query) then
    begin
      Query.Close;

      if Query.Database <> nil then
        if Query.Database.Active then
          Query.Database.Active := false;

      if Query.Database <> nil then
      begin
        Query.Database.Active := false;
        FConnections.Remove(Query.Database);
        Query.Database := nil;
      end;

      FreeAndNil(Query);
    end;
  except
    raise Exception.Create('Não foi possível encerra a conexão.');
  end;
end;

procedure TConexaoRest.config(PoolerService: String;
  PoolerPort, RequestTimeOut: Integer; ClientPooler: String);
begin
  FPoolerService := PoolerService;
  FPoolerPort := PoolerPort;
  FRequestTimeOut := RequestTimeOut;

  FClientPooler := ClientPooler;
end;

constructor TConexaoRest.Create;
begin
  FPoolerService := '';
  FPoolerPort := 0;
  FRequestTimeOut := 0;

  FConnections := TList<TRESTDWDatabase>.Create;
end;

function TConexaoRest.getConnection: TRESTDWDatabase;
begin
  try

    Result := TRESTDWDatabase.Create(nil);
    Result.Active := false;
    Result.ClientConnectionDefs.Active := false;
    Result.Compression := True;
    Result.CriptOptions.Key := 'RDWBASEKEY256';
    Result.CriptOptions.Use := True;
    Result.EncodeStrings := True;
    Result.Encoding := TEncodeSelect.esUtf8;
    Result.FailOver := True;
    Result.FailOverReplaceDefaults := True;
    Result.PoolerService := FPoolerService;
    Result.PoolerPort := FPoolerPort;
    Result.RequestTimeOut := FRequestTimeOut;
    Result.StateConnection.AutoCheck := false;
    Result.StateConnection.InTime := 1000;
    Result.StrsEmpty2Null := false;
    Result.StrsTrim := false;
    Result.StrsTrim2Len := false;
    Result.TokenOptions.Active := false;
    Result.TokenOptions.TokenHash := 'RDWTS_HASH';

    Result.PoolerName := FClientPooler;

    Result.Active := True;
    FConnections.add(Result);
  except
    on E: Exception do
    begin
      raise Exception.Create
        ('Não foi possível criar conexão. Mensagem retornada: ' + E.message);
    end;
  end;

end;

class function TConexaoRest.getInstancia: TConexaoRest;
begin
  if FInstancia = Nil then
    FInstancia := TConexaoRest.Create;

  Result := FInstancia;
end;

function TConexaoRest.prepareStatement(const Value: String): TRESTDWClientSQL;
begin
  Result := TRESTDWClientSQL.Create(nil);
  Result.ActionCursor := crSQLWait;
  Result.AutoCalcFields := True;
  Result.AutoCommitData := false;
  Result.AutoRefreshAfterCommit := false;
  Result.BinaryCompatibleMode := false;
  Result.BinaryRequest := True;
  Result.Database := getConnection;
  Result.DataCache := false;
  Result.Datapacks := -1;
  Result.Filtered := false;
  Result.MasterCascadeDelete := false;
  Result.RaiseErrors := True;
  Result.ReflectChanges := True;
  Result.Close;
  Result.SQL.Clear;
  Result.SQL.Text := Value;
end;

end.
