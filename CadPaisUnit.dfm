object FormCadPais: TFormCadPais
  Left = 98
  Top = 138
  Width = 463
  Height = 223
  Caption = 'Cadastro de Pa'#237's'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PCadastro: TPanel
    Left = 0
    Top = 0
    Width = 449
    Height = 185
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = edtCod
    end
    object Label2: TLabel
      Left = 104
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = edtNomePais
    end
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 88
      Height = 13
      Caption = 'Data de transa'#231#227'o'
      FocusControl = edtDtTransacao
    end
    object PBotoes: TPanel
      Left = 8
      Top = 136
      Width = 433
      Height = 41
      TabOrder = 4
      object btnNovo: TBitBtn
        Left = 8
        Top = 8
        Width = 75
        Height = 21
        Caption = 'Novo'
        TabOrder = 0
        OnClick = btnNovoClick
      end
      object btnExcluir: TBitBtn
        Left = 148
        Top = 8
        Width = 75
        Height = 21
        Caption = 'Excluir'
        TabOrder = 1
        OnClick = btnExcluirClick
      end
      object btnGravar: TBitBtn
        Left = 242
        Top = 8
        Width = 75
        Height = 21
        Caption = 'Gravar'
        TabOrder = 2
        OnClick = btnGravarClick
      end
      object btnCancelar: TBitBtn
        Left = 336
        Top = 8
        Width = 75
        Height = 21
        Caption = 'Cancelar'
        TabOrder = 3
        OnClick = btnCancelarClick
      end
    end
    object edtCod: TDBEdit
      Left = 16
      Top = 24
      Width = 41
      Height = 21
      DataField = 'CD_PAIS'
      DataSource = DataSource
      Enabled = False
      TabOrder = 0
      OnExit = edtCodExit
    end
    object edtNomePais: TDBEdit
      Left = 104
      Top = 24
      Width = 337
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NM_PAIS'
      DataSource = DataSource
      TabOrder = 2
    end
    object edtDtTransacao: TDBEdit
      Left = 16
      Top = 72
      Width = 81
      Height = 21
      DataField = 'DT_TRANSACAO'
      DataSource = DataSource
      Enabled = False
      TabOrder = 3
    end
    object BitBtnConsulta: TBitBtn
      Left = 64
      Top = 24
      Width = 33
      Height = 21
      Caption = '...'
      TabOrder = 1
      OnClick = BitBtnConsultaClick
    end
  end
  object DataSource: TDataSource
    DataSet = DM.CAD_PAIS
    Left = 112
    Top = 144
  end
end