object FormCadEstado: TFormCadEstado
  Left = 201
  Top = 124
  Width = 463
  Height = 223
  Caption = 'Cadastro de Estado'
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
  object PanelCadastro: TPanel
    Left = 0
    Top = 0
    Width = 449
    Height = 185
    TabOrder = 0
    object Label5: TLabel
      Left = 8
      Top = 50
      Width = 22
      Height = 13
      Caption = 'Pa'#237's'
    end
    object Label2: TLabel
      Left = 392
      Top = 8
      Width = 23
      Height = 13
      Caption = 'Sigla'
      FocusControl = edtSigla
    end
    object Label3: TLabel
      Left = 90
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = edtNomeEstado
    end
    object Label4: TLabel
      Left = 8
      Top = 96
      Width = 88
      Height = 13
      Caption = 'Data de transa'#231#227'o'
      FocusControl = edtData
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Panel1: TPanel
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
    object DBComboBoxPais: TDBLookupComboBox
      Left = 8
      Top = 68
      Width = 145
      Height = 21
      DataField = 'CD_PAIS'
      DataSource = DataSource
      KeyField = 'CD_PAIS'
      ListField = 'NM_PAIS'
      ListSource = DTConsultaPais
      TabOrder = 4
    end
    object edtCod: TDBEdit
      Left = 8
      Top = 26
      Width = 41
      Height = 21
      DataField = 'CD_UF'
      DataSource = DataSource
      Enabled = False
      TabOrder = 0
      OnExit = edtCodExit
    end
    object edtSigla: TDBEdit
      Left = 392
      Top = 26
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'SG_UF'
      DataSource = DataSource
      TabOrder = 3
    end
    object edtNomeEstado: TDBEdit
      Left = 90
      Top = 26
      Width = 297
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NM_UF'
      DataSource = DataSource
      TabOrder = 2
    end
    object edtData: TDBEdit
      Left = 8
      Top = 112
      Width = 89
      Height = 21
      DataField = 'DT_TRANSACAO'
      DataSource = DataSource
      Enabled = False
      TabOrder = 5
    end
    object BitBtnConsulta: TBitBtn
      Left = 52
      Top = 26
      Width = 33
      Height = 21
      Caption = '...'
      TabOrder = 1
      OnClick = BitBtnConsultaClick
    end
  end
  object DataSource: TDataSource
    DataSet = DM.CAD_UF
    Left = 136
    Top = 104
  end
  object DTConsultaPais: TDataSource
    DataSet = DM.IBQCAD_PAIS
    Left = 177
    Top = 104
  end
end
