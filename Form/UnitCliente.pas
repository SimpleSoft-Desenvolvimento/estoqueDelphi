unit UnitCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadrao, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TFrmCliente = class(TFrmPadrao)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    txtClienteId: TDBEdit;
    txtClienteNome: TDBEdit;
    txtClienteCadastro: TDBEdit;
    txtClienteEndereco: TDBEdit;
    txtClienteBairro: TDBEdit;
    txtClienteCidade: TDBEdit;
    txtClienteUf: TDBEdit;
    txtClienteNumero: TDBEdit;
    txtClienteCPF: TDBEdit;
    txtClienteCep: TDBEdit;
    txtClienteTelefone: TDBEdit;
    txtClienteEmail: TDBEdit;
    procedure btn_novoClick(Sender: TObject);
    procedure btn_deletarClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_atualizarClick(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure habilitarEdicao(isReadOnly: boolean);
    procedure inputMask;
    procedure showFields;
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

uses
  UnitDM, UnitPesqCliente;

{$R *.dfm}

procedure TFrmCliente.btn_atualizarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmCliente.btn_cancelarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmCliente.btn_deletarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmCliente.btn_editarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(false);
end;

procedure TFrmCliente.btn_gravarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmCliente.btn_novoClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(false);
  txtClienteCadastro.Text := DateToStr(now);
  txtClienteNome.SetFocus;
end;

procedure TFrmCliente.btn_pesquisarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);

  Application.CreateForm(TFrmPesqCliente, FrmPesqCliente);
  FrmPesqCliente.ShowModal;

  try
    if FrmPesqCliente.codigo > 0 then
      DM.query_padrao.Locate('CLIENTE_ID', FrmPesqCliente.codigo, []);
  finally
    if Assigned(FrmPesqCliente) then
      FreeAndNil(FrmPesqCliente);
  end;

end;

procedure TFrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.query_padrao.Close;
  DM.query_padrao.SQL.Clear;
  DM.ds_padrao.DataSet := nil;
  Action := caFree;
  FrmCliente := nil;
end;

procedure TFrmCliente.FormShow(Sender: TObject);
begin
  inherited;
  DM.query_padrao.Close;

  DM.query_padrao.UpdateOptions.AutoIncFields := 'CLIENTE_ID';
  DM.query_padrao.UpdateOptions.GeneratorName := 'GEN_CLIENTE_ID';

  DM.query_padrao.SQL.Text := 'SELECT' + ' CLIENTE_ID,' + ' CLIENTE_NOME,' +
    ' CLIENTE_ENDERECO,' + ' CLIENTE_NUMERO,' + ' CLIENTE_BAIRRO,' +
    ' CLIENTE_CIDADE,' + ' CLIENTE_UF,' + ' CLIENTE_TELEFONE,' + ' CLIENTE_CPF,'
    + ' CLIENTE_EMAIL,' + ' CLIENTE_CADASTRO,' + ' CLIENTE_CEP' +
    ' FROM CLIENTE' + ' ORDER BY CLIENTE_ID;';

  DM.query_padrao.Open;

  DM.ds_padrao.DataSet := DM.query_padrao;

  btn_novo.SetFocus;

  showFields();
  inputMask();
end;

procedure TFrmCliente.showFields;
begin
  txtClienteId.DataField := DM.ds_padrao.DataSet.FieldByName('CLIENTE_ID')
    .FieldName;
  txtClienteNome.DataField := DM.ds_padrao.DataSet.FieldByName('CLIENTE_NOME')
    .FieldName;
  txtClienteEndereco.DataField := DM.ds_padrao.DataSet.FieldByName
    ('CLIENTE_ENDERECO').FieldName;
  txtClienteBairro.DataField := DM.ds_padrao.DataSet.FieldByName
    ('CLIENTE_BAIRRO').FieldName;
  txtClienteNumero.DataField := DM.ds_padrao.DataSet.FieldByName
    ('CLIENTE_NUMERO').FieldName;
  txtClienteCidade.DataField := DM.ds_padrao.DataSet.FieldByName
    ('CLIENTE_CIDADE').FieldName;
  txtClienteUf.DataField := DM.ds_padrao.DataSet.FieldByName('CLIENTE_UF')
    .FieldName;
  txtClienteTelefone.DataField := DM.ds_padrao.DataSet.FieldByName
    ('CLIENTE_TELEFONE').FieldName;
  txtClienteCPF.DataField := DM.ds_padrao.DataSet.FieldByName('CLIENTE_CPF')
    .FieldName;
  txtClienteEmail.DataField := DM.ds_padrao.DataSet.FieldByName('CLIENTE_EMAIL')
    .FieldName;
  txtClienteCadastro.DataField := DM.ds_padrao.DataSet.FieldByName
    ('CLIENTE_CADASTRO').FieldName;
  txtClienteCep.DataField := DM.ds_padrao.DataSet.FieldByName('CLIENTE_CEP')
    .FieldName;
end;

procedure TFrmCliente.inputMask();
begin
  DM.ds_padrao.DataSet.FieldByName('CLIENTE_CPF').EditMask :=
    '###.###.###-##;0;';
  DM.ds_padrao.DataSet.FieldByName('CLIENTE_TELEFONE').EditMask :=
    '(##)# ####-####;0;';
  DM.ds_padrao.DataSet.FieldByName('CLIENTE_CEP').EditMask := '##.###-###;0;';
end;

procedure TFrmCliente.habilitarEdicao(isReadOnly: boolean);
begin
  txtClienteNome.ReadOnly := isReadOnly;
  txtClienteEndereco.ReadOnly := isReadOnly;
  txtClienteBairro.ReadOnly := isReadOnly;
  txtClienteNumero.ReadOnly := isReadOnly;
  txtClienteCidade.ReadOnly := isReadOnly;
  txtClienteUf.ReadOnly := isReadOnly;
  txtClienteTelefone.ReadOnly := isReadOnly;
  txtClienteCPF.ReadOnly := isReadOnly;
  txtClienteEmail.ReadOnly := isReadOnly;
  txtClienteCep.ReadOnly := isReadOnly;
end;

end.
