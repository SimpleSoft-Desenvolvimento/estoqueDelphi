unit UnitMovCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadraoMovimento, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Vcl.Buttons;

type
  TFrmMovCompra = class(TFrmPadraoMovimento)
    txtFornecedorId: TDBEdit;
    txtFormaPagamentoId: TDBEdit;
    txtUsuarioNome: TDBEdit;
    txtCompraCadastro: TDBEdit;
    txtFornecedorNome: TDBEdit;
    txtFormaPgtoDesc: TDBEdit;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    txtProdutoId: TDBEdit;
    txtCusto: TDBEdit;
    txtQuant: TDBEdit;
    txtTotal: TDBEdit;
    txtDesconto: TDBEdit;
    Produto: TLabel;
    Custo: TLabel;
    Quantidade: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    txtCompraId: TDBEdit;
    DBGrid1: TDBGrid;
    txtCompraValor: TEdit;
    btnGetFornecedor: TBitBtn;
    btnGetFormaPgto: TBitBtn;
    procedure btn_atualizarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_deletarClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_itemClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure txtProdutoIdExit(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure apenasLeituraCompra(isReadOnly: boolean);
    procedure camposCompra;
    procedure iniciaCompra();
    procedure iniciaProdutos();
    procedure camposMovimentacao();
    procedure defineGrid();
    procedure habilitarEdicaoItem(habilitar: boolean);
    procedure atualizarEstoque(isInsert : boolean);
    procedure calculaTotal();
    procedure btnGetFornecedorClick(Sender: TObject);
    procedure btnGetFormaPgtoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMovCompra: TFrmMovCompra;

implementation

uses
  UnitDM, UnitPesqCompra, UnitPesFornecedor, UnitPesqFormaPgto;

{$R *.dfm}

procedure TFrmMovCompra.defineGrid;
var index : integer;
begin

  DBGrid1.Columns[0].Visible := false;
  DBGrid1.Columns[6].Visible := false;
  DBGrid1.Columns[7].Visible := false;
  DBGrid1.Columns[8].Visible := false;

  for index := 1 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[index].Width := 80;

  DBGrid1.Columns[1].Title.Caption := 'DESCRICAO';
  DBGrid1.Columns[1].Width := 400;

  DBGrid1.Columns[2].Title.Caption := 'QUANTIDADE';
  DBGrid1.Columns[3].Title.Caption := 'CUSTO';
  DBGrid1.Columns[4].Title.Caption := 'DESCONTO';
  DBGrid1.Columns[5].Title.Caption := 'TOTAL';

end;

procedure TFrmMovCompra.atualizarEstoque(isInsert: boolean);
begin
  try
    DM.query_produto.Close;

    DM.query_produto.SQL.Text := 'SELECT ' +
    ' * ' +
    ' FROM' +
    ' PRODUTO' +
    ' WHERE' +
    ' PRODUTO_ID = ' + txtProdutoId.Text;

    DM.query_produto.Open;

    DM.query_produto.Edit;

    if isInsert = true then
    begin
      DM.query_produto.FieldByName('PRODUTO_ESTOQUE').AsFloat :=
      DM.query_produto.FieldByName('PRODUTO_ESTOQUE').AsFloat
      + DM.query_item.FieldByName('COMPRA_PRODUTO_QTDE').AsFloat;
    end
    else
    begin
      DM.query_produto.FieldByName('PRODUTO_ESTOQUE').AsFloat :=
      DM.query_produto.FieldByName('PRODUTO_ESTOQUE').AsFloat
      - DM.query_item.FieldByName('COMPRA_PRODUTO_QTDE').AsFloat;
    end;

    DM.query_produto.Refresh;
  finally
    DM.query_produto.Close;
  end;
end;

procedure TFrmMovCompra.btnGetFormaPgtoClick(Sender: TObject);
begin
   with DM do

  if query_padrao.State in [dsInsert, dsEdit] then
  begin
    FrmPesqFormaPgto := TFrmPesqFormaPgto.create(self);
    FrmPesqFormaPgto.ShowModal;

    try
      if FrmPesqFormaPgto.codigo > 0 then
      begin
        query_padrao.FieldByName('FORMA_PGTO_ID').AsInteger := FrmPesqFormaPgto.codigo;
//        txtFornecedorNome.text := FrmPesqFormaPgto.nome;
      end;
    finally
      if Assigned(FrmPesqFormaPgto) then
        FreeAndNil(FrmPesqFormaPgto);
    end;
  end;

end;

procedure TFrmMovCompra.btnGetFornecedorClick(Sender: TObject);
begin
  with DM do

  if query_padrao.State in [dsInsert, dsEdit] then
  begin
    FrmPesFornecedor := TFrmPesFornecedor.create(self);
    FrmPesFornecedor.ShowModal;

    try
      if FrmPesFornecedor.codigo > 0 then
      begin
        query_padrao.FieldByName('FORNECEDOR_ID').AsInteger := FrmPesFornecedor.codigo;
      end;
    finally
      if Assigned(FrmPesFornecedor) then
        FreeAndNil(FrmPesFornecedor);
    end;
  end;
end;

procedure TFrmMovCompra.btn_atualizarClick(Sender: TObject);
begin
  inherited;
  apenasLeituraCompra(true);
end;

procedure TFrmMovCompra.btn_cancelarClick(Sender: TObject);
begin
  inherited;
  apenasLeituraCompra(true);
end;

procedure TFrmMovCompra.btn_deletarClick(Sender: TObject);
begin
  DM.query_item.First;
  while not DM.query_item.Eof do
  begin
     atualizarEstoque(false);
    DM.query_item.Next;
  end;

  inherited;
  apenasLeituraCompra(true);
end;

procedure TFrmMovCompra.btn_editarClick(Sender: TObject);
begin
  inherited;
  apenasLeituraCompra(false);
end;

procedure TFrmMovCompra.btn_excluirClick(Sender: TObject);
begin
    if MessageDlg('Deseja deletar este registro?', mtConfirmation, [mbOk, mbNo],
    0) = mrOk then
  begin
    tratarBotoes(2);
    atualizarEstoque(false);
    DM.query_item.Delete;
  end
  else
  begin
    abort;
  end;

  habilitarEdicaoItem(false);
  calculaTotal();

end;

procedure TFrmMovCompra.btn_gravarClick(Sender: TObject);
begin
  inherited;
  apenasLeituraCompra(true);
  DM.query_padrao.Refresh;
end;

procedure TFrmMovCompra.btn_imprimirClick(Sender: TObject);
begin
  inherited;
  habilitarEdicaoItem(false);
end;

procedure TFrmMovCompra.btn_itemClick(Sender: TObject);
begin
  txtProdutoId.SetFocus;
  inherited;
  habilitarEdicaoItem(true);
end;

procedure TFrmMovCompra.btn_novoClick(Sender: TObject);
begin
  inherited;
  apenasLeituraCompra(false);
  txtCompraCadastro.Text := DateToStr(now);
  txtUsuarioNome.Text := DM.usuarioNome;
end;

procedure TFrmMovCompra.btn_okClick(Sender: TObject);
begin

  DM.query_item.FieldByName
    ('COMPRA_PRODUTO_TOTAL_ITEM').Value :=
    (StrToFloat(txtCusto.text) * StrToFloat(txtQuant.text)) - StrToFloat(txtDesconto.text);

  DM.query_item.FieldByName
    ('COMPRA_ID').Value := txtCompraId.text;

  atualizarEstoque(true);

  inherited;
  DM.query_item.Refresh;
  habilitarEdicaoItem(false);
  calculaTotal();
end;

procedure TFrmMovCompra.btn_pesquisarClick(Sender: TObject);
begin
  apenasLeituraCompra(true);
  FrmPesqCompra := TFrmPesqCompra.Create(Self);
  try
    FrmPesqCompra.ShowModal;
    if FrmPesqCompra.codigo > 0 then
      DM.query_padrao.Locate('COMPRA_ID', FrmPesqCompra.codigo, []);
  finally
    if Assigned(FrmPesqCompra) then
      FreeAndNil(FrmPesqCompra);
  end;
end;

procedure TFrmMovCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.query_padrao.Close;
  DM.query_padrao.SQL.Clear;
  DM.ds_padrao.DataSet := nil;
  Action := caFree;
  FrmMovCompra := nil;
end;

procedure TFrmMovCompra.FormShow(Sender: TObject);
begin
  inherited;
  iniciaCompra();
  iniciaProdutos();
  calculaTotal();
end;

procedure TFrmMovCompra.habilitarEdicaoItem(habilitar: boolean);
begin
  txtProdutoId.ReadOnly := not habilitar;
  txtCusto.ReadOnly := not habilitar;
  txtQuant.ReadOnly := not habilitar;
  txtDesconto.ReadOnly := not habilitar;
end;

procedure TFrmMovCompra.iniciaCompra;
begin
  DM.query_padrao.Close;

  DM.query_padrao.UpdateOptions.AutoIncFields := 'COMPRA_ID';
  DM.query_padrao.UpdateOptions.GeneratorName := 'GEN_COMPRA_ID';


  DM.query_padrao.SQL.Text := 'SELECT' +
  ' C.COMPRA_ID,' +
  ' C.FORNECEDOR_ID,' +
  ' C.FORMA_PGTO_ID,' +
  ' C.USUARIO_NOME,' +
  ' C.COMPRA_CADASTRO,' +
  ' P.FORMA_PGTO_DESCRICAO,' +
  ' F.FORNECEDOR_NOME' +
  ' FROM COMPRA C' +
  ' INNER JOIN FORNECEDOR F ON' +
  ' C.FORNECEDOR_ID = F.FORNECEDOR_ID' +
  ' INNER JOIN FORMA_PGTO P ON' +
  ' C.FORMA_PGTO_ID = P.FORMA_PGTO_ID';

  DM.query_padrao.Open;

  DM.ds_padrao.DataSet := DM.query_padrao;

  btn_novo.SetFocus;

  camposCompra();

end;

procedure TFrmMovCompra.iniciaProdutos;
var codProduto: string;
begin

  codProduto := '-1';

  DM.query_item.Close;

  DM.query_item.UpdateOptions.AutoIncFields := 'COMPRA_PRODUTO_ID';
  DM.query_item.UpdateOptions.GeneratorName := 'GEN_COMPRA_PRODUTO_ID';

  if DM.query_padrao.RecordCount > 0 then
    codProduto := DM.query_padrao.FieldByName('COMPRA_ID').AsString;

    DM.query_item.SQL.Text := 'SELECT'+
  ' CP.COMPRA_ID,' +
  ' P.PRODUTO_DESCRICAO,' +
  ' CP.COMPRA_PRODUTO_QTDE,' +
  ' CP.COMPRA_PRODUTO_CUSTO,' +
  ' CP.COMPRA_PRODUTO_DESCONTO,' +
  ' CP.COMPRA_PRODUTO_TOTAL_ITEM,' +
  ' CP.COMPRA_PRODUTO_ID,' +
  ' CP.PRODUTO_ID,' +
  ' P.PRODUTO_CUSTO' +
  ' FROM' +
  ' COMPRA_PRODUTO CP' +
  ' INNER JOIN PRODUTO P ON' +
  ' CP.PRODUTO_ID = P.PRODUTO_ID'+
  ' WHERE' +
  ' COMPRA_ID = ' + codProduto;


  DM.query_item.Open;

  DM.query_item.FieldByName('PRODUTO_DESCRICAO').ProviderFlags := [];
  DM.query_item.FieldByName('PRODUTO_DESCRICAO').ReadOnly      := False;
  DM.query_item.FieldByName('PRODUTO_CUSTO').ProviderFlags := [];
  DM.query_item.FieldByName('PRODUTO_CUSTO').ReadOnly      := False;

  defineGrid();

  camposMovimentacao();
end;

procedure TFrmMovCompra.txtProdutoIdExit(Sender: TObject);
begin
  DM.query_produto.Close;
    DM.query_produto.SQL.Text := 'SELECT'+
    ' PRODUTO_ID, PRODUTO_CUSTO FROM PRODUTO WHERE PRODUTO_ID = ' + DM.query_item.FieldByName('PRODUTO_ID').AsString;
  Dm.query_produto.Open;

  if DM.query_produto.Locate('PRODUTO_ID', DM.query_produto.FieldByName('PRODUTO_ID').AsInteger,[]) then
  begin
    DM.query_item.FieldByName('COMPRA_PRODUTO_CUSTO').asFloat :=
    DM.query_produto.FieldByName('PRODUTO_CUSTO').asFloat;
    DM.query_item.FieldByName('COMPRA_PRODUTO_QTDE').asFloat := 1;
    DM.query_item.FieldByName('COMPRA_PRODUTO_DESCONTO').asFloat := 0;
  end
  else
  begin
    ShowMessage('Produto não encontrado, favor digitar um identificar válido');
    DM.query_item.FieldByName('PRODUTO_ID').Clear;
    txtProdutoId.SetFocus;
  end;
end;

procedure TFrmMovCompra.calculaTotal;
var
  i, soma: Integer;
begin
  soma := 0;

  DBGrid1.DataSource.DataSet.First;

  for i := 0 to DBGrid1.DataSource.DataSet.RecordCount - 1 do
  begin
    soma := soma + DBGrid1.DataSource.DataSet.FieldByName('COMPRA_PRODUTO_QTDE').AsInteger;
    DBGrid1.DataSource.DataSet.Next;
  end;
  txtCompraValor.Text := 'R$ ' + IntToStr(soma);
end;

procedure TFrmMovCompra.camposCompra;
begin
  txtCompraId.DataField := DM.ds_padrao.DataSet.FieldByName ('COMPRA_ID').FieldName;
  txtFornecedorId.DataField := DM.ds_padrao.DataSet.FieldByName('FORNECEDOR_ID').FieldName;
  txtFormaPagamentoId.DataField := DM.ds_padrao.DataSet.FieldByName('FORMA_PGTO_ID').FieldName;
  txtUsuarioNome.DataField := DM.ds_padrao.DataSet.FieldByName('USUARIO_NOME').FieldName;
  txtCompraCadastro.DataField := DM.ds_padrao.DataSet.FieldByName('COMPRA_CADASTRO').FieldName;
  txtFornecedorNome.DataField := DM.ds_padrao.DataSet.FieldByName('FORNECEDOR_NOME').FieldName;
  txtFormaPgtoDesc.DataField := DM.ds_padrao.DataSet.FieldByName('FORMA_PGTO_DESCRICAO').FieldName;
end;

procedure TFrmMovCompra.camposMovimentacao;
begin

    txtProdutoId.DataField := DM.ds_item.DataSet.FieldByName
    ('PRODUTO_ID').FieldName;

    txtQuant.DataField := DM.ds_item.DataSet.FieldByName
    ('COMPRA_PRODUTO_QTDE').FieldName;

    txtDesconto.DataField := DM.ds_item.DataSet.FieldByName
    ('COMPRA_PRODUTO_DESCONTO').FieldName;

    txtTotal.DataField := DM.ds_item.DataSet.FieldByName
    ('COMPRA_PRODUTO_TOTAL_ITEM').FieldName;

    txtCusto.DataField := DM.ds_item.DataSet.FieldByName
    ('COMPRA_PRODUTO_CUSTO').FieldName;

end;

procedure TFrmMovCompra.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  iniciaProdutos;
  calculaTotal();
end;

procedure TFrmMovCompra.apenasLeituraCompra(isReadOnly: boolean);
begin
  txtFornecedorId.ReadOnly := isReadOnly;
  txtFormaPagamentoId.ReadOnly := isReadOnly;
end;

end.
