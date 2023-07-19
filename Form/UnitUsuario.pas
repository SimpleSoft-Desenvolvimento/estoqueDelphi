unit UnitUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadrao, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TFrmUsuario = class(TFrmPadrao)
    txtUsuarioNome: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    txtUsuarioId: TDBEdit;
    txtUsuarioSenha: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    txtUsuarioCadastro: TDBEdit;
    Label5: TLabel;
    txtUsuarioTipo: TDBComboBox;
    procedure FormShow(Sender: TObject);
    procedure showFields();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_novoClick(Sender: TObject);
    procedure habilitarEdicao(isReadOnly: boolean);
    procedure btn_deletarClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_atualizarClick(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUsuario: TFrmUsuario;

implementation

uses
  UnitDM, Data.DB, UnitPesqUsuario;

{$R *.dfm}

procedure TFrmUsuario.btn_atualizarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmUsuario.btn_cancelarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmUsuario.btn_deletarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmUsuario.btn_editarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(false);
end;

procedure TFrmUsuario.btn_gravarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmUsuario.btn_novoClick(Sender: TObject);
begin
  inherited;
  txtUsuarioCadastro.Text := DateToStr(now);
  txtUsuarioNome.SetFocus;
  habilitarEdicao(false);

end;

procedure TFrmUsuario.btn_pesquisarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);

  Application.CreateForm(TFrmPesqUsuario, FrmPesqUsuario);
  FrmPesqUsuario.ShowModal;

  try
    if FrmPesqUsuario.codigo > 0 then
      DM.query_padrao.Locate('USUARIO_ID', FrmPesqUsuario.codigo, []);
  finally
    if Assigned(FrmPesqUsuario) then
      FreeAndNil(FrmPesqUsuario);
  end;

end;

procedure TFrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.query_padrao.Close;
  DM.query_padrao.SQL.Clear;
  DM.ds_padrao.DataSet := nil;
  Action := caFree;
  FrmUsuario := nil;
end;

procedure TFrmUsuario.FormShow(Sender: TObject);
begin
  inherited;

  txtUsuarioNome.SetFocus;

  DM.query_padrao.Close;

  DM.query_padrao.UpdateOptions.AutoIncFields := 'USUARIO_ID';
  DM.query_padrao.UpdateOptions.GeneratorName := 'GEN_USUARIO_ID';

  DM.query_padrao.SQL.Text := 'SELECT' + ' USUARIO_ID,' + ' USUARIO_NOME,' +
    ' USUARIO_SENHA,' + ' USUARIO_TIPO,' + ' USUARIO_CADASTRO' + ' FROM USUARIO'
    + ' ORDER BY USUARIO_ID;';

  DM.query_padrao.Open;

  DM.ds_padrao.DataSet := DM.query_padrao;

  showFields();

end;

procedure TFrmUsuario.showFields;
begin
  txtUsuarioId.DataField := DM.ds_padrao.DataSet.FieldByName('USUARIO_ID')
    .FieldName;
  txtUsuarioNome.DataField := DM.ds_padrao.DataSet.FieldByName('USUARIO_NOME')
    .FieldName;
  txtUsuarioSenha.DataField := DM.ds_padrao.DataSet.FieldByName('USUARIO_SENHA')
    .FieldName;
  txtUsuarioTipo.DataField := DM.ds_padrao.DataSet.FieldByName('USUARIO_TIPO')
    .FieldName;
  txtUsuarioCadastro.DataField := DM.ds_padrao.DataSet.FieldByName
    ('USUARIO_CADASTRO').FieldName;
end;

procedure TFrmUsuario.habilitarEdicao(isReadOnly: boolean);
begin
  txtUsuarioNome.ReadOnly := isReadOnly;
  txtUsuarioSenha.ReadOnly := isReadOnly;
  txtUsuarioTipo.ReadOnly := isReadOnly;
end;

end.
