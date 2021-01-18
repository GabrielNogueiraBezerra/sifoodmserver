program WebserviceSIFOODM;

uses
  Vcl.Forms,
  webservice_repository
    in 'shared\repository\webservice_repository.pas' {webservice_repository_dm} ,
  dashboard_module
    in 'modules\dashboard\dashboard_module.pas' {dashboard_module_page} ,
  dashboard_controller in 'modules\dashboard\dashboard_controller.pas',
  uConexaoFiredac in 'shared\connection\uConexaoFiredac.pas',
  utils in 'shared\utils\utils.pas',
  conferencia_detalhada in 'shared\models\conferencia_detalhada.pas',
  impressao in 'shared\models\impressao.pas',
  comprovante in 'shared\models\comprovante.pas',
  conferencia_resumida in 'shared\models\conferencia_resumida.pas',
  comanda in 'shared\models\comanda.pas',
  licenca in 'shared\models\licenca.pas',
  comandaProduto in 'shared\models\comandaProduto.pas',
  evento in 'shared\models\evento.pas',
  evento_login in 'shared\models\evento_login.pas',
  evento_comandas in 'shared\models\evento_comandas.pas',
  evento_setores in 'shared\models\evento_setores.pas',
  evento_comanda in 'shared\models\evento_comanda.pas',
  evento_secao in 'shared\models\evento_secao.pas',
  evento_produto_secao in 'shared\models\evento_produto_secao.pas',
  evento_conferencia_detalhada
    in 'shared\models\evento_conferencia_detalhada.pas',
  evento_conferencia_resumida
    in 'shared\models\evento_conferencia_resumida.pas',
  evento_itens_comanda in 'shared\models\evento_itens_comanda.pas',
  evento_adicional in 'shared\models\evento_adicional.pas',
  evento_imprime_comanda in 'shared\models\evento_imprime_comanda.pas',
  imprime_comanda in 'shared\models\imprime_comanda.pas',
  evento_comanda_transferencia
    in 'shared\models\evento_comanda_transferencia.pas',
  evento_transfere_item in 'shared\models\evento_transfere_item.pas',
  evento_produto in 'shared\models\evento_produto.pas',
  uConexaoRest in 'shared\connection\uConexaoRest.pas',
  evento_itens_transferencia in 'shared\models\evento_itens_transferencia.pas',
  dashboard_repository
    in 'modules\dashboard\dashboard_repository.pas' {dashboard_repository_dm: TDataModule} ,
  evento_quantidade_comandas in 'shared\models\evento_quantidade_comandas.pas',
  evento_busca_comanda in 'shared\models\evento_busca_comanda.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Webservice Si Food - SI Informática';
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdashboard_module_page, dashboard_module_page);
  Application.Run;

end.
