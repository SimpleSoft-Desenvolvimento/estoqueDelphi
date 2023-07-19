object FrmPadraoPesquisa: TFrmPadraoPesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Formul'#225'rio Padr'#227'o de Pesquisa'
  ClientHeight = 747
  ClientWidth = 1130
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1130
    Height = 105
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 22
      Width = 114
      Height = 16
      Caption = 'Op'#231#245'es de Pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNomeCodigo: TLabel
      Left = 208
      Top = 22
      Width = 38
      Height = 16
      Caption = 'Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object chave_pesquisa: TComboBox
      Left = 24
      Top = 44
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 4
      TabOrder = 0
      Text = 'TODOS'
      OnChange = chave_pesquisaChange
      Items.Strings = (
        'C'#211'DIGO'
        'NOME'
        'CADASTRO'
        'PER'#205'ODO'
        'TODOS')
    end
    object txtNome: TEdit
      Left = 208
      Top = 44
      Width = 241
      Height = 21
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 504
      Top = 18
      Width = 393
      Height = 81
      Caption = 'Per'#237'odo'
      TabOrder = 2
      object lblInicio: TLabel
        Left = 19
        Top = 22
        Width = 30
        Height = 16
        Caption = 'In'#237'cio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblFim: TLabel
        Left = 164
        Top = 21
        Width = 21
        Height = 16
        Caption = 'Fim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object txtFim: TMaskEdit
        Left = 161
        Top = 43
        Width = 112
        Height = 21
        EditMask = '##/##/####;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
      end
      object txtInicio: TMaskEdit
        Left = 15
        Top = 44
        Width = 110
        Height = 21
        EditMask = '##/##/####;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
    end
    object btnPesquisar: TButton
      Left = 968
      Top = 9
      Width = 105
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 3
    end
    object btnImprimir: TButton
      Left = 968
      Top = 40
      Width = 105
      Height = 27
      Caption = 'Imprimir'
      TabOrder = 4
    end
    object btnTransferir: TButton
      Left = 968
      Top = 73
      Width = 105
      Height = 25
      Caption = 'Transferir'
      ModalResult = 1
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 706
    Width = 1130
    Height = 41
    Align = alBottom
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 1
  end
end
