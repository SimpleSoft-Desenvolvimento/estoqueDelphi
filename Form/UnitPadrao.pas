unit UnitPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  VCLTee.TeCanvas, Vcl.DBCtrls;

type
  TFrmPadrao = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    btn_pesquisar: TButton;
    btn_deletar: TButton;
    btn_editar: TButton;
    btn_gravar: TButton;
    btn_cancelar: TButton;
    btn_atualizar: TButton;
    btn_novo: TButton;
    DBNavigator1: TDBNavigator;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_deletarClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_atualizarClick(Sender: TObject);
    procedure tratarBotoes(operacao: integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPadrao: TFrmPadrao;

implementation

uses
  UnitDM, Data.DB;

{$R *.dfm}

procedure TFrmPadrao.btn_atualizarClick(Sender: TObject);
begin
  tratarBotoes(2);
  DM.query_padrao.Refresh;
end;

procedure TFrmPadrao.btn_cancelarClick(Sender: TObject);
begin
  tratarBotoes(2);
  DM.query_padrao.Cancel;
end;

procedure TFrmPadrao.btn_deletarClick(Sender: TObject);
begin
  if MessageDlg('Deseja deletar este registro?', mtConfirmation, [mbOk, mbNo],
    0) = mrOk then
  begin
    tratarBotoes(2);
    DM.query_padrao.Delete;
  end
  else
  begin
    abort;
  end;

end;

procedure TFrmPadrao.btn_editarClick(Sender: TObject);
begin

  if MessageDlg('Deseja editar este registro?', mtConfirmation, [mbOk, mbNo], 0)
    = mrOk then
  begin
    tratarBotoes(1);
    DM.query_padrao.Edit;
  end
  else
    abort;
end;

procedure TFrmPadrao.btn_gravarClick(Sender: TObject);
begin

  try
    begin
      tratarBotoes(2);
      DM.query_padrao.Post;
    end;
  except
    on E: Exception do
    begin
      tratarBotoes(0);
      ShowMessage
        ('Não foi possível inserir os registros.\nFavor conferir o preenchimento dos campos obrigatórios');
    end;

  end;

end;

procedure TFrmPadrao.btn_novoClick(Sender: TObject);
begin
  tratarBotoes(0);
  DM.query_padrao.Append;
end;

procedure TFrmPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin

  // Faz a tecla enter a função da tecla tab
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextDlgCtl, 0, 0);
  end;
end;

procedure TFrmPadrao.tratarBotoes(operacao: integer);
begin

  case operacao of
    0:
      begin
        btn_novo.Enabled := false;
        btn_deletar.Enabled := false;
        btn_editar.Enabled := false;
        btn_gravar.Enabled := true;
        btn_cancelar.Enabled := true;
        btn_atualizar.Enabled := false;
      end;

    1:
      begin
        btn_novo.Enabled := false;
        btn_deletar.Enabled := false;
        btn_editar.Enabled := false;
        btn_gravar.Enabled := false;
        btn_atualizar.Enabled := true;
        btn_cancelar.Enabled := true;
      end;
  else
    begin
      btn_novo.Enabled := true;
      btn_deletar.Enabled := true;
      btn_editar.Enabled := true;
      btn_gravar.Enabled := false;
      btn_atualizar.Enabled := false;
      btn_cancelar.Enabled := false;
    end;

    // código a ser executado se a variável não corresponder a nenhum dos valores acima
  end;

end;

end.
