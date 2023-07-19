unit UnitPesqCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadraoPesquisa, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmPesqCliente = class(TFrmPadraoPesquisa)
    DBGrid1: TDBGrid;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure configuraTabela;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure limpaPesquisa;
    procedure pesquisaPorCodigo;
    procedure pesquisaPorDataInicio;
    procedure pesquisaPorIntervalo;
    procedure pesquisaPorNome;
    procedure pesquisarTodos;
    function GetStringAfterUnderscore(const str: string): string;
    procedure btnTransferirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesqCliente: TFrmPesqCliente;

implementation

uses
  UnitDM;

{$R *.dfm}

procedure TFrmPesqCliente.btnImprimirClick(Sender: TObject);
var
  caminho: string;
begin
  caminho := ExtractFilePath(Application.ExeName);
  if DM.RelatorioPesqCliente.LoadFromFile(caminho + 'RelatorioCliente.fr3') then
  begin
    DM.RelatorioPesqCliente.Clear;
    DM.RelatorioPesqCliente.LoadFromFile(caminho + 'RelatorioCliente.fr3');
    DM.RelatorioPesqCliente.PrepareReport(true);
    DM.RelatorioPesqCliente.ShowReport();
  end
  else
    MessageDlg('Relatório não encontrado', mtError, [mbOk], 0);
end;

procedure TFrmPesqCliente.btnPesquisarClick(Sender: TObject);
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

procedure TFrmPesqCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.query_pesquisa.Close;
  DM.query_pesquisa.SQL.Clear;
  DM.ds_pesquisa.DataSet := nil;
  // Action := caFree;
  // FrmPesqCliente := nil;
end;

procedure TFrmPesqCliente.FormShow(Sender: TObject);
begin
  inherited;

  DM.ds_pesquisa.DataSet := DM.query_pesquisa;

  pesquisarTodos();

end;

procedure TFrmPesqCliente.pesquisarTodos();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' CLIENTE_ID,' + ' CLIENTE_NOME,' +
    ' CLIENTE_ENDERECO,' + ' CLIENTE_NUMERO,' + ' CLIENTE_BAIRRO,' +
    ' CLIENTE_CIDADE,' + ' CLIENTE_UF,' + ' CLIENTE_TELEFONE,' + ' CLIENTE_CPF,'
    + ' CLIENTE_EMAIL,' + ' CLIENTE_CADASTRO,' + ' CLIENTE_CEP' +
    ' FROM CLIENTE' + ' ORDER BY CLIENTE_ID;';

  DM.query_pesquisa.Open;

  configuraTabela();
end;

procedure TFrmPesqCliente.btnTransferirClick(Sender: TObject);
begin
  inherited;
  if DM.query_pesquisa.RecordCount > 0 then
  begin
    codigo := DM.query_pesquisa.FieldByName('CLIENTE_ID').Value;
  end
  else
    abort;
end;

procedure TFrmPesqCliente.configuraTabela();
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

procedure TFrmPesqCliente.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnTransferir.Click;
end;

procedure TFrmPesqCliente.limpaPesquisa();
begin
  DM.query_pesquisa.Close;
  DM.query_pesquisa.SQL.Clear;
  DM.query_pesquisa.Params.Clear;
end;

procedure TFrmPesqCliente.pesquisaPorCodigo();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' CLIENTE_ID,' + ' CLIENTE_NOME,' +
    ' CLIENTE_ENDERECO,' + ' CLIENTE_NUMERO,' + ' CLIENTE_BAIRRO,' +
    ' CLIENTE_CIDADE,' + ' CLIENTE_UF,' + ' CLIENTE_TELEFONE,' + ' CLIENTE_CPF,'
    + ' CLIENTE_EMAIL,' + ' CLIENTE_CADASTRO,' + ' CLIENTE_CEP' +
    ' FROM CLIENTE' + ' WHERE' + ' CLIENTE_ID = ' + txtNome.Text;

  DM.query_pesquisa.Open;
  configuraTabela();
end;

procedure TFrmPesqCliente.pesquisaPorDataInicio();
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

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' CLIENTE_ID,' + ' CLIENTE_NOME,' +
    ' CLIENTE_ENDERECO,' + ' CLIENTE_NUMERO,' + ' CLIENTE_BAIRRO,' +
    ' CLIENTE_CIDADE,' + ' CLIENTE_UF,' + ' CLIENTE_TELEFONE,' + ' CLIENTE_CPF,'
    + ' CLIENTE_EMAIL,' + ' CLIENTE_CADASTRO,' + ' CLIENTE_CEP' +
    ' FROM CLIENTE' + ' WHERE' + ' CLIENTE_CADASTRO = :pDataInicio';

  DM.query_pesquisa.ParamByName('pDataInicio').AsDate :=
    StrToDate(txtInicio.Text);

  DM.query_pesquisa.Open;
  configuraTabela();
end;

procedure TFrmPesqCliente.pesquisaPorIntervalo();
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

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' CLIENTE_ID,' + ' CLIENTE_NOME,' +
    ' CLIENTE_ENDERECO,' + ' CLIENTE_NUMERO,' + ' CLIENTE_BAIRRO,' +
    ' CLIENTE_CIDADE,' + ' CLIENTE_UF,' + ' CLIENTE_TELEFONE,' + ' CLIENTE_CPF,'
    + ' CLIENTE_EMAIL,' + ' CLIENTE_CADASTRO,' + ' CLIENTE_CEP' +
    ' FROM CLIENTE' + ' WHERE' + ' CLIENTE_CADASTRO' + ' BETWEEN' +
    ' :pDataInicio' + ' AND' + ' :pDataFim';

  DM.query_pesquisa.ParamByName('pDataInicio').AsDate :=
    StrToDate(txtInicio.Text);
  DM.query_pesquisa.ParamByName('pDataFim').AsDate := StrToDate(txtFim.Text);

  DM.query_pesquisa.Open;
  configuraTabela();
end;

procedure TFrmPesqCliente.pesquisaPorNome();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' CLIENTE_ID,' + ' CLIENTE_NOME,' +
    ' CLIENTE_ENDERECO,' + ' CLIENTE_NUMERO,' + ' CLIENTE_BAIRRO,' +
    ' CLIENTE_CIDADE,' + ' CLIENTE_UF,' + ' CLIENTE_TELEFONE,' + ' CLIENTE_CPF,'
    + ' CLIENTE_EMAIL,' + ' CLIENTE_CADASTRO,' + ' CLIENTE_CEP' +
    ' FROM CLIENTE' + ' WHERE' + ' CLIENTE_NOME' + ' LIKE ''%' +
    txtNome.Text + '%'';';

  DM.query_pesquisa.Open;
  configuraTabela();
end;

function TFrmPesqCliente.GetStringAfterUnderscore(const str: string): string;
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
