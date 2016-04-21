object FormCadCidade: TFormCadCidade
  Left = 902
  Top = 120
  Width = 464
  Height = 223
  Caption = 'Cadastro de Cidade'
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
      Left = 96
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = edtNome
    end
    object Label3: TLabel
      Left = 8
      Top = 88
      Width = 92
      Height = 13
      Caption = 'Data de Transa'#231#227'o'
      FocusControl = edtDtTransacao
    end
    object Label4: TLabel
      Left = 160
      Top = 48
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label5: TLabel
      Left = 8
      Top = 48
      Width = 22
      Height = 13
      Caption = 'Pa'#237's'
    end
    object edtCod: TDBEdit
      Left = 8
      Top = 24
      Width = 41
      Height = 21
      DataField = 'CD_CIDADE'
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
      DataField = 'NM_CIDADE'
      DataSource = DataSource
      TabOrder = 2
    end
    object edtDtTransacao: TDBEdit
      Left = 8
      Top = 104
      Width = 89
      Height = 21
      DataField = 'DT_TRANSACAO'
      DataSource = DataSource
      Enabled = False
      TabOrder = 5
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
    object DBPais: TDBLookupComboBox
      Left = 8
      Top = 64
      Width = 145
      Height = 21
      KeyField = 'CD_PAIS'
      ListField = 'NM_PAIS'
      ListSource = DataSourcePais
      TabOrder = 3
      OnClick = DBPaisClick
    end
    object DBEstado: TDBLookupComboBox
      Left = 160
      Top = 64
      Width = 177
      Height = 21
      DataField = 'CD_UF'
      DataSource = DataSource
      KeyField = 'CD_UF'
      ListField = 'NM_UF'
      ListSource = DataSourceEstado
      TabOrder = 4
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
    DataSet = DM.CAD_CIDADE
    Left = 152
    Top = 96
  end
  object DataSourcePais: TDataSource
    DataSet = DM.IBQCAD_PAIS
    Left = 216
    Top = 96
  end
  object DataSourceEstado: TDataSource
    DataSet = IBQESTADO
    Left = 296
    Top = 96
  end
  object IBQESTADO: TIBQuery
    Database = DM.Conection
    Transaction = DM.Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_UF where CD_PAIS = :PCDPAIS')
    Left = 344
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PCDPAIS'
        ParamType = ptUnknown
      end>
    object IBQESTADOCD_UF: TIntegerField
      FieldName = 'CD_UF'
      Origin = 'CAD_UF.CD_UF'
      Required = True
    end
    object IBQESTADOSG_UF: TIBStringField
      FieldName = 'SG_UF'
      Origin = 'CAD_UF.SG_UF'
      FixedChar = True
      Size = 2
    end
    object IBQESTADONM_UF: TIBStringField
      FieldName = 'NM_UF'
      Origin = 'CAD_UF.NM_UF'
      Size = 50
    end
    object IBQESTADODT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_UF.DT_TRANSACAO'
    end
    object IBQESTADOCD_PAIS: TIntegerField
      FieldName = 'CD_PAIS'
      Origin = 'CAD_UF.CD_PAIS'
    end
  end
end
