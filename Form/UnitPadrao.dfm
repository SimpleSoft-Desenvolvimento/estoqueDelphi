object FrmPadrao: TFrmPadrao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Formul'#225'rio Padr'#227'o'
  ClientHeight = 427
  ClientWidth = 805
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 805
    Height = 73
    Align = alTop
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 0
    object btn_pesquisar: TButton
      Left = 688
      Top = 13
      Width = 89
      Height = 49
      Caption = 'Pesquisar'
      TabOrder = 0
    end
    object btn_deletar: TButton
      Left = 128
      Top = 13
      Width = 89
      Height = 49
      Caption = 'Deletar'
      TabOrder = 1
      OnClick = btn_deletarClick
    end
    object btn_editar: TButton
      Left = 240
      Top = 13
      Width = 89
      Height = 49
      Caption = 'Editar'
      TabOrder = 2
      OnClick = btn_editarClick
    end
    object btn_gravar: TButton
      Left = 352
      Top = 13
      Width = 89
      Height = 49
      Caption = 'Gravar'
      Enabled = False
      TabOrder = 3
      OnClick = btn_gravarClick
    end
    object btn_cancelar: TButton
      Left = 464
      Top = 13
      Width = 89
      Height = 49
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 4
      OnClick = btn_cancelarClick
    end
    object btn_atualizar: TButton
      Left = 576
      Top = 13
      Width = 89
      Height = 49
      Caption = 'Atualizar'
      Enabled = False
      TabOrder = 5
      OnClick = btn_atualizarClick
    end
    object btn_novo: TButton
      Left = 24
      Top = 13
      Width = 89
      Height = 49
      Caption = 'Novo'
      TabOrder = 6
      OnClick = btn_novoClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 386
    Width = 805
    Height = 41
    Align = alBottom
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 257
      Top = 16
      Width = 296
      Height = 25
      DataSource = DM.ds_padrao
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
  end
end
