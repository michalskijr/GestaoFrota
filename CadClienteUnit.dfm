object FormCadCliente: TFormCadCliente
  Left = 234
  Top = 156
  Width = 988
  Height = 478
  Caption = 'Cadastro de Cliente'
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
    Width = 873
    Height = 441
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
      Left = 280
      Top = 136
      Width = 88
      Height = 13
      Caption = 'Data de transa'#231#227'o'
      FocusControl = edtDtTransacao
    end
    object Label2: TLabel
      Left = 680
      Top = 320
      Width = 16
      Height = 13
      Caption = 'RG'
      FocusControl = DBEdit1
    end
    object Label6: TLabel
      Left = 680
      Top = 280
      Width = 20
      Height = 13
      Caption = 'CPF'
      FocusControl = DBEdit4
    end
    object Label7: TLabel
      Left = 16
      Top = 136
      Width = 97
      Height = 13
      Caption = 'Data de Nascimento'
      FocusControl = DBEdit5
    end
    object Label8: TLabel
      Left = 528
      Top = 136
      Width = 24
      Height = 13
      Caption = 'Sexo'
      FocusControl = DBEdit6
    end
    object LabelCPFCNPJ: TLabel
      Left = 440
      Top = 56
      Width = 52
      Height = 13
      Caption = 'CPF/CNPJ'
    end
    object LabelRGEstadual: TLabel
      Left = 16
      Top = 96
      Width = 108
      Height = 13
      Caption = 'RG/Inscri'#231#227'o Estadual'
    end
    object Label3: TLabel
      Left = 680
      Top = 240
      Width = 49
      Height = 13
      Caption = 'NR_CNPJ'
      FocusControl = DBEdit2
    end
    object Label9: TLabel
      Left = 680
      Top = 200
      Width = 74
      Height = 13
      Caption = 'NR_INSC_EST'
      FocusControl = DBEdit8
    end
    object Label10: TLabel
      Left = 136
      Top = 96
      Width = 71
      Height = 13
      Caption = 'Nome Fantasia'
      FocusControl = DBEdit9
    end
    object Label5: TLabel
      Left = 16
      Top = 176
      Width = 46
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label11: TLabel
      Left = 16
      Top = 288
      Width = 37
      Height = 13
      Caption = 'Contato'
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
    end
    object edtDescricao: TDBEdit
      Left = 112
      Top = 72
      Width = 321
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NM_RZ_SOCIAL'
      DataSource = DataSourcePessoa
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 256
      Top = 16
      Width = 17
      Height = 21
      DataField = 'TP_PESSOA'
      DataSource = DataSourcePessoa
      Enabled = False
      TabOrder = 2
    end
    object edtDtTransacao: TDBEdit
      Left = 280
      Top = 152
      Width = 89
      Height = 21
      DataField = 'DT_TRANSACAO'
      DataSource = DataSourcePessoa
      Enabled = False
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 680
      Top = 336
      Width = 145
      Height = 21
      DataField = 'NR_RG'
      DataSource = DataSourceFisica
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 680
      Top = 296
      Width = 147
      Height = 21
      DataField = 'NR_CPF'
      DataSource = DataSourceFisica
      TabOrder = 5
    end
    object DBEdit5: TDBEdit
      Left = 16
      Top = 152
      Width = 89
      Height = 21
      DataField = 'DT_NASCIMENTO'
      DataSource = DataSourceFisica
      TabOrder = 6
    end
    object DBEdit6: TDBEdit
      Left = 528
      Top = 152
      Width = 17
      Height = 21
      DataField = 'IN_SEXO'
      DataSource = DataSourceFisica
      TabOrder = 7
    end
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 8
      Width = 217
      Height = 41
      Caption = 'Tipo Pessoa'
      TabOrder = 8
    end
    object RadioButton1: TRadioButton
      Left = 24
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Pessoa F'#237'sica'
      TabOrder = 9
    end
    object RadioButton2: TRadioButton
      Left = 128
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Pessoa Jur'#237'dica'
      TabOrder = 10
    end
    object BitBtnConsulta: TBitBtn
      Left = 64
      Top = 72
      Width = 33
      Height = 21
      Caption = '...'
      TabOrder = 11
    end
    object MaskCPFCNPJ: TMaskEdit
      Left = 440
      Top = 72
      Width = 185
      Height = 21
      TabOrder = 12
      Text = 'MaskCPFCNPJ'
    end
    object edtRGEstadual: TEdit
      Left = 16
      Top = 112
      Width = 113
      Height = 21
      TabOrder = 13
    end
    object DBEdit2: TDBEdit
      Left = 680
      Top = 256
      Width = 145
      Height = 21
      DataField = 'NR_CNPJ'
      DataSource = DataSourceJuridica
      TabOrder = 14
    end
    object DBEdit8: TDBEdit
      Left = 680
      Top = 216
      Width = 145
      Height = 21
      DataField = 'NR_INSC_EST'
      DataSource = DataSourceJuridica
      TabOrder = 15
    end
    object DBEdit9: TDBEdit
      Left = 136
      Top = 112
      Width = 289
      Height = 21
      DataField = 'NM_FANTASIA'
      DataSource = DataSourceJuridica
      TabOrder = 16
    end
    object RadioGroup2: TRadioGroup
      Left = 120
      Top = 136
      Width = 153
      Height = 41
      Caption = 'Sexo'
      TabOrder = 17
    end
    object RadioButton3: TRadioButton
      Left = 128
      Top = 152
      Width = 73
      Height = 17
      Caption = 'Masculino'
      TabOrder = 18
    end
    object RadioButton4: TRadioButton
      Left = 200
      Top = 152
      Width = 65
      Height = 17
      Caption = 'Feminino'
      TabOrder = 19
    end
    object PanelBotoes: TPanel
      Left = 8
      Top = 392
      Width = 633
      Height = 41
      Color = clBtnHighlight
      TabOrder = 20
      object btnNovo: TBitBtn
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Novo'
        TabOrder = 0
      end
      object btnExcluir: TBitBtn
        Left = 364
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 1
      end
      object btnGravar: TBitBtn
        Left = 454
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 2
      end
      object btnCancelar: TBitBtn
        Left = 544
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 3
      end
    end
    object btnTeste: TButton
      Left = 584
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Button'
      TabOrder = 21
      OnClick = btnTesteClick
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 192
      Width = 545
      Height = 89
      DataSource = DataSourceEndereco
      TabOrder = 22
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_PESSOA'
          Title.Caption = 'C'#243'd. Pessoa'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_SEQ'
          Title.Caption = 'Nr'
          Width = 26
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_LOGRADOURO'
          Title.Caption = 'Logradouro'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_NUMERO'
          Title.Caption = 'Numero'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_BAIRRO'
          Title.Caption = 'Bairro'
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_CEP'
          Title.Caption = 'CEP'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_TRANSACAO'
          Title.Caption = 'Data de transa'#231#227'o'
          Width = 94
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 16
      Top = 304
      Width = 545
      Height = 81
      DataSource = DataSourceContato
      TabOrder = 23
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NR_SEQ'
          Title.Caption = 'Nr'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_PESSOA'
          Title.Caption = 'C'#243'd Pessoa'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_CONTATO'
          Title.Caption = 'Nome'
          Width = 181
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_TELEFONE'
          Title.Caption = 'Telefone'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_EMAIL'
          Title.Caption = 'E-Mail'
          Visible = True
        end>
    end
  end
  object DataSourcePessoa: TDataSource
    DataSet = DM.CAD_PESSOA
    Left = 368
    Top = 24
  end
  object DataSourceFisica: TDataSource
    DataSet = DM.CAD_FISICA
    Left = 400
    Top = 24
  end
  object DataSourceJuridica: TDataSource
    DataSet = DM.CAD_JURIDICA
    Left = 432
    Top = 24
  end
  object DataSourceCliente: TDataSource
    DataSet = DM.CAD_CLIENTE
    Left = 464
    Top = 24
  end
  object DataSourceEndereco: TDataSource
    DataSet = DM.CAD_ENDERECO
    Left = 496
    Top = 24
  end
  object DSEnderecoConsulta: TDataSource
    Left = 528
    Top = 24
  end
  object DataSourceContato: TDataSource
    DataSet = DM.CAD_CONTATO
    Left = 560
    Top = 24
  end
end
