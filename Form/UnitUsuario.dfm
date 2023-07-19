inherited FrmUsuario: TFrmUsuario
  Caption = 'Cadastro de Usuario'
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 189
    Top = 173
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel [1]
    Left = 192
    Top = 112
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label3: TLabel [2]
    Left = 189
    Top = 243
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Label4: TLabel [3]
    Left = 482
    Top = 243
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  object Label5: TLabel [4]
    Left = 480
    Top = 112
    Width = 44
    Height = 13
    Caption = 'Cadastro'
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
  object txtUsuarioNome: TDBEdit
    Left = 189
    Top = 192
    Width = 436
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 2
  end
  object txtUsuarioId: TDBEdit
    Left = 189
    Top = 131
    Width = 89
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 3
  end
  object txtUsuarioSenha: TDBEdit
    Left = 189
    Top = 262
    Width = 196
    Height = 21
    DataSource = DM.ds_padrao
    PasswordChar = '*'
    ReadOnly = True
    TabOrder = 4
  end
  object txtUsuarioCadastro: TDBEdit
    Left = 479
    Top = 131
    Width = 150
    Height = 21
    DataSource = DM.ds_padrao
    Enabled = False
    ReadOnly = True
    TabOrder = 6
  end
  object txtUsuarioTipo: TDBComboBox
    Left = 480
    Top = 262
    Width = 145
    Height = 21
    Style = csDropDownList
    DataSource = DM.ds_padrao
    Items.Strings = (
      'ADM'
      'APOIO')
    ReadOnly = True
    TabOrder = 5
  end
end
