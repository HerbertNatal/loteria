object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 377
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    796
    377)
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 485
    Top = 27
    Width = 40
    Height = 13
    Caption = 'Started:'
  end
  object Label6: TLabel
    Left = 485
    Top = 54
    Width = 46
    Height = 13
    Caption = 'Finished: '
  end
  object Label7: TLabel
    Left = 455
    Top = 81
    Width = 70
    Height = 13
    Caption = 'Ultimo NUmero'
  end
  object Label8: TLabel
    Left = 465
    Top = 108
    Width = 57
    Height = 13
    Caption = 'qtd jogados'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 358
    Width = 796
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 161
    Caption = 'Configura'#231#245'es do jogo'
    TabOrder = 1
    object Label1: TLabel
      Left = 19
      Top = 19
      Width = 92
      Height = 13
      Caption = 'Fechar qtd Acertos'
    end
    object Label2: TLabel
      Left = 19
      Top = 46
      Width = 79
      Height = 13
      Caption = 'Qtd Num a jogar'
    end
    object Label3: TLabel
      Left = 19
      Top = 73
      Width = 92
      Height = 13
      Caption = 'Total numeros jogo'
    end
    object Label4: TLabel
      Left = 19
      Top = 100
      Width = 88
      Height = 13
      Caption = 'Qtd Jogos a Fazer'
    end
    object edQtdAcertos: TEdit
      Left = 117
      Top = 16
      Width = 57
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      Text = '11'
    end
    object edQtdAJogar: TEdit
      Left = 117
      Top = 43
      Width = 57
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      Text = '15'
    end
    object edQtdNumTotal: TEdit
      Left = 117
      Top = 70
      Width = 57
      Height = 21
      NumbersOnly = True
      TabOrder = 2
      Text = '25'
    end
    object BitBtn1: TBitBtn
      Left = 84
      Top = 124
      Width = 90
      Height = 25
      Hint = 
        'Pega a quantidade de numeros totais e deixa aleat'#243'rio em um Arra' +
        'y'
      Caption = 'Bagun'#231'ar'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object edQtdJogos: TEdit
      Left = 117
      Top = 97
      Width = 57
      Height = 21
      NumbersOnly = True
      TabOrder = 4
      Text = '12'
    end
  end
  object Memo1: TMemo
    Left = 188
    Top = 24
    Width = 41
    Height = 137
    Lines.Strings = (
      'Memo'
      '1')
    TabOrder = 2
  end
  object btGame: TBitBtn
    Left = 259
    Top = 136
    Width = 90
    Height = 25
    Hint = 'Apostar'
    Caption = 'Apostar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btGameClick
  end
  object Button1: TButton
    Left = 259
    Top = 22
    Width = 75
    Height = 25
    Caption = 'teste sort'
    TabOrder = 4
    OnClick = Button1Click
  end
  object SMDBGrid1: TSMDBGrid
    Left = 8
    Top = 184
    Width = 635
    Height = 168
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsApostas
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnMouseUp = SMDBGrid1MouseUp
    Flat = False
    AutoLockInsEdit = True
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'Tahoma'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoBLOBEditor, eoTitleWordWrap, eoFilterAutoApply]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 2
    RowCount = 2
  end
  object gd1: TSMDBGrid
    Left = 658
    Top = 1
    Width = 123
    Height = 351
    Anchors = [akTop, akRight]
    DataSource = dsNumbers
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Flat = False
    AutoLockInsEdit = True
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'Tahoma'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoFilterAutoApply]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 3
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'number'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtd'
        Width = 39
        Visible = True
      end>
  end
  object edStart: TEdit
    Left = 531
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object edFinished: TEdit
    Left = 531
    Top = 51
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object edDtLastNumber: TEdit
    Left = 531
    Top = 78
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object edQtdJaJogado: TEdit
    Left = 531
    Top = 105
    Width = 121
    Height = 21
    TabOrder = 10
  end
  object BitBtn2: TBitBtn
    Left = 371
    Top = 136
    Width = 90
    Height = 25
    Hint = 'Apostar'
    Caption = 'Excel Right Now'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnMouseDown = BitBtn2MouseDown
  end
  object BitBtn3: TBitBtn
    Left = 259
    Top = 105
    Width = 90
    Height = 25
    Hint = 'Apostar'
    Caption = 'Stop'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = BitBtn3Click
    OnMouseDown = BitBtn3MouseDown
  end
  object vtApostas: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 280
    Top = 56
    Data = {03000000000000000000}
  end
  object dsApostas: TDataSource
    DataSet = vtApostas
    Left = 368
    Top = 56
  end
  object vtNumbers: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    IndexFieldNames = 'qtd'
    Left = 378
    Top = 16
    Data = {03000000000000000000}
    object vtNumbersnumber: TIntegerField
      FieldName = 'number'
    end
    object vtNumbersqtd: TIntegerField
      FieldName = 'qtd'
    end
  end
  object dsNumbers: TDataSource
    DataSet = vtNumbers
    Left = 422
    Top = 24
  end
  object alRightClick: TActionList
    Left = 560
    Top = 152
    object actExportToExcel: TAction
      Caption = '&Excel'
      Hint = 'Exportar para o Excel'
      ImageIndex = 47
      OnExecute = actExportToExcelExecute
      OnUpdate = actExportToExcelUpdate
    end
  end
  object pmRightClick: TPopupMenu
    Left = 492
    Top = 152
    object Excel1: TMenuItem
      Action = actExportToExcel
    end
  end
end
