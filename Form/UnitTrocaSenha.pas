unit UnitTrocaSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmTrocaSenha = class(TForm)
    txtNovaSenha: TEdit;
    txtConfirmarNovaSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrocaSenha: TfrmTrocaSenha;

implementation

uses
  UnitDM;

{$R *.dfm}

procedure TfrmTrocaSenha.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTrocaSenha.btnConfirmarClick(Sender: TObject);
begin

  if (txtNovaSenha.Text =  '') or (txtNovaSenha.Text <> txtConfirmarNovaSenha.Text) then
  begin
    ShowMessage('Senha(s) incongruente(s), tente novamente');
    abort;
  end;

  //// altero a senha

  DM.query_padrao.Close;

  DM.query_padrao.SQL.Text :=
   ' UPDATE' +
   ' USUARIO' +
   ' SET' +
   ' USUARIO_SENHA = '
   + QuotedStr(txtNovaSenha.Text) +
   ' WHERE' +
   ' USUARIO_NOME = ' +
   QuotedStr(DM.usuarioNome);

  DM.query_padrao.ExecSQL;

  ShowMessage('Senha atualizada com sucesso');


  Close;

end;

end.
