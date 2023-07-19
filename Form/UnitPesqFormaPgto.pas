unit UnitPesqFormaPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadraoPesquisa, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmPesqFormaPgto = class(TFrmPadraoPesquisa)
    DBGrid1: TDBGrid;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnTransferirClick(Sender: TObject);
    procedure configuraTabela;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    function GetStringAfterUnderscore(const str: string): string;
    procedure limpaPesquisa;
    procedure pesquisaPorCodigo;
    procedure pesquisaPorNome;
    procedure pesquisarTodos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesqFormaPgto: TFrmPesqFormaPgto;

implementation

uses
  UnitDM;

{$R *.dfm}


procedure TFrmPesqFormaPgto.btnPesquisarClick(Sender: TObject);
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
  else
    begin
      // todos
      limpaPesquisa();
      pesquisarTodos();
    end;
  end;

end;

procedure TFrmPesqFormaPgto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.query_pesquisa.Close;
  DM.query_pesquisa.SQL.Clear;
  DM.ds_pesquisa.DataSet := nil;
  // Action := caFree;
  // FrmPesqCliente := nil;
end;

procedure TFrmPesqFormaPgto.FormShow(Sender: TObject);
begin
  inherited;

  DM.ds_pesquisa.DataSet := DM.query_pesquisa;

  pesquisarTodos();

end;

procedure TFrmPesqFormaPgto.pesquisarTodos();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text :=
  'SELECT' +
  ' FORMA_PGTO_ID,' +
  ' FORMA_PGTO_DESCRICAO,'+
  ' FORMA_PGTO_CADASTRO'+
  ' FROM FORMA_PGTO' +
  ' ORDER BY FORMA_PGTO_ID';

  DM.query_pesquisa.Open;

  configuraTabela();
end;

procedure TFrmPesqFormaPgto.btnTransferirClick(Sender: TObject);
begin
  inherited;
  if DM.query_pesquisa.RecordCount > 0 then
  begin
    codigo := DM.query_pesquisa.FieldByName('FORMA_PGTO_ID').Value;
  end
  else
    abort;
end;

procedure TFrmPesqFormaPgto.configuraTabela();
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

procedure TFrmPesqFormaPgto.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnTransferir.Click;
end;

procedure TFrmPesqFormaPgto.limpaPesquisa();
begin
  DM.query_pesquisa.Close;
  DM.query_pesquisa.SQL.Clear;
  DM.query_pesquisa.Params.Clear;
end;

procedure TFrmPesqFormaPgto.pesquisaPorCodigo();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text :=
    'SELECT' +
    ' FORMA_PGTO_ID,' +
    ' FORMA_PGTO_DESCRICAO,'+
    ' FORMA_PGTO_CADASTRO'+
    ' FROM FORMA_PGTO' +
    ' WHERE' + ' FORMA_PGTO_ID = ' + txtNome.Text +
    ' ORDER BY FORMA_PGTO_ID';

  DM.query_pesquisa.Open;
  configuraTabela();
end;

procedure TFrmPesqFormaPgto.pesquisaPorNome();
begin
  DM.query_pesquisa.Close;

  DM.query_pesquisa.SQL.Text :=
    'SELECT' +
    ' FORMA_PGTO_ID,' +
    ' FORMA_PGTO_DESCRICAO,'+
    ' FORMA_PGTO_CADASTRO'+
    ' FROM FORMA_PGTO' +
    ' WHERE' + ' FORMA_PGTO_DESCRICAO' +
    ' LIKE' +  QuotedStr('%'+txtNome.Text+'%')+
    ' ORDER BY FORMA_PGTO_ID';

  DM.query_pesquisa.Open;
  configuraTabela();
end;

function TFrmPesqFormaPgto.GetStringAfterUnderscore(const str: string): string;
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
