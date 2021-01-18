unit dashboard_controller;

interface

uses
  dashboard_module, webservice_repository, System.Classes,
  IdUDPServer, IdGlobal, dashboard_repository;

type
  TDashboardController = class
  private

    function getView: Tdashboard_module_page;
    function getWebserviceRepository: Twebservice_repository_dm;
    function getRepository: Tdashboard_repository_dm;

    procedure buttonServico;
    procedure colorButton;
    procedure hideApplication;
    procedure ShowApplication(Sender: TObject);
    Function GetHandleOnTaskBar: THandle;
    procedure loadIni;
    class var FInstancia: TDashboardController;

  public
    class function getInstancia: TDashboardController;

    constructor Create;

    procedure destroyInstancia;

    procedure FormShow;
    procedure FormClose;
    procedure FormCreate;

    procedure btnIniciarClick;
    procedure btnCloseClick(Sender: TObject);

    procedure lConfiguracoesClick;
    procedure lLogsClick;
    procedure lChaveClick;
    procedure btnInserirChaveClick;

    procedure lblImprimeDescricaoItemClick;
    procedure EdtPortaChange;
    procedure cbEmpresasChange;

    procedure TimerTimer(Sender: TObject);
    procedure btnBaixarChavesClick;
  end;

var
  primeiroAcesso: Boolean;

implementation

uses
  System.SysUtils, Vcl.Graphics, Vcl.Dialogs, Vcl.Forms, Winapi.Windows,
  Vcl.Controls, uConexaoFiredac, utils, licenca;

{ TDashboardController }

procedure TDashboardController.btnBaixarChavesClick;
begin
  with getView, getRepository do
  begin
    try
      btnBaixarChaves.enabled := false;

      if not verificaInternet then
      begin
        showmessage('Seu computador está sem conexão com a internet.');
        btnBaixarChaves.enabled := true;
        exit;
      end;

      carregaLicencas;
      showmessage('Chaves carregadas com sucesso');
      btnBaixarChaves.enabled := true;
    except
      on E: Exception do
      begin
        btnBaixarChaves.enabled := true;
        showmessage
          ('Não foi possível carregar chaves de licença. Mensagem retornada: ' +
          E.message);
      end;
    end;
  end;
end;

procedure TDashboardController.btnCloseClick(Sender: TObject);
begin
  with getView, getWebserviceRepository do
  begin
    { SERVIÇO NÃO ESTÁ ATIVO? }
    if service.active then
    begin
      { A TELA ESTÁ VISIVEL? }
      if not getView.visible then
      begin
        if Application.MessageBox
          ('Você deseja realmente fechar o Webservice Restaurante ?',
          'Webservice Restaurante', Mb_IconQuestion + Mb_YesNo) = MrYes then
          getView.close;
      end
      else
        hideApplication;
    end
    else
      getView.close;
  end;
end;

procedure TDashboardController.btnIniciarClick;
begin
  try

    with getView do
    begin
      TConexaoFiredac.getInstancia.config('FB', edBanco.Text, 'Open', 'sysdba',
        'masterkey', EdtHost.Text, strtoint(edPortaBD.Text), getView.FDManager);

      writeArqIni('ConfiguracaoLocal', 'PortaSIFOODM', Trim(EdtPorta.Text));
    end;

    with getRepository do
    begin

      portaServico := strtoint(getView.EdtPorta.Text);

      if primeiroAcesso then
      begin
        getView.mmRequest.Clear;
        getView.mmResponse.Clear;
        requestDashboard := getView.mmRequest;
        responseDashboard := getView.mmResponse;
        requestWebService := getView.mmRequest;
        responseWebService := getView.mmResponse;
      end;

    end;

    buttonServico;

    if getWebserviceRepository.service.active then
      lLogsClick;

    with getView, getWebserviceRepository do
    begin

      if primeiroAcesso then
        getRepository.carregaLicencas;

      getRepository.carregaIps;
    end;

  except
    on E: Exception do
    begin
      getWebserviceRepository.addResponse
        ('Não foi possível iniciar o serviço. Mensagem retornada: ' +
        E.message);
    end;
  end;

end;

procedure TDashboardController.btnInserirChaveClick;
begin
  with getView, getRepository do
  begin
    if cbEmpresas.Text = '' then
    begin
      cbEmpresas.setFocus;
      showmessage('Selecione uma empresa.');
      exit;
    end;

    if Trim(Replace(EdtChave.Text, '-', '')) = '' then
    begin
      EdtChave.setFocus;
      showmessage('Informe a chave de licença.');
      exit;
    end;

    lMensagemChave.visible := true;

    if ValidaChave(Trim(Replace(EdtChave.Text, '-', '')),
      Trim(RemoveChar(copy(cbEmpresas.Text, 1, Pos(' ', cbEmpresas.Text)))))
    then
    begin
      lMensagemChave.Caption := 'Chave válida';
      DeletaChave(FormataCNPJ(Trim(RemoveChar(copy(cbEmpresas.Text, 1,
        Pos(' ', cbEmpresas.Text))))));
      InsereChave(Trim(Replace(EdtChave.Text, '-', '')),
        FormataCNPJ(Trim(RemoveChar(copy(cbEmpresas.Text, 1, Pos(' ',
        cbEmpresas.Text))))));
      EdtChave.Clear;

      Self.cbEmpresasChange;
    end
    else
      lMensagemChave.Caption := 'Chave inválida';

  end;
end;

procedure TDashboardController.buttonServico;
begin
  try
    with getView do
    begin

      if not getWebserviceRepository.service.active then
        getWebserviceRepository.iniciaServico
          (StrToIntDef(getView.EdtPorta.Text, 8082))
      else
        getWebserviceRepository.encerraServico;
    end;

    colorButton;

    if getWebserviceRepository.service.active then
    begin
      getRepository.IdUDPServer.active := false;
      if not getRepository.IdUDPServer.active then
      begin
        getRepository.IdUDPServer.DefaultPort := 8761;
        getRepository.IdUDPServer.active := true;

        getRepository.addRequest('Aceitando mensagens broadcasting udp...');
      end;
    end
    else
    begin
      if getRepository.IdUDPServer.active then
        getRepository.IdUDPServer.active := false;
    end;
  except
    on E: Exception do
    begin
      getWebserviceRepository.addResponse
        ('Não foi possível iniciar o serviço. Mensagem retornada: ' +
        E.message);
    end;
  end;

end;

procedure TDashboardController.cbEmpresasChange;
var
  licenca: TLicenca;
begin
  with getView, getRepository do
  begin
    licenca := TLicenca.Create
      (ConsultaChave(ConsultaLicenca(Trim(RemoveChar(copy(cbEmpresas.Text, 1,
      Pos(' ', cbEmpresas.Text)))))));

    Panel19.visible := true;
    lVencimento.visible := false;
    lMensagemChave.visible := false;

    if licenca.Chave = '' then
    begin
      lStatusLicenca.Caption := 'Esta empresa não possui licença.';
      lVencimento.visible := false;
    end
    else
    begin
      if licenca.Vencimento > 0 then
      begin
        lStatusLicenca.Caption := 'Esta licença está no plano DEMONSTRAÇÃO' +
          slinebreak + inttostr(licenca.QuantidadeMaquinas) +
          ' dispositivos autorizados.';
        lVencimento.visible := true;

        lVencimento.Caption := inttostr(Trunc(licenca.Vencimento - date)) +
          ' dias para o vencimento';
      end
      else
      begin
        lStatusLicenca.Caption := 'Esta licença está no plano PRO' + slinebreak
          + inttostr(licenca.QuantidadeMaquinas) + ' dispositivos autorizados.';
      end;
    end;

    lStatusLicenca.Top := (Panel21.Height - lStatusLicenca.Height) div 2;

  end;

end;

procedure TDashboardController.colorButton;
begin
  with getView do
  begin
    if getWebserviceRepository.service.active then
    begin
      pnIniciar.color := $00201F23;
      pnColorIniciar.color := clWhite;
      btnIniciar.Caption := 'Parar Servidor';
      btnIniciar.font.color := clblack;
    end
    else
    begin
      pnIniciar.color := $00201F23;
      pnColorIniciar.color := $00201F23;
      btnIniciar.Caption := 'Iniciar Servidor';
      btnIniciar.font.color := clWhite;
    end;
  end;
end;

constructor TDashboardController.Create;
begin
  if not Assigned(webservice_repository_dm) then
    webservice_repository_dm := Twebservice_repository_dm.Create(nil);

  if not Assigned(dashboard_repository_dm) then
    dashboard_repository_dm := Tdashboard_repository_dm.Create(nil);

  with getRepository do
  begin
    pmiRestauraApp.OnClick := ShowApplication;
    pmiSairAPP.OnClick := btnCloseClick;
    TrayIcon.OnDblClick := ShowApplication;
  end;

end;

procedure TDashboardController.destroyInstancia;
begin
  if Assigned(FInstancia) then
  begin
    FreeAndNil(FInstancia);
    FreeAndNil(webservice_repository_dm);
    FreeAndNil(dashboard_repository_dm);
  end;
end;

procedure TDashboardController.EdtPortaChange;
begin
  with getView do
    writeArqIni('ConfiguracaoLocal', 'PortaSIFOODM', Trim(EdtPorta.Text));
end;

procedure TDashboardController.ShowApplication(Sender: TObject);
begin
  with getView, getRepository do
  begin
    TrayIcon.visible := false;
    Application.ShowMainForm := true;
    getView.visible := true;
    getView.WindowState := WsNormal;
    ShowWindow(GetHandleOnTaskBar, SW_SHOW);

  end;

  btnIniciarClick;

end;

procedure TDashboardController.FormClose;
begin
  destroyInstancia;
end;

procedure TDashboardController.FormCreate;
begin
  primeiroAcesso := true;
  getRepository.IdUDPServer.active := false;
end;

procedure TDashboardController.FormShow;
begin

  loadIni;
  colorButton;
  lConfiguracoesClick;

  btnIniciarClick;

  if primeiroAcesso then
  begin
    getRepository.Timer.OnTimer := Self.TimerTimer;
    primeiroAcesso := false;
    getRepository.Timer.enabled := true;
  end;

  getView.cbIps.Items := getRepository.FListaIps;
  getView.cbIps.ItemIndex := 0;

end;

function TDashboardController.GetHandleOnTaskBar: THandle;
begin
{$IFDEF COMPILER11_UP}
  If Application.MainFormOnTaskBar And Assigned(Application.MainForm) Then
    Result := Application.MainForm.Handle
  Else
{$ENDIF COMPILER11_UP}
    Result := Application.Handle;
end;

class function TDashboardController.getInstancia: TDashboardController;
begin
  if not Assigned(FInstancia) then
    FInstancia := TDashboardController.Create;

  Result := FInstancia;
end;

function TDashboardController.getRepository: Tdashboard_repository_dm;
begin
  Result := dashboard_repository_dm;
end;

function TDashboardController.getView: Tdashboard_module_page;
begin
  Result := dashboard_module_page;
end;

function TDashboardController.getWebserviceRepository
  : Twebservice_repository_dm;
begin
  Result := webservice_repository_dm;
end;

procedure TDashboardController.hideApplication;
begin

  with getView, getRepository do
  begin
    TrayIcon.visible := true;
    Application.ShowMainForm := false;
    getView.visible := false;
    Application.Minimize;
    ShowWindow(GetHandleOnTaskBar, SW_HIDE);

    TrayIcon.BalloonTitle := 'Restaurando o Webservice.';
    TrayIcon.BalloonHint :=
      'Clique duas vezes no ícone da bandeja do sistema para restaurar o webservice.';
  end;
end;

procedure TDashboardController.TimerTimer(Sender: TObject);
begin
  getRepository.Timer.enabled := false;
  btnCloseClick(nil);
end;

procedure TDashboardController.lblImprimeDescricaoItemClick;
begin
  with getView do
  begin
    cbImprimeDescricaoItem.checked := not cbImprimeDescricaoItem.checked;

    if cbImprimeDescricaoItem.checked then
      writeArqIni('ConfiguracaoLocal', 'ItemConferenciaMesaEmUmaLinha', '1')
    else
      writeArqIni('ConfiguracaoLocal', 'ItemConferenciaMesaEmUmaLinha', '0');
  end;
end;

procedure TDashboardController.lChaveClick;
begin
  with getView do
  begin
    pnMenuSel.tag := 2;
    pnMenuSel.parent := Panel27;
    pnMenuSel.margins.left := 12;
    pnMenuSel.margins.right := 12;

    pnChave.BringToFront;

    cbEmpresas.setFocus;

    Panel19.visible := false;
    lMensagemChave.visible := false;
    cbEmpresas.Items := getRepository.ConsultaEmpresas;
  end;

end;

procedure TDashboardController.lConfiguracoesClick;
begin
  with getView do
  begin
    pnMenuSel.tag := 0;
    pnMenuSel.parent := Panel25;
    pnMenuSel.margins.left := 17;
    pnMenuSel.margins.right := 17;

    pnConfiguracoes.BringToFront;

    EdtPorta.setFocus;
  end;
end;

procedure TDashboardController.lLogsClick;
begin
  with getView do
  begin
    pnMenuSel.tag := 1;
    pnMenuSel.parent := Panel26;
    pnMenuSel.margins.left := 17;
    pnMenuSel.margins.right := 17;

    pnLogs.BringToFront;

    mmRequest.setFocus;
  end;
end;

procedure TDashboardController.loadIni;
var
  caminhoBanco: String;
  slCaminhoBanco: TStringList;
begin
  try

    with getView do
    begin
      cbImprimeDescricaoItem.checked := readArqIni('ConfiguracaoLocal',
        'ItemConferenciaMesaEmUmaLinha', '0') = '1';

      lCaixa.Caption := 'Caixa: ' + readArqIni('ConfiguracaoLocal',
        'Caixa', '1');

      EdtPorta.Text := readArqIni('ConfiguracaoLocal', 'PortaSIFOODM', '8082');

      caminhoBanco := readArqIni('ConfiguracaoLocal', 'CaminhoBanco',
        'C:\SI\SIAF\Database\BANCO.fdb');

      slCaminhoBanco := Explode(caminhoBanco, ':');

      if slCaminhoBanco.Strings[0] = '' then
        EdtHost.Text := 'localhost'
      else
        EdtHost.Text := slCaminhoBanco.Strings[0];

      edBanco.Text := slCaminhoBanco.Strings[1] + ':' +
        slCaminhoBanco.Strings[2];

      pnTop.Caption := 'Webservice Restaurante ' + getBuildInfo;

    end;
  except
    on E: Exception do
    begin
      showmessage
        ('Não foi possível carregar parametros do arquivo de configuração.');
      Application.Terminate;
    end;
  end;
end;

end.
