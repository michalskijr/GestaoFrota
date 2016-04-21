object FormCadVeiculo: TFormCadVeiculo
  Left = 223
  Top = 222
  Width = 464
  Height = 389
  Caption = 'Cadastro de Ve'#237'culo'
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
    Height = 353
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
      Top = 128
      Width = 59
      Height = 13
      Caption = 'Combust'#237'vel'
    end
    object Label3: TLabel
      Left = 8
      Top = 168
      Width = 33
      Height = 13
      Caption = 'Cidade'
      FocusControl = edtCodCidade
    end
    object Label4: TLabel
      Left = 312
      Top = 128
      Width = 16
      Height = 13
      Caption = 'Cor'
    end
    object Label5: TLabel
      Left = 160
      Top = 128
      Width = 75
      Height = 13
      Caption = 'Tipo do ve'#237'culo'
    end
    object Label6: TLabel
      Left = 232
      Top = 48
      Width = 35
      Height = 13
      Caption = 'Modelo'
    end
    object Label7: TLabel
      Left = 8
      Top = 88
      Width = 27
      Height = 13
      Caption = 'Placa'
    end
    object Label8: TLabel
      Left = 200
      Top = 88
      Width = 31
      Height = 13
      Caption = 'Chassi'
      FocusControl = edtChassi
    end
    object Label9: TLabel
      Left = 72
      Top = 88
      Width = 46
      Height = 13
      Caption = 'Renavam'
      FocusControl = edtRenavam
    end
    object Label10: TLabel
      Left = 96
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = edtNome
    end
    object Label11: TLabel
      Left = 184
      Top = 208
      Width = 39
      Height = 13
      Caption = 'Nr Eixos'
      FocusControl = edtEixos
    end
    object Label12: TLabel
      Left = 8
      Top = 208
      Width = 75
      Height = 13
      Caption = 'Ano Fabrica'#231#227'o'
      FocusControl = edtAnoFabricacao
    end
    object Label13: TLabel
      Left = 96
      Top = 208
      Width = 57
      Height = 13
      Caption = 'Ano Modelo'
      FocusControl = edtAnoModelo
    end
    object Label14: TLabel
      Left = 328
      Top = 208
      Width = 46
      Height = 13
      Caption = 'Od'#244'metro'
      FocusControl = edtOdometro
    end
    object Label15: TLabel
      Left = 232
      Top = 208
      Width = 47
      Height = 13
      Caption = 'Hor'#237'metro'
      FocusControl = edtHorimetro
    end
    object Label16: TLabel
      Left = 8
      Top = 248
      Width = 88
      Height = 13
      Caption = 'Data de transa'#231#227'o'
      FocusControl = edtDtTransacao
    end
    object Label17: TLabel
      Left = 8
      Top = 48
      Width = 30
      Height = 13
      Caption = 'Marca'
    end
    object Label18: TLabel
      Left = 144
      Top = 248
      Width = 45
      Height = 13
      Caption = 'Placa BD'
      Visible = False
    end
    object edtCod: TDBEdit
      Left = 8
      Top = 24
      Width = 41
      Height = 21
      DataField = 'CD_VEICULO'
      DataSource = DataSource
      Enabled = False
      TabOrder = 0
      OnExit = edtCodExit
    end
    object edtCodCidade: TDBEdit
      Left = 8
      Top = 184
      Width = 41
      Height = 21
      DataField = 'CD_CIDADE_PLACA'
      DataSource = DataSource
      TabOrder = 11
      OnExit = edtCodCidadeExit
    end
    object edtChassi: TDBEdit
      Left = 200
      Top = 104
      Width = 241
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NR_CHASSI'
      DataSource = DataSource
      TabOrder = 7
    end
    object edtRenavam: TDBEdit
      Left = 72
      Top = 104
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NR_RENAVAM'
      DataSource = DataSource
      TabOrder = 6
    end
    object edtNome: TDBEdit
      Left = 96
      Top = 24
      Width = 345
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DS_VEICULO'
      DataSource = DataSource
      TabOrder = 2
    end
    object edtEixos: TDBEdit
      Left = 184
      Top = 224
      Width = 41
      Height = 21
      DataField = 'NR_EIXOS'
      DataSource = DataSource
      TabOrder = 15
    end
    object edtAnoFabricacao: TDBEdit
      Left = 8
      Top = 224
      Width = 81
      Height = 21
      DataField = 'DS_ANO_FABRICACAO'
      DataSource = DataSource
      TabOrder = 13
    end
    object edtAnoModelo: TDBEdit
      Left = 96
      Top = 224
      Width = 81
      Height = 21
      DataField = 'DS_ANO_MODELO'
      DataSource = DataSource
      TabOrder = 14
    end
    object edtOdometro: TDBEdit
      Left = 328
      Top = 224
      Width = 113
      Height = 21
      DataField = 'VL_ODOMETRO'
      DataSource = DataSource
      TabOrder = 17
    end
    object edtHorimetro: TDBEdit
      Left = 232
      Top = 224
      Width = 89
      Height = 21
      DataField = 'VL_HORIMETRO'
      DataSource = DataSource
      TabOrder = 16
    end
    object edtDtTransacao: TDBEdit
      Left = 8
      Top = 264
      Width = 89
      Height = 21
      DataField = 'DT_TRANSACAO'
      DataSource = DataSource
      Enabled = False
      TabOrder = 18
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
      Width = 210
      Height = 21
      KeyField = 'CD_MARCA'
      ListField = 'NM_MARCA'
      ListSource = DataSourceMarca
      TabOrder = 3
      OnClick = DBMarcaClick
    end
    object DBModelo: TDBLookupComboBox
      Left = 232
      Top = 64
      Width = 210
      Height = 21
      DataField = 'CD_MODELO'
      DataSource = DataSource
      KeyField = 'CD_MODELO'
      ListField = 'DS_MODELO'
      ListSource = DataSourceModelo
      TabOrder = 4
    end
    object edtMaskPlaca: TMaskEdit
      Left = 8
      Top = 104
      Width = 57
      Height = 21
      EditMask = '>aaa-0000;1;_'
      MaxLength = 8
      TabOrder = 5
      Text = '   -    '
      OnExit = edtMaskPlacaExit
    end
    object edtPlaca: TDBEdit
      Left = 144
      Top = 264
      Width = 49
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DS_PLACA'
      DataSource = DataSource
      Enabled = False
      TabOrder = 20
    end
    object DBCombustivel: TDBLookupComboBox
      Left = 8
      Top = 144
      Width = 145
      Height = 21
      DataField = 'CD_COMBUSTIVEL'
      DataSource = DataSource
      KeyField = 'CD_COMBUSTIVEL'
      ListField = 'NM_COMBUSTIVEL'
      ListSource = DataSourceCombustivel
      TabOrder = 8
    end
    object DBTipoVeiculo: TDBLookupComboBox
      Left = 160
      Top = 144
      Width = 145
      Height = 21
      DataField = 'CD_TIPO_VEICULO'
      DataSource = DataSource
      KeyField = 'CD_TIPO_VEICULO'
      ListField = 'NM_TIPO_VEICULO'
      ListSource = DataSourceTipoVeiculo
      TabOrder = 9
    end
    object DBCor: TDBLookupComboBox
      Left = 312
      Top = 144
      Width = 129
      Height = 21
      DataField = 'CD_COR'
      DataSource = DataSource
      KeyField = 'CD_COR'
      ListField = 'DS_COR'
      ListSource = DataSourceCor
      TabOrder = 10
    end
    object BitBtnCidade: TBitBtn
      Left = 56
      Top = 184
      Width = 33
      Height = 21
      Caption = '...'
      TabOrder = 12
      OnClick = BitBtnCidadeClick
    end
    object PanelBotoes: TPanel
      Left = 0
      Top = 304
      Width = 449
      Height = 41
      Color = clBtnHighlight
      TabOrder = 19
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
    object edtNomeCidade: TDBEdit
      Left = 96
      Top = 184
      Width = 345
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 21
    end
  end
  object DataSource: TDataSource
    DataSet = DM.CAD_VEICULO
    Left = 104
    Top = 256
  end
  object DataSourceMarca: TDataSource
    DataSet = DM.IBQCAD_MARCA
    Left = 200
    Top = 256
  end
  object DataSourceCombustivel: TDataSource
    DataSet = DM.IBQCAD_COMBUSTIVEL
    Left = 232
    Top = 256
  end
  object DataSourceTipoVeiculo: TDataSource
    DataSet = DM.IBQCAD_TIPO_VEICULO
    Left = 264
    Top = 256
  end
  object DataSourceCor: TDataSource
    DataSet = DM.IBQCAD_COR
    Left = 296
    Top = 256
  end
  object IBQMODELO: TIBQuery
    Database = DM.Conection
    Transaction = DM.Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_MODELO where CD_MARCA = :PCDMARCA')
    Left = 328
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PCDMARCA'
        ParamType = ptUnknown
      end>
    object IBQMODELOCD_MODELO: TIntegerField
      FieldName = 'CD_MODELO'
      Origin = 'CAD_MODELO.CD_MODELO'
      Required = True
    end
    object IBQMODELOCD_MARCA: TIntegerField
      FieldName = 'CD_MARCA'
      Origin = 'CAD_MODELO.CD_MARCA'
      Required = True
    end
    object IBQMODELODS_MODELO: TIBStringField
      FieldName = 'DS_MODELO'
      Origin = 'CAD_MODELO.DS_MODELO'
      Required = True
      Size = 50
    end
    object IBQMODELODS_OBSERVACAO: TIBStringField
      FieldName = 'DS_OBSERVACAO'
      Origin = 'CAD_MODELO.DS_OBSERVACAO'
      Size = 200
    end
    object IBQMODELODT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_MODELO.DT_TRANSACAO'
      Required = True
    end
  end
  object DataSourceModelo: TDataSource
    DataSet = IBQMODELO
    Left = 360
    Top = 256
  end
end
