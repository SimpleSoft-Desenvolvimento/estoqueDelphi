inherited FrmPesqProduto: TFrmPesqProduto
  Caption = 'Pesquisa de Produto'
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited chave_pesquisa: TComboBox
      ItemIndex = 5
      Items.Strings = (
        'C'#211'DIGO'
        'DESCRICAO'
        'NOME FABRICANTE'
        'CADASTRO'
        'PER'#205'ODO'
        'TODOS')
    end
    inherited btnPesquisar: TButton
      OnClick = btnPesquisarClick
    end
    inherited btnImprimir: TButton
      OnClick = btnImprimirClick
    end
    inherited btnTransferir: TButton
      OnClick = btnTransferirClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 105
    Width = 1130
    Height = 601
    Align = alClient
    DataSource = DM.ds_pesquisa
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
end
