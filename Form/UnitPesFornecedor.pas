unit UnitPesFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadraoPesquisa, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmPesFornecedor = class(TFrmPadraoPesquisa)
    DBGrid1: TDBGrid;

    procedure btnPesquisarClick(Sender: TObject);
    procedure configuraTabela;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    function GetStringAfterUnderscore(const str: string): string;
    procedure limpaPesquisa;
    procedure pesquisaPorCodigo;
    procedure pesquisaPorDataInicio;
    procedure pesquisaPorIntervalo;
    procedure pesquisaPorNome;
    procedure pesquisarTodos;
    procedure btnTransferirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure imprimir();
    procedure prepararQueryFilha();
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    nome: string;
    { Public declarations }
  end;

var
  FrmPesFornecedor: TFrmPesFornecedor;

implementation

{$R *.dfm}

uses UnitDM, FireDAC.Comp.Client;

procedure TFrmPesFornecedor.imprimir();
var
  caminho: string;
begin

  caminho := ExtractFilePath(Application.ExeName);
  if DM.RelatorioPesqFornecedor.LoadFromFile(caminho + 'RelatorioFornecedor.fr3')
  then
  begin

    DM.RelatorioPesqFornecedor.Clear;
    DM.RelatorioPesqFornecedor.LoadFromFile
      (caminho + 'RelatorioFornecedor.fr3');
    DM.RelatorioPesqFornecedor.Variables['vVariavel'] := QuotedStr(DM.usuarioNome);
    DM.RelatorioPesqFornecedor.PrepareReport(true);
    DM.RelatorioPesqFornecedor.ShowReport();
  end
  else
    MessageDlg('Relatório não encontrado', mtError, [mbOk], 0);
end;

procedure TFrmPesFornecedor.btnImprimirClick(Sender: TObject);
begin
  inherited;
  prepararQueryFilha;
end;

procedure TFrmPesFornecedor.btnPesquisarClick(Sender: TObject);
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
        // nome
        limpaPesquisa();
        pesquisaPorNome
      end;
    2:
      begin
        // data de cadastro
        limpaPesquisa();
        pesquisaPorDataInicio();
      end;
    3:
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

procedure TFrmPesFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DM.query_pesquisa.Close;
  DM.query_pesquisa.SQL.Clear;
  DM.ds_pesquisa.DataSet := nil;
  // Action := caFree;
  // FrmPesFornecedor := nil;
end;

procedure TFrmPesFornecedor.FormShow(Sender: TObject);
begin
  inherited;

  DM.ds_pesquisa.DataSet := DM.query_pesquisa;

  pesquisarTodos();
end;

procedure TFrmPesFornecedor.pesquisarTodos();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' FORNECEDOR_ID,' +
    ' FORNECEDOR_NOME,' + ' FORNECEDOR_ENDERECO,' + ' FORNECEDOR_NUMERO,' +
    ' FORNECEDOR_BAIRRO,' + ' FORNECEDOR_CIDADE,' + ' FORNECEDOR_UF,' +
    ' FORNECEDOR_TELEFONE,' + ' FORNECEDOR_CNPJ,' + ' FORNECEDOR_EMAIL,' +
    ' FORNECEDOR_CADASTRO,' + ' FORNECEDOR_CEP' + ' FROM FORNECEDOR' +
    ' ORDER BY FORNECEDOR_ID;';

  DM.query_pesquisa.Open;

  configuraTabela();
end;

procedure TFrmPesFornecedor.prepararQueryFilha;
var
  queryFilha: TFDQuery;
begin

  queryFilha := TFDQuery.Create(self);
  try
  queryFilha.Connection := DM.conexao;
  DM.DataSetPesqProdutoFornecedor.DataSet := queryFilha;

  queryFilha.Close;

  queryFilha.MasterSource := DM.ds_pesquisa;
  queryFilha.MasterFields := 'FORNECEDOR_ID';
  queryFilha.DetailFields := 'ID_FORNECEDOR';
  queryFilha.IndexFieldNames := 'ID_FORNECEDOR';


  queryFilha.SQL.Text := 'SELECT '
    + 'PRODUTO_ID, '
    + 'PRODUTO_DESCRICAO, '
    + 'ID_FORNECEDOR, '
    + 'PRODUTO_CUSTO, '
    + 'PRODUTO_VENDA, '
    + 'PRODUTO_ESTOQUE, '
    + 'PRODUTO_ESTOQUE_MIN, '
    + 'PRODUTO_UNIDADE, '
    + 'PRODUTO_CADASTRO '
    + 'FROM produto' ;

  queryFilha.Open();

  imprimir;

  finally
    queryFilha.Free;
  end;

end;

procedure TFrmPesFornecedor.btnTransferirClick(Sender: TObject);
begin
  inherited;
  if DM.query_pesquisa.RecordCount > 0 then
  begin
    codigo := DM.query_pesquisa.FieldByName('FORNECEDOR_ID').Value;
    nome := DM.query_pesquisa.FieldByName('FORNECEDOR_NOME').asString;
  end
  else
    abort;
end;

procedure TFrmPesFornecedor.configuraTabela();
var
  i: Integer;
begin
  for i := 0 to DBGrid1.Columns.Count - 1 do
  begin
    if (i = 0) OR (i = 3) OR (i = 6) then
      DBGrid1.Columns[i].Width := 50
    else
      DBGrid1.Columns[i].Width := 150;
    DBGrid1.Columns[i].Title.Caption := GetStringAfterUnderscore
      (DBGrid1.Columns[i].Title.Caption);
  end;
end;

procedure TFrmPesFornecedor.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnTransferir.Click;
end;

procedure TFrmPesFornecedor.limpaPesquisa();
begin
  DM.query_pesquisa.Close;
  DM.query_pesquisa.SQL.Clear;
  DM.query_pesquisa.Params.Clear;
end;

procedure TFrmPesFornecedor.pesquisaPorCodigo();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' FORNECEDOR_ID,' +
    ' FORNECEDOR_NOME,' + ' FORNECEDOR_ENDERECO,' + ' FORNECEDOR_NUMERO,' +
    ' FORNECEDOR_BAIRRO,' + ' FORNECEDOR_CIDADE,' + ' FORNECEDOR_UF,' +
    ' FORNECEDOR_TELEFONE,' + ' FORNECEDOR_CNPJ,' + ' FORNECEDOR_EMAIL,' +
    ' FORNECEDOR_CADASTRO,' + ' FORNECEDOR_CEP' + ' FROM FORNECEDOR' + ' WHERE'
    + ' FORNECEDOR_ID = ' + txtNome.Text;

  DM.query_pesquisa.Open;
  configuraTabela();
end;

procedure TFrmPesFornecedor.pesquisaPorDataInicio();
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

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' FORNECEDOR_ID,' +
    ' FORNECEDOR_NOME,' + ' FORNECEDOR_ENDERECO,' + ' FORNECEDOR_NUMERO,' +
    ' FORNECEDOR_BAIRRO,' + ' FORNECEDOR_CIDADE,' + ' FORNECEDOR_UF,' +
    ' FORNECEDOR_TELEFONE,' + ' FORNECEDOR_CNPJ,' + ' FORNECEDOR_EMAIL,' +
    ' FORNECEDOR_CADASTRO,' + ' FORNECEDOR_CEP' + ' FROM FORNECEDOR' + ' WHERE'
    + ' FORNECEDOR_CADASTRO = :pDataInicio';

  DM.query_pesquisa.ParamByName('pDataInicio').AsDate :=
    StrToDate(txtInicio.Text);

  DM.query_pesquisa.Open;
  configuraTabela();
end;

procedure TFrmPesFornecedor.pesquisaPorIntervalo();
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

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' FORNECEDOR_ID,' +
    ' FORNECEDOR_NOME,' + ' FORNECEDOR_ENDERECO,' + ' FORNECEDOR_NUMERO,' +
    ' FORNECEDOR_BAIRRO,' + ' FORNECEDOR_CIDADE,' + ' FORNECEDOR_UF,' +
    ' FORNECEDOR_TELEFONE,' + ' FORNECEDOR_CNPJ,' + ' FORNECEDOR_EMAIL,' +
    ' FORNECEDOR_CADASTRO,' + ' FORNECEDOR_CEP' + ' FROM FORNECEDOR' + ' WHERE'
    + ' FORNECEDOR_CADASTRO' + ' BETWEEN' + ' :pDataInicio' + ' AND' +
    ' :pDataFim';

  DM.query_pesquisa.ParamByName('pDataInicio').AsDate :=
    StrToDate(txtInicio.Text);
  DM.query_pesquisa.ParamByName('pDataFim').AsDate := StrToDate(txtFim.Text);

  DM.query_pesquisa.Open;
  configuraTabela();
end;

procedure TFrmPesFornecedor.pesquisaPorNome();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' FORNECEDOR_ID,' +
    ' FORNECEDOR_NOME,' + ' FORNECEDOR_ENDERECO,' + ' FORNECEDOR_NUMERO,' +
    ' FORNECEDOR_BAIRRO,' + ' FORNECEDOR_CIDADE,' + ' FORNECEDOR_UF,' +
    ' FORNECEDOR_TELEFONE,' + ' FORNECEDOR_CNPJ,' + ' FORNECEDOR_EMAIL,' +
    ' FORNECEDOR_CADASTRO,' + ' FORNECEDOR_CEP' + ' FROM FORNECEDOR' + ' WHERE'
    + ' FORNECEDOR_NOME' + ' LIKE ''%' + txtNome.Text + '%'';';

  DM.query_pesquisa.Open;
  configuraTabela();
end;

function TFrmPesFornecedor.GetStringAfterUnderscore(const str: string): string;
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
