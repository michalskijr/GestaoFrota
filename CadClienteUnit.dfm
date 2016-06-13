object FormCadCliente: TFormCadCliente
  Left = 199
  Top = 122
  Width = 792
  Height = 352
  Caption = 'Cadastro de Cliente'
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
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 321
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 56
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = edtCod
    end
    object LabelNome: TLabel
      Left = 112
      Top = 56
      Width = 96
      Height = 13
      Caption = 'Nome/Raz'#227'o Social'
      FocusControl = edtDescricao
    end
    object Label4: TLabel
      Left = 240
      Top = 16
      Width = 88
      Height = 13
      Caption = 'Data de transa'#231#227'o'
      FocusControl = edtDtTransacao
    end
    object edtCod: TDBEdit
      Left = 16
      Top = 72
      Width = 41
      Height = 21
      DataField = 'CD_PESSOA'
      DataSource = DataSourcePessoa
      Enabled = False
      TabOrder = 0
      OnExit = edtCodExit
    end
    object edtDescricao: TDBEdit
      Left = 112
      Top = 72
      Width = 433
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NM_RZ_SOCIAL'
      DataSource = DataSourcePessoa
      TabOrder = 1
    end
    object edtDtTransacao: TDBEdit
      Left = 240
      Top = 32
      Width = 89
      Height = 21
      DataField = 'DT_TRANSACAO'
      DataSource = DataSourcePessoa
      Enabled = False
      TabOrder = 2
    end
    object radioTpPessoa: TRadioGroup
      Left = 16
      Top = 8
      Width = 217
      Height = 41
      Caption = 'Tipo Pessoa'
      TabOrder = 3
    end
    object radioFisica: TRadioButton
      Left = 24
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Pessoa F'#237'sica'
      Checked = True
      TabOrder = 4
      TabStop = True
      OnClick = radioFisicaClick
    end
    object radioJuridica: TRadioButton
      Left = 128
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Pessoa Jur'#237'dica'
      TabOrder = 5
      OnClick = radioJuridicaClick
    end
    object BitBtnConsulta: TBitBtn
      Left = 64
      Top = 72
      Width = 33
      Height = 21
      Caption = '...'
      TabOrder = 6
      OnClick = BitBtnConsultaClick
    end
    object PageControl: TPageControl
      Left = 16
      Top = 104
      Width = 753
      Height = 217
      ActivePage = TabDados
      TabOrder = 7
      object TabDados: TTabSheet
        Caption = 'Dados'
        ImageIndex = 2
        object LabelCPFCNPJ: TLabel
          Left = 8
          Top = 8
          Width = 20
          Height = 13
          Caption = 'CPF'
        end
        object LabelRGEstadual: TLabel
          Left = 128
          Top = 8
          Width = 16
          Height = 13
          Caption = 'RG'
        end
        object labelNomeFantasia: TLabel
          Left = 8
          Top = 48
          Width = 71
          Height = 13
          Caption = 'Nome Fantasia'
          FocusControl = edtNomeFantasia
          Visible = False
        end
        object labelDtNascimento: TLabel
          Left = 8
          Top = 48
          Width = 97
          Height = 13
          Caption = 'Data de Nascimento'
          FocusControl = edtDtNascimento
        end
        object maskCPFCNPJ: TMaskEdit
          Left = 8
          Top = 24
          Width = 113
          Height = 21
          EditMask = '999.999.999-99;1;_'
          MaxLength = 14
          TabOrder = 0
          Text = '   .   .   -  '
        end
        object edtRGEstadual: TEdit
          Left = 128
          Top = 24
          Width = 113
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object edtNomeFantasia: TDBEdit
          Left = 8
          Top = 64
          Width = 441
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NM_FANTASIA'
          DataSource = DataSourceJuridica
          TabOrder = 2
          Visible = False
        end
        object edtDtNascimento: TDBEdit
          Left = 8
          Top = 64
          Width = 89
          Height = 21
          DataField = 'DT_NASCIMENTO'
          DataSource = DataSourceFisica
          TabOrder = 3
        end
        object radioGroupSexo: TRadioGroup
          Left = 112
          Top = 48
          Width = 153
          Height = 41
          Caption = 'Sexo'
          TabOrder = 4
        end
        object radioMasculino: TRadioButton
          Left = 120
          Top = 64
          Width = 73
          Height = 17
          Caption = 'Masculino'
          Checked = True
          TabOrder = 5
          TabStop = True
        end
        object radioFeminino: TRadioButton
          Left = 192
          Top = 64
          Width = 65
          Height = 17
          Caption = 'Feminino'
          TabOrder = 6
        end
        object PanelBotoes: TPanel
          Left = 24
          Top = 140
          Width = 633
          Height = 41
          Color = clBtnHighlight
          TabOrder = 7
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
            Left = 364
            Top = 8
            Width = 75
            Height = 25
            Caption = 'Excluir'
            TabOrder = 1
            OnClick = btnExcluirClick
          end
          object btnGravar: TBitBtn
            Left = 454
            Top = 8
            Width = 75
            Height = 25
            Caption = 'Gravar'
            TabOrder = 2
            OnClick = btnGravarClick
          end
          object btnCancelar: TBitBtn
            Left = 544
            Top = 8
            Width = 75
            Height = 25
            Caption = 'Cancelar'
            TabOrder = 3
            OnClick = btnCancelarClick
          end
        end
      end
      object TabEndereco: TTabSheet
        Caption = 'Endere'#231'o'
        object gridEndereco: TDBGrid
          Left = 8
          Top = 8
          Width = 721
          Height = 129
          DataSource = DataSourceIBQEndereco
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_PESSOA'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_SEQ'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_LOGRADOURO'
              Width = 108
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_NUMERO'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_BAIRRO'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_CEP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_TRANSACAO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_CIDADE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NM_CIDADE'
              Width = 78
              Visible = True
            end>
        end
        object btnAdd: TBitBtn
          Left = 616
          Top = 152
          Width = 33
          Height = 25
          Caption = '+'
          TabOrder = 1
          OnClick = btnAddClick
        end
        object btnRemover: TBitBtn
          Left = 656
          Top = 152
          Width = 33
          Height = 25
          Caption = '-'
          TabOrder = 2
          OnClick = btnRemoverClick
        end
      end
      object TabContato: TTabSheet
        Caption = 'Contato'
        Enabled = False
        ImageIndex = 1
        object gridContato: TDBGrid
          Left = 8
          Top = 8
          Width = 713
          Height = 137
          DataSource = DataSourceIBQContato
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NR_SEQ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_PESSOA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NM_CONTATO'
              Width = 219
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_TELEFONE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_EMAIL'
              Visible = True
            end>
        end
        object btnAddContato: TBitBtn
          Left = 616
          Top = 152
          Width = 33
          Height = 25
          Caption = '+'
          TabOrder = 1
          OnClick = btnAddContatoClick
        end
        object btnRemoverContato: TBitBtn
          Left = 656
          Top = 152
          Width = 33
          Height = 25
          Caption = '-'
          TabOrder = 2
          OnClick = btnRemoverContatoClick
        end
      end
    end
  end
  object DataSourcePessoa: TDataSource
    DataSet = DM.CAD_PESSOA
    OnStateChange = DataSourcePessoaStateChange
    Left = 448
    Top = 24
  end
  object DataSourceFisica: TDataSource
    DataSet = DM.CAD_FISICA
    Left = 480
    Top = 24
  end
  object DataSourceJuridica: TDataSource
    DataSet = DM.CAD_JURIDICA
    Left = 512
    Top = 24
  end
  object DataSourceCliente: TDataSource
    DataSet = DM.CAD_CLIENTE
    Left = 544
    Top = 24
  end
  object DataSourceIBQEndereco: TDataSource
    DataSet = DM.IBQCAD_ENDERECO
    Left = 624
    Top = 24
  end
  object DataSourceIBQContato: TDataSource
    DataSet = DM.IBQCAD_CONTATO
    Left = 664
    Top = 24
  end
end
