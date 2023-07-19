inherited FrmFornecedor: TFrmFornecedor
  Caption = 'Cadastro de Fornecedor'
  OnClose = FormClose
  OnShow = FormShow
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
    Top = 127
    Width = 75
    Height = 13
    Caption = 'Nome Completo'
  end
  object Label3: TLabel [2]
    Left = 413
    Top = 79
    Width = 44
    Height = 13
    Caption = 'Cadastro'
  end
  object Label5: TLabel [3]
    Left = 24
    Top = 183
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label6: TLabel [4]
    Left = 24
    Top = 231
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object Label7: TLabel [5]
    Left = 176
    Top = 229
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label8: TLabel [6]
    Left = 308
    Top = 229
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object Label9: TLabel [7]
    Left = 452
    Top = 183
    Width = 37
    Height = 13
    Caption = 'Numero'
  end
  object Label10: TLabel [8]
    Left = 112
    Top = 79
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label11: TLabel [9]
    Left = 396
    Top = 229
    Width = 19
    Height = 13
    Caption = 'Cep'
  end
  object Label12: TLabel [10]
    Left = 396
    Top = 277
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label13: TLabel [11]
    Left = 24
    Top = 277
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  inherited Panel2: TPanel
    inherited btn_pesquisar: TButton
      OnClick = btn_pesquisarClick
    end
  end
  inherited Panel1: TPanel
    inherited DBNavigator1: TDBNavigator
      Hints.Strings = ()
    end
  end
  object txtFornecedorId: TDBEdit
    Left = 24
    Top = 98
    Width = 60
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 2
  end
  object txtFornecedorNome: TDBEdit
    Left = 24
    Top = 146
    Width = 493
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 3
  end
  object txtFornecedorCadastro: TDBEdit
    Left = 413
    Top = 98
    Width = 104
    Height = 21
    DataSource = DM.ds_padrao
    Enabled = False
    ReadOnly = True
    TabOrder = 4
  end
  object txtFornecedorEndereco: TDBEdit
    Left = 24
    Top = 202
    Width = 414
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 5
  end
  object txtFornecedorBairro: TDBEdit
    Left = 24
    Top = 250
    Width = 129
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 6
  end
  object txtFornecedorCidade: TDBEdit
    Left = 176
    Top = 248
    Width = 113
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 7
  end
  object txtFornecedorUf: TDBEdit
    Left = 308
    Top = 248
    Width = 69
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 8
  end
  object txtFornecedorNumero: TDBEdit
    Left = 452
    Top = 202
    Width = 65
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 9
  end
  object txtFornecedorCNPJ: TDBEdit
    Left = 112
    Top = 98
    Width = 281
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 10
  end
  object txtFornecedorCep: TDBEdit
    Left = 396
    Top = 248
    Width = 121
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 11
  end
  object txtFornecedorTelefone: TDBEdit
    Left = 396
    Top = 296
    Width = 121
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 13
  end
  object txtFornecedorEmail: TDBEdit
    Left = 24
    Top = 296
    Width = 353
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 12
  end
end
