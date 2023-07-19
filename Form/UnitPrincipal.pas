unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.ComCtrls, UnitMovVenda;

type
  TFrmPrincipal = class(TForm)
    Menu: TMainMenu;
    Sistema1: TMenuItem;
    trocarUsuario: TMenuItem;
    Sair1: TMenuItem;
    StatusBar1: TStatusBar;
    Temporizador: TTimer;
    Cadastro1: TMenuItem;
    Usuario: TMenuItem;
    Empresa2: TMenuItem;
    Clientes2: TMenuItem;
    Fornecedores2: TMenuItem;
    Produtos2: TMenuItem;
    FormadePagamento1: TMenuItem;
    Movimentos1: TMenuItem;
    Compras2: TMenuItem;
    Vendas2: TMenuItem;
    Image1: TImage;
    alterarSenha: TMenuItem;
    procedure TemporizadorTimer(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure UsuarioClick(Sender: TObject);
    procedure Empresa2Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Fornecedores2Click(Sender: TObject);
    procedure Produtos2Click(Sender: TObject);
    procedure FormadePagamento1Click(Sender: TObject);
    procedure Compras2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure trocarUsuarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure alterarSenhaClick(Sender: TObject);
    procedure Vendas2Click(Sender: TObject);
  private
    FBotaoTrocarUsuarioPressionado: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  UnitUsuario, UnitEmpresa, UnitCliente, UnitFornecedor, UnitProduto,
  UnitFormaPgto, UnitMovCompra, UnitDM, UnitLogin, UnitTrocaSenha;

{$R *.dfm}

procedure TFrmPrincipal.alterarSenhaClick(Sender: TObject);
begin
  frmTrocaSenha := TFrmTrocaSenha.Create(Self);
  try
     frmTrocaSenha.ShowModal;
  finally
    if Assigned(frmTrocaSenha) then
     FreeAndNil(frmTrocaSenha) ;
  end;
end;

procedure TFrmPrincipal.Clientes2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmCliente, FrmCliente);
  FrmCliente.ShowModal;

  if Assigned(FrmCliente) then
    FreeAndNil(FrmCliente);
end;

procedure TFrmPrincipal.Compras2Click(Sender: TObject);
begin

  frmMovCompra := TFrmMovCompra.Create(Self);
  try
    frmMovCompra.ShowModal;
  finally
    frmMovCompra.Free;
  end;
end;

procedure TFrmPrincipal.Empresa2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmEmpresa, FrmEmpresa);
  FrmEmpresa.ShowModal;

  if Assigned(FrmEmpresa) then
    FreeAndNil(FrmEmpresa);
end;

procedure TFrmPrincipal.FormadePagamento1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmFormaPgto, FrmFormaPgto);
  FrmFormaPgto.ShowModal;

  if Assigned(FrmFormaPgto) then
    FreeAndNil(FrmFormaPgto);
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FBotaoTrocarUsuarioPressionado = false then
    Application.Terminate;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin

  FBotaoTrocarUsuarioPressionado := false;

  if DM.usuarioTipo = 'APOIO' then
   begin
    Usuario.Enabled := false;
    Empresa2.Enabled := false;
   end;

end;

procedure TFrmPrincipal.Fornecedores2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmFornecedor, FrmFornecedor);
  FrmFornecedor.ShowModal;

  if Assigned(FrmFornecedor) then
    FreeAndNil(FrmFornecedor);
end;

procedure TFrmPrincipal.Produtos2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmProduto, FrmProduto);
  FrmProduto.ShowModal;

  if Assigned(FrmProduto) then
    FreeAndNil(FrmProduto);
end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.TemporizadorTimer(Sender: TObject);
begin
  // insere dados no status bar
  StatusBar1.Panels[0].Text := DateToStr(Now);
  StatusBar1.Panels[1].Text := TimeToStr(Now);
  StatusBar1.Panels[2].Text := DM.usuarioNome;
  StatusBar1.Panels[3].Text := '[' + DM.usuarioTipo + ']';
end;

procedure TFrmPrincipal.trocarUsuarioClick(Sender: TObject);
begin
  FBotaoTrocarUsuarioPressionado := True;
  FrmPrincipal.Close;
  frmLogin.Show;
end;

procedure TFrmPrincipal.UsuarioClick(Sender: TObject);
begin
  Application.CreateForm(TFrmUsuario, FrmUsuario);
  FrmUsuario.ShowModal;

  if Assigned(FrmUsuario) then
    FreeAndNil(FrmUsuario);
end;

procedure TFrmPrincipal.Vendas2Click(Sender: TObject);
begin
  frmMovVenda := TFrmMovVenda.Create(self);
  try
    frmMovVenda.ShowModal;
  finally
    if Assigned(FrmMovVenda) then
      FreeAndNil(FrmMovVenda);
  end;
end;

end.
