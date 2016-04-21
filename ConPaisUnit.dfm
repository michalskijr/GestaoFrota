object FormConsultaPais: TFormConsultaPais
  Left = 400
  Top = 276
  Width = 502
  Height = 332
  Caption = 'Consulta do Pa'#237's'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
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
  object CBTipoConsulta: TComboBox
    Left = 8
    Top = 16
    Width = 113
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = 'Geral'
    OnSelect = CBTipoConsultaSelect
    Items.Strings = (
      'Geral'
      'C'#243'digo'
      'Nome')
  end
  object edtValor: TEdit
    Left = 128
    Top = 16
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    Visible = False
  end
  object btnPesquisar: TBitBtn
    Left = 416
    Top = 16
    Width = 75
    Height = 21
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = btnPesquisarClick
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 40
    Width = 481
    Height = 225
    DataSource = DT_CONSULTA
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_PAIS'
        Title.Caption = 'C'#243'digo'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_PAIS'
        Title.Caption = 'Nome'
        Width = 293
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_TRANSACAO'
        Title.Caption = 'Data de Transa'#231#227'o'
        Width = 102
        Visible = True
      end>
  end
  object btnOk: TBitBtn
    Left = 416
    Top = 272
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 4
    OnClick = btnOkClick
  end
  object btnCancelar: TBitBtn
    Left = 328
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
  end
  object btnNovo: TBitBtn
    Left = 8
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 6
    OnClick = btnNovoClick
  end
  object DT_CONSULTA: TDataSource
    DataSet = DM.IBQCAD_PAIS
    Left = 284
    Top = 272
  end
end
