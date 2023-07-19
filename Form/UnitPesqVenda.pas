unit UnitPesqVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadraoPesquisa, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPesqVenda = class(TFrmPadraoPesquisa)
    DBGrid1: TDBGrid;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnTransferirClick(Sender: TObject);
    procedure configuraTabela;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    function GetStringAfterUnderscore(const str: string): string;
    procedure limpaPesquisa;
    procedure pesquisaPorCodigo;
    procedure pesquisaPorDataInicio;
    procedure pesquisaPorIntervalo;
    procedure pesquisaPorNome;
    procedure pesquisarTodos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqVenda: TfrmPesqVenda;

implementation

uses
  UnitDM;

{$R *.dfm}

procedure TFrmPesqVenda.btnImprimirClick(Sender: TObject);
var
  caminho: string;
begin
  ShowMessage(
  'Este relátorio irá ' +
  'ignorar quaisquer configurações prévias, ' +
  'mostrando sempre todos os pedidos de venda ' +
  'junto aos seus itens'
  );

  DM.query_produto.Close;

  DM.query_produto.SQL.Text :=
  ' SELECT' +
  ' V.VENDA_ID,' +
  ' P.PRODUTO_ID,' +
  ' VP.VENDA_PRODUTO_QTDE,' +
  ' VP.VENDA_PRODUTO_TOTAL_ITEM,' +
  ' V.VENDA_CADASTRO,' +
  ' P.PRODUTO_DESCRICAO,' +
  ' V.USUARIO_NOME' +
  ' FROM VENDA V' +
  ' INNER JOIN VENDA_PRODUTO VP ON' +
  ' V.VENDA_ID = VP.VENDA_ID' +
  ' INNER JOIN PRODUTO P ON' +
  ' VP.PRODUTO_ID = P.PRODUTO_ID';

  DM.query_produto.Open;

  caminho := ExtractFilePath(Application.ExeName);
  if DM.RelatorioPesqVenda.LoadFromFile(caminho + 'RelatorioVenda.fr3') then
  begin
    DM.RelatorioPesqVenda.Clear;
    DM.RelatorioPesqVenda.LoadFromFile(caminho + 'RelatorioVenda.fr3');
    DM.RelatorioPesqVenda.PrepareReport(true);
    DM.RelatorioPesqVenda.ShowReport();
  end
  else
    MessageDlg('Relatório não encontrado', mtError, [mbOk], 0);
end;

procedure TFrmPesqVenda.btnPesquisarClick(Sender: TObject);
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
        pesquisaPorNome();
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

procedure TFrmPesqVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.query_pesquisa.Close;
  DM.query_pesquisa.SQL.Clear;
  DM.ds_pesquisa.DataSet := nil;
  // Action := caFree;
  // FrmPesqCliente := nil;
end;

procedure TFrmPesqVenda.FormShow(Sender: TObject);
begin
  inherited;

  DM.ds_pesquisa.DataSet := DM.query_pesquisa;

  pesquisarTodos();

end;

procedure TFrmPesqVenda.pesquisarTodos();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text :=
  'SELECT' +
  ' V.VENDA_ID,' +
  ' C.CLIENTE_NOME,'+
  ' P.FORMA_PGTO_DESCRICAO,'+
  ' V.USUARIO_NOME,' +
  ' V.VENDA_CADASTRO' +
  ' FROM VENDA V' +
  ' INNER JOIN CLIENTE C ON' +
  ' V.CLIENTE_ID = C.CLIENTE_ID' +
  ' INNER JOIN FORMA_PGTO P ON' +
  ' V.FORMA_PGTO_ID = P.FORMA_PGTO_ID' +
  ' ORDER BY V.VENDA_ID';

  DM.query_pesquisa.Open;

  configuraTabela();
end;

procedure TFrmPesqVenda.btnTransferirClick(Sender: TObject);
begin
  inherited;
  if DM.query_pesquisa.RecordCount > 0 then
  begin
    codigo := DM.query_pesquisa.FieldByName('VENDA_ID').Value;
  end
  else
    abort;
end;

procedure TFrmPesqVenda.configuraTabela();
var
  i: Integer;
begin

  DBGrid1.Columns[0].Width := 50;
  DBGrid1.Columns[0].Title.Caption := GetStringAfterUnderscore
      (DBGrid1.Columns[0].Title.Caption);

  for i := 1 to DBGrid1.Columns.Count - 1 do
  begin
    DBGrid1.Columns[i].Width := 250;
    DBGrid1.Columns[i].Title.Caption := GetStringAfterUnderscore
      (DBGrid1.Columns[i].Title.Caption);
  end;
end;

procedure TFrmPesqVenda.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnTransferir.Click;
end;

procedure TFrmPesqVenda.limpaPesquisa();
begin
  DM.query_pesquisa.Close;
  DM.query_pesquisa.SQL.Clear;
  DM.query_pesquisa.Params.Clear;
end;

procedure TFrmPesqVenda.pesquisaPorCodigo();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text :=
    'SELECT' +
    ' V.VENDA_ID,' +
    ' C.CLIENTE_NOME,'+
    ' P.FORMA_PGTO_DESCRICAO,'+
    ' V.USUARIO_NOME,' +
    ' V.VENDA_CADASTRO' +
    ' FROM VENDA V' +
    ' INNER JOIN CLIENTE C ON' +
    ' V.CLIENTE_ID = C.CLIENTE_ID' +
    ' INNER JOIN FORMA_PGTO P ON' +
    ' V.FORMA_PGTO_ID = P.FORMA_PGTO_ID' +
    ' WHERE' + ' V.VENDA_ID = ' + txtNome.Text +
    ' ORDER BY V.VENDA_ID';

  DM.query_pesquisa.Open;
  configuraTabela();
end;

procedure TFrmPesqVenda.pesquisaPorDataInicio();
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

  DM.query_pesquisa.SQL.Text :=
    'SELECT' +
    ' V.VENDA_ID,' +
    ' C.CLIENTE_NOME,'+
    ' P.FORMA_PGTO_DESCRICAO,'+
    ' V.USUARIO_NOME,' +
    ' V.VENDA_CADASTRO' +
    ' FROM VENDA V' +
    ' INNER JOIN CLIENTE C ON' +
    ' V.CLIENTE_ID = C.CLIENTE_ID' +
    ' INNER JOIN FORMA_PGTO P ON' +
    ' V.FORMA_PGTO_ID = P.FORMA_PGTO_ID' +
    ' WHERE' + ' V.VENDA_CADASTRO = :pDataInicio' +
    ' ORDER BY V.VENDA_ID';

  DM.query_pesquisa.ParamByName('pDataInicio').AsDate :=
    StrToDate(txtInicio.Text);

  DM.query_pesquisa.Open;
  configuraTabela();
end;

procedure TFrmPesqVenda.pesquisaPorIntervalo();
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

  DM.query_pesquisa.SQL.Text :=
    'SELECT' +
    ' V.VENDA_ID,' +
    ' C.CLIENTE_NOME,'+
    ' P.FORMA_PGTO_DESCRICAO,'+
    ' V.USUARIO_NOME,' +
    ' V.VENDA_CADASTRO' +
    ' FROM VENDA V' +
    ' INNER JOIN CLIENTE C ON' +
    ' V.CLIENTE_ID = C.CLIENTE_ID' +
    ' INNER JOIN FORMA_PGTO P ON' +
    ' V.FORMA_PGTO_ID = P.FORMA_PGTO_ID' +
    ' WHERE' + ' V.VENDA_CADASTRO ' +
    ' BETWEEN' +
    ' :pDataInicio AND :pDataFim' +
    ' ORDER BY V.VENDA_ID';

  DM.query_pesquisa.ParamByName('pDataInicio').AsDate :=
    StrToDate(txtInicio.Text);
  DM.query_pesquisa.ParamByName('pDataFim').AsDate := StrToDate(txtFim.Text);

  DM.query_pesquisa.Open;
  configuraTabela();
end;

procedure TFrmPesqVenda.pesquisaPorNome();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text :=
    'SELECT' +
    ' V.VENDA_ID,' +
    ' C.CLIENTE_NOME,'+
    ' P.FORMA_PGTO_DESCRICAO,'+
    ' V.USUARIO_NOME,' +
    ' V.VENDA_CADASTRO' +
    ' FROM VENDA V' +
    ' INNER JOIN CLIENTE C ON' +
    ' V.CLIENTE_ID = C.CLIENTE_ID' +
    ' INNER JOIN FORMA_PGTO P ON' +
    ' V.FORMA_PGTO_ID = P.FORMA_PGTO_ID' +
    ' WHERE' + ' V.USUARIO_NOME ' +
    ' LIKE' +  QuotedStr('%'+txtNome.Text+'%')+
    ' ORDER BY V.VENDA_ID';

  DM.query_pesquisa.Open;
  configuraTabela();
end;

function TFrmPesqVenda.GetStringAfterUnderscore(const str: string): string;
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
