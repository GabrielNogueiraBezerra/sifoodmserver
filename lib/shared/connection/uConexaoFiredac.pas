unit uConexaoFiredac;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt, FireDAC.Stan.ExprFuncs,
  FireDAC.FMXUI.Wait, FireDAC.Comp.Client, Data.DB,
  FireDAC.Stan.StorageJSON, FireDAC.Phys.SQLite,
  FireDAC.Comp.DataSet,
  FireDAC.Phys.FB, FireDAC.VCLUI.Wait,
  System.Classes;

type
{$TYPEINFO ON}
  TConexaoFiredac = class(TComponent)
  private
    FDriver: String;
    FDatabase: String;
    FOpenMode: String;
    FUsername: String;
    FPassword: String;
    FHost: String;
    FPorta: Integer;
    FManager: TFDManager;

    FCreate: Boolean;

    constructor Create;
    function getConnection: TFDConnection;

    class var FInstancia: TConexaoFiredac;
  public
    function prepareStatement(const Value: String): TFDQuery;
    procedure closeConnection(Query: TFDQuery);
    procedure config(Drive, Database, OpenMode, Username, Password,
      Host: String; Porta: Integer; Manager: TFDManager);
    class function getInstancia: TConexaoFiredac;
  end;

implementation

uses
  System.SysUtils;

{ TConexaoFiredac }

procedure TConexaoFiredac.closeConnection(Query: TFDQuery);
begin
  try
    if (Assigned(Query)) then
    begin
      Query.Close;

      if Query.Connection <> nil then
      begin
        Query.Connection.Connected := false;
        Query.Connection.Free;
      end;

    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Não foi possível encerra a conexão. Mensagem: ' +
        E.Message);
    end;
  end;
end;

procedure TConexaoFiredac.config(Drive, Database, OpenMode, Username, Password,
  Host: String; Porta: Integer; Manager: TFDManager);
var
  oParams: TStrings;
begin
  FDriver := Drive;
  FDatabase := Database;
  FOpenMode := OpenMode;
  FHost := Host;
  FPorta := Porta;
  FUsername := Username;
  FPassword := Password;
  FManager := Manager;

  if FCreate then
  begin
    FCreate := false;
    oParams := TStringList.Create;
    oParams.Add('DriverID=' + FDriver);
    oParams.Add('Server=' + FHost);
    oParams.Add('Port=' + inttostr(FPorta));
    oParams.Add('Database=' + FDatabase);
    oParams.Add('User_Name=' + FUsername);
    oParams.Add('Password=' + FPassword);
    oParams.Add('Protocol=TCPIP');
    oParams.Add('Pooled=True');
    FDManager.AddConnectionDef('connectionDef', 'FB', oParams);
    FDManager.FetchOptions.RowsetSize := 500;
    FDManager.open;

    oParams.Free;
  end;
end;

constructor TConexaoFiredac.Create;
begin
  FDriver := '';
  FDatabase := '';
  FOpenMode := '';
  FHost := '';
  FPorta := 0;

  FUsername := '';
  FPassword := '';
  FCreate := true;

end;

function TConexaoFiredac.getConnection: TFDConnection;
begin
  try
    Result := TFDConnection.Create(Self);

    Result.ConnectionDefName := 'connectionDef';

    Result.Connected := true;

  except
    on E: Exception do
    begin
      raise Exception.Create('Não foi possível criar a conexão com ' +
        'o banco de dados. Mensagem Retornada: ' + E.Message);
    end;
  end;
end;

class function TConexaoFiredac.getInstancia: TConexaoFiredac;
begin
  if FInstancia = Nil then
    FInstancia := TConexaoFiredac.Create;

  Result := FInstancia;
end;

function TConexaoFiredac.prepareStatement(const Value: String): TFDQuery;
var
  Query: TFDQuery;
  Connection: TFDCustomConnection;
begin
  Connection := getConnection;
  Query := TFDQuery.Create(Connection);
  Query.Connection := Connection;
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Text := Value;
  Result := Query;
end;

end.
