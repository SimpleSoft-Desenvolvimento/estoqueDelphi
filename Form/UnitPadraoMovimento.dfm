inherited FrmPadraoMovimento: TFrmPadraoMovimento
  Caption = 'Formul'#225'rio Padr'#227'o de Movimento'
  ClientHeight = 521
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    TabOrder = 1
    inherited btn_novo: TButton
      Left = 17
      ExplicitLeft = 17
    end
  end
  inherited Panel1: TPanel
    Top = 464
    Height = 57
    TabOrder = 0
    ExplicitTop = 464
    ExplicitHeight = 57
    inherited DBNavigator1: TDBNavigator
      Left = 576
      Top = 6
      Width = 216
      Height = 43
      Hints.Strings = ()
      ExplicitLeft = 576
      ExplicitTop = 6
      ExplicitWidth = 216
      ExplicitHeight = 43
    end
    object btn_item: TButton
      Left = 17
      Top = 6
      Width = 89
      Height = 43
      Caption = 'Item'
      TabOrder = 1
      OnClick = btn_itemClick
    end
    object btn_ok: TButton
      Left = 128
      Top = 6
      Width = 89
      Height = 43
      Caption = 'Ok'
      Enabled = False
      TabOrder = 2
      OnClick = btn_okClick
    end
    object btn_excluir: TButton
      Left = 240
      Top = 6
      Width = 89
      Height = 43
      Caption = 'Excluir'
      TabOrder = 3
    end
    object btn_imprimir: TButton
      Left = 352
      Top = 6
      Width = 89
      Height = 43
      Caption = 'Imprimir'
      TabOrder = 4
    end
    object btn_CancelarItem: TButton
      Left = 464
      Top = 6
      Width = 89
      Height = 43
      Caption = 'Cancelar'
      TabOrder = 5
      OnClick = btn_CancelarItemClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 73
    Width = 805
    Height = 176
    Align = alTop
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 0
    Top = 394
    Width = 805
    Height = 70
    Align = alBottom
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 3
  end
end
