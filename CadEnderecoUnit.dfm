object FormCadEndereco: TFormCadEndereco
  Left = 741
  Top = 214
  Width = 464
  Height = 223
  Caption = 'Cadastro de Endere'#231'o'
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
      Left = 376
      Top = 88
      Width = 60
      Height = 13
      Caption = 'C'#243'd. Pessoa'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 11
      Height = 13
      Caption = 'Nr'
      FocusControl = edtNumSeq
    end
    object Label3: TLabel
      Left = 48
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Logradouro'
      FocusControl = edtLogradouro
    end
    object Label4: TLabel
      Left = 8
      Top = 48
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
      FocusControl = edtNum
    end
    object Label5: TLabel
      Left = 88
      Top = 48
      Width = 27
      Height = 13
      Caption = 'Bairro'
      FocusControl = edtBairro
    end
    object Label6: TLabel
      Left = 240
      Top = 48
      Width = 21
      Height = 13
      Caption = 'CEP'
      FocusControl = edtCep
    end
    object Label7: TLabel
      Left = 352
      Top = 48
      Width = 88
      Height = 13
      Caption = 'Data de transa'#231#227'o'
      FocusControl = edtDtTransacao
    end
    object Label9: TLabel
      Left = 8
      Top = 88
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label8: TLabel
      Left = 200
      Top = 88
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object DBEdit1: TDBEdit
      Left = 376
      Top = 104
      Width = 65
      Height = 21
      DataField = 'CD_PESSOA'
      DataSource = DataSource
      Enabled = False
      TabOrder = 9
    end
    object edtNumSeq: TDBEdit
      Left = 8
      Top = 24
      Width = 33
      Height = 21
      DataField = 'NR_SEQ'
      DataSource = DataSource
      Enabled = False
      TabOrder = 0
    end
    object edtLogradouro: TDBEdit
      Left = 48
      Top = 24
      Width = 393
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DS_LOGRADOURO'
      DataSource = DataSource
      TabOrder = 1
    end
    object edtNum: TDBEdit
      Left = 8
      Top = 64
      Width = 73
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DS_NUMERO'
      DataSource = DataSource
      TabOrder = 2
    end
    object edtBairro: TDBEdit
      Left = 88
      Top = 64
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DS_BAIRRO'
      DataSource = DataSource
      TabOrder = 3
    end
    object edtCep: TDBEdit
      Left = 240
      Top = 64
      Width = 108
      Height = 21
      DataField = 'DS_CEP'
      DataSource = DataSource
      TabOrder = 4
    end
    object edtDtTransacao: TDBEdit
      Left = 352
      Top = 64
      Width = 89
      Height = 21
      DataField = 'DT_TRANSACAO'
      DataSource = DataSource
      Enabled = False
      TabOrder = 5
    end
    object dbEstado: TDBLookupComboBox
      Left = 8
      Top = 104
      Width = 185
      Height = 21
      KeyField = 'CD_UF'
      ListField = 'NM_UF'
      ListSource = DataSourceEstado
      TabOrder = 6
      OnClick = dbEstadoClick
    end
    object dbCidade: TDBLookupComboBox
      Left = 200
      Top = 104
      Width = 169
      Height = 21
      DataField = 'CD_CIDADE'
      DataSource = DataSource
      KeyField = 'CD_CIDADE'
      ListField = 'NM_CIDADE'
      ListSource = DataSourceCidade
      TabOrder = 7
    end
    object PanelBotoes: TPanel
      Left = 280
      Top = 136
      Width = 169
      Height = 41
      Color = clBtnHighlight
      TabOrder = 8
      object btnGravar: TBitBtn
        Left = 6
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 0
        OnClick = btnGravarClick
      end
      object btnCancelar: TBitBtn
        Left = 88
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 1
      end
    end
  end
  object DataSource: TDataSource
    DataSet = DM.CAD_ENDERECO
    Left = 120
  end
  object DataSourceEstado: TDataSource
    DataSet = IBQESTADO
    Left = 152
  end
  object IBQESTADO: TIBQuery
    Database = DM.Conection
    Transaction = DM.Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select uf.cd_uf, uf.nm_uf'
      'from cad_uf uf'
      'where uf.cd_uf in (select cidade.cd_uf'
      '                    from cad_cidade cidade)')
    Left = 184
    object IBQESTADOCD_UF: TIntegerField
      FieldName = 'CD_UF'
      Origin = 'CAD_UF.CD_UF'
      Required = True
    end
    object IBQESTADONM_UF: TIBStringField
      FieldName = 'NM_UF'
      Origin = 'CAD_UF.NM_UF'
      Size = 50
    end
  end
  object DataSourceCidade: TDataSource
    DataSet = IBQCIDADE
    Left = 216
  end
  object IBQCIDADE: TIBQuery
    Database = DM.Conection
    Transaction = DM.Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_CIDADE where CD_UF = :PCDUF')
    Left = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PCDUF'
        ParamType = ptUnknown
      end>
    object IBQCIDADECD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CAD_CIDADE.CD_CIDADE'
      Required = True
    end
    object IBQCIDADENM_CIDADE: TIBStringField
      FieldName = 'NM_CIDADE'
      Origin = 'CAD_CIDADE.NM_CIDADE'
      Size = 50
    end
    object IBQCIDADEDT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_CIDADE.DT_TRANSACAO'
    end
    object IBQCIDADECD_UF: TIntegerField
      FieldName = 'CD_UF'
      Origin = 'CAD_CIDADE.CD_UF'
    end
  end
end
