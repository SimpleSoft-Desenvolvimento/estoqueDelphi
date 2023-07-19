unit UnitPadraoMovimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadrao, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFrmPadraoMovimento = class(TFrmPadrao)
    Panel3: TPanel;
    Panel4: TPanel;
    btn_item: TButton;
    btn_ok: TButton;
    btn_excluir: TButton;
    btn_imprimir: TButton;
    btn_CancelarItem: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tratarBotoes(operacao: integer);
    procedure btn_itemClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_CancelarItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPadraoMovimento: TFrmPadraoMovimento;

implementation

uses
  UnitDM;

{$R *.dfm}


procedure TFrmPadraoMovimento.btn_itemClick(Sender: TObject);
begin
  tratarBotoes(0);
  DM.query_item.Append;
end;

procedure TFrmPadraoMovimento.btn_okClick(Sender: TObject);
begin

  try
    begin
      tratarBotoes(2);
      DM.query_item.Post;
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

procedure TFrmPadraoMovimento.btn_CancelarItemClick(Sender: TObject);
begin
  tratarBotoes(0);
  DM.query_item.Cancel;
end;

procedure TFrmPadraoMovimento.FormKeyPress(Sender: TObject; var Key: Char);
begin

  // Faz a tecla enter a função da tecla tab
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextDlgCtl, 0, 0);
  end;

end;

procedure TFrmPadraoMovimento.tratarBotoes(operacao: integer);
begin

  case operacao of
    0:
      begin
        btn_item.Enabled :=false;
        btn_excluir.Enabled := false;
        btn_ok.Enabled := true;
      end;

    1:
      begin
        btn_item.Enabled := false;
        btn_excluir.Enabled := false;
        btn_ok.Enabled := false;
      end;
  else
    begin
      btn_item.Enabled := true;
      btn_excluir.Enabled := true;
      btn_ok.Enabled := false;
    end;

    // código a ser executado se a variável não corresponder a nenhum dos valores acima
  end;

end;

end.
