inherited FrmFormaPgto: TFrmFormaPgto
  Caption = 'Cadastro de Forma de Pagamento'
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 184
    Top = 127
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label8: TLabel [1]
    Left = 384
    Top = 127
    Width = 44
    Height = 13
    Caption = 'Cadastro'
  end
  object Label10: TLabel [2]
    Left = 184
    Top = 231
    Width = 102
    Height = 13
    Caption = 'Forma de Pagamento'
  end
  inherited Panel2: TPanel
    inherited btn_pesquisar: TButton
      OnClick = btn_pesquisarClick
    end
    inherited btn_gravar: TButton
      Left = 355
      ExplicitLeft = 355
    end
  end
  inherited Panel1: TPanel
    inherited DBNavigator1: TDBNavigator
      Hints.Strings = ()
    end
  end
  object txtFormaPgtoId: TDBEdit
    Left = 184
    Top = 146
    Width = 129
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 2
  end
  object txtFormaPgtoCadastro: TDBEdit
    Left = 384
    Top = 146
    Width = 281
    Height = 21
    DataSource = DM.ds_padrao
    Enabled = False
    ReadOnly = True
    TabOrder = 4
  end
  object txtFormaPgtoDescricao: TDBEdit
    Left = 184
    Top = 250
    Width = 481
    Height = 21
    DataSource = DM.ds_padrao
    ReadOnly = True
    TabOrder = 3
  end
end
