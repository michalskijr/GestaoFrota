object FormCadModelo: TFormCadModelo
  Left = 353
  Top = 331
  Width = 464
  Height = 223
  Caption = 'Cadastro de Modelo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 449
    Height = 185
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = edtCod
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 30
      Height = 13
      Caption = 'Marca'
    end
    object Label3: TLabel
      Left = 96
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = edtNome
    end
    object Label4: TLabel
      Left = 8
      Top = 88
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
      FocusControl = edtObservacao
    end
    object Label5: TLabel
      Left = 176
      Top = 48
      Width = 92
      Height = 13
      Caption = 'Data de Transa'#231#227'o'
      FocusControl = edtDtTransacao
    end
    object edtCod: TDBEdit
      Left = 8
      Top = 24
      Width = 41
      Height = 21
      DataField = 'CD_MODELO'
      DataSource = DataSource
      Enabled = False
      TabOrder = 0
      OnExit = edtCodExit
    end
    object edtNome: TDBEdit
      Left = 96
      Top = 24
      Width = 345
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DS_MODELO'
      DataSource = DataSource
      TabOrder = 2
    end
    object edtObservacao: TDBEdit
      Left = 8
      Top = 104
      Width = 433
      Height = 21
      DataField = 'DS_OBSERVACAO'
      DataSource = DataSource
      TabOrder = 5
    end
    object edtDtTransacao: TDBEdit
      Left = 176
      Top = 62
      Width = 89
      Height = 21
      DataField = 'DT_TRANSACAO'
      DataSource = DataSource
      Enabled = False
      TabOrder = 4
    end
    object BitBtnConsulta: TBitBtn
      Left = 56
      Top = 24
      Width = 33
      Height = 21
      Caption = '...'
      TabOrder = 1
      OnClick = BitBtnConsultaClick
    end
    object DBMarca: TDBLookupComboBox
      Left = 8
      Top = 64
      Width = 161
      Height = 21
      DataField = 'CD_MARCA'
      DataSource = DataSource
      KeyField = 'CD_MARCA'
      ListField = 'NM_MARCA'
      ListSource = DataSourceMarca
      TabOrder = 3
    end
    object PanelBotoes: TPanel
      Left = 0
      Top = 144
      Width = 449
      Height = 41
      Color = clBtnHighlight
      TabOrder = 6
      object btnNovo: TBitBtn
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Novo'
        TabOrder = 0
        OnClick = btnNovoClick
      end
      object btnExcluir: TBitBtn
        Left = 188
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 1
        OnClick = btnExcluirClick
      end
      object btnGravar: TBitBtn
        Left = 278
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 2
        OnClick = btnGravarClick
      end
      object btnCancelar: TBitBtn
        Left = 368
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 3
        OnClick = btnCancelarClick
      end
    end
  end
  object DataSource: TDataSource
    DataSet = DM.CAD_MODELO
    Left = 296
    Top = 48
  end
  object DataSourceMarca: TDataSource
    DataSet = DM.IBQCAD_MARCA
    Left = 336
    Top = 48
  end
end
