object DM: TDM
  OldCreateOrder = False
  Height = 497
  Width = 776
  object conexao: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos_Matheus\Desktop\Banco de Dados\ESTOQUE.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=UTF8'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 168
    Top = 24
  end
  object transacao: TFDTransaction
    Connection = conexao
    Left = 168
    Top = 96
  end
  object query_padrao: TFDQuery
    Connection = conexao
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    Left = 40
    Top = 168
  end
  object ds_padrao: TDataSource
    DataSet = query_padrao
    Left = 40
    Top = 248
  end
  object query_pesquisa: TFDQuery
    Connection = conexao
    Left = 160
    Top = 168
  end
  object ds_pesquisa: TDataSource
    DataSet = query_pesquisa
    Left = 160
    Top = 248
  end
  object RelatorioPesqUsuario: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45043.712019097220000000
    ReportOptions.LastChange = 45044.305728668980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 549
    Top = 24
    Datasets = <
      item
        DataSet = DataSetPesqUsuario
        DataSetName = 'frxDBUsuarios'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        DataSet = DataSetPesqUsuario
        DataSetName = 'frxDBUsuarios'
        RowCount = 0
        object frxDBUsuariosUSUARIO_ID: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Top = 7.559060000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          DataField = 'USUARIO_ID'
          DataSet = DataSetPesqUsuario
          DataSetName = 'frxDBUsuarios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBUsuarios."USUARIO_ID"]')
          ParentFont = False
        end
        object frxDBUsuariosUSUARIO_NOME: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 196.535560000000000000
          Top = 7.559060000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          DataField = 'USUARIO_NOME'
          DataSet = DataSetPesqUsuario
          DataSetName = 'frxDBUsuarios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBUsuarios."USUARIO_NOME"]')
          ParentFont = False
        end
        object frxDBUsuariosUSUARIO_TIPO: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 408.189240000000000000
          Top = 7.559060000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'USUARIO_TIPO'
          DataSet = DataSetPesqUsuario
          DataSetName = 'frxDBUsuarios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBUsuarios."USUARIO_TIPO"]')
          ParentFont = False
        end
        object frxDBUsuariosUSUARIO_CADASTRO: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 529.134200000000000000
          Top = 7.559060000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataField = 'USUARIO_CADASTRO'
          DataSet = DataSetPesqUsuario
          DataSetName = 'frxDBUsuarios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBUsuarios."USUARIO_CADASTRO"]')
          ParentFont = False
        end
      end
      object Titulo: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 147.401670000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 64.252010000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Usu'#225'rios - Sint'#233'tico ')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 188.976500000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 196.535560000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 408.189240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tipo')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cadastro')
          ParentFont = False
        end
      end
    end
  end
  object DataSetPesqUsuario: TfrxDBDataset
    UserName = 'frxDBUsuarios'
    CloseDataSource = False
    FieldAliases.Strings = (
      'USUARIO_ID=USUARIO_ID'
      'USUARIO_NOME=USUARIO_NOME'
      'USUARIO_TIPO=USUARIO_TIPO'
      'USUARIO_CADASTRO=USUARIO_CADASTRO')
    DataSet = query_pesquisa
    BCDToCurrency = False
    DataSetOptions = []
    Left = 677
    Top = 24
  end
  object RelatorioPesqCliente: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45043.712019097200000000
    ReportOptions.LastChange = 45044.361921655090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 549
    Top = 96
    Datasets = <
      item
        DataSet = DataSetPesqCliente
        DataSetName = 'frxDBClientes'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        DataSet = DataSetPesqCliente
        DataSetName = 'frxDBClientes'
        RowCount = 0
        object frxDBUsuariosUSUARIO_ID: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 7.559060000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataField = 'CLIENTE_EMAIL'
          DataSet = DataSetPesqCliente
          DataSetName = 'frxDBClientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBClientes."CLIENTE_EMAIL"]')
          ParentFont = False
        end
        object frxDBClientesCLIENTE_ID: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Top = 7.559060000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'CLIENTE_ID'
          DataSet = DataSetPesqCliente
          DataSetName = 'frxDBClientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBClientes."CLIENTE_ID"]')
          ParentFont = False
        end
        object frxDBClientesCLIENTE_TELEFONE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 109.606370000000000000
          Top = 7.559060000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'CLIENTE_TELEFONE'
          DataSet = DataSetPesqCliente
          DataSetName = 'frxDBClientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBClientes."CLIENTE_TELEFONE"]')
          ParentFont = False
        end
        object frxDBClientesCLIENTE_ENDERECO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 491.338900000000000000
          Top = 7.559060000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          DataField = 'CLIENTE_ENDERECO '
          DataSet = DataSetPesqCliente
          DataSetName = 'frxDBClientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBClientes."CLIENTE_ENDERECO "]')
          ParentFont = False
        end
      end
      object Titulo: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 147.401670000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 64.252010000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Clientes - Sint'#233'tico ')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 188.976500000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 7.559060000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Top = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Email')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 491.338900000000000000
          Top = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Endere'#231'o')
          ParentFont = False
        end
      end
    end
  end
  object DataSetPesqCliente: TfrxDBDataset
    UserName = 'frxDBClientes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CLIENTE_ID=CLIENTE_ID'
      'CLIENTE_NOME=CLIENTE_NOME'
      'CLIENTE_ENDERECO=CLIENTE_ENDERECO '
      'CLIENTE_NUMERO=CLIENTE_NUMERO'
      'CLIENTE_BAIRRO=CLIENTE_BAIRRO'
      'CLIENTE_CIDADE=CLIENTE_CIDADE'
      'CLIENTE_UF=CLIENTE_UF'
      'CLIENTE_TELEFONE=CLIENTE_TELEFONE'
      'CLIENTE_CPF=CLIENTE_CPF'
      'CLIENTE_EMAIL=CLIENTE_EMAIL'
      'CLIENTE_CADASTRO=CLIENTE_CADASTRO'
      'CLIENTE_CEP=CLIENTE_CEP')
    DataSet = query_pesquisa
    BCDToCurrency = False
    DataSetOptions = []
    Left = 677
    Top = 96
  end
  object RelatorioPesqFornecedor: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45043.712019097200000000
    ReportOptions.LastChange = 45133.721115000000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 165
    Top = 376
    Datasets = <
      item
        DataSet = DataSetPesqFornecedor
        DataSetName = 'frxDBFornecedores'
      end
      item
        DataSet = DataSetPesqProdutoFornecedor
        DataSetName = 'frxDBProdutosFornecedor'
      end
      item
        DataSet = DataSetPesqUsuario
        DataSetName = 'frxDBUsuarios'
      end>
    Variables = <
      item
        Name = ' Minhas Variaveis'
        Value = Null
      end
      item
        Name = 'vVariavel'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 196.535560000000000000
        Top = 143.622140000000000000
        Width = 718.110700000000000000
        DataSet = DataSetPesqFornecedor
        DataSetName = 'frxDBFornecedores'
        PrintIfDetailEmpty = True
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 52.913420000000000000
          Width = 680.315400000000000000
          Height = 124.724490000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object frxDBFornecedoresFORNECEDOR_ENDERECO: TfrxMemoView
          IndexTag = 1
          Align = baRight
          AllowVectorExport = True
          Left = 30.236240000000000000
          Top = 143.622140000000000000
          Width = 241.889920000000000000
          Height = 22.677180000000000000
          DataSet = DataSetPesqFornecedor
          DataSetName = 'frxDBFornecedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBFornecedores."FORNECEDOR_ENDERECO"],')
          ParentFont = False
        end
        object frxDBFornecedoresFORNECEDOR_BAIRRO: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 321.260050000000000000
          Top = 143.622140000000000000
          Width = 136.063080000000000000
          Height = 22.677180000000000000
          DataSet = DataSetPesqFornecedor
          DataSetName = 'frxDBFornecedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBFornecedores."FORNECEDOR_BAIRRO"],')
          ParentFont = False
        end
        object frxDBFornecedoresFORNECEDOR_NUMERO: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 272.126160000000000000
          Top = 143.622140000000000000
          Width = 49.133890000000000000
          Height = 22.677180000000000000
          DataSet = DataSetPesqFornecedor
          DataSetName = 'frxDBFornecedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' [frxDBFornecedores."FORNECEDOR_NUMERO"],')
          ParentFont = False
        end
        object frxDBFornecedoresFORNECEDOR_UF: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Left = 638.740570000000000000
          Top = 143.622140000000000000
          Width = 45.354360000000000000
          Height = 22.677180000000000000
          DataSet = DataSetPesqFornecedor
          DataSetName = 'frxDBFornecedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBFornecedores."FORNECEDOR_UF"].')
          ParentFont = False
        end
        object frxDBFornecedoresFORNECEDOR_CIDADE: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 544.252320000000000000
          Top = 143.622140000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          DataSet = DataSetPesqFornecedor
          DataSetName = 'frxDBFornecedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBFornecedores."FORNECEDOR_CIDADE"],')
          ParentFont = False
        end
        object frxDBFornecedoresFORNECEDOR_NOME: TfrxMemoView
          IndexTag = 1
          Align = baRight
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 71.811070000000000000
          Width = 238.110390000000000000
          Height = 22.677180000000000000
          DataField = 'FORNECEDOR_NOME'
          DataSet = DataSetPesqFornecedor
          DataSetName = 'frxDBFornecedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBFornecedores."FORNECEDOR_NOME"]')
          ParentFont = False
        end
        object frxDBFornecedoresFORNECEDOR_CNPJ: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 71.811070000000000000
          Width = 181.417440000000000000
          Height = 22.677180000000000000
          DataField = 'FORNECEDOR_CNPJ'
          DataSet = DataSetPesqFornecedor
          DataSetName = 'frxDBFornecedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBFornecedores."FORNECEDOR_CNPJ"]')
          ParentFont = False
        end
        object frxDBFornecedoresFORNECEDOR_CEP: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 457.323130000000000000
          Top = 143.622140000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          DataSet = DataSetPesqFornecedor
          DataSetName = 'frxDBFornecedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBFornecedores."FORNECEDOR_CEP"],')
          ParentFont = False
        end
        object frxDBFornecedoresFORNECEDOR_EMAIL: TfrxMemoView
          IndexTag = 1
          Align = baRight
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 98.267780000000000000
          Width = 691.653990000000000000
          Height = 18.897650000000000000
          DataField = 'FORNECEDOR_EMAIL'
          DataSet = DataSetPesqFornecedor
          DataSetName = 'frxDBFornecedores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBFornecedores."FORNECEDOR_EMAIL"]')
          ParentFont = False
        end
      end
      object Titulo: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 64.252010000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 7.559060000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Fornecedores')
          ParentFont = False
        end
        object Date: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 563.149970000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Time: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 642.520100000000000000
          Top = 45.354360000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object vVariavel: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 453.543600000000000000
          Top = 45.354360000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[vVariavel]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 427.086890000000000000
        Width = 718.110700000000000000
        DataSet = DataSetPesqProdutoFornecedor
        DataSetName = 'frxDBProdutosFornecedor'
        RowCount = 0
        object frxDBProdutosFornecedorPRODUTO_DESCRICAO: TfrxMemoView
          IndexTag = 1
          Align = baRight
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 3.779530000000000000
          Width = 457.323130000000000000
          Height = 22.677180000000000000
          DataField = 'PRODUTO_DESCRICAO'
          DataSet = DataSetPesqProdutoFornecedor
          DataSetName = 'frxDBProdutosFornecedor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[frxDBProdutosFornecedor."PRODUTO_DESCRICAO"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Left = 495.118430000000000000
          Top = 3.779530000000000000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          DataSet = DataSetPesqProdutoFornecedor
          DataSetName = 'frxDBProdutosFornecedor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[frxDBProdutosFornecedor."PRODUTO_ESTOQUE"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Left = 597.165740000000000000
          Top = 3.779530000000000000
          Width = 83.149660000000000000
          Height = 22.677180000000000000
          DataSet = DataSetPesqProdutoFornecedor
          DataSetName = 'frxDBProdutosFornecedor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[frxDBProdutosFornecedor."PRODUTO_UNIDADE"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 30.236240000000000000
          Width = 370.393940000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Produtos:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Width = 132.283550000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade:')
          ParentFont = False
        end
      end
    end
  end
  object DataSetPesqFornecedor: TfrxDBDataset
    UserName = 'frxDBFornecedores'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FORNECEDOR_ID=FORNECEDOR_ID'
      'FORNECEDOR_NOME=FORNECEDOR_NOME'
      'FORNECEDOR_ENDERECO=FORNECEDOR_ENDERECO'
      'FORNECEDOR_NUMERO=FORNECEDOR_NUMERO'
      'FORNECEDOR_BAIRRO=FORNECEDOR_BAIRRO'
      'FORNECEDOR_CIDADE=FORNECEDOR_CIDADE'
      'FORNECEDOR_UF=FORNECEDOR_UF'
      'FORNECEDOR_TELEFONE=FORNECEDOR_TELEFONE'
      'FORNECEDOR_CNPJ=FORNECEDOR_CNPJ'
      'FORNECEDOR_EMAIL=FORNECEDOR_EMAIL'
      'FORNECEDOR_CADASTRO=FORNECEDOR_CADASTRO'
      'FORNECEDOR_CEP=FORNECEDOR_CEP')
    DataSet = query_pesquisa
    BCDToCurrency = False
    DataSetOptions = []
    Left = 277
    Top = 352
  end
  object RelatorioPesqProduto: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45043.712019097200000000
    ReportOptions.LastChange = 45044.361587037030000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 549
    Top = 176
    Datasets = <
      item
        DataSet = DataSetPesqProduto
        DataSetName = 'frxDBProdutos'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        DataSet = DataSetPesqProduto
        DataSetName = 'frxDBProdutos'
        RowCount = 0
        object frxDBProdutosPPRODUTO_ID: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Top = 7.559060000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'PRODUTO_ID'
          DataSet = DataSetPesqProduto
          DataSetName = 'frxDBProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBProdutos."PRODUTO_ID"]')
          ParentFont = False
        end
        object frxDBProdutosFFORNECEDOR_NOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 75.590600000000000000
          Top = 7.559060000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DataField = 'FORNECEDOR_NOME'
          DataSet = DataSetPesqProduto
          DataSetName = 'frxDBProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBProdutos."FORNECEDOR_NOME"]')
          ParentFont = False
        end
        object frxDBProdutosPPRODUTO_DESCRICAO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 268.346630000000000000
          Top = 7.559060000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          DataField = 'PRODUTO_DESCRICAO'
          DataSet = DataSetPesqProduto
          DataSetName = 'frxDBProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBProdutos."PRODUTO_DESCRICAO"]')
          ParentFont = False
        end
        object frxDBProdutosPPRODUTO_VENDA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 480.000310000000000000
          Top = 7.559060000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataSet = DataSetPesqProduto
          DataSetName = 'frxDBProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            
              'R$ [frxDBProdutos."PRODUTO_VENDA"] / [frxDBProdutos."PRODUTO_UNI' +
              'DADE"]')
          ParentFont = False
          Formats = <
            item
              FormatStr = '%2.2f'
              Kind = fkNumeric
            end
            item
            end>
        end
        object frxDBProdutosPPRODUTO_ESTOQUE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 597.165740000000000000
          Top = 7.559060000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'PRODUTO_ESTOQUE'
          DataSet = DataSetPesqProduto
          DataSetName = 'frxDBProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBProdutos."PRODUTO_ESTOQUE"]')
          ParentFont = False
        end
      end
      object Titulo: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 147.401670000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 64.252010000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Produtos - Sint'#233'tico ')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 188.976500000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 7.559060000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590600000000000000
          Top = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Fornecedor')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 272.126160000000000000
          Top = 3.779530000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Descricao do Produto')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 480.000310000000000000
          Top = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Pre'#231'o')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165740000000000000
          Top = 7.559060000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Estoque')
          ParentFont = False
        end
      end
    end
  end
  object DataSetPesqProduto: TfrxDBDataset
    UserName = 'frxDBProdutos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'PRODUTO_ID=PRODUTO_ID'
      'FORNECEDOR_NOME=FORNECEDOR_NOME'
      'PRODUTO_DESCRICAO=PRODUTO_DESCRICAO'
      'PRODUTO_VENDA=PRODUTO_VENDA'
      'PRODUTO_ESTOQUE=PRODUTO_ESTOQUE'
      'PRODUTO_UNIDADE=PRODUTO_UNIDADE')
    DataSet = query_pesquisa
    BCDToCurrency = False
    DataSetOptions = []
    Left = 677
    Top = 176
  end
  object query_item: TFDQuery
    Connection = conexao
    Left = 264
    Top = 168
  end
  object ds_item: TDataSource
    DataSet = query_item
    Left = 264
    Top = 248
  end
  object query_produto: TFDQuery
    Connection = conexao
    Left = 40
    Top = 328
  end
  object RelatorioPesqCompra: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45061.689306388890000000
    ReportOptions.LastChange = 45065.685832349540000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 544
    Top = 264
    Datasets = <
      item
        DataSet = DataSetPesqCompra
        DataSetName = 'frxDBCompra'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 162.519790000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBCompra."COMPRA_ID"'
        KeepTogether = True
        object frxDBCompraUSUARIO_NOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 619.842920000000000000
          Top = 75.590600000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'USUARIO_NOME'
          DataSet = DataSetPesqCompra
          DataSetName = 'frxDBCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCompra."USUARIO_NOME"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 563.149970000000000000
          Top = 75.590600000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object frxDBCompraCOMPRA_CADASTRO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 75.590600000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          DataField = 'COMPRA_CADASTRO'
          DataSet = DataSetPesqCompra
          DataSetName = 'frxDBCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCompra."COMPRA_CADASTRO"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 136.063080000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Produto:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
          Top = 136.063080000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 495.118430000000000000
          Top = 136.063080000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor Total:')
          ParentFont = False
        end
        object frxDBCompraCOMPRA_ID: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 661.417750000000000000
          Top = 94.488250000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'COMPRA_ID'
          DataSet = DataSetPesqCompra
          DataSetName = 'frxDBCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCompra."COMPRA_ID"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo do Pedido:')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 434.645950000000000000
        Width = 718.110700000000000000
        DataSet = DataSetPesqCompra
        DataSetName = 'frxDBCompra'
        RowCount = 0
        object frxDBCompraPRODUTO_DESCRICAO: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          DataField = 'PRODUTO_DESCRICAO'
          DataSet = DataSetPesqCompra
          DataSetName = 'frxDBCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBCompra."PRODUTO_DESCRICAO"]')
          ParentFont = False
        end
        object frxDBCompraCOMPRA_PRODUTO_TOTAL_ITEM: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 495.118430000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          DataSet = DataSetPesqCompra
          DataSetName = 'frxDBCompra'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'R$ [frxDBCompra."COMPRA_PRODUTO_TOTAL_ITEM"]')
          ParentFont = False
        end
        object frxDBCompraCOMPRA_PRODUTO_QTDE: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 241.889920000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          DataField = 'COMPRA_PRODUTO_QTDE'
          DataSet = DataSetPesqCompra
          DataSetName = 'frxDBCompra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBCompra."COMPRA_PRODUTO_QTDE"]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -33
        Font.Name = 'Arial'
        Font.Style = []
        Height = 170.078850000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 170.078850000000000000
          Top = 56.692950000000000000
          Width = 370.393940000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -33
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Compras')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 105.826840000000000000
        Top = 514.016080000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 491.338900000000000000
          Top = 64.252010000000000000
          Width = 219.212740000000000000
          Height = 41.574830000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            
              'Total: [SUM(<frxDBCompra."COMPRA_PRODUTO_TOTAL_ITEM">,MasterData' +
              '1,2)]')
          ParentFont = False
        end
      end
    end
  end
  object DataSetPesqCompra: TfrxDBDataset
    UserName = 'frxDBCompra'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COMPRA_ID=COMPRA_ID'
      'PRODUTO_ID=PRODUTO_ID'
      'PRODUTO_DESCRICAO=PRODUTO_DESCRICAO'
      'USUARIO_NOME=USUARIO_NOME'
      'COMPRA_PRODUTO_QTDE=COMPRA_PRODUTO_QTDE'
      'COMPRA_PRODUTO_TOTAL_ITEM=COMPRA_PRODUTO_TOTAL_ITEM'
      'COMPRA_CADASTRO=COMPRA_CADASTRO')
    DataSet = query_produto
    BCDToCurrency = False
    DataSetOptions = []
    Left = 672
    Top = 264
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 536
    Top = 408
  end
  object RelatorioPesqVenda: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45061.689306388890000000
    ReportOptions.LastChange = 45065.633794907410000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 544
    Top = 336
    Datasets = <
      item
        DataSet = DataSetPesqVenda
        DataSetName = 'frxDBVenda'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 162.519790000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBVenda."VENDA_ID"'
        KeepTogether = True
        object frxDBCompraUSUARIO_NOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 619.842920000000000000
          Top = 75.590600000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'USUARIO_NOME'
          DataSet = DataSetPesqVenda
          DataSetName = 'frxDBVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBVenda."USUARIO_NOME"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 563.149970000000000000
          Top = 75.590600000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
        end
        object frxDBCompraCOMPRA_CADASTRO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 75.590600000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          DataSet = DataSetPesqVenda
          DataSetName = 'frxDBVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBVenda."VENDA_CADASTRO"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 136.063080000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Produto:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
          Top = 136.063080000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 495.118430000000000000
          Top = 136.063080000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor Total:')
          ParentFont = False
        end
        object frxDBCompraCOMPRA_ID: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 661.417750000000000000
          Top = 94.488250000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataSet = DataSetPesqVenda
          DataSetName = 'frxDBVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBVenda."VENDA_ID"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo do Pedido:')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 434.645950000000000000
        Width = 718.110700000000000000
        DataSet = DataSetPesqVenda
        DataSetName = 'frxDBVenda'
        RowCount = 0
        object frxDBCompraPRODUTO_DESCRICAO: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          DataField = 'PRODUTO_DESCRICAO'
          DataSet = DataSetPesqVenda
          DataSetName = 'frxDBVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBVenda."PRODUTO_DESCRICAO"]')
          ParentFont = False
        end
        object frxDBCompraCOMPRA_PRODUTO_TOTAL_ITEM: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 495.118430000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          DataField = 'VENDA_PRODUTO_TOTAL_ITEM'
          DataSet = DataSetPesqVenda
          DataSetName = 'frxDBVenda'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBVenda."VENDA_PRODUTO_TOTAL_ITEM"]')
          ParentFont = False
        end
        object frxDBCompraCOMPRA_PRODUTO_QTDE: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 241.889920000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          DataField = 'VENDA_PRODUTO_QTDE'
          DataSet = DataSetPesqVenda
          DataSetName = 'frxDBVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBVenda."VENDA_PRODUTO_QTDE"]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -33
        Font.Name = 'Arial'
        Font.Style = []
        Height = 170.078850000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 170.078850000000000000
          Top = 56.692950000000000000
          Width = 370.393940000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -33
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Vendas')
          ParentFont = False
        end
      end
    end
  end
  object DataSetPesqVenda: TfrxDBDataset
    UserName = 'frxDBVenda'
    CloseDataSource = False
    FieldAliases.Strings = (
      'VENDA_ID=VENDA_ID'
      'PRODUTO_ID=PRODUTO_ID'
      'PRODUTO_DESCRICAO=PRODUTO_DESCRICAO'
      'USUARIO_NOME=USUARIO_NOME'
      'VENDA_PRODUTO_QTDE=VENDA_PRODUTO_QTDE'
      'VENDA_PRODUTO_TOTAL_ITEM=VENDA_PRODUTO_TOTAL_ITEM'
      'VENDA_CADASTRO=VENDA_CADASTRO')
    DataSet = query_produto
    BCDToCurrency = False
    DataSetOptions = []
    Left = 680
    Top = 336
  end
  object DataSetPesqProdutoFornecedor: TfrxDBDataset
    UserName = 'frxDBProdutosFornecedor'
    CloseDataSource = False
    FieldAliases.Strings = (
      'PRODUTO_ID=PRODUTO_ID'
      'PRODUTO_DESCRICAO=PRODUTO_DESCRICAO'
      'ID_FORNECEDOR=ID_FORNECEDOR'
      'PRODUTO_CUSTO=PRODUTO_CUSTO'
      'PRODUTO_VENDA=PRODUTO_VENDA'
      'PRODUTO_ESTOQUE=PRODUTO_ESTOQUE'
      'PRODUTO_ESTOQUE_MIN=PRODUTO_ESTOQUE_MIN'
      'PRODUTO_UNIDADE=PRODUTO_UNIDADE'
      'PRODUTO_CADASTRO=PRODUTO_CADASTRO')
    BCDToCurrency = False
    DataSetOptions = []
    Left = 272
    Top = 408
  end
end
