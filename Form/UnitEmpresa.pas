unit UnitEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadrao, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TFrmEmpresa = class(TFrmPadrao)
    txtEmpresaId: TDBEdit;
    Label1: TLabel;
    txtEmpresaRazaoSocial: TDBEdit;
    Label2: TLabel;
    txtEmpresaCadastro: TDBEdit;
    Label3: TLabel;
    txtEmpresaFantasia: TDBEdit;
    Label4: TLabel;
    txtEmpresaEndereco: TDBEdit;
    Label5: TLabel;
    txtEmpresaBairro: TDBEdit;
    Label6: TLabel;
    txtEmpresaCidade: TDBEdit;
    Label7: TLabel;
    txtEmpresaUf: TDBEdit;
    Label8: TLabel;
    txtEmpresaNumero: TDBEdit;
    Label9: TLabel;
    txtEmpresaCNPJ: TDBEdit;
    Label10: TLabel;
    txtEmpresaCep: TDBEdit;
    Label11: TLabel;
    txtEmpresaTelefone: TDBEdit;
    Label12: TLabel;
    txtEmpresaEmail: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    imagemEmpresaLogo: TDBImage;
    btnCarregar: TButton;
    btnLimpar: TButton;
    OpenDialog1: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure showFields();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_deletarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_atualizarClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure habilitarEdicao(isReadOnly: boolean);
    procedure inputMask();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEmpresa: TFrmEmpresa;

implementation

uses
  UnitDM;

{$R *.dfm}

procedure TFrmEmpresa.btnLimparClick(Sender: TObject);
begin
  inherited;
  DM.query_padrao.FieldByName('EMPRESA_LOGO').AsVariant := null;
end;

procedure TFrmEmpresa.btn_atualizarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmEmpresa.btn_cancelarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmEmpresa.btn_deletarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmEmpresa.btn_editarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(false);
end;

procedure TFrmEmpresa.btn_gravarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmEmpresa.btn_novoClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(false);
  txtEmpresaCadastro.Text := DateToStr(now);
  txtEmpresaRazaoSocial.SetFocus;
end;

procedure TFrmEmpresa.btn_pesquisarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmEmpresa.btnCarregarClick(Sender: TObject);
var
  Extensao: string;
begin
  OpenDialog1.Filter := 'Arquivos BMP (*.bmp)|*.bmp';
  if OpenDialog1.Execute() then
  begin
    Extensao := ExtractFileExt(OpenDialog1.FileName);
    if UpperCase(Extensao) = '.BMP' then
      imagemEmpresaLogo.Picture.LoadFromFile(OpenDialog1.FileName)
    else
      ShowMessage('Por favor, selecione um arquivo BMP.');
  end;
end;

procedure TFrmEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.query_padrao.Close;
  DM.query_padrao.SQL.Clear;
  DM.ds_padrao.DataSet := nil;
  Action := caFree;
  FrmEmpresa := nil;
end;

procedure TFrmEmpresa.FormShow(Sender: TObject);
begin
  inherited;

  DM.query_padrao.Close;

  DM.query_padrao.UpdateOptions.AutoIncFields := 'EMPRESA_ID';
  DM.query_padrao.UpdateOptions.GeneratorName := 'GEN_EMPRESA_ID';

  DM.query_padrao.SQL.Text := 'SELECT' + ' EMPRESA_ID,' + ' EMPRESA_RAZAO,' +
    ' EMPRESA_FANTASIA,' + ' EMPRESA_ENDERECO,' + ' EMPRESA_NUMERO,' +
    ' EMPRESA_BAIRRO,' + ' EMPRESA_CIDADE,' + ' EMPRESA_UF,' +
    ' EMPRESA_TELEFONE,' + ' EMPRESA_CNPJ,' + ' EMPRESA_EMAIL,' +
    ' EMPRESA_CADASTRO,' + ' EMPRESA_CEP,' + ' EMPRESA_LOGO' + ' FROM EMPRESA' +
    ' ORDER BY EMPRESA_ID;';

  DM.query_padrao.Open;

  DM.ds_padrao.DataSet := DM.query_padrao;

  showFields();
  inputMask();
end;

procedure TFrmEmpresa.showFields;
begin
  txtEmpresaId.DataField := DM.ds_padrao.DataSet.FieldByName('EMPRESA_ID')
    .FieldName;
  txtEmpresaRazaoSocial.DataField := DM.ds_padrao.DataSet.FieldByName
    ('EMPRESA_RAZAO').FieldName;
  txtEmpresaFantasia.DataField := DM.ds_padrao.DataSet.FieldByName
    ('EMPRESA_FANTASIA').FieldName;
  txtEmpresaEndereco.DataField := DM.ds_padrao.DataSet.FieldByName
    ('EMPRESA_ENDERECO').FieldName;
  txtEmpresaNumero.DataField := DM.ds_padrao.DataSet.FieldByName
    ('EMPRESA_NUMERO').FieldName;
  txtEmpresaBairro.DataField := DM.ds_padrao.DataSet.FieldByName
    ('EMPRESA_BAIRRO').FieldName;
  txtEmpresaCidade.DataField := DM.ds_padrao.DataSet.FieldByName
    ('EMPRESA_CIDADE').FieldName;
  txtEmpresaUf.DataField := DM.ds_padrao.DataSet.FieldByName('EMPRESA_UF')
    .FieldName;
  txtEmpresaTelefone.DataField := DM.ds_padrao.DataSet.FieldByName
    ('EMPRESA_TELEFONE').FieldName;
  txtEmpresaCNPJ.DataField := DM.ds_padrao.DataSet.FieldByName('EMPRESA_CNPJ')
    .FieldName;
  txtEmpresaEmail.DataField := DM.ds_padrao.DataSet.FieldByName('EMPRESA_EMAIL')
    .FieldName;
  txtEmpresaCadastro.DataField := DM.ds_padrao.DataSet.FieldByName
    ('EMPRESA_CADASTRO').FieldName;
  txtEmpresaCep.DataField := DM.ds_padrao.DataSet.FieldByName('EMPRESA_CEP')
    .FieldName;
  imagemEmpresaLogo.DataField := DM.ds_padrao.DataSet.FieldByName
    ('EMPRESA_LOGO').FieldName;
end;

procedure TFrmEmpresa.inputMask();
begin
  DM.ds_padrao.DataSet.FieldByName('EMPRESA_CNPJ').EditMask :=
    '##.###.###/####-##;0;';
  DM.ds_padrao.DataSet.FieldByName('EMPRESA_TELEFONE').EditMask :=
    '(##)# ####-####;0;';
  DM.ds_padrao.DataSet.FieldByName('EMPRESA_CEP').EditMask := '##.###-###;0;';
end;

procedure TFrmEmpresa.habilitarEdicao(isReadOnly: boolean);
begin
  txtEmpresaRazaoSocial.ReadOnly := isReadOnly;
  txtEmpresaFantasia.ReadOnly := isReadOnly;
  txtEmpresaEndereco.ReadOnly := isReadOnly;
  txtEmpresaNumero.ReadOnly := isReadOnly;
  txtEmpresaBairro.ReadOnly := isReadOnly;
  txtEmpresaCidade.ReadOnly := isReadOnly;
  txtEmpresaUf.ReadOnly := isReadOnly;
  txtEmpresaTelefone.ReadOnly := isReadOnly;
  txtEmpresaCNPJ.ReadOnly := isReadOnly;
  txtEmpresaEmail.ReadOnly := isReadOnly;
  txtEmpresaCep.ReadOnly := isReadOnly;
  btnCarregar.Enabled := not isReadOnly;
  btnLimpar.Enabled := not isReadOnly;
end;

end.
