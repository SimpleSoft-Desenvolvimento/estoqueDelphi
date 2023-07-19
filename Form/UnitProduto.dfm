inherited FrmProduto: TFrmProduto
  Caption = 'Cadastro de Produto'
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 811
  ExplicitHeight = 456
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 24
    Top = 79
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label2: TLabel [1]
    Left = 24
    Top = 143
    Width = 102
    Height = 13
    Caption = 'Descri'#231#227'o do Produto'
  end
  object Label5: TLabel [2]
    Left = 24
    Top = 199
    Width = 84
    Height = 13
    Caption = 'Custo do Produto'
  end
  object Label6: TLabel [3]
    Left = 391
    Top = 201
    Width = 74
    Height = 13
    Caption = 'Estoque M'#237'nimo'
  end
  object Label7: TLabel [4]
    Left = 265
    Top = 201
    Width = 39
    Height = 13
    Caption = 'Unidade'
  end
  object Label8: TLabel [5]
    Left = 184
    Top = 79
    Width = 44
    Height = 13
    Caption = 'Cadastro'
  end
  object Label9: TLabel [6]
    Left = 132
    Top = 201
    Width = 72
    Height = 13
    Caption = 'Valor de Venda'
  end
  object Label10: TLabel [7]
    Left = 405
    Top = 79
    Width = 39
    Height = 13
    Caption = 'Estoque'
  end
  inherited Panel2: TPanel
    TabOrder = 8
    inherited btn_pesquisar: TButton
      OnClick = btn_pesquisarClick
    end
  end
  inherited Panel1: TPanel
    TabOrder = 9
    inherited DBNavigator1: TDBNavigator
      Hints.Strings = ()
    end
  end
  object txtProdutoId: TDBEdit
    Left = 24
    Top = 98
    Width = 74
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 0
  end
  object txtProdutoDescricao: TDBEdit
    Left = 24
    Top = 162
    Width = 493
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 3
  end
  object txtProdutoCusto: TDBEdit
    Left = 24
    Top = 220
    Width = 102
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 4
  end
  object txtProdutoEstoqueMin: TDBEdit
    Left = 391
    Top = 220
    Width = 118
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 7
  end
  object txtProdutoCadastro: TDBEdit
    Left = 184
    Top = 98
    Width = 113
    Height = 21
    DataSource = DM.ds_padrao
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object txtProdutoVenda: TDBEdit
    Left = 132
    Top = 220
    Width = 120
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 5
  end
  object txtProdutoEstoque: TDBEdit
    Left = 405
    Top = 98
    Width = 112
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 275
    Width = 505
    Height = 105
    Caption = 'Fornecedor'
    TabOrder = 10
    object Label12: TLabel
      Left = 141
      Top = 36
      Width = 100
      Height = 13
      Caption = 'Nome do Fornecedor'
    end
    object Label13: TLabel
      Left = 13
      Top = 36
      Width = 69
      Height = 13
      Caption = 'ID Fornecedor'
    end
    object txtFornecedorId: TDBEdit
      Left = 13
      Top = 55
      Width = 89
      Height = 21
      DataSource = DM.ds_padrao
      ReadOnly = True
      TabOrder = 0
    end
    object txtFornecedorNome: TDBEdit
      Left = 141
      Top = 55
      Width = 357
      Height = 21
      DataSource = DM.ds_padrao
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object txtProdutoUnidade: TDBComboBox
    Left = 258
    Top = 220
    Width = 105
    Height = 21
    Style = csDropDownList
    DataSource = DM.ds_padrao
    Items.Strings = (
      'UN'
      'LT'
      'PCT'
      'ML'
      'KG'
      'G')
    ReadOnly = True
    TabOrder = 6
  end
end
