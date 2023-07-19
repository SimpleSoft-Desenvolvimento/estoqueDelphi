object frmTrocaSenha: TfrmTrocaSenha
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Trocar Senha'
  ClientHeight = 276
  ClientWidth = 428
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 117
    Width = 108
    Height = 13
    Caption = 'Confirmar Nova Senha'
  end
  object Label2: TLabel
    Left = 48
    Top = 45
    Width = 62
    Height = 13
    Caption = 'Nova Senha:'
  end
  object txtNovaSenha: TEdit
    Left = 48
    Top = 64
    Width = 321
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object txtConfirmarNovaSenha: TEdit
    Left = 48
    Top = 136
    Width = 321
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object btnConfirmar: TButton
    Left = 48
    Top = 192
    Width = 121
    Height = 33
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object btnCancelar: TButton
    Left = 248
    Top = 192
    Width = 121
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
end
