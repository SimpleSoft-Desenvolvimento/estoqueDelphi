unit UnitPesqUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadraoPesquisa, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, frxClass, frxDBSet;

type
  TFrmPesqUsuario = class(TFrmPadraoPesquisa)
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure pesquisaPorCodigo;
    procedure limpaPesquisa;
    procedure configuraTabela;
    procedure pesquisaPorDataInicio;
    procedure pesquisaPorIntervalo;
    procedure pesquisaPorNome;
    procedure pesquisarTodos;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTransferirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    function GetStringAfterUnderscore(const str: string): string;
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesqUsuario: TFrmPesqUsuario;

implementation

uses
  UnitDM;

{$R *.dfm}

procedure TFrmPesqUsuario.btnImprimirClick(Sender: TObject);
var
  caminho: string;
begin
  caminho := ExtractFilePath(Application.ExeName);
  if DM.RelatorioPesqUsuario.LoadFromFile(caminho + 'RelatorioUsuario.fr3') then
  begin
    DM.RelatorioPesqUsuario.Clear;
    DM.RelatorioPesqUsuario.LoadFromFile(caminho + 'RelatorioUsuario.fr3');
    DM.RelatorioPesqUsuario.PrepareReport(true);
    DM.RelatorioPesqUsuario.ShowReport();
  end
  else
    MessageDlg('Relatório não encontrado', mtError, [mbOk], 0);
end;

procedure TFrmPesqUsuario.btnPesquisarClick(Sender: TObject);
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

procedure TFrmPesqUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.query_pesquisa.Close;
  DM.query_pesquisa.SQL.Clear;
  DM.ds_pesquisa.DataSet := nil;
  // Action := caFree;
  // FrmPesqUsuario := nil;
end;

procedure TFrmPesqUsuario.FormShow(Sender: TObject);
begin
  inherited;

  DM.ds_pesquisa.DataSet := DM.query_pesquisa;

  pesquisarTodos();

end;

procedure TFrmPesqUsuario.pesquisarTodos();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' USUARIO_ID,' + ' USUARIO_NOME,' +
    ' USUARIO_TIPO,' + ' USUARIO_CADASTRO' + ' FROM USUARIO' +
    ' ORDER BY USUARIO_ID;';

  DM.query_pesquisa.Open;

  configuraTabela();
end;

procedure TFrmPesqUsuario.btnTransferirClick(Sender: TObject);
begin

  if DM.query_pesquisa.RecordCount > 0 then
  begin
    codigo := DM.query_pesquisa.FieldByName('USUARIO_ID').Value;
  end
  else
    abort;
end;

procedure TFrmPesqUsuario.configuraTabela();
var
  i: Integer;
begin
  for i := 0 to DBGrid1.Columns.Count - 1 do
  begin
    DBGrid1.Columns[i].Width := 150;
    DBGrid1.Columns[i].Title.Caption := GetStringAfterUnderscore
      (DBGrid1.Columns[i].Title.Caption);
  end;
end;

procedure TFrmPesqUsuario.DBGrid1DblClick(Sender: TObject);
begin
  btnTransferir.Click;
end;

procedure TFrmPesqUsuario.limpaPesquisa();
begin
  DM.query_pesquisa.Close;
  DM.query_pesquisa.SQL.Clear;
  DM.query_pesquisa.Params.Clear;
end;

procedure TFrmPesqUsuario.pesquisaPorCodigo();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' USUARIO_ID,' + ' USUARIO_NOME,' +
    ' USUARIO_TIPO,' + ' USUARIO_CADASTRO' + ' FROM USUARIO' + ' WHERE' +
    ' USUARIO_ID = ' + txtNome.Text;

  DM.query_pesquisa.Open;
  configuraTabela();
end;

procedure TFrmPesqUsuario.pesquisaPorDataInicio();
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

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' USUARIO_ID,' + ' USUARIO_NOME,' +
    ' USUARIO_TIPO,' + ' USUARIO_CADASTRO' + ' FROM USUARIO' + ' WHERE' +
    ' USUARIO_CADASTRO = :pDataInicio';

  DM.query_pesquisa.ParamByName('pDataInicio').AsDate :=
    StrToDate(txtInicio.Text);

  DM.query_pesquisa.Open;
  configuraTabela();
end;

procedure TFrmPesqUsuario.pesquisaPorIntervalo();
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

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' USUARIO_ID,' + ' USUARIO_NOME,' +
    ' USUARIO_TIPO,' + ' USUARIO_CADASTRO' + ' FROM USUARIO' + ' WHERE' +
    ' USUARIO_CADASTRO' + ' BETWEEN' + ' :pDataInicio' + ' AND' + ' :pDataFim';

  DM.query_pesquisa.ParamByName('pDataInicio').AsDate :=
    StrToDate(txtInicio.Text);
  DM.query_pesquisa.ParamByName('pDataFim').AsDate := StrToDate(txtFim.Text);

  DM.query_pesquisa.Open;
  configuraTabela();
end;

procedure TFrmPesqUsuario.pesquisaPorNome();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text := 'SELECT' + ' USUARIO_ID,' + ' USUARIO_NOME,' +
    ' USUARIO_TIPO,' + ' USUARIO_CADASTRO' + ' FROM USUARIO' + ' WHERE' +
    ' USUARIO_NOME' + ' LIKE ''%' + txtNome.Text + '%'';';

  DM.query_pesquisa.Open;
  configuraTabela();
end;

function TFrmPesqUsuario.GetStringAfterUnderscore(const str: string): string;
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
