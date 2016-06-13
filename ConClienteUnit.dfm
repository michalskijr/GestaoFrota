object FormConsultaCliente: TFormConsultaCliente
  Left = 251
  Top = 123
  Width = 584
  Height = 551
  Caption = 'Consulta de Cliente'
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
  object Label1: TLabel
    Left = 8
    Top = 200
    Width = 46
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label2: TLabel
    Left = 8
    Top = 344
    Width = 37
    Height = 13
    Caption = 'Contato'
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
      'Nome')
  end
  object edtValorPesquisa: TEdit
    Left = 128
    Top = 16
    Width = 361
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    Visible = False
  end
  object btnPesquisar: TBitBtn
    Left = 496
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
    Width = 561
    Height = 153
    DataSource = DSIBQCLIENTE
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = GridConsultaCellClick
    OnDblClick = GridConsultaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_CLIENTE'
        Title.Caption = 'C'#211'DIGO'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CD_PESSOA'
        Title.Caption = 'C'#211'D PESSOA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_RZ_SOCIAL'
        Title.Caption = 'NOME'
        Width = 274
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_TRANSACAO'
        Title.Caption = 'DATA DE TRANSA'#199#195'O'
        Visible = True
      end>
  end
  object btnNovo: TBitBtn
    Left = 8
    Top = 488
    Width = 75
    Height = 25
    Caption = '&Novo'
    TabOrder = 4
    OnClick = btnNovoClick
  end
  object btnCancelar: TBitBtn
    Left = 408
    Top = 488
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
  end
  object btnOk: TBitBtn
    Left = 494
    Top = 488
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 6
    OnClick = btnOkClick
  end
  object gridEndereco: TDBGrid
    Left = 8
    Top = 216
    Width = 561
    Height = 120
    DataSource = DSIBQENDERECO
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DS_LOGRADOURO'
        Title.Caption = 'LOGRADOURO'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_NUMERO'
        Title.Caption = 'NUMERO'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_BAIRRO'
        Title.Caption = 'BAIRRO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_CIDADE'
        Title.Caption = 'CIDADE'
        Width = 200
        Visible = True
      end>
  end
  object gridContato: TDBGrid
    Left = 8
    Top = 360
    Width = 561
    Height = 120
    DataSource = DSIBQCONTATO
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CONTATO'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Width = 169
        Visible = True
      end>
  end
  object DSIBQCLIENTE: TDataSource
    DataSet = DM.IBQCAD_CLIENTE
    Left = 280
    Top = 488
  end
  object DSIBQENDERECO: TDataSource
    DataSet = DM.IBQCAD_ENDERECO
    Left = 312
    Top = 488
  end
  object DSIBQCONTATO: TDataSource
    DataSet = DM.IBQCAD_CONTATO
    Left = 344
    Top = 488
  end
end
