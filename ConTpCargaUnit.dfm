object FormConsultaTpCarga: TFormConsultaTpCarga
  Left = 570
  Top = 278
  Width = 463
  Height = 271
  Caption = 'Consulta de Tipo de Carga'
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
    Left = 0
    Top = 0
    Width = 80
    Height = 13
    Caption = 'Tipo da Consulta'
  end
  object labelPesquisa: TLabel
    Left = 120
    Top = 0
    Width = 85
    Height = 13
    Caption = 'Valor da Pesquisa'
    Visible = False
  end
  object cbTipoConsulta: TComboBox
    Left = 0
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
    Left = 120
    Top = 16
    Width = 249
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    Visible = False
  end
  object btnPesquisar: TBitBtn
    Left = 374
    Top = 16
    Width = 75
    Height = 21
    Caption = '&Pesquisar'
    TabOrder = 2
    OnClick = btnPesquisarClick
  end
  object GridConsulta: TDBGrid
    Left = 0
    Top = 40
    Width = 449
    Height = 161
    DataSource = DSTPCARGA
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
        FieldName = 'CD_TIPO_CARGA'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_TIPO_CARGA'
        Title.Caption = 'Descri'#231#227'o'
        Width = 252
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_TRANSACAO'
        Title.Caption = 'Data de transa'#231#227'o'
        Width = 99
        Visible = True
      end>
  end
  object btnOk: TBitBtn
    Left = 366
    Top = 212
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 4
    OnClick = btnOkClick
  end
  object DSTPCARGA: TDataSource
    DataSet = DM.IBQCAD_TIPO_CARGA
    Left = 184
    Top = 208
  end
end
