inherited FrmEmpresa: TFrmEmpresa
  Caption = 'Cadastro de Empresa'
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
    Width = 60
    Height = 13
    Caption = 'Raz'#227'o Social'
  end
  object Label3: TLabel [2]
    Left = 413
    Top = 79
    Width = 44
    Height = 13
    Caption = 'Cadastro'
  end
  object Label4: TLabel [3]
    Left = 24
    Top = 175
    Width = 41
    Height = 13
    Caption = 'Fantasia'
  end
  object Label5: TLabel [4]
    Left = 24
    Top = 223
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label6: TLabel [5]
    Left = 24
    Top = 271
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object Label7: TLabel [6]
    Left = 176
    Top = 269
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label8: TLabel [7]
    Left = 308
    Top = 269
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object Label9: TLabel [8]
    Left = 452
    Top = 223
    Width = 37
    Height = 13
    Caption = 'Numero'
  end
  object Label10: TLabel [9]
    Left = 112
    Top = 79
    Width = 25
    Height = 13
    Caption = 'CNPJ'
  end
  object Label11: TLabel [10]
    Left = 396
    Top = 269
    Width = 19
    Height = 13
    Caption = 'Cep'
  end
  object Label12: TLabel [11]
    Left = 396
    Top = 317
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label13: TLabel [12]
    Left = 24
    Top = 317
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label14: TLabel [13]
    Left = 560
    Top = 79
    Width = 23
    Height = 13
    Caption = 'Logo'
  end
  inherited Panel2: TPanel
    TabOrder = 14
    inherited btn_pesquisar: TButton
      OnClick = btn_pesquisarClick
    end
  end
  inherited Panel1: TPanel
    TabOrder = 15
    inherited DBNavigator1: TDBNavigator
      Hints.Strings = ()
    end
  end
  object txtEmpresaId: TDBEdit
    Left = 24
    Top = 98
    Width = 60
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 0
  end
  object txtEmpresaRazaoSocial: TDBEdit
    Left = 24
    Top = 146
    Width = 493
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 3
  end
  object txtEmpresaCadastro: TDBEdit
    Left = 413
    Top = 98
    Width = 104
    Height = 21
    DataSource = DM.ds_padrao
    Enabled = False
    ReadOnly = True
    TabOrder = 2
  end
  object txtEmpresaFantasia: TDBEdit
    Left = 24
    Top = 196
    Width = 493
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 4
  end
  object txtEmpresaEndereco: TDBEdit
    Left = 24
    Top = 242
    Width = 414
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 5
  end
  object txtEmpresaBairro: TDBEdit
    Left = 24
    Top = 290
    Width = 129
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 7
  end
  object txtEmpresaCidade: TDBEdit
    Left = 176
    Top = 288
    Width = 113
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 8
  end
  object txtEmpresaUf: TDBEdit
    Left = 308
    Top = 288
    Width = 69
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 9
  end
  object txtEmpresaNumero: TDBEdit
    Left = 452
    Top = 242
    Width = 65
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 6
  end
  object txtEmpresaCNPJ: TDBEdit
    Left = 112
    Top = 98
    Width = 281
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 1
  end
  object txtEmpresaCep: TDBEdit
    Left = 396
    Top = 288
    Width = 121
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 10
  end
  object txtEmpresaTelefone: TDBEdit
    Left = 396
    Top = 336
    Width = 121
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 12
  end
  object txtEmpresaEmail: TDBEdit
    Left = 24
    Top = 336
    Width = 353
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 11
  end
  object imagemEmpresaLogo: TDBImage
    Left = 560
    Top = 98
    Width = 211
    Height = 211
    DataSource = DM.ds_padrao
    ReadOnly = True
    Stretch = True
    TabOrder = 13
  end
  object btnCarregar: TButton
    Left = 560
    Top = 315
    Width = 75
    Height = 25
    Caption = 'Carregar'
    Enabled = False
    TabOrder = 17
    OnClick = btnCarregarClick
  end
  object btnLimpar: TButton
    Left = 696
    Top = 315
    Width = 75
    Height = 25
    Caption = 'Limpar'
    Enabled = False
    TabOrder = 16
    OnClick = btnLimparClick
  end
  object OpenDialog1: TOpenDialog
    Left = 648
    Top = 320
  end
end
