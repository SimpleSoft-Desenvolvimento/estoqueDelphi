unit UnitDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, frxClass, frxDBSet, frxExportBaseDialog,
  frxExportPDF;

type
  TDM = class(TDataModule)
    conexao: TFDConnection;
    transacao: TFDTransaction;
    query_padrao: TFDQuery;
    ds_padrao: TDataSource;
    query_pesquisa: TFDQuery;
    ds_pesquisa: TDataSource;
    RelatorioPesqUsuario: TfrxReport;
    DataSetPesqUsuario: TfrxDBDataset;
    RelatorioPesqCliente: TfrxReport;
    DataSetPesqCliente: TfrxDBDataset;
    RelatorioPesqFornecedor: TfrxReport;
    DataSetPesqFornecedor: TfrxDBDataset;
    RelatorioPesqProduto: TfrxReport;
    DataSetPesqProduto: TfrxDBDataset;
    query_item: TFDQuery;
    ds_item: TDataSource;
    query_produto: TFDQuery;
    RelatorioPesqCompra: TfrxReport;
    DataSetPesqCompra: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    RelatorioPesqVenda: TfrxReport;
    DataSetPesqVenda: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
    usuarioNome, usuarioTipo: string;
  end;

var
  DM: TDM;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

end.
