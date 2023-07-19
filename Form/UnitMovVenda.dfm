inherited FrmMovVenda: TFrmMovVenda
  Caption = 'Cadastro de Vendas'
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited btn_pesquisar: TButton
      OnClick = btn_pesquisarClick
    end
  end
  inherited Panel1: TPanel
    inherited DBNavigator1: TDBNavigator
      Hints.Strings = ()
      OnClick = DBNavigator1Click
    end
    inherited btn_excluir: TButton
      OnClick = btn_excluirClick
    end
  end
  inherited Panel3: TPanel
    object Label3: TLabel
      Left = 32
      Top = 13
      Width = 52
      Height = 13
      Caption = 'Cod Venda'
    end
    object Label1: TLabel
      Left = 32
      Top = 59
      Width = 55
      Height = 13
      Caption = 'Cod Cliente'
    end
    object Label2: TLabel
      Left = 32
      Top = 107
      Width = 76
      Height = 13
      Caption = 'Cod Pagamento'
    end
    object Label4: TLabel
      Left = 208
      Top = 13
      Width = 44
      Height = 13
      Caption = 'Cadastro'
    end
    object Label7: TLabel
      Left = 208
      Top = 59
      Width = 78
      Height = 13
      Caption = 'Nome do Cliente'
    end
    object Label8: TLabel
      Left = 208
      Top = 107
      Width = 118
      Height = 13
      Caption = 'Descricao de Pagamento'
    end
    object Label5: TLabel
      Left = 352
      Top = 13
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label6: TLabel
      Left = 496
      Top = 13
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object txtVendaId: TDBEdit
      Left = 32
      Top = 32
      Width = 121
      Height = 21
      DataSource = DM.ds_padrao
      Enabled = False
      TabOrder = 0
    end
    object txtClienteId: TDBEdit
      Left = 32
      Top = 78
      Width = 90
      Height = 21
      DataSource = DM.ds_padrao
      ReadOnly = True
      TabOrder = 1
    end
    object txtFormaPagamentoId: TDBEdit
      Left = 32
      Top = 126
      Width = 90
      Height = 21
      DataSource = DM.ds_padrao
      ReadOnly = True
      TabOrder = 2
    end
    object txtVendaCadastro: TDBEdit
      Left = 208
      Top = 32
      Width = 121
      Height = 21
      DataSource = DM.ds_padrao
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
    object txtClienteNome: TDBEdit
      Left = 208
      Top = 78
      Width = 409
      Height = 21
      DataSource = DM.ds_padrao
      Enabled = False
      TabOrder = 4
    end
    object txtFormaPgtoDesc: TDBEdit
      Left = 208
      Top = 126
      Width = 409
      Height = 21
      DataSource = DM.ds_padrao
      Enabled = False
      TabOrder = 5
    end
    object txtVendaValor: TEdit
      Left = 352
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object txtUsuarioNome: TDBEdit
      Left = 496
      Top = 32
      Width = 121
      Height = 21
      DataSource = DM.ds_padrao
      Enabled = False
      ReadOnly = True
      TabOrder = 7
    end
    object btnGetCliente: TBitBtn
      Left = 128
      Top = 78
      Width = 25
      Height = 22
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = '...'
      TabOrder = 8
      OnClick = btnGetClienteClick
    end
    object btnGetFormaPgto: TBitBtn
      Left = 128
      Top = 125
      Width = 25
      Height = 22
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = '...'
      TabOrder = 9
      OnClick = btnGetFormaPgtoClick
    end
  end
  inherited Panel4: TPanel
    object Produto: TLabel
      Left = 20
      Top = 5
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object Custo: TLabel
      Left = 131
      Top = 5
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Quantidade: TLabel
      Left = 243
      Top = 5
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object Label12: TLabel
      Left = 355
      Top = 5
      Width = 45
      Height = 13
      Caption = 'Desconto'
    end
    object Label13: TLabel
      Left = 467
      Top = 5
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object txtProdutoId: TDBEdit
      Left = 20
      Top = 24
      Width = 86
      Height = 21
      DataSource = DM.ds_item
      ReadOnly = True
      TabOrder = 0
      OnExit = txtProdutoIdExit
    end
    object txtValor: TDBEdit
      Left = 131
      Top = 24
      Width = 86
      Height = 21
      DataSource = DM.ds_item
      ReadOnly = True
      TabOrder = 1
    end
    object txtQuant: TDBEdit
      Left = 243
      Top = 24
      Width = 86
      Height = 21
      DataSource = DM.ds_item
      ReadOnly = True
      TabOrder = 2
    end
    object txtDesconto: TDBEdit
      Left = 355
      Top = 24
      Width = 86
      Height = 21
      DataSource = DM.ds_item
      ReadOnly = True
      TabOrder = 3
    end
    object txtTotal: TDBEdit
      Left = 467
      Top = 24
      Width = 86
      Height = 21
      DataSource = DM.ds_item
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 249
    Width = 805
    Height = 145
    Align = alClient
    DataSource = DM.ds_item
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
