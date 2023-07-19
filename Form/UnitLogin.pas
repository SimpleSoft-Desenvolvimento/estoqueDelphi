unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UnitPrincipal,
  Vcl.ExtCtrls;

type
  TfrmLogin = class(TForm)
    Image1: TImage;
    txtUsuarioNome: TEdit;
    txtUsuarioSenha: TEdit;
    txtUsuarioTipo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnEntrar: TButton;
    btnCancelar: TLabel;
    Label4: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  UnitDM;

{$R *.dfm}

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
  DM.query_padrao.Close;

  DM.query_padrao.SQL.Text :=
  ' SELECT'+
  ' USUARIO_NOME,'+
  ' USUARIO_TIPO'+
  ' FROM'+
  ' USUARIO'+
  ' WHERE'+
  ' USUARIO_NOME = '+ QuotedStr(txtUsuarioNome.Text) +
  ' AND '+
  ' USUARIO_SENHA = '+ QuotedStr(txtUsuarioSenha.Text) +
  ' AND'+
  ' USUARIO_TIPO = '+ QuotedStr(txtUsuarioTipo.Text);

  DM.query_padrao.Open;

  if DM.query_padrao.RecordCount > 0 then
  begin
    frmPrincipal := TFrmPrincipal.Create(self);
    try
      DM.usuarioNome := txtUsuarioNome.Text;
      DM.usuarioTipo := txtUsuarioTipo.Text;
      frmLogin.Hide;
      frmPrincipal.ShowModal;
    finally
      FreeAndNil(FrmPrincipal);
      DM.usuarioNome := '';
      DM.usuarioTipo := '';
      txtUsuarioNome.Text := '';
      txtUsuarioTipo.Text := '';
      txtUsuarioSenha.Text := '';
    end;
  end
  else
  begin
    ShowMessage('Dados inválidos, tente novamente');
  end;
end;

end.
