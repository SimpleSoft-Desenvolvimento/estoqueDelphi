unit UnitFormaPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadrao, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TFrmFormaPgto = class(TFrmPadrao)
    Label1: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    txtFormaPgtoId: TDBEdit;
    txtFormaPgtoCadastro: TDBEdit;
    txtFormaPgtoDescricao: TDBEdit;

    procedure btn_atualizarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_deletarClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure habilitarEdicao(isReadOnly: boolean);
    procedure showFields;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFormaPgto: TFrmFormaPgto;

implementation

uses
  UnitDM, UnitPesqFormaPgto;

{$R *.dfm}

procedure TFrmFormaPgto.btn_atualizarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmFormaPgto.btn_cancelarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmFormaPgto.btn_deletarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmFormaPgto.btn_editarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(false);

end;

procedure TFrmFormaPgto.btn_gravarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmFormaPgto.btn_novoClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(false);
  txtFormaPgtoCadastro.Text := DateToStr(now);
  txtFormaPgtoDescricao.SetFocus;

end;

procedure TFrmFormaPgto.btn_pesquisarClick(Sender: TObject);
begin

  frmPesqFormaPgto := TFrmPesqFormaPgto.Create(self);
  try
    frmPesqFormaPgto.ShowModal;
  finally
    FreeAndNil(frmPesqFormaPgto);
  end;

  habilitarEdicao(true);
end;

procedure TFrmFormaPgto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.query_padrao.Close;
  DM.query_padrao.SQL.Clear;
  DM.ds_padrao.DataSet := nil;
  Action := caFree;
  FrmFormaPgto := nil;
end;

procedure TFrmFormaPgto.FormShow(Sender: TObject);
begin
  inherited;

  DM.query_padrao.Close;

  DM.query_padrao.UpdateOptions.AutoIncFields := 'FORMA_PGTO_ID';
  DM.query_padrao.UpdateOptions.GeneratorName := 'GEN_FORMA_PGTO_ID';

  DM.query_padrao.SQL.Text := 'SELECT' + ' FORMA_PGTO_ID,' +
    ' FORMA_PGTO_DESCRICAO,' + ' FORMA_PGTO_CADASTRO' + ' FROM FORMA_PGTO;';

  DM.query_padrao.Open;

  DM.ds_padrao.DataSet := DM.query_padrao;

  btn_novo.SetFocus;

  showFields();
end;

procedure TFrmFormaPgto.showFields;
begin
  txtFormaPgtoId.DataField := DM.ds_padrao.DataSet.FieldByName('FORMA_PGTO_ID')
    .FieldName;
  txtFormaPgtoDescricao.DataField := DM.ds_padrao.DataSet.FieldByName
    ('FORMA_PGTO_DESCRICAO').FieldName;
  txtFormaPgtoCadastro.DataField := DM.ds_padrao.DataSet.FieldByName
    ('FORMA_PGTO_CADASTRO').FieldName;
end;

procedure TFrmFormaPgto.habilitarEdicao(isReadOnly: boolean);
begin
  txtFormaPgtoDescricao.ReadOnly := isReadOnly;
end;

end.
