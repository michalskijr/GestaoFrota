object Form1: TForm1
  Left = 192
  Top = 117
  Width = 774
  Height = 480
  Caption = 'Form1'
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 761
    Height = 449
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Nota Fiscal'
      object Label1: TLabel
        Left = 24
        Top = 8
        Width = 54
        Height = 13
        Caption = 'Numero NF'
      end
      object Label2: TLabel
        Left = 96
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label3: TLabel
        Left = 32
        Top = 32
        Width = 32
        Height = 13
        Caption = 'Cliente'
      end
      object Label4: TLabel
        Left = 40
        Top = 64
        Width = 24
        Height = 13
        Caption = 'Total'
      end
      object Label5: TLabel
        Left = 96
        Top = 64
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label6: TLabel
        Left = 16
        Top = 88
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label7: TLabel
        Left = 16
        Top = 112
        Width = 37
        Height = 13
        Caption = 'Produto'
      end
      object Label8: TLabel
        Left = 168
        Top = 104
        Width = 55
        Height = 13
        Caption = 'Quantidade'
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 232
        Width = 721
        Height = 120
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 8
        Top = 128
        Width = 145
        Height = 21
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 168
        Top = 128
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'Edit1'
      end
      object BitBtn1: TBitBtn
        Left = 536
        Top = 200
        Width = 75
        Height = 25
        Caption = 'Add'
        TabOrder = 3
      end
      object BitBtn2: TBitBtn
        Left = 624
        Top = 200
        Width = 75
        Height = 25
        Caption = 'Remover'
        TabOrder = 4
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
    end
  end
end
