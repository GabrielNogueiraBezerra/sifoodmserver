unit dashboard_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxPC, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Phys, FireDAC.Comp.Client,
  IdGlobal,
  Vcl.AppEvnts, Vcl.Menus, FireDAC.Phys.Intf, acPNG;

type
  Tdashboard_module_page = class(TForm)
    btnIniciar: TSpeedButton;
    pnIniciar: TPanel;
    btnClose: TImage;
    EdtPorta: TEdit;
    edPortaBD: TEdit;
    edBanco: TEdit;
    pnColorIniciar: TPanel;
    mmRequest: TMemo;
    mmResponse: TMemo;
    Panel1: TPanel;
    pnTop: TPanel;
    pnMenus: TPanel;
    lConfiguracoes: TLabel;
    lLogs: TLabel;
    pnMenuSel: TPanel;
    pnConfiguracoes: TPanel;
    pnLogs: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdtHost: TEdit;
    Label8: TLabel;
    Panel9: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label5: TLabel;
    lCaixa: TLabel;
    Panel14: TPanel;
    cbImprimeDescricaoItem: TCheckBox;
    lblImprimeDescricaoItem: TLabel;
    lChave: TLabel;
    pnChave: TPanel;
    Panel2: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Label9: TLabel;
    EdtChave: TMaskEdit;
    Label10: TLabel;
    cbEmpresas: TComboBox;
    Panel17: TPanel;
    Panel18: TPanel;
    btnInserirChave: TSpeedButton;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Image1: TImage;
    Label12: TLabel;
    lStatusLicenca: TLabel;
    lVencimento: TLabel;
    lMensagemChave: TLabel;
    lIpServidor: TLabel;
    cbIps: TComboBox;
    FDManager: TFDManager;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    btnBaixarChaves: TSpeedButton;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    procedure btnIniciarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure paTopoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lConfiguracoesClick(Sender: TObject);
    procedure lLogsClick(Sender: TObject);
    procedure lblImprimeDescricaoItemClick(Sender: TObject);
    procedure EdtPortaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lChaveClick(Sender: TObject);
    procedure cbEmpresasChange(Sender: TObject);
    procedure btnInserirChaveClick(Sender: TObject);
    procedure btnBaixarChavesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dashboard_module_page: Tdashboard_module_page;

implementation

uses
  dashboard_controller;

{$R *.dfm}

procedure Tdashboard_module_page.btnBaixarChavesClick(Sender: TObject);
begin
  TDashboardController.getInstancia.btnBaixarChavesClick;
end;

procedure Tdashboard_module_page.btnCloseClick(Sender: TObject);
begin
  TDashboardController.getInstancia.btnCloseClick(Sender);
end;

procedure Tdashboard_module_page.btnIniciarClick(Sender: TObject);
begin
  TDashboardController.getInstancia.btnIniciarClick;
end;

procedure Tdashboard_module_page.btnInserirChaveClick(Sender: TObject);
begin
  TDashboardController.getInstancia.btnInserirChaveClick;
end;

procedure Tdashboard_module_page.cbEmpresasChange(Sender: TObject);
begin
  TDashboardController.getInstancia.cbEmpresasChange;
end;

procedure Tdashboard_module_page.EdtPortaChange(Sender: TObject);
begin
  TDashboardController.getInstancia.EdtPortaChange;
end;

procedure Tdashboard_module_page.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TDashboardController.getInstancia.FormClose;
end;

procedure Tdashboard_module_page.FormCreate(Sender: TObject);
begin
  TDashboardController.getInstancia.FormCreate;
end;

procedure Tdashboard_module_page.FormShow(Sender: TObject);
begin
  TDashboardController.getInstancia.FormShow;
end;

procedure Tdashboard_module_page.lblImprimeDescricaoItemClick(Sender: TObject);
begin
  TDashboardController.getInstancia.lblImprimeDescricaoItemClick;
end;

procedure Tdashboard_module_page.lChaveClick(Sender: TObject);
begin
  TDashboardController.getInstancia.lChaveClick;
end;

procedure Tdashboard_module_page.lConfiguracoesClick(Sender: TObject);
begin
  TDashboardController.getInstancia.lConfiguracoesClick;
end;

procedure Tdashboard_module_page.lLogsClick(Sender: TObject);
begin
  TDashboardController.getInstancia.lLogsClick;
end;

procedure Tdashboard_module_page.paTopoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  sc_DragMove = $F012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

end.
