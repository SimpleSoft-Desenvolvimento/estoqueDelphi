unit UnitProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadrao, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TFrmProduto = class(TFrmPadrao)
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    txtProdutoId: TDBEdit;
    txtProdutoDescricao: TDBEdit;
    txtProdutoCusto: TDBEdit;
    txtProdutoEstoqueMin: TDBEdit;
    txtProdutoCadastro: TDBEdit;
    txtProdutoVenda: TDBEdit;
    txtProdutoEstoque: TDBEdit;
    txtFornecedorNome: TDBEdit;
    txtFornecedorId: TDBEdit;
    GroupBox1: TGroupBox;
    txtProdutoUnidade: TDBComboBox;
    procedure FormShow(Sender: TObject);
    procedure showFields();
    procedure habilitarEdicao(isReadOnly: boolean);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_deletarClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_atualizarClick(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure setCurrencyFields;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProduto: TFrmProduto;

implementation

uses
  UnitDM, Data.DB, UnitPesqProduto, UnitPadraoPesquisa, FireDAC.Comp.Client;

{$R *.dfm}

procedure TFrmProduto.btn_atualizarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmProduto.btn_cancelarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmProduto.btn_deletarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
end;

procedure TFrmProduto.btn_editarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(false);

end;

procedure TFrmProduto.btn_gravarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);
  DM.query_padrao.Refresh;
end;

procedure TFrmProduto.btn_novoClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(false);
  txtProdutoCadastro.Text := DateToStr(now);
  txtProdutoDescricao.SetFocus;

end;

procedure TFrmProduto.btn_pesquisarClick(Sender: TObject);
begin
  inherited;
  habilitarEdicao(true);

  Application.CreateForm(TFrmPesqProduto, FrmPesqProduto);
  FrmPesqProduto.ShowModal;

  try
    if FrmPesqProduto.codigo > 0 then
      DM.query_padrao.Locate('PRODUTO_ID', FrmPesqProduto.codigo, []);
  finally
    if Assigned(FrmPesqProduto) then
      FreeAndNil(FrmPesqProduto);
  end;

end;

procedure TFrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.query_padrao.Close;
  DM.query_padrao.SQL.Clear;
  DM.ds_padrao.DataSet := nil;
  Action := caFree;
  FrmProduto := nil;
end;

procedure TFrmProduto.FormShow(Sender: TObject);
begin
  inherited;

  DM.query_padrao.Close;

  DM.query_padrao.UpdateOptions.AutoIncFields := 'PRODUTO_ID';
  DM.query_padrao.UpdateOptions.GeneratorName := 'GEN_PRODUTO_ID';

  DM.query_padrao.SQL.Text := 'SELECT' + ' P.PRODUTO_ID,' +
    ' P.PRODUTO_DESCRICAO,' + ' P.PRODUTO_CUSTO,' + ' P.PRODUTO_VENDA,' +
    ' P.PRODUTO_ESTOQUE,' + ' P.PRODUTO_ESTOQUE_MIN,' + ' P.PRODUTO_UNIDADE,' +
    ' P.PRODUTO_CADASTRO,' + ' P.ID_FORNECEDOR, ' + 'F.FORNECEDOR_NOME' +
    ' FROM PRODUTO P' + ' INNER JOIN FORNECEDOR F ON' +
    ' P.ID_FORNECEDOR = F.FORNECEDOR_ID;';

  DM.query_padrao.Open;

  DM.ds_padrao.DataSet := DM.query_padrao;

  btn_novo.SetFocus;

  showFields();
  setCurrencyFields();
end;

procedure TFrmProduto.setCurrencyFields();
begin
  TFloatField(DM.query_padrao.FieldByName('PRODUTO_CUSTO')).currency := true;
  TFloatField(DM.query_padrao.FieldByName('PRODUTO_VENDA')).currency := true;
end;

procedure TFrmProduto.showFields;
begin
  txtProdutoId.DataField := 'PRODUTO_ID';
  txtProdutoDescricao.DataField := 'PRODUTO_DESCRICAO';
  txtProdutoCusto.DataField := 'PRODUTO_CUSTO';
  txtProdutoVenda.DataField := 'PRODUTO_VENDA';
  txtProdutoEstoque.DataField := 'PRODUTO_ESTOQUE';
  txtProdutoEstoqueMin.DataField := 'PRODUTO_ESTOQUE_MIN';
  txtProdutoUnidade.DataField := 'PRODUTO_UNIDADE';
  txtProdutoCadastro.DataField := 'PRODUTO_CADASTRO';
  txtFornecedorId.DataField := 'ID_FORNECEDOR';
  txtFornecedorNome.DataField := 'FORNECEDOR_NOME';
end;

procedure TFrmProduto.habilitarEdicao(isReadOnly: boolean);
begin
  txtProdutoDescricao.ReadOnly := isReadOnly;
  txtProdutoCusto.ReadOnly := isReadOnly;
  txtProdutoVenda.ReadOnly := isReadOnly;
  txtProdutoEstoque.ReadOnly := isReadOnly;
  txtProdutoEstoqueMin.ReadOnly := isReadOnly;
  txtProdutoUnidade.ReadOnly := isReadOnly;
  txtFornecedorId.ReadOnly := isReadOnly;
end;

end.
