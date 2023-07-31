object formPedidos: TformPedidos
  Left = 647
  Top = 179
  Width = 698
  Height = 692
  Caption = 'Teste Programador - Microdata'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgControl: TPageControl
    Left = 0
    Top = 0
    Width = 690
    Height = 665
    ActivePage = tbEdicao
    Align = alClient
    TabOrder = 0
    OnChange = pgControlChange
    object tbPesquisa: TTabSheet
      Caption = 'Pesquisa'
      object Splitter1: TSplitter
        Left = 0
        Top = 298
        Width = 682
        Height = 8
        Cursor = crVSplit
        Align = alTop
      end
      object grdPesquisaItem: TDBGrid
        Left = 0
        Top = 347
        Width = 682
        Height = 290
        Align = alClient
        DataSource = dsItens
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PEDIDOID'
            Title.Caption = 'Pedido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRODUTOID'
            Title.Caption = 'Produto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkpDescricaoProduto'
            Title.Caption = 'Descri'#231#227'o'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Caption = 'Quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VRUNITARIO'
            Title.Caption = 'Unit'#225'rio'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCONTOITEM'
            Title.Caption = 'Desconto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VRTOTALITEM'
            Title.Caption = 'Total'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACAO'
            Title.Caption = 'Observa'#231#227'o'
            Visible = True
          end>
      end
      object grdPesquisaPedido: TDBGrid
        Left = 0
        Top = 41
        Width = 682
        Height = 257
        Align = alTop
        DataSource = dsPedidos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = grdPesquisaPedidoDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = 'Pedido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE'
            Title.Caption = 'Cliente'
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VRTOTALPEDIDO'
            Title.Caption = 'Total'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAPEDIDO'
            Title.Caption = 'Data Pedido'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATADIGITACAO'
            Title.Caption = 'Data Digita'#231#227'o'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACAO'
            Title.Caption = 'Observa'#231#227'o'
            Visible = True
          end>
      end
      object pnlPesquisaItens: TPanel
        Left = 0
        Top = 306
        Width = 682
        Height = 41
        Align = alTop
        TabOrder = 2
        object Label1: TLabel
          Left = 16
          Top = 16
          Width = 54
          Height = 13
          Caption = 'PRODUTO'
        end
        object edtFiltraItenPedido: TEdit
          Left = 80
          Top = 12
          Width = 121
          Height = 21
          TabOrder = 0
          OnKeyDown = edtFiltraItenPedidoKeyDown
        end
      end
      object pnlPesquisaPedido: TPanel
        Left = 0
        Top = 0
        Width = 682
        Height = 41
        Align = alTop
        TabOrder = 3
        object Label2: TLabel
          Left = 16
          Top = 16
          Width = 41
          Height = 13
          Caption = 'PEDIDO'
        end
        object edtFiltraPedido: TEdit
          Left = 80
          Top = 12
          Width = 121
          Height = 21
          TabOrder = 0
          OnKeyDown = edtFiltraPedidoKeyDown
        end
        object btIncluirPedido: TButton
          Left = 232
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Incluir Pedido'
          TabOrder = 1
          OnClick = btIncluirPedidoClick
        end
        object btExcluirPedido: TButton
          Left = 424
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Excluir Pedido'
          Enabled = False
          TabOrder = 3
          OnClick = btExcluirPedidoClick
        end
        object btEditarPedido: TButton
          Left = 328
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Editar Pedido'
          Enabled = False
          TabOrder = 2
          OnClick = btEditarPedidoClick
        end
      end
    end
    object tbEdicao: TTabSheet
      Caption = 'Edi'#231#227'o'
      ImageIndex = 1
      object Splitter2: TSplitter
        Left = 0
        Top = 298
        Width = 682
        Height = 9
        Cursor = crVSplit
        Align = alTop
      end
      object pnlTopPesquisa: TPanel
        Left = 0
        Top = 0
        Width = 682
        Height = 41
        Align = alTop
        TabOrder = 0
        object btGravarPedido: TButton
          Left = 176
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Gravar'
          Enabled = False
          TabOrder = 2
          OnClick = btGravarPedidoClick
        end
        object btCancelarEdicao: TButton
          Left = 256
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Cancelar'
          Enabled = False
          TabOrder = 3
          OnClick = btCancelarEdicaoClick
        end
        object btIncluirPedidoED: TButton
          Left = 16
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Incluir Pedido'
          TabOrder = 0
          OnClick = btIncluirPedidoClick
        end
        object btExcluirPedidoED: TButton
          Left = 96
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Excluir Pedido'
          Enabled = False
          TabOrder = 1
          OnClick = btExcluirPedidoClick
        end
        object btEnviarAoBanco: TButton
          Left = 584
          Top = 8
          Width = 89
          Height = 25
          Caption = '&Enviar ao banco'
          TabOrder = 4
          OnClick = btEnviarAoBancoClick
        end
      end
      object grdEditPedido: TDBGrid
        Left = 0
        Top = 41
        Width = 682
        Height = 257
        Align = alTop
        DataSource = dsPedidos
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            ReadOnly = True
            Title.Caption = 'Pedido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE'
            Title.Caption = 'Cliente'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VRTOTALPEDIDO'
            ReadOnly = True
            Title.Caption = 'Total'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAPEDIDO'
            ReadOnly = True
            Title.Caption = 'Data Pedido'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATADIGITACAO'
            ReadOnly = True
            Title.Caption = 'Data Digita'#231#227'o'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACAO'
            Title.Caption = 'Observa'#231#227'o'
            Visible = True
          end>
      end
      object pnlMidlePesquisa: TPanel
        Left = 0
        Top = 307
        Width = 682
        Height = 41
        Align = alTop
        TabOrder = 2
        object btExcluirItem: TButton
          Left = 592
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Excluir Item'
          TabOrder = 0
          OnClick = btExcluirItemClick
        end
      end
      object grdEditaItem: TDBGrid
        Left = 0
        Top = 348
        Width = 682
        Height = 289
        Align = alClient
        DataSource = dsItens
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnExit = grdEditaItemExit
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            ReadOnly = True
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PEDIDOID'
            ReadOnly = True
            Title.Caption = 'Pedido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRODUTOID'
            ReadOnly = True
            Title.Caption = 'Item'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkpDescricaoProduto'
            Title.Caption = 'Descri'#231#227'o'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Caption = 'Quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VRUNITARIO'
            Title.Caption = 'Unit'#225'rio'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCONTOITEM'
            Title.Caption = 'Desconto'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VRTOTALITEM'
            ReadOnly = True
            Title.Caption = 'Total'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACAO'
            Title.Caption = 'Observa'#231#227'o'
            Visible = True
          end>
      end
    end
  end
  object appEvents: TApplicationEvents
    OnException = appEventsException
    Left = 624
    Top = 112
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    OnStateChange = dsItensStateChange
    Left = 364
    Top = 152
  end
  object dsPedidos: TDataSource
    DataSet = cdsPedidos
    OnStateChange = dsPedidosStateChange
    Left = 367
    Top = 112
  end
  object cdsPedidos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    CommandText = 'SELECT * FROM TBPEDIDO ORDER BY ID'
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspPedidos'
    AfterInsert = cdsPedidosAfterInsert
    BeforePost = cdsPedidosBeforePost
    BeforeDelete = cdsPedidosBeforeDelete
    AfterScroll = cdsPedidosAfterScroll
    Left = 412
    Top = 112
    object cdsPedidosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPedidosCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Required = True
      Size = 60
    end
    object cdsPedidosVRTOTALPEDIDO: TFMTBCDField
      FieldName = 'VRTOTALPEDIDO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsPedidosDATAPEDIDO: TSQLTimeStampField
      FieldName = 'DATAPEDIDO'
      Required = True
    end
    object cdsPedidosDATADIGITACAO: TSQLTimeStampField
      FieldName = 'DATADIGITACAO'
      Required = True
    end
    object cdsPedidosOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object cdsPedidoscalcMaxIDPed: TAggregateField
      FieldName = 'calcMaxIDPed'
      Active = True
      Expression = 'MAX(ID)'
    end
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    CommandText = 'SELECT * FROM TBPEDIDOITEM ORDER BY ID'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PEDIDOID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRODUTOID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'QUANTIDADE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'VRUNITARIO'
        Attributes = [faRequired]
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'DESCONTOITEM'
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'VRTOTALITEM'
        Attributes = [faRequired]
        DataType = ftFMTBcd
        Precision = 15
        Size = 2
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <
      item
        Name = 'cdsItensIndex1'
        Fields = 'PEDIDOID;PRODUTOID'
        Options = [ixUnique]
      end
      item
        Name = 'cdsItensIndex2'
        Fields = 'ID'
        Options = [ixPrimary]
      end>
    IndexName = 'cdsItensIndex1'
    Params = <>
    ProviderName = 'dspItens'
    StoreDefs = True
    BeforeInsert = cdsItensBeforeInsert
    AfterInsert = cdsItensAfterInsert
    BeforePost = cdsItensBeforePost
    AfterPost = cdsItensAfterPost
    BeforeDelete = cdsItensBeforeDelete
    AfterDelete = cdsItensAfterDelete
    AfterScroll = cdsItensAfterScroll
    Left = 412
    Top = 152
    object cdsItensID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsItensPEDIDOID: TIntegerField
      FieldName = 'PEDIDOID'
      Required = True
    end
    object cdsItensPRODUTOID: TIntegerField
      FieldName = 'PRODUTOID'
      Required = True
    end
    object cdsItenslkpDescricaoProduto: TStringField
      DisplayLabel = 'DESCRICAO'
      FieldKind = fkLookup
      FieldName = 'lkpDescricaoProduto'
      LookupDataSet = cdsProdutos
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTOID'
      Size = 100
      Lookup = True
    end
    object cdsItensQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object cdsItensVRUNITARIO: TFMTBCDField
      FieldName = 'VRUNITARIO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsItensDESCONTOITEM: TFMTBCDField
      FieldName = 'DESCONTOITEM'
      Precision = 15
      Size = 2
    end
    object cdsItensVRTOTALITEM: TFMTBCDField
      FieldName = 'VRTOTALITEM'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsItensOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object cdsItenscalcMaxIDItem: TAggregateField
      FieldName = 'calcMaxIDItem'
      Active = True
      Expression = 'MAX(ID)'
    end
    object cdsItenscalcValorTotalItens: TAggregateField
      FieldName = 'calcValorTotalItens'
      Active = True
      Expression = 'SUM(VRTOTALITEM)'
    end
  end
  object dspPedidos: TDataSetProvider
    DataSet = sqlPedidos
    Options = [poAllowCommandText]
    Left = 460
    Top = 112
  end
  object dspItens: TDataSetProvider
    DataSet = sqlItens
    Options = [poAllowCommandText]
    Left = 460
    Top = 152
  end
  object SQLConnection: TSQLConnection
    ConnectionName = 'IBConnection'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=c:\dados\Microdata.gdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Connected = True
    Left = 572
    Top = 112
  end
  object sqlPedidos: TSQLDataSet
    CommandText = 'SELECT * FROM TBPEDIDO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 516
    Top = 112
  end
  object sqlItens: TSQLDataSet
    CommandText = 'SELECT * FROM TBPEDIDOITEM'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 516
    Top = 152
  end
  object sqlProdutos: TSQLDataSet
    CommandText = 'SELECT * FROM TBPRODUTO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 512
    Top = 192
  end
  object dsProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 364
    Top = 192
  end
  object cdsProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'SELECT * FROM TBPRODUTO'
    Params = <>
    ProviderName = 'dspProdutos'
    Left = 412
    Top = 192
    object cdsProdutosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 100
    end
  end
  object dspProdutos: TDataSetProvider
    DataSet = sqlProdutos
    Options = [poAllowCommandText]
    Left = 460
    Top = 192
  end
end
