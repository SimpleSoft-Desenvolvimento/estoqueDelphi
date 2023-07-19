unit UnitPadraoPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmPadraoPesquisa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    chave_pesquisa: TComboBox;
    Label1: TLabel;
    txtNome: TEdit;
    txtInicio: TMaskEdit;
    txtFim: TMaskEdit;
    lblNomeCodigo: TLabel;
    lblInicio: TLabel;
    lblFim: TLabel;
    GroupBox1: TGroupBox;
    btnPesquisar: TButton;
    btnImprimir: TButton;
    btnTransferir: TButton;
    procedure chave_pesquisaChange(Sender: TObject);
    procedure padronizar;
    procedure FormShow(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    codigo: Integer;
  end;

var
  FrmPadraoPesquisa: TFrmPadraoPesquisa;

implementation

{$R *.dfm}

uses UnitDM;

procedure TFrmPadraoPesquisa.chave_pesquisaChange(Sender: TObject);
begin

  padronizar();

  //
  case chave_pesquisa.ItemIndex of

    0:
      begin
        // código
        lblNomeCodigo.Caption := 'Codigo';
        lblInicio.Visible := false;
        lblFim.Visible := false;
        GroupBox1.Visible := false;
      end;
    1:
      begin
        // nome
        lblNomeCodigo.Caption := 'Nome';
        lblInicio.Visible := false;
        lblFim.Visible := false;
        GroupBox1.Visible := false;
      end;
    2:
      begin
        // cadastro
        lblNomeCodigo.Visible := false;
        txtNome.Visible := false;
        lblFim.Visible := false;
        txtFim.Visible := false;
      end;
    3:
      begin
        // periodo
        lblNomeCodigo.Visible := false;
        txtNome.Visible := false;
      end;
    4:
      begin
        // todos
        lblNomeCodigo.Visible := false;
        txtNome.Visible := false;
        GroupBox1.Visible := false;
      end;

  end;
end;

procedure TFrmPadraoPesquisa.FormShow(Sender: TObject);
begin
  lblNomeCodigo.Visible := false;
  txtNome.Visible := false;
  GroupBox1.Visible := false;
end;

procedure TFrmPadraoPesquisa.padronizar();
begin
  lblNomeCodigo.Caption := 'Nome';
  lblNomeCodigo.Visible := true;
  lblInicio.Visible := true;
  lblFim.Visible := true;
  GroupBox1.Visible := true;
  txtNome.Visible := true;
  txtInicio.Visible := true;
  txtFim.Visible := true;
  txtNome.Clear;
  txtInicio.Clear;
  txtFim.Clear;
end;

end.
