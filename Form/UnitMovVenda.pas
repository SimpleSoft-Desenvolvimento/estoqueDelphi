unit UnitMovVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadraoMovimento, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.Buttons;

type
  TFrmMovVenda = class(TFrmPadraoMovimento)
    Label3: TLabel;
    txtVendaId: TDBEdit;
    Label1: TLabel;
    txtClienteId: TDBEdit;
    Label2: TLabel;
    txtFormaPagamentoId: TDBEdit;
    Label4: TLabel;
    txtVendaCadastro: TDBEdit;
    Label7: TLabel;
    txtClienteNome: TDBEdit;
    Label8: TLabel;
    txtFormaPgtoDesc: TDBEdit;
    Label5: TLabel;
    txtVendaValor: TEdit;
    Label6: TLabel;
    txtUsuarioNome: TDBEdit;
    Produto: TLabel;
    txtProdutoId: TDBEdit;
    Custo: TLabel;
    txtValor: TDBEdit;
    Quantidade: TLabel;
    txtQuant: TDBEdit;
    Label12: TLabel;
    txtDesconto: TDBEdit;
    Label13: TLabel;
    txtTotal: TDBEdit;
    DBGrid1: TDBGrid;
    btnGetCliente: TBitBtn;
    btnGetFormaPgto: TBitBtn;
    procedure apenasLeituraVenda(isReadOnly: boolean);
    procedure atualizarEstoque(isInsert: boolean);
    procedure btn_atualizarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_deletarClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_itemClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure calculaTotal;
    procedure camposVenda;
    procedure camposMovimentacao;
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure defineGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure habilitarEdicaoItem(habilitar: boolean);
    procedure iniciaVenda;
    procedure iniciaProdutos;
    procedure txtProdutoIdExit(Sender: TObject);
    procedure btnGetFormaPgtoClick(Sender: TObject);
    procedure btnGetClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMovVenda: TFrmMovVenda;

implementation

{$R *.dfm}

uses UnitDM, UnitPesqCompra, UnitMovCompra, UnitPesqVenda, UnitPesqCliente,
  UnitPesqFormaPgto;


procedure TFrmMovVenda.defineGrid;
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
  DBGrid1.Columns[3].Title.Caption := 'VALOR';
  DBGrid1.Columns[4].Title.Caption := 'DESCONTO';
  DBGrid1.Columns[5].Title.Caption := 'TOTAL';

end;

procedure TFrmMovVenda.atualizarEstoque(isInsert: boolean);
begin
  try
    DM.query_produto.Close;

    DM.query_produto.SQL.Text := 'SELECT ' +
    ' * ' +
    ' FROM' +
    ' PRODUTO' +
    ' WHERE' +
    ' PRODUTO_ID = ' + DM.query_item.FieldByName('PRODUTO_ID').AsString;

    showMessage(DM.query_item.FieldByName('PRODUTO_ID').AsString);

    DM.query_produto.Open;

    DM.query_produto.Edit;

    if isInsert = true then
    begin
      DM.query_produto.FieldByName('PRODUTO_ESTOQUE').AsFloat :=
      DM.query_produto.FieldByName('PRODUTO_ESTOQUE').AsFloat
      - DM.query_item.FieldByName('VENDA_PRODUTO_QTDE').AsFloat;
    end
    else
    begin
      DM.query_produto.FieldByName('PRODUTO_ESTOQUE').AsFloat :=
      DM.query_produto.FieldByName('PRODUTO_ESTOQUE').AsFloat
      + DM.query_item.FieldByName('VENDA_PRODUTO_QTDE').AsFloat;
    end;
    DM.query_produto.Refresh;
  finally
    DM.query_produto.Close;
  end;
end;

procedure TFrmMovVenda.btnGetClienteClick(Sender: TObject);
begin
  with DM do

  if query_padrao.State in [dsInsert, dsEdit] then
  begin
    FrmPesqCliente := TFrmPesqCliente.create(self);
    FrmPesqCliente.ShowModal;

    try
      if FrmPesqCliente.codigo > 0 then
      begin
        query_padrao.FieldByName('CLIENTE_ID').AsInteger := FrmPesqCliente.codigo;
      end;
    finally
      if Assigned(FrmPesqCliente) then
        FreeAndNil(FrmPesqCliente);
    end;
  end;
end;

procedure TFrmMovVenda.btnGetFormaPgtoClick(Sender: TObject);
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
      end;
    finally
      if Assigned(FrmPesqFormaPgto) then
        FreeAndNil(FrmPesqFormaPgto);
    end;

  end;
end;

procedure TFrmMovVenda.btn_atualizarClick(Sender: TObject);
begin
  inherited;
  apenasLeituraVenda(true);
end;

procedure TFrmMovVenda.btn_cancelarClick(Sender: TObject);
begin
  inherited;
  apenasLeituraVenda(true);
end;

procedure TFrmMovVenda.btn_deletarClick(Sender: TObject);
begin
  DM.query_item.First;
  while not DM.query_item.Eof do
  begin
     atualizarEstoque(false);
    DM.query_item.Next;
  end;

  inherited;
  apenasLeituraVenda(true);
end;

procedure TFrmMovVenda.btn_editarClick(Sender: TObject);
begin
  inherited;
  apenasLeituraVenda(false);

end;

procedure TFrmMovVenda.btn_excluirClick(Sender: TObject);
begin
//  inherited;
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
end;

procedure TFrmMovVenda.btn_gravarClick(Sender: TObject);
begin
  inherited;
  apenasLeituraVenda(true);
  DM.query_padrao.Refresh;
end;

procedure TFrmMovVenda.btn_imprimirClick(Sender: TObject);
begin
  inherited;
  habilitarEdicaoItem(false);
end;

procedure TFrmMovVenda.btn_itemClick(Sender: TObject);
begin
  txtProdutoId.SetFocus;
  inherited;
  habilitarEdicaoItem(true);
end;

procedure TFrmMovVenda.btn_novoClick(Sender: TObject);
begin
  inherited;
  apenasLeituraVenda(false);
  txtVendaCadastro.Text := DateToStr(now);
  txtUsuarioNome.Text := DM.usuarioNome;
  txtClienteId.SetFocus;
end;

procedure TFrmMovVenda.btn_okClick(Sender: TObject);
begin

  DM.query_item.FieldByName
    ('VENDA_PRODUTO_TOTAL_ITEM').Value :=
    (StrToFloat(txtValor.text) * StrToFloat(txtQuant.text)) - StrToFloat(txtDesconto.text);

  DM.query_item.FieldByName
    ('VENDA_ID').Value := txtVendaId.text;

  atualizarEstoque(true);

  inherited;
  DM.query_item.Refresh;
  habilitarEdicaoItem(false);
end;

procedure TFrmMovVenda.btn_pesquisarClick(Sender: TObject);
begin
  apenasLeituraVenda(true);

  FrmPesqVenda := TFrmPesqVenda.Create(Self);
  try
    FrmPesqVenda.ShowModal;
    if FrmPesqVenda.codigo > 0 then
      DM.query_padrao.Locate('VENDA_ID', FrmPesqVenda.codigo, []);
  finally
    if Assigned(FrmPesqVenda) then
      FreeAndNil(FrmPesqVenda);
  end;
end;

procedure TFrmMovVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.query_padrao.Close;
  DM.query_padrao.SQL.Clear;
  DM.ds_padrao.DataSet := nil;
  Action := caFree;
  FrmMovVenda := nil;
end;

procedure TFrmMovVenda.FormShow(Sender: TObject);
begin
  inherited;
  iniciaVenda();
  iniciaProdutos();
  calculaTotal();
end;

procedure TFrmMovVenda.habilitarEdicaoItem(habilitar: boolean);
begin
  txtProdutoId.ReadOnly := not habilitar;
  txtValor.ReadOnly := not habilitar;
  txtQuant.ReadOnly := not habilitar;
  txtDesconto.ReadOnly := not habilitar;
end;

procedure TFrmMovVenda.iniciaVenda;
begin
  DM.query_padrao.Close;

  DM.query_padrao.UpdateOptions.AutoIncFields := 'VENDA_ID';
  DM.query_padrao.UpdateOptions.GeneratorName := 'GEN_VENDA_ID';

  DM.query_padrao.SQL.Text := 'SELECT' +
  ' V.VENDA_ID,' +
  ' V.CLIENTE_ID,' +
  ' V.FORMA_PGTO_ID,' +
  ' V.USUARIO_NOME,' +
  ' V.VENDA_CADASTRO,' +
  ' F.FORMA_PGTO_DESCRICAO,' +
  ' C.CLIENTE_NOME' +
  ' FROM VENDA V' +
  ' INNER JOIN CLIENTE C ON' +
  ' V.CLIENTE_ID = C.CLIENTE_ID' +
  ' INNER JOIN FORMA_PGTO F ON' +
  ' V.FORMA_PGTO_ID = F.FORMA_PGTO_ID';

  DM.query_padrao.Open;

  DM.ds_padrao.DataSet := DM.query_padrao;

  btn_novo.SetFocus;

  camposVenda();

end;

procedure TFrmMovVenda.iniciaProdutos;
var codProduto: string;
begin

  codProduto := '-1';

  DM.query_item.Close;

  DM.query_item.UpdateOptions.AutoIncFields := 'VENDA_PRODUTO_ID';
  DM.query_item.UpdateOptions.GeneratorName := 'GEN_VENDA_PRODUTO_ID';

  if DM.query_padrao.RecordCount > 0 then
    codProduto := DM.query_padrao.FieldByName('VENDA_ID').AsString;

    DM.query_item.SQL.Text := 'SELECT'+
  ' VP.VENDA_ID,' +
  ' P.PRODUTO_DESCRICAO,' +
  ' VP.VENDA_PRODUTO_QTDE,' +
  ' VP.VENDA_PRODUTO_VALOR,' +
  ' VP.VENDA_PRODUTO_DESCONTO,' +
  ' VP.VENDA_PRODUTO_TOTAL_ITEM,' +
  ' VP.VENDA_PRODUTO_ID,' +
  ' VP.PRODUTO_ID,' +
  ' P.PRODUTO_CUSTO' +
  ' FROM' +
  ' VENDA_PRODUTO VP' +
  ' INNER JOIN PRODUTO P ON' +
  ' VP.PRODUTO_ID = P.PRODUTO_ID'+
  ' WHERE' +
  ' VENDA_ID = ' + codProduto;


  DM.query_item.Open;

  DM.query_item.FieldByName('PRODUTO_DESCRICAO').ProviderFlags := [];
  DM.query_item.FieldByName('PRODUTO_DESCRICAO').ReadOnly      := False;
  DM.query_item.FieldByName('PRODUTO_CUSTO').ProviderFlags := [];
  DM.query_item.FieldByName('PRODUTO_CUSTO').ReadOnly      := False;

  defineGrid();

  camposMovimentacao();
end;

procedure TFrmMovVenda.txtProdutoIdExit(Sender: TObject);
begin
  DM.query_produto.Close;
    DM.query_produto.SQL.Text := 'SELECT'+
    ' PRODUTO_ID,' +
    ' PRODUTO_CUSTO' +
    ' FROM' +
    ' PRODUTO' +
    ' WHERE' +
    ' PRODUTO_ID = ' +
    DM.query_item.FieldByName('PRODUTO_ID').AsString;


  Dm.query_produto.Open;

  if DM.query_produto.Locate('PRODUTO_ID', DM.query_produto.FieldByName('PRODUTO_ID').AsInteger,[]) then
  begin
    DM.query_item.FieldByName('VENDA_PRODUTO_VALOR').asFloat :=
    DM.query_produto.FieldByName('PRODUTO_CUSTO').asFloat;
    DM.query_item.FieldByName('VENDA_PRODUTO_QTDE').asFloat := 1;
    DM.query_item.FieldByName('VENDA_PRODUTO_DESCONTO').asFloat := 0;
  end
  else
  begin
    ShowMessage('Produto não encontrado, favor digitar um identificador válido');
    DM.query_item.FieldByName('PRODUTO_ID').Clear;
    txtProdutoId.SetFocus;
  end;
end;

procedure TFrmMovVenda.calculaTotal;
var
  i, soma: Integer;
begin
  soma := 0;

  DBGrid1.DataSource.DataSet.First;

  for i := 0 to DBGrid1.DataSource.DataSet.RecordCount - 1 do
  begin
    soma := soma + DBGrid1.DataSource.DataSet.FieldByName('VENDA_PRODUTO_QTDE').AsInteger;
    DBGrid1.DataSource.DataSet.Next;
  end;
  txtVendaValor.Text := 'R$ ' + IntToStr(soma);
end;

procedure TFrmMovVenda.camposVenda;
begin
  txtVendaId.DataField := DM.ds_padrao.DataSet.FieldByName ('VENDA_ID').FieldName;
  txtClienteId.DataField := DM.ds_padrao.DataSet.FieldByName('CLIENTE_ID').FieldName;
  txtFormaPagamentoId.DataField := DM.ds_padrao.DataSet.FieldByName('FORMA_PGTO_ID').FieldName;
  txtUsuarioNome.DataField := DM.ds_padrao.DataSet.FieldByName('USUARIO_NOME').FieldName;
  txtVendaCadastro.DataField := DM.ds_padrao.DataSet.FieldByName('VENDA_CADASTRO').FieldName;
  txtClienteNome.DataField := DM.ds_padrao.DataSet.FieldByName('CLIENTE_NOME').FieldName;
  txtFormaPgtoDesc.DataField := DM.ds_padrao.DataSet.FieldByName('FORMA_PGTO_DESCRICAO').FieldName;
end;

procedure TFrmMovVenda.camposMovimentacao;
begin

    txtProdutoId.DataField := DM.ds_item.DataSet.FieldByName
    ('PRODUTO_ID').FieldName;

    txtQuant.DataField := DM.ds_item.DataSet.FieldByName
    ('VENDA_PRODUTO_QTDE').FieldName;

    txtDesconto.DataField := DM.ds_item.DataSet.FieldByName
    ('VENDA_PRODUTO_DESCONTO').FieldName;

    txtTotal.DataField := DM.ds_item.DataSet.FieldByName
    ('VENDA_PRODUTO_TOTAL_ITEM').FieldName;

    txtValor.DataField := DM.ds_item.DataSet.FieldByName
    ('VENDA_PRODUTO_VALOR').FieldName;

end;

procedure TFrmMovVenda.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  iniciaProdutos;
  calculaTotal();
end;

procedure TFrmMovVenda.apenasLeituraVenda(isReadOnly: boolean);
begin
  txtClienteId.ReadOnly := isReadOnly;
  txtFormaPagamentoId.ReadOnly := isReadOnly;
end;

end.
