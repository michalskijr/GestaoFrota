object FormPrincipal: TFormPrincipal
  Left = 252
  Top = 151
  Width = 703
  Height = 480
  Caption = 'Projeto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PrintScale = poNone
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 8
    Top = 8
    object Cadastro1: TMenuItem
      Caption = '&Cadastro'
      object Pas1: TMenuItem
        Caption = '&Pa'#237's'
        OnClick = Pas1Click
      end
      object Estado1: TMenuItem
        Caption = '&Estado'
        OnClick = Estado1Click
      end
      object Cidade1: TMenuItem
        Caption = '&Cidade'
        OnClick = Cidade1Click
      end
      object Marca1: TMenuItem
        Caption = '&Marca'
        OnClick = Marca1Click
      end
      object Modelo1: TMenuItem
        Caption = 'M&odelo'
        OnClick = Modelo1Click
      end
      object ipoVeculo1: TMenuItem
        Caption = 'Tipo Ve'#237'culo'
        OnClick = ipoVeculo1Click
      end
      object Cor1: TMenuItem
        Caption = 'Cor'
        OnClick = Cor1Click
      end
      object Combustvel1: TMenuItem
        Caption = 'Combust'#237'vel'
        OnClick = Combustvel1Click
      end
      object Veculo1: TMenuItem
        Caption = 'Ve'#237'culo'
        OnClick = Veculo1Click
      end
      object ipoCarga1: TMenuItem
        Caption = 'Tipo Carga'
        OnClick = ipoCarga1Click
      end
      object Cliente1: TMenuItem
        Caption = 'Cliente'
        OnClick = Cliente1Click
      end
      object Motorista1: TMenuItem
        Caption = 'Motorista'
        OnClick = Motorista1Click
      end
    end
    object Consulta1: TMenuItem
      Caption = 'C&onsulta'
      object Pasi1: TMenuItem
        Caption = '&Pa'#237's'
        OnClick = Pasi1Click
      end
      object Estado2: TMenuItem
        Caption = '&Estado'
        OnClick = Estado2Click
      end
      object Cidade2: TMenuItem
        Caption = '&Cidade'
        OnClick = Cidade2Click
      end
      object Marca2: TMenuItem
        Caption = '&Marca'
        OnClick = Marca2Click
      end
      object Modelo2: TMenuItem
        Caption = 'M&odelo'
        OnClick = Modelo2Click
      end
      object ipoVeculo2: TMenuItem
        Caption = 'Tipo Ve'#237'culo'
        OnClick = ipoVeculo2Click
      end
      object Cor2: TMenuItem
        Caption = 'Cor'
        OnClick = Cor2Click
      end
      object Combustvel2: TMenuItem
        Caption = 'Combust'#237'vel'
        OnClick = Combustvel2Click
      end
    end
    object Ferramentas1: TMenuItem
      Caption = '&Movimenta'#231#227'o'
      object Frete1: TMenuItem
        Caption = 'Frete'
        OnClick = Frete1Click
      end
    end
    object Ajuda1: TMenuItem
      Caption = '&Ajuda'
      object Sobre1: TMenuItem
        Caption = 'Sobre'
      end
    end
  end
end
