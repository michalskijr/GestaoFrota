object FormConsultaEstado: TFormConsultaEstado
  Left = 235
  Top = 213
  Width = 501
  Height = 341
  Caption = 'Consulta de Estado'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Painel: TPanel
    Left = 0
    Top = 0
    Width = 489
    Height = 305
    Caption = 'Painel'
    TabOrder = 0
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
        'Nome'
        'Sigla'
        'Pa'#237's')
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
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btnPesquisarClick
    end
    object GridConsulta: TDBGrid
      Left = 8
      Top = 40
      Width = 473
      Height = 225
      DataSource = DT_CONSULTA
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
          FieldName = 'CD_UF'
          Title.Caption = 'C'#243'digo'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_UF'
          Title.Caption = 'Nome'
          Width = 189
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SG_UF'
          Title.Caption = 'Sigla'
          Width = 31
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_PAIS'
          Title.Caption = 'Pa'#237's'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_TRANSACAO'
          Title.Caption = 'Data de transa'#231#227'o'
          Width = 93
          Visible = True
        end>
    end
    object btnNovo: TBitBtn
      Left = 8
      Top = 272
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 4
      OnClick = btnNovoClick
    end
    object btnCancelar: TBitBtn
      Left = 320
      Top = 272
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 5
      OnClick = btnCancelarClick
    end
    object btnOk: TBitBtn
      Left = 406
      Top = 272
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 6
      OnClick = btnOkClick
    end
  end
  object DT_CONSULTA: TDataSource
    DataSet = DM.IBQCAD_ESTADO
    Left = 187
    Top = 272
  end
end
