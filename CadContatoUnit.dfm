object FormCadContato: TFormCadContato
  Left = 815
  Top = 206
  Width = 396
  Height = 175
  Caption = 'Cadastro de Contato'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 385
    Height = 137
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 11
      Height = 13
      Caption = 'Nr'
      FocusControl = edtNr
    end
    object Label2: TLabel
      Left = 304
      Top = 48
      Width = 60
      Height = 13
      Caption = 'C'#243'd. Pessoa'
      FocusControl = edtCodPessoa
    end
    object Label3: TLabel
      Left = 56
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Contato'
      FocusControl = edtContato
    end
    object Label4: TLabel
      Left = 8
      Top = 48
      Width = 42
      Height = 13
      Caption = 'Telefone'
      FocusControl = edtTelefone
    end
    object Label5: TLabel
      Left = 120
      Top = 48
      Width = 27
      Height = 13
      Caption = 'e-mail'
      FocusControl = edtEmail
    end
    object edtNr: TDBEdit
      Left = 8
      Top = 24
      Width = 41
      Height = 21
      DataField = 'NR_SEQ'
      DataSource = DataSource
      Enabled = False
      TabOrder = 0
    end
    object edtCodPessoa: TDBEdit
      Left = 304
      Top = 64
      Width = 65
      Height = 21
      DataField = 'CD_PESSOA'
      DataSource = DataSource
      Enabled = False
      TabOrder = 1
    end
    object edtContato: TDBEdit
      Left = 56
      Top = 24
      Width = 316
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NM_CONTATO'
      DataSource = DataSource
      TabOrder = 2
    end
    object edtTelefone: TDBEdit
      Left = 8
      Top = 64
      Width = 105
      Height = 21
      DataField = 'NR_TELEFONE'
      DataSource = DataSource
      TabOrder = 3
    end
    object edtEmail: TDBEdit
      Left = 120
      Top = 64
      Width = 177
      Height = 21
      DataField = 'DS_EMAIL'
      DataSource = DataSource
      TabOrder = 4
    end
    object PanelBotoes: TPanel
      Left = 208
      Top = 88
      Width = 169
      Height = 41
      Color = clBtnHighlight
      TabOrder = 5
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
        OnClick = btnCancelarClick
      end
    end
  end
  object DataSource: TDataSource
    DataSet = DM.CAD_CONTATO
    Left = 112
    Top = 96
  end
end
