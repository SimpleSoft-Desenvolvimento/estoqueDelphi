unit UnitFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadrao, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TFrmFornecedor = class(TFrmPadrao)
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
    txtFornecedorId: TDBEdit;
    txtFornecedorNome: TDBEdit;
    txtFornecedorCadastro: TDBEdit;
    txtFornecedorEndereco: TDBEdit;
    txtFornecedorBairro: TDBEdit;
    txtFornecedorCidade: TDBEdit;
    txtFornecedorUf: TDBEdit;
    txtFornecedorNumero: TDBEdit;
    txtFornecedorCNPJ: TDBEdit;
    txtFornecedorCep: TDBEdit;
    txtFornecedorTelefone: TDBEdit;
    txtFornecedorEmail: TDBEdit;
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
    procedure inputMask;
    procedure showFields;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFornecedor: TFrmFornecedor;

implementation

uses
  UnitDM, UnitPesFornecedor;

{$R *.dfm}

procedure TFrmFornecedor.btn_atualizarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmFornecedor.btn_cancelarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmFornecedor.btn_deletarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmFornecedor.btn_editarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(false);
end;

procedure TFrmFornecedor.btn_gravarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmFornecedor.btn_novoClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(false);
  txtFornecedorCadastro.Text := DateToStr(now);
  txtFornecedorNome.SetFocus;
end;

procedure TFrmFornecedor.btn_pesquisarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);

  Application.CreateForm(TFrmPesFornecedor, FrmPesFornecedor);
  FrmPesFornecedor.ShowModal;

  try
    if FrmPesFornecedor.codigo > 0 then
      DM.query_padrao.Locate('FORNECEDOR_ID', FrmPesFornecedor.codigo, []);
  finally
    if Assigned(FrmPesFornecedor) then
      FreeAndNil(FrmPesFornecedor);
  end;
end;

procedure TFrmFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.query_padrao.Close;
  DM.query_padrao.SQL.Clear;
  DM.ds_padrao.DataSet := nil;
  Action := caFree;
  FrmFornecedor := nil;
end;

procedure TFrmFornecedor.FormShow(Sender: TObject);
begin
  inherited;
  DM.query_padrao.Close;

  DM.query_padrao.UpdateOptions.AutoIncFields := 'FORNECEDOR_ID';
  DM.query_padrao.UpdateOptions.GeneratorName := 'GEN_FORNECEDOR_ID';

  DM.query_padrao.SQL.Text := 'SELECT' + ' FORNECEDOR_ID,' + ' FORNECEDOR_NOME,'
    + ' FORNECEDOR_ENDERECO,' + ' FORNECEDOR_NUMERO,' + ' FORNECEDOR_BAIRRO,' +
    ' FORNECEDOR_CIDADE,' + ' FORNECEDOR_UF,' + ' FORNECEDOR_TELEFONE,' +
    ' FORNECEDOR_CNPJ,' + ' FORNECEDOR_EMAIL,' + ' FORNECEDOR_CADASTRO,' +
    ' FORNECEDOR_CEP' + ' FROM FORNECEDOR' + ' ORDER BY FORNECEDOR_ID;';

  DM.query_padrao.Open;

  DM.ds_padrao.DataSet := DM.query_padrao;

  btn_novo.SetFocus;

  showFields();
  inputMask();
end;

procedure TFrmFornecedor.showFields;
begin
  txtFornecedorId.DataField := DM.ds_padrao.DataSet.FieldByName('FORNECEDOR_ID')
    .FieldName;
  txtFornecedorNome.DataField := DM.ds_padrao.DataSet.FieldByName
    ('FORNECEDOR_NOME').FieldName;
  txtFornecedorEndereco.DataField := DM.ds_padrao.DataSet.FieldByName
    ('FORNECEDOR_ENDERECO').FieldName;
  txtFornecedorBairro.DataField := DM.ds_padrao.DataSet.FieldByName
    ('FORNECEDOR_BAIRRO').FieldName;
  txtFornecedorNumero.DataField := DM.ds_padrao.DataSet.FieldByName
    ('FORNECEDOR_NUMERO').FieldName;
  txtFornecedorCidade.DataField := DM.ds_padrao.DataSet.FieldByName
    ('FORNECEDOR_CIDADE').FieldName;
  txtFornecedorUf.DataField := DM.ds_padrao.DataSet.FieldByName('FORNECEDOR_UF')
    .FieldName;
  txtFornecedorTelefone.DataField := DM.ds_padrao.DataSet.FieldByName
    ('FORNECEDOR_TELEFONE').FieldName;
  txtFornecedorCNPJ.DataField := DM.ds_padrao.DataSet.FieldByName
    ('FORNECEDOR_CNPJ').FieldName;
  txtFornecedorEmail.DataField := DM.ds_padrao.DataSet.FieldByName
    ('FORNECEDOR_EMAIL').FieldName;
  txtFornecedorCadastro.DataField := DM.ds_padrao.DataSet.FieldByName
    ('FORNECEDOR_CADASTRO').FieldName;
  txtFornecedorCep.DataField := DM.ds_padrao.DataSet.FieldByName
    ('FORNECEDOR_CEP').FieldName;
end;

procedure TFrmFornecedor.inputMask();
begin
  DM.ds_padrao.DataSet.FieldByName('FORNECEDOR_CNPJ').EditMask :=
    '##.###.###/####-##;0;';
  DM.ds_padrao.DataSet.FieldByName('FORNECEDOR_TELEFONE').EditMask :=
    '(##)# ####-####;0;';
  DM.ds_padrao.DataSet.FieldByName('FORNECEDOR_CEP').EditMask :=
    '##.###-###;0;';
end;

procedure TFrmFornecedor.habilitarEdicao(isReadOnly: boolean);
begin
  txtFornecedorNome.ReadOnly := isReadOnly;
  txtFornecedorEndereco.ReadOnly := isReadOnly;
  txtFornecedorBairro.ReadOnly := isReadOnly;
  txtFornecedorNumero.ReadOnly := isReadOnly;
  txtFornecedorCidade.ReadOnly := isReadOnly;
  txtFornecedorUf.ReadOnly := isReadOnly;
  txtFornecedorTelefone.ReadOnly := isReadOnly;
  txtFornecedorCNPJ.ReadOnly := isReadOnly;
  txtFornecedorEmail.ReadOnly := isReadOnly;
  txtFornecedorCep.ReadOnly := isReadOnly;
end;

end.
