object FormCadCor: TFormCadCor
  Left = 634
  Top = 219
  Width = 464
  Height = 221
  Caption = 'Cadastro de Cor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
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
      Top = 48
      Width = 88
      Height = 13
      Caption = 'Data de transa'#231#227'o'
      FocusControl = edtDtTransacao
    end
    object edtCod: TDBEdit
      Left = 8
      Top = 24
      Width = 41
      Height = 21
      DataField = 'CD_COR'
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
      DataField = 'DS_COR'
      DataSource = DataSource
      TabOrder = 2
    end
    object edtDtTransacao: TDBEdit
      Left = 8
      Top = 64
      Width = 89
      Height = 21
      DataField = 'DT_TRANSACAO'
      DataSource = DataSource
      Enabled = False
      TabOrder = 3
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
    object PanelBotoes: TPanel
      Left = 0
      Top = 144
      Width = 449
      Height = 41
      Color = clBtnHighlight
      TabOrder = 4
      object btnNovo: TBitBtn
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Novo'
        TabOrder = 0
        OnClick = btnNovoClick
      end
      object btnExcluir: TBitBtn
        Left = 188
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Excluir'
        TabOrder = 1
        OnClick = btnExcluirClick
      end
      object btnGravar: TBitBtn
        Left = 278
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Gravar'
        TabOrder = 2
        OnClick = btnGravarClick
      end
      object btnCancelar: TBitBtn
        Left = 368
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Cancelar'
        TabOrder = 3
        OnClick = btnCancelarClick
      end
    end
  end
  object DataSource: TDataSource
    DataSet = DM.CAD_COR
    Left = 176
    Top = 56
  end
end
