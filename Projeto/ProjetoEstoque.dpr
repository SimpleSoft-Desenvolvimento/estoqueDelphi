program ProjetoEstoque;

uses
  Vcl.Forms,
  UnitPrincipal in '..\Form\UnitPrincipal.pas' {FrmPrincipal},
  UnitDM in '..\Form\UnitDM.pas' {DM: TDataModule},
  UnitPadrao in '..\Form\UnitPadrao.pas' {FrmPadrao},
  UnitUsuario in '..\Form\UnitUsuario.pas' {FrmUsuario},
  UnitEmpresa in '..\Form\UnitEmpresa.pas' {FrmEmpresa},
  UnitCliente in '..\Form\UnitCliente.pas' {FrmCliente},
  UnitFornecedor in '..\Form\UnitFornecedor.pas' {FrmFornecedor},
  UnitProduto in '..\Form\UnitProduto.pas' {FrmProduto},
  UnitFormaPgto in '..\Form\UnitFormaPgto.pas' {FrmFormaPgto},
  UnitPadraoPesquisa in '..\Form\UnitPadraoPesquisa.pas' {FrmPadraoPesquisa},
  UnitPesqUsuario in '..\Form\UnitPesqUsuario.pas' {FrmPesqUsuario},
  UnitPesqCliente in '..\Form\UnitPesqCliente.pas' {FrmPesqCliente},
  UnitPesFornecedor in '..\Form\UnitPesFornecedor.pas' {FrmPesFornecedor},
  UnitPesqProduto in '..\Form\UnitPesqProduto.pas' {FrmPesqProduto},
  UnitPadraoMovimento in '..\Form\UnitPadraoMovimento.pas' {FrmPadraoMovimento},
  UnitMovCompra in '..\Form\UnitMovCompra.pas' {FrmMovCompra},
  UnitPesqCompra in '..\Form\UnitPesqCompra.pas' {FrmPesqCompra},
  UnitLogin in '..\Form\UnitLogin.pas' {frmLogin},
  UnitTrocaSenha in '..\Form\UnitTrocaSenha.pas' {frmTrocaSenha},
  UnitMovVenda in '..\Form\UnitMovVenda.pas' {FrmMovVenda},
  UnitPesqVenda in '..\Form\UnitPesqVenda.pas' {frmPesqVenda},
  UnitPesqFormaPgto in '..\Form\UnitPesqFormaPgto.pas' {FrmPesqFormaPgto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPesqVenda, frmPesqVenda);
  Application.CreateForm(TFrmPesqFormaPgto, FrmPesqFormaPgto);
  Application.Run;

end.
