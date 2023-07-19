unit UnitPesqProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadraoPesquisa, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmPesqProduto = class(TFrmPadraoPesquisa)
    DBGrid1: TDBGrid;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure configuraTabela;
    function GetStringAfterUnderscore(const str: string): string;
    procedure limpaPesquisa;
    procedure pesquisaPorCodigo;
    procedure pesquisaPorDataInicio;
    procedure pesquisaPorIntervalo;
    procedure pesquisaPorNome(operacao: string);
    procedure pesquisarTodos;
    procedure chave_pesquisaChange(Sender: TObject);
    procedure padronizar;
    procedure btnTransferirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesqProduto: TFrmPesqProduto;

implementation

uses
  UnitDM;

{$R *.dfm}

procedure TFrmPesqProduto.btnImprimirClick(Sender: TObject);
var
  caminho: string;
begin
  caminho := ExtractFilePath(Application.ExeName);
  if DM.RelatorioPesqProduto.LoadFromFile(caminho + 'RelatorioProduto.fr3') then
  begin
    DM.RelatorioPesqProduto.Clear;
    DM.RelatorioPesqProduto.LoadFromFile(caminho + 'RelatorioProduto.fr3');
    DM.RelatorioPesqProduto.PrepareReport(true);
    DM.RelatorioPesqProduto.ShowReport();
  end
  else
    MessageDlg('Relatório não encontrado', mtError, [mbOk], 0);
end;

procedure TFrmPesqProduto.btnPesquisarClick(Sender: TObject);
var
  operacao: string;
begin
  inherited;
  case chave_pesquisa.ItemIndex of
    0:
      begin
        // codigo
        limpaPesquisa();
        pesquisaPorCodigo();
      end;
    1:
      begin
        // descricao
        limpaPesquisa();
        operacao := 'P.PRODUTO_DESCRICAO';
        pesquisaPorNome(operacao);
      end;
    2:
      begin
        // nome do fabricante
        limpaPesquisa();
        operacao := 'F.FORNECEDOR_NOME';
        pesquisaPorNome(operacao);
      end;
    3:
      begin
        // data de cadastro
        limpaPesquisa();
        pesquisaPorDataInicio();
      end;
    4:
      begin
        // intervalo de datas
        limpaPesquisa();
        pesquisaPorIntervalo();
      end;
  else
    begin
      // intervalo de datas
      limpaPesquisa();
      pesquisarTodos();
    end;
  end;

end;

procedure TFrmPesqProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.query_pesquisa.Close;
  DM.query_pesquisa.SQL.Clear;
  DM.ds_pesquisa.DataSet := nil;
  // Action := caFree;
  // FrmPesqProduto := nil;
end;

procedure TFrmPesqProduto.FormShow(Sender: TObject);
begin
  inherited;

  DM.ds_pesquisa.DataSet := DM.query_pesquisa;

  pesquisarTodos();
end;

procedure TFrmPesqProduto.pesquisarTodos();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' P.PRODUTO_ID,' +
    ' F.FORNECEDOR_NOME, ' + ' P.PRODUTO_DESCRICAO,' + ' P.PRODUTO_CUSTO,' +
    ' P.PRODUTO_VENDA,' + ' P.PRODUTO_ESTOQUE,' + ' P.PRODUTO_ESTOQUE_MIN,' +
    ' P.PRODUTO_UNIDADE,' + ' P.PRODUTO_CADASTRO,' + ' P.ID_FORNECEDOR' +
    ' FROM PRODUTO P' + ' INNER JOIN FORNECEDOR F ON' +
    ' P.ID_FORNECEDOR = F.FORNECEDOR_ID' + ' ORDER BY P.ID_FORNECEDOR;';

  DM.query_pesquisa.Open;

  configuraTabela();
end;

procedure TFrmPesqProduto.btnTransferirClick(Sender: TObject);
begin
  inherited;
  if DM.query_pesquisa.RecordCount > 0 then
  begin
    codigo := DM.query_pesquisa.FieldByName('PRODUTO_ID').Value;
  end
  else
    abort;
end;

procedure TFrmPesqProduto.chave_pesquisaChange(Sender: TObject);
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
        // DESCRICAO
        lblNomeCodigo.Caption := 'Descricao do Produto';
        lblInicio.Visible := false;
        lblFim.Visible := false;
        GroupBox1.Visible := false;
      end;
    2:
      begin
        // NOME DO FABRICANTE
        lblNomeCodigo.Caption := 'Nome do Fabricante';
        lblInicio.Visible := false;
        lblFim.Visible := false;
        GroupBox1.Visible := false;
      end;
    3:
      begin
        // cadastro
        lblNomeCodigo.Visible := false;
        txtNome.Visible := false;
        lblFim.Visible := false;
        txtFim.Visible := false;
      end;
    4:
      begin
        // periodo
        lblNomeCodigo.Visible := false;
        txtNome.Visible := false;
      end;

  end;
end;

procedure TFrmPesqProduto.padronizar();
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

procedure TFrmPesqProduto.configuraTabela();
var
  i: Integer;
begin
  for i := 0 to DBGrid1.Columns.Count - 1 do
  begin

    if (i = 0) OR (i = 3) OR (i = 4) OR (i = 5) OR (i = 6) OR (i = 7) OR (i = 9)
    then
      DBGrid1.Columns[i].Width := 50
    else
      DBGrid1.Columns[i].Width := 150;

    DBGrid1.Columns[i].Title.Caption := GetStringAfterUnderscore
      (DBGrid1.Columns[i].Title.Caption);
    DBGrid1.Columns[1].Title.Caption := 'FORNECEDOR';
  end;
end;

procedure TFrmPesqProduto.DBGrid1DblClick(Sender: TObject);
begin
  btnTransferir.Click;
end;

procedure TFrmPesqProduto.limpaPesquisa();
begin
  DM.query_pesquisa.Close;
  DM.query_pesquisa.SQL.Clear;
  DM.query_pesquisa.Params.Clear;
end;

procedure TFrmPesqProduto.pesquisaPorCodigo();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' P.PRODUTO_ID,' +
    ' F.FORNECEDOR_NOME, ' + ' P.PRODUTO_DESCRICAO,' + ' P.PRODUTO_CUSTO,' +
    ' P.PRODUTO_VENDA,' + ' P.PRODUTO_ESTOQUE,' + ' P.PRODUTO_ESTOQUE_MIN,' +
    ' P.PRODUTO_UNIDADE,' + ' P.PRODUTO_CADASTRO,' + ' P.ID_FORNECEDOR' +
    ' FROM PRODUTO P' + ' INNER JOIN FORNECEDOR F ON' +
    ' P.ID_FORNECEDOR = F.FORNECEDOR_ID' + ' WHERE' + ' PRODUTO_ID = ' +
    txtNome.Text + ' ORDER BY P.ID_FORNECEDOR';

  DM.query_pesquisa.Open;
  configuraTabela();
end;

procedure TFrmPesqProduto.pesquisaPorDataInicio();
var
  Data: TDateTime;
begin
  if not TryStrToDate(txtInicio.Text, Data) then
  begin
    ShowMessage('Insira uma data válida');
    abort;
  end;

  DM.query_pesquisa.Close;

  DM.query_pesquisa.Params.Add('pDataInicio', ftDate);

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' P.PRODUTO_ID,' +
    ' F.FORNECEDOR_NOME, ' + ' P.PRODUTO_DESCRICAO,' + ' P.PRODUTO_CUSTO,' +
    ' P.PRODUTO_VENDA,' + ' P.PRODUTO_ESTOQUE,' + ' P.PRODUTO_ESTOQUE_MIN,' +
    ' P.PRODUTO_UNIDADE,' + ' P.PRODUTO_CADASTRO,' + ' P.ID_FORNECEDOR' +
    ' FROM PRODUTO P' + ' INNER JOIN FORNECEDOR F ON' +
    ' P.ID_FORNECEDOR = F.FORNECEDOR_ID' + ' WHERE' + ' PRODUTO_CADASTRO =' +
    ' :pDataInicio' + ' ORDER BY P.ID_FORNECEDOR';

  DM.query_pesquisa.ParamByName('pDataInicio').AsDate :=
    StrToDate(txtInicio.Text);

  DM.query_pesquisa.Open;
  configuraTabela();
end;

procedure TFrmPesqProduto.pesquisaPorIntervalo();
var
  Data: TDateTime;
begin
  if not TryStrToDate(txtInicio.Text, Data) OR not TryStrToDate(txtFim.Text,
    Data) then
  begin
    ShowMessage('Insira datas válidas');
    abort;
  end;

  DM.query_pesquisa.Close;

  DM.query_pesquisa.Params.Add('pDataInicio', ftDate);
  DM.query_pesquisa.Params.Add('pDataFim', ftDate);

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' P.PRODUTO_ID,' +
    ' F.FORNECEDOR_NOME, ' + ' P.PRODUTO_DESCRICAO,' + ' P.PRODUTO_CUSTO,' +
    ' P.PRODUTO_VENDA,' + ' P.PRODUTO_ESTOQUE,' + ' P.PRODUTO_ESTOQUE_MIN,' +
    ' P.PRODUTO_UNIDADE,' + ' P.PRODUTO_CADASTRO,' + ' P.ID_FORNECEDOR' +
    ' FROM PRODUTO P' + ' INNER JOIN FORNECEDOR F ON' +
    ' P.ID_FORNECEDOR = F.FORNECEDOR_ID' + ' WHERE' + ' PRODUTO_CADASTRO' +
    ' BETWEEN' + ' :pDataInicio' + ' AND' + ' :pDataFim' +
    ' ORDER BY P.ID_FORNECEDOR';

  DM.query_pesquisa.ParamByName('pDataInicio').AsDate :=
    StrToDate(txtInicio.Text);
  DM.query_pesquisa.ParamByName('pDataFim').AsDate := StrToDate(txtFim.Text);

  DM.query_pesquisa.Open;
  configuraTabela();
end;

procedure TFrmPesqProduto.pesquisaPorNome(operacao: string);
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' P.PRODUTO_ID,' +
    ' F.FORNECEDOR_NOME, ' + ' P.PRODUTO_DESCRICAO,' + ' P.PRODUTO_CUSTO,' +
    ' P.PRODUTO_VENDA,' + ' P.PRODUTO_ESTOQUE,' + ' P.PRODUTO_ESTOQUE_MIN,' +
    ' P.PRODUTO_UNIDADE,' + ' P.PRODUTO_CADASTRO,' + ' P.ID_FORNECEDOR' +
    ' FROM PRODUTO P' + ' INNER JOIN FORNECEDOR F ON' +
    ' P.ID_FORNECEDOR = F.FORNECEDOR_ID' + ' WHERE ' + operacao + ' LIKE ''%' +
    txtNome.Text + '%''' + 'ORDER BY P.ID_FORNECEDOR';

  DM.query_pesquisa.Open;
  configuraTabela();
end;

function TFrmPesqProduto.GetStringAfterUnderscore(const str: string): string;
var
  underscorePos: Integer;
begin
  underscorePos := Pos('_', str);
  if underscorePos > 0 then
    Result := Copy(str, underscorePos + 1, Length(str) - underscorePos)
  else
    Result := '';
end;

end.
