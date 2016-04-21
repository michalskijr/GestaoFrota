object FormConsultaTipoVeiculo: TFormConsultaTipoVeiculo
  Left = 193
  Top = 173
  Width = 494
  Height = 332
  Caption = 'Consuta do tipo do ve'#237'culo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 8
    Top = 0
    Width = 80
    Height = 13
    Caption = 'Tipo da Consulta'
  end
  object labelPesquisa: TLabel
    Left = 128
    Top = 0
    Width = 85
    Height = 13
    Caption = 'Valor da Pesquisa'
    Visible = False
  end
  object cbTipoConsulta: TComboBox
    Left = 8
    Top = 16
    Width = 113
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = 'Geral'
    OnSelect = cbTipoConsultaSelect
    Items.Strings = (
      'Geral'
      'C'#243'digo'
      'Nome')
  end
  object edtValorPesquisa: TEdit
    Left = 128
    Top = 16
    Width = 273
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    Visible = False
  end
  object btnPesquisar: TBitBtn
    Left = 408
    Top = 16
    Width = 75
    Height = 21
    Caption = '&Pesquisar'
    TabOrder = 2
    OnClick = btnPesquisarClick
  end
  object GridConsulta: TDBGrid
    Left = 8
    Top = 40
    Width = 473
    Height = 225
    DataSource = DataSourceConsulta
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = GridConsultaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_TIPO_VEICULO'
        Title.Caption = 'C'#243'digo'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_TIPO_VEICULO'
        Title.Caption = 'Tipo do ve'#237'culo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_TRANSACAO'
        Title.Caption = 'Data de transa'#231#227'o'
        Width = 101
        Visible = True
      end>
  end
  object btnNovo: TBitBtn
    Left = 8
    Top = 272
    Width = 75
    Height = 25
    Caption = '&Novo'
    TabOrder = 4
    OnClick = btnNovoClick
  end
  object btnCancelar: TBitBtn
    Left = 320
    Top = 272
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
  end
  object btnOk: TBitBtn
    Left = 406
    Top = 272
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 6
    OnClick = btnOkClick
  end
  object DataSourceConsulta: TDataSource
    DataSet = DM.IBQCAD_TIPO_VEICULO
    Left = 168
    Top = 272
  end
end
