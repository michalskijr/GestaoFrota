object FormCadTipoCarga: TFormCadTipoCarga
  Left = 235
  Top = 172
  Width = 472
  Height = 308
  Caption = 'Tipo de Carga'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 457
    Height = 273
    ActivePage = TabCadastro
    TabOrder = 0
    object TabCadastro: TTabSheet
      Caption = 'Cadastro'
      object Label1: TLabel
        Left = 8
        Top = 0
        Width = 33
        Height = 13
        Caption = 'C'#243'dgio'
        FocusControl = edtCod
      end
      object Label2: TLabel
        Left = 8
        Top = 40
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = edtNome
      end
      object Label3: TLabel
        Left = 8
        Top = 80
        Width = 88
        Height = 13
        Caption = 'Data de transa'#231#227'o'
        FocusControl = edtDtTransacao
      end
      object PanelBotoes: TPanel
        Left = 0
        Top = 208
        Width = 449
        Height = 41
        Color = clBtnHighlight
        TabOrder = 0
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
        object btnAlterar: TBitBtn
          Left = 98
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Alterar'
          TabOrder = 4
          OnClick = btnAlterarClick
        end
      end
      object edtCod: TDBEdit
        Left = 8
        Top = 16
        Width = 49
        Height = 21
        DataField = 'CD_TIPO_CARGA'
        DataSource = DataSource
        Enabled = False
        TabOrder = 1
        OnExit = edtCodExit
      end
      object edtNome: TDBEdit
        Left = 8
        Top = 56
        Width = 345
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DS_TIPO_CARGA'
        DataSource = DataSource
        TabOrder = 2
      end
      object edtDtTransacao: TDBEdit
        Left = 8
        Top = 96
        Width = 89
        Height = 21
        DataField = 'DT_TRANSACAO'
        DataSource = DataSource
        Enabled = False
        TabOrder = 3
      end
    end
    object TabConsulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
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
    end
  end
  object DataSource: TDataSource
    DataSet = DM.CAD_TIPO_CARGA
    OnStateChange = DataSourceStateChange
    Left = 40
    Top = 240
  end
  object DataSourceConsulta: TDataSource
    DataSet = DM.IBQCAD_TIPO_CARGA
    Left = 84
    Top = 240
  end
end
