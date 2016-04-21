object DM: TDM
  OldCreateOrder = False
  Left = 349
  Top = 97
  Height = 591
  Width = 560
  object Conection: TIBDatabase
    Connected = True
    DatabaseName = 
      'E:\Documentos\OneDrive\5'#186' Per'#237'odo\Programa'#231#227'o Visual\Trabalho 1'#186 +
      ' Bim\Banco\BANCO.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = Transaction
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 32
    Top = 8
  end
  object Transaction: TIBTransaction
    Active = True
    DefaultDatabase = Conection
    AutoStopAction = saNone
    Left = 32
    Top = 64
  end
  object CAD_PAIS: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_PAIS'
      'where'
      '  CD_PAIS = :OLD_CD_PAIS')
    InsertSQL.Strings = (
      'insert into CAD_PAIS'
      '  (NM_PAIS, DT_TRANSACAO)'
      'values'
      '  (:NM_PAIS, :DT_TRANSACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_PAIS,'
      '  NM_PAIS,'
      '  DT_TRANSACAO'
      'from CAD_PAIS '
      'where'
      '  CD_PAIS = :CD_PAIS')
    SelectSQL.Strings = (
      'select * from CAD_PAIS where CD_PAIS = :PCDPAIS')
    ModifySQL.Strings = (
      'update CAD_PAIS'
      'set'
      '  NM_PAIS = :NM_PAIS,'
      '  DT_TRANSACAO = :DT_TRANSACAO'
      'where'
      '  CD_PAIS = :OLD_CD_PAIS')
    Active = True
    Left = 128
    Top = 8
    object CAD_PAISCD_PAIS: TIntegerField
      FieldName = 'CD_PAIS'
      Origin = 'CAD_PAIS.CD_PAIS'
      Required = True
    end
    object CAD_PAISNM_PAIS: TIBStringField
      FieldName = 'NM_PAIS'
      Origin = 'CAD_PAIS.NM_PAIS'
      Size = 50
    end
    object CAD_PAISDT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_PAIS.DT_TRANSACAO'
    end
  end
  object CAD_UF: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_UF'
      'where'
      '  CD_UF = :OLD_CD_UF')
    InsertSQL.Strings = (
      'insert into CAD_UF'
      '  (SG_UF, NM_UF, DT_TRANSACAO, CD_PAIS)'
      'values'
      '  (:SG_UF, :NM_UF, :DT_TRANSACAO, :CD_PAIS)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_UF,'
      '  SG_UF,'
      '  NM_UF,'
      '  DT_TRANSACAO,'
      '  CD_PAIS'
      'from CAD_UF '
      'where'
      '  CD_UF = :CD_UF')
    SelectSQL.Strings = (
      'select * from CAD_UF where CD_UF =:PCDUF')
    ModifySQL.Strings = (
      'update CAD_UF'
      'set'
      '  SG_UF = :SG_UF,'
      '  NM_UF = :NM_UF,'
      '  DT_TRANSACAO = :DT_TRANSACAO,'
      '  CD_PAIS = :CD_PAIS'
      'where'
      '  CD_UF = :OLD_CD_UF')
    Active = True
    Left = 125
    Top = 68
    object CAD_UFCD_UF: TIntegerField
      FieldName = 'CD_UF'
      Origin = 'CAD_UF.CD_UF'
      Required = True
    end
    object CAD_UFSG_UF: TIBStringField
      FieldName = 'SG_UF'
      Origin = 'CAD_UF.SG_UF'
      FixedChar = True
      Size = 2
    end
    object CAD_UFNM_UF: TIBStringField
      FieldName = 'NM_UF'
      Origin = 'CAD_UF.NM_UF'
      Size = 50
    end
    object CAD_UFDT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_UF.DT_TRANSACAO'
    end
    object CAD_UFCD_PAIS: TIntegerField
      FieldName = 'CD_PAIS'
      Origin = 'CAD_UF.CD_PAIS'
    end
  end
  object CAD_CIDADE: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_CIDADE'
      'where'
      '  CD_CIDADE = :OLD_CD_CIDADE')
    InsertSQL.Strings = (
      'insert into CAD_CIDADE'
      '  (NM_CIDADE, DT_TRANSACAO, CD_UF)'
      'values'
      '  (:NM_CIDADE, :DT_TRANSACAO, :CD_UF)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_CIDADE,'
      '  NM_CIDADE,'
      '  DT_TRANSACAO,'
      '  CD_UF'
      'from CAD_CIDADE '
      'where'
      '  CD_CIDADE = :CD_CIDADE')
    SelectSQL.Strings = (
      'select * from CAD_CIDADE where CD_CIDADE =:PCDCIDADE')
    ModifySQL.Strings = (
      'update CAD_CIDADE'
      'set'
      '  NM_CIDADE = :NM_CIDADE,'
      '  DT_TRANSACAO = :DT_TRANSACAO,'
      '  CD_UF = :CD_UF'
      'where'
      '  CD_CIDADE = :OLD_CD_CIDADE')
    Active = True
    Left = 128
    Top = 129
    object CAD_CIDADECD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CAD_CIDADE.CD_CIDADE'
      Required = True
    end
    object CAD_CIDADENM_CIDADE: TIBStringField
      FieldName = 'NM_CIDADE'
      Origin = 'CAD_CIDADE.NM_CIDADE'
      Size = 50
    end
    object CAD_CIDADEDT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_CIDADE.DT_TRANSACAO'
    end
    object CAD_CIDADECD_UF: TIntegerField
      FieldName = 'CD_UF'
      Origin = 'CAD_CIDADE.CD_UF'
    end
  end
  object IBQCAD_PAIS: TIBQuery
    Database = Conection
    Transaction = Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_PAIS')
    Left = 346
    Top = 8
    object IBQCAD_PAISCD_PAIS: TIntegerField
      FieldName = 'CD_PAIS'
      Origin = 'CAD_PAIS.CD_PAIS'
      Required = True
    end
    object IBQCAD_PAISNM_PAIS: TIBStringField
      FieldName = 'NM_PAIS'
      Origin = 'CAD_PAIS.NM_PAIS'
      Size = 50
    end
    object IBQCAD_PAISDT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_PAIS.DT_TRANSACAO'
    end
  end
  object IBQCAD_ESTADO: TIBQuery
    Database = Conection
    Transaction = Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select UF.CD_PAIS, UF.CD_UF, UF.DT_TRANSACAO, UF.NM_UF, UF.SG_UF' +
        ', PAIS.NM_PAIS from CAD_UF UF inner join CAD_PAIS PAIS on (UF.CD' +
        '_PAIS = PAIS.CD_PAIS)')
    Left = 346
    Top = 68
    object IBQCAD_ESTADOCD_UF: TIntegerField
      FieldName = 'CD_UF'
      Origin = 'CAD_UF.CD_UF'
      Required = True
    end
    object IBQCAD_ESTADOSG_UF: TIBStringField
      FieldName = 'SG_UF'
      Origin = 'CAD_UF.SG_UF'
      FixedChar = True
      Size = 2
    end
    object IBQCAD_ESTADONM_UF: TIBStringField
      FieldName = 'NM_UF'
      Origin = 'CAD_UF.NM_UF'
      Size = 50
    end
    object IBQCAD_ESTADODT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_UF.DT_TRANSACAO'
    end
    object IBQCAD_ESTADOCD_PAIS: TIntegerField
      FieldName = 'CD_PAIS'
      Origin = 'CAD_UF.CD_PAIS'
    end
    object IBQCAD_ESTADONM_PAIS: TIBStringField
      FieldName = 'NM_PAIS'
      Origin = 'CAD_PAIS.NM_PAIS'
      Size = 50
    end
  end
  object IBQCAD_CIDADE: TIBQuery
    Database = Conection
    Transaction = Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select cidade.cd_cidade, cidade.nm_cidade, cidade.dt_transacao, ' +
        'uf.nm_uf, cidade.cd_uf'
      'from cad_cidade cidade'
      'inner join cad_uf uf on (cidade.cd_uf = uf.cd_uf)')
    Left = 346
    Top = 129
    object IBQCAD_CIDADECD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CAD_CIDADE.CD_CIDADE'
      Required = True
    end
    object IBQCAD_CIDADENM_CIDADE: TIBStringField
      FieldName = 'NM_CIDADE'
      Origin = 'CAD_CIDADE.NM_CIDADE'
      Size = 50
    end
    object IBQCAD_CIDADEDT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_CIDADE.DT_TRANSACAO'
    end
    object IBQCAD_CIDADECD_UF: TIntegerField
      FieldName = 'CD_UF'
      Origin = 'CAD_CIDADE.CD_UF'
    end
    object IBQCAD_CIDADENM_UF: TIBStringField
      FieldName = 'NM_UF'
      Origin = 'CAD_UF.NM_UF'
      Size = 50
    end
  end
  object CAD_MARCA: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_MARCA'
      'where'
      '  CD_MARCA = :OLD_CD_MARCA')
    InsertSQL.Strings = (
      'insert into CAD_MARCA'
      '  (NM_MARCA, DT_TRANSACAO)'
      'values'
      '  (:NM_MARCA, :DT_TRANSACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_MARCA,'
      '  NM_MARCA,'
      '  DT_TRANSACAO'
      'from CAD_MARCA '
      'where'
      '  CD_MARCA = :CD_MARCA')
    SelectSQL.Strings = (
      'select * from CAD_MARCA where CD_MARCA = :PCDMARCA')
    ModifySQL.Strings = (
      'update CAD_MARCA'
      'set'
      '  NM_MARCA = :NM_MARCA,'
      '  DT_TRANSACAO = :DT_TRANSACAO'
      'where'
      '  CD_MARCA = :OLD_CD_MARCA')
    Active = True
    Left = 128
    Top = 190
    object CAD_MARCACD_MARCA: TIntegerField
      FieldName = 'CD_MARCA'
      Origin = 'CAD_MARCA.CD_MARCA'
      Required = True
    end
    object CAD_MARCANM_MARCA: TIBStringField
      FieldName = 'NM_MARCA'
      Origin = 'CAD_MARCA.NM_MARCA'
      Required = True
      Size = 50
    end
    object CAD_MARCADT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_MARCA.DT_TRANSACAO'
      Required = True
    end
  end
  object IBQCAD_MARCA: TIBQuery
    Database = Conection
    Transaction = Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_MARCA')
    Left = 346
    Top = 189
    object IBQCAD_MARCACD_MARCA: TIntegerField
      FieldName = 'CD_MARCA'
      Origin = 'CAD_MARCA.CD_MARCA'
      Required = True
    end
    object IBQCAD_MARCANM_MARCA: TIBStringField
      FieldName = 'NM_MARCA'
      Origin = 'CAD_MARCA.NM_MARCA'
      Required = True
      Size = 50
    end
    object IBQCAD_MARCADT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_MARCA.DT_TRANSACAO'
      Required = True
    end
  end
  object CAD_MODELO: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_MODELO'
      'where'
      '  CD_MODELO = :OLD_CD_MODELO')
    InsertSQL.Strings = (
      'insert into CAD_MODELO'
      '  (CD_MARCA, DS_MODELO, DS_OBSERVACAO, DT_TRANSACAO)'
      'values'
      '  (:CD_MARCA, :DS_MODELO, :DS_OBSERVACAO, :DT_TRANSACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_MODELO,'
      '  CD_MARCA,'
      '  DS_MODELO,'
      '  DS_OBSERVACAO,'
      '  DT_TRANSACAO'
      'from CAD_MODELO '
      'where'
      '  CD_MODELO = :CD_MODELO')
    SelectSQL.Strings = (
      'select * from CAD_MODELO where CD_MODELO = :PCDMODELO')
    ModifySQL.Strings = (
      'update CAD_MODELO'
      'set'
      '  CD_MARCA = :CD_MARCA,'
      '  DS_MODELO = :DS_MODELO,'
      '  DS_OBSERVACAO = :DS_OBSERVACAO,'
      '  DT_TRANSACAO = :DT_TRANSACAO'
      'where'
      '  CD_MODELO = :OLD_CD_MODELO')
    Active = True
    Left = 128
    Top = 251
    object CAD_MODELOCD_MODELO: TIntegerField
      FieldName = 'CD_MODELO'
      Origin = 'CAD_MODELO.CD_MODELO'
      Required = True
    end
    object CAD_MODELOCD_MARCA: TIntegerField
      FieldName = 'CD_MARCA'
      Origin = 'CAD_MODELO.CD_MARCA'
      Required = True
    end
    object CAD_MODELODS_MODELO: TIBStringField
      FieldName = 'DS_MODELO'
      Origin = 'CAD_MODELO.DS_MODELO'
      Required = True
      Size = 50
    end
    object CAD_MODELODS_OBSERVACAO: TIBStringField
      FieldName = 'DS_OBSERVACAO'
      Origin = 'CAD_MODELO.DS_OBSERVACAO'
      Size = 200
    end
    object CAD_MODELODT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_MODELO.DT_TRANSACAO'
      Required = True
    end
  end
  object IBQCAD_MODELO: TIBQuery
    Database = Conection
    Transaction = Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select MODELO.CD_MODELO, MODELO.DS_MODELO, MODELO.CD_MARCA, MARC' +
        'A.NM_MARCA, MODELO.DS_OBSERVACAO, MODELO.DT_TRANSACAO'
      'from CAD_MODELO MODELO'
      'inner join CAD_MARCA MARCA on (MODELO.CD_MARCA = MARCA.CD_MARCA)')
    Left = 346
    Top = 250
    object IBQCAD_MODELOCD_MODELO: TIntegerField
      FieldName = 'CD_MODELO'
      Origin = 'CAD_MODELO.CD_MODELO'
      Required = True
    end
    object IBQCAD_MODELODS_MODELO: TIBStringField
      FieldName = 'DS_MODELO'
      Origin = 'CAD_MODELO.DS_MODELO'
      Required = True
      Size = 50
    end
    object IBQCAD_MODELOCD_MARCA: TIntegerField
      FieldName = 'CD_MARCA'
      Origin = 'CAD_MODELO.CD_MARCA'
      Required = True
    end
    object IBQCAD_MODELONM_MARCA: TIBStringField
      FieldName = 'NM_MARCA'
      Origin = 'CAD_MARCA.NM_MARCA'
      Required = True
      Size = 50
    end
    object IBQCAD_MODELODS_OBSERVACAO: TIBStringField
      FieldName = 'DS_OBSERVACAO'
      Origin = 'CAD_MODELO.DS_OBSERVACAO'
      Size = 200
    end
    object IBQCAD_MODELODT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_MODELO.DT_TRANSACAO'
      Required = True
    end
  end
  object CAD_TIPO_VEICULO: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_TIPO_VEICULO'
      'where'
      '  CD_TIPO_VEICULO = :OLD_CD_TIPO_VEICULO')
    InsertSQL.Strings = (
      'insert into CAD_TIPO_VEICULO'
      '  (NM_TIPO_VEICULO, DT_TRANSACAO)'
      'values'
      '  (:NM_TIPO_VEICULO, :DT_TRANSACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_TIPO_VEICULO,'
      '  NM_TIPO_VEICULO,'
      '  DT_TRANSACAO'
      'from CAD_TIPO_VEICULO '
      'where'
      '  CD_TIPO_VEICULO = :CD_TIPO_VEICULO')
    SelectSQL.Strings = (
      
        'select * from CAD_TIPO_VEICULO where CD_TIPO_VEICULO = :PCDTIPOV' +
        'EICULO')
    ModifySQL.Strings = (
      'update CAD_TIPO_VEICULO'
      'set'
      '  NM_TIPO_VEICULO = :NM_TIPO_VEICULO,'
      '  DT_TRANSACAO = :DT_TRANSACAO'
      'where'
      '  CD_TIPO_VEICULO = :OLD_CD_TIPO_VEICULO')
    Active = True
    Left = 128
    Top = 312
    object CAD_TIPO_VEICULOCD_TIPO_VEICULO: TIntegerField
      FieldName = 'CD_TIPO_VEICULO'
      Origin = 'CAD_TIPO_VEICULO.CD_TIPO_VEICULO'
      Required = True
    end
    object CAD_TIPO_VEICULONM_TIPO_VEICULO: TIBStringField
      FieldName = 'NM_TIPO_VEICULO'
      Origin = 'CAD_TIPO_VEICULO.NM_TIPO_VEICULO'
      Required = True
      Size = 50
    end
    object CAD_TIPO_VEICULODT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_TIPO_VEICULO.DT_TRANSACAO'
      Required = True
    end
  end
  object IBQCAD_TIPO_VEICULO: TIBQuery
    Database = Conection
    Transaction = Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_TIPO_VEICULO')
    Left = 346
    Top = 310
    object IBQCAD_TIPO_VEICULOCD_TIPO_VEICULO: TIntegerField
      FieldName = 'CD_TIPO_VEICULO'
      Origin = 'CAD_TIPO_VEICULO.CD_TIPO_VEICULO'
      Required = True
    end
    object IBQCAD_TIPO_VEICULONM_TIPO_VEICULO: TIBStringField
      FieldName = 'NM_TIPO_VEICULO'
      Origin = 'CAD_TIPO_VEICULO.NM_TIPO_VEICULO'
      Required = True
      Size = 50
    end
    object IBQCAD_TIPO_VEICULODT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_TIPO_VEICULO.DT_TRANSACAO'
      Required = True
    end
  end
  object CAD_COR: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_COR'
      'where'
      '  CD_COR = :OLD_CD_COR')
    InsertSQL.Strings = (
      'insert into CAD_COR'
      '  (DS_COR, DT_TRANSACAO)'
      'values'
      '  (:DS_COR, :DT_TRANSACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_COR,'
      '  DS_COR,'
      '  DT_TRANSACAO'
      'from CAD_COR '
      'where'
      '  CD_COR = :CD_COR')
    SelectSQL.Strings = (
      'select * from CAD_COR where CD_COR = :PCDCOR')
    ModifySQL.Strings = (
      'update CAD_COR'
      'set'
      '  DS_COR = :DS_COR,'
      '  DT_TRANSACAO = :DT_TRANSACAO'
      'where'
      '  CD_COR = :OLD_CD_COR')
    Active = True
    Left = 128
    Top = 373
    object CAD_CORCD_COR: TIntegerField
      FieldName = 'CD_COR'
      Origin = 'CAD_COR.CD_COR'
      Required = True
    end
    object CAD_CORDS_COR: TIBStringField
      FieldName = 'DS_COR'
      Origin = 'CAD_COR.DS_COR'
      Required = True
      Size = 50
    end
    object CAD_CORDT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_COR.DT_TRANSACAO'
      Required = True
    end
  end
  object IBQCAD_COR: TIBQuery
    Database = Conection
    Transaction = Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_COR')
    Left = 346
    Top = 371
    object IBQCAD_CORCD_COR: TIntegerField
      FieldName = 'CD_COR'
      Origin = 'CAD_COR.CD_COR'
      Required = True
    end
    object IBQCAD_CORDS_COR: TIBStringField
      FieldName = 'DS_COR'
      Origin = 'CAD_COR.DS_COR'
      Required = True
      Size = 50
    end
    object IBQCAD_CORDT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_COR.DT_TRANSACAO'
      Required = True
    end
  end
  object CAD_COMBUSTIVEL: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_COMBUSTIVEL'
      'where'
      '  CD_COMBUSTIVEL = :OLD_CD_COMBUSTIVEL')
    InsertSQL.Strings = (
      'insert into CAD_COMBUSTIVEL'
      '  (NM_COMBUSTIVEL, DT_TRANSACAO)'
      'values'
      '  (:NM_COMBUSTIVEL, :DT_TRANSACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_COMBUSTIVEL,'
      '  NM_COMBUSTIVEL,'
      '  DT_TRANSACAO'
      'from CAD_COMBUSTIVEL '
      'where'
      '  CD_COMBUSTIVEL = :CD_COMBUSTIVEL')
    SelectSQL.Strings = (
      
        'select * from CAD_COMBUSTIVEL where CD_COMBUSTIVEL = :PCDCOMBUST' +
        'IVEL')
    ModifySQL.Strings = (
      'update CAD_COMBUSTIVEL'
      'set'
      '  NM_COMBUSTIVEL = :NM_COMBUSTIVEL,'
      '  DT_TRANSACAO = :DT_TRANSACAO'
      'where'
      '  CD_COMBUSTIVEL = :OLD_CD_COMBUSTIVEL')
    Active = True
    Left = 128
    Top = 434
    object CAD_COMBUSTIVELCD_COMBUSTIVEL: TIntegerField
      FieldName = 'CD_COMBUSTIVEL'
      Origin = 'CAD_COMBUSTIVEL.CD_COMBUSTIVEL'
      Required = True
    end
    object CAD_COMBUSTIVELNM_COMBUSTIVEL: TIBStringField
      FieldName = 'NM_COMBUSTIVEL'
      Origin = 'CAD_COMBUSTIVEL.NM_COMBUSTIVEL'
      Required = True
      Size = 50
    end
    object CAD_COMBUSTIVELDT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_COMBUSTIVEL.DT_TRANSACAO'
      Required = True
    end
  end
  object IBQCAD_COMBUSTIVEL: TIBQuery
    Database = Conection
    Transaction = Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_COMBUSTIVEL')
    Left = 346
    Top = 432
    object IBQCAD_COMBUSTIVELCD_COMBUSTIVEL: TIntegerField
      FieldName = 'CD_COMBUSTIVEL'
      Origin = 'CAD_COMBUSTIVEL.CD_COMBUSTIVEL'
      Required = True
    end
    object IBQCAD_COMBUSTIVELNM_COMBUSTIVEL: TIBStringField
      FieldName = 'NM_COMBUSTIVEL'
      Origin = 'CAD_COMBUSTIVEL.NM_COMBUSTIVEL'
      Required = True
      Size = 50
    end
    object IBQCAD_COMBUSTIVELDT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_COMBUSTIVEL.DT_TRANSACAO'
      Required = True
    end
  end
  object CAD_VEICULO: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_VEICULO'
      'where'
      '  CD_VEICULO = :OLD_CD_VEICULO')
    InsertSQL.Strings = (
      'insert into CAD_VEICULO'
      '  (CD_COMBUSTIVEL, CD_CIDADE_PLACA, CD_COR, CD_TIPO_VEICULO, '
      'CD_MODELO, '
      '   DS_PLACA, NR_CHASSI, NR_RENAVAM, DS_VEICULO, NR_EIXOS, '
      'DS_ANO_FABRICACAO, '
      '   DS_ANO_MODELO, VL_ODOMETRO, VL_HORIMETRO, DT_TRANSACAO)'
      'values'
      
        '  (:CD_COMBUSTIVEL, :CD_CIDADE_PLACA, :CD_COR, :CD_TIPO_VEICULO,' +
        ' '
      ':CD_MODELO, '
      '   :DS_PLACA, :NR_CHASSI, :NR_RENAVAM, :DS_VEICULO, :NR_EIXOS, '
      ':DS_ANO_FABRICACAO, '
      '   :DS_ANO_MODELO, :VL_ODOMETRO, :VL_HORIMETRO, :DT_TRANSACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_VEICULO,'
      '  CD_COMBUSTIVEL,'
      '  CD_CIDADE_PLACA,'
      '  CD_COR,'
      '  CD_TIPO_VEICULO,'
      '  CD_MODELO,'
      '  DS_PLACA,'
      '  NR_CHASSI,'
      '  NR_RENAVAM,'
      '  DS_VEICULO,'
      '  NR_EIXOS,'
      '  DS_ANO_FABRICACAO,'
      '  DS_ANO_MODELO,'
      '  VL_ODOMETRO,'
      '  VL_HORIMETRO,'
      '  DT_TRANSACAO'
      'from CAD_VEICULO '
      'where'
      '  CD_VEICULO = :CD_VEICULO')
    SelectSQL.Strings = (
      'select * from CAD_VEICULO where CD_VEICULO = :PCDVEICULO')
    ModifySQL.Strings = (
      'update CAD_VEICULO'
      'set'
      '  CD_COMBUSTIVEL = :CD_COMBUSTIVEL,'
      '  CD_CIDADE_PLACA = :CD_CIDADE_PLACA,'
      '  CD_COR = :CD_COR,'
      '  CD_TIPO_VEICULO = :CD_TIPO_VEICULO,'
      '  CD_MODELO = :CD_MODELO,'
      '  DS_PLACA = :DS_PLACA,'
      '  NR_CHASSI = :NR_CHASSI,'
      '  NR_RENAVAM = :NR_RENAVAM,'
      '  DS_VEICULO = :DS_VEICULO,'
      '  NR_EIXOS = :NR_EIXOS,'
      '  DS_ANO_FABRICACAO = :DS_ANO_FABRICACAO,'
      '  DS_ANO_MODELO = :DS_ANO_MODELO,'
      '  VL_ODOMETRO = :VL_ODOMETRO,'
      '  VL_HORIMETRO = :VL_HORIMETRO,'
      '  DT_TRANSACAO = :DT_TRANSACAO'
      'where'
      '  CD_VEICULO = :OLD_CD_VEICULO')
    Active = True
    Left = 229
    Top = 16
    object CAD_VEICULOCD_VEICULO: TIntegerField
      FieldName = 'CD_VEICULO'
      Origin = 'CAD_VEICULO.CD_VEICULO'
      Required = True
    end
    object CAD_VEICULOCD_COMBUSTIVEL: TIntegerField
      FieldName = 'CD_COMBUSTIVEL'
      Origin = 'CAD_VEICULO.CD_COMBUSTIVEL'
      Required = True
    end
    object CAD_VEICULOCD_CIDADE_PLACA: TIntegerField
      FieldName = 'CD_CIDADE_PLACA'
      Origin = 'CAD_VEICULO.CD_CIDADE_PLACA'
      Required = True
    end
    object CAD_VEICULOCD_COR: TIntegerField
      FieldName = 'CD_COR'
      Origin = 'CAD_VEICULO.CD_COR'
      Required = True
    end
    object CAD_VEICULOCD_TIPO_VEICULO: TIntegerField
      FieldName = 'CD_TIPO_VEICULO'
      Origin = 'CAD_VEICULO.CD_TIPO_VEICULO'
      Required = True
    end
    object CAD_VEICULOCD_MODELO: TIntegerField
      FieldName = 'CD_MODELO'
      Origin = 'CAD_VEICULO.CD_MODELO'
      Required = True
    end
    object CAD_VEICULODS_PLACA: TIBStringField
      FieldName = 'DS_PLACA'
      Origin = 'CAD_VEICULO.DS_PLACA'
      Size = 8
    end
    object CAD_VEICULONR_CHASSI: TIBStringField
      FieldName = 'NR_CHASSI'
      Origin = 'CAD_VEICULO.NR_CHASSI'
    end
    object CAD_VEICULONR_RENAVAM: TIBStringField
      FieldName = 'NR_RENAVAM'
      Origin = 'CAD_VEICULO.NR_RENAVAM'
      Size = 11
    end
    object CAD_VEICULODS_VEICULO: TIBStringField
      FieldName = 'DS_VEICULO'
      Origin = 'CAD_VEICULO.DS_VEICULO'
      Size = 60
    end
    object CAD_VEICULONR_EIXOS: TIntegerField
      FieldName = 'NR_EIXOS'
      Origin = 'CAD_VEICULO.NR_EIXOS'
    end
    object CAD_VEICULODS_ANO_FABRICACAO: TIntegerField
      FieldName = 'DS_ANO_FABRICACAO'
      Origin = 'CAD_VEICULO.DS_ANO_FABRICACAO'
    end
    object CAD_VEICULODS_ANO_MODELO: TIntegerField
      FieldName = 'DS_ANO_MODELO'
      Origin = 'CAD_VEICULO.DS_ANO_MODELO'
    end
    object CAD_VEICULOVL_ODOMETRO: TFloatField
      FieldName = 'VL_ODOMETRO'
      Origin = 'CAD_VEICULO.VL_ODOMETRO'
    end
    object CAD_VEICULOVL_HORIMETRO: TFloatField
      FieldName = 'VL_HORIMETRO'
      Origin = 'CAD_VEICULO.VL_HORIMETRO'
    end
    object CAD_VEICULODT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_VEICULO.DT_TRANSACAO'
      Required = True
    end
  end
  object IBQCAD_VEICULO: TIBQuery
    Database = Conection
    Transaction = Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select v.cd_veiculo, v.ds_veiculo, v.cd_cor, cor.ds_cor, v.cd_co' +
        'mbustivel, comb.nm_combustivel,'
      
        'v.cd_cidade_placa, cidade.nm_cidade, v.cd_tipo_veiculo, tpveicul' +
        'o.nm_tipo_veiculo,'
      
        'v.cd_modelo, modelo.ds_modelo, v.ds_placa, v.nr_chassi, v.nr_ren' +
        'avam, v.nr_eixos, v.ds_ano_fabricacao,'
      'v.ds_ano_modelo, v.vl_odometro, v.vl_horimetro, v.dt_transacao '
      'from cad_veiculo v'
      'inner join cad_cor cor on (v.cd_cor = cor.cd_cor)'
      
        'inner join cad_combustivel comb on (v.cd_combustivel = comb.cd_c' +
        'ombustivel)'
      
        'inner join cad_cidade cidade on (v.cd_cidade_placa = cidade.cd_c' +
        'idade)'
      
        'inner join cad_tipo_veiculo tpveiculo on (v.cd_tipo_veiculo = tp' +
        'veiculo.cd_tipo_veiculo)'
      'inner join cad_modelo modelo on (v.cd_modelo = modelo.cd_modelo)')
    Left = 456
    Top = 8
    object IBQCAD_VEICULOCD_VEICULO: TIntegerField
      FieldName = 'CD_VEICULO'
      Origin = 'CAD_VEICULO.CD_VEICULO'
      Required = True
    end
    object IBQCAD_VEICULODS_VEICULO: TIBStringField
      FieldName = 'DS_VEICULO'
      Origin = 'CAD_VEICULO.DS_VEICULO'
      Size = 60
    end
    object IBQCAD_VEICULOCD_COR: TIntegerField
      FieldName = 'CD_COR'
      Origin = 'CAD_VEICULO.CD_COR'
      Required = True
    end
    object IBQCAD_VEICULODS_COR: TIBStringField
      FieldName = 'DS_COR'
      Origin = 'CAD_COR.DS_COR'
      Required = True
      Size = 50
    end
    object IBQCAD_VEICULOCD_COMBUSTIVEL: TIntegerField
      FieldName = 'CD_COMBUSTIVEL'
      Origin = 'CAD_VEICULO.CD_COMBUSTIVEL'
      Required = True
    end
    object IBQCAD_VEICULONM_COMBUSTIVEL: TIBStringField
      FieldName = 'NM_COMBUSTIVEL'
      Origin = 'CAD_COMBUSTIVEL.NM_COMBUSTIVEL'
      Required = True
      Size = 50
    end
    object IBQCAD_VEICULOCD_CIDADE_PLACA: TIntegerField
      FieldName = 'CD_CIDADE_PLACA'
      Origin = 'CAD_VEICULO.CD_CIDADE_PLACA'
      Required = True
    end
    object IBQCAD_VEICULONM_CIDADE: TIBStringField
      FieldName = 'NM_CIDADE'
      Origin = 'CAD_CIDADE.NM_CIDADE'
      Size = 50
    end
    object IBQCAD_VEICULOCD_TIPO_VEICULO: TIntegerField
      FieldName = 'CD_TIPO_VEICULO'
      Origin = 'CAD_VEICULO.CD_TIPO_VEICULO'
      Required = True
    end
    object IBQCAD_VEICULONM_TIPO_VEICULO: TIBStringField
      FieldName = 'NM_TIPO_VEICULO'
      Origin = 'CAD_TIPO_VEICULO.NM_TIPO_VEICULO'
      Required = True
      Size = 50
    end
    object IBQCAD_VEICULOCD_MODELO: TIntegerField
      FieldName = 'CD_MODELO'
      Origin = 'CAD_VEICULO.CD_MODELO'
      Required = True
    end
    object IBQCAD_VEICULODS_MODELO: TIBStringField
      FieldName = 'DS_MODELO'
      Origin = 'CAD_MODELO.DS_MODELO'
      Required = True
      Size = 50
    end
    object IBQCAD_VEICULODS_PLACA: TIBStringField
      FieldName = 'DS_PLACA'
      Origin = 'CAD_VEICULO.DS_PLACA'
      Size = 8
    end
    object IBQCAD_VEICULONR_CHASSI: TIBStringField
      FieldName = 'NR_CHASSI'
      Origin = 'CAD_VEICULO.NR_CHASSI'
    end
    object IBQCAD_VEICULONR_RENAVAM: TIBStringField
      FieldName = 'NR_RENAVAM'
      Origin = 'CAD_VEICULO.NR_RENAVAM'
      Size = 11
    end
    object IBQCAD_VEICULONR_EIXOS: TIntegerField
      FieldName = 'NR_EIXOS'
      Origin = 'CAD_VEICULO.NR_EIXOS'
    end
    object IBQCAD_VEICULODS_ANO_FABRICACAO: TIntegerField
      FieldName = 'DS_ANO_FABRICACAO'
      Origin = 'CAD_VEICULO.DS_ANO_FABRICACAO'
    end
    object IBQCAD_VEICULODS_ANO_MODELO: TIntegerField
      FieldName = 'DS_ANO_MODELO'
      Origin = 'CAD_VEICULO.DS_ANO_MODELO'
    end
    object IBQCAD_VEICULOVL_ODOMETRO: TFloatField
      FieldName = 'VL_ODOMETRO'
      Origin = 'CAD_VEICULO.VL_ODOMETRO'
    end
    object IBQCAD_VEICULOVL_HORIMETRO: TFloatField
      FieldName = 'VL_HORIMETRO'
      Origin = 'CAD_VEICULO.VL_HORIMETRO'
    end
    object IBQCAD_VEICULODT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_VEICULO.DT_TRANSACAO'
      Required = True
    end
  end
  object CAD_TIPO_CARGA: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_TIPO_CARGA'
      'where'
      '  CD_TIPO_CARGA = :OLD_CD_TIPO_CARGA')
    InsertSQL.Strings = (
      'insert into CAD_TIPO_CARGA'
      '  (DS_TIPO_CARGA, DT_TRANSACAO)'
      'values'
      '  (:DS_TIPO_CARGA, :DT_TRANSACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_TIPO_CARGA,'
      '  DS_TIPO_CARGA,'
      '  DT_TRANSACAO'
      'from CAD_TIPO_CARGA '
      'where'
      '  CD_TIPO_CARGA = :CD_TIPO_CARGA')
    SelectSQL.Strings = (
      'select * from CAD_TIPO_CARGA where CD_TIPO_CARGA = :PCDTIPOCARGA')
    ModifySQL.Strings = (
      'update CAD_TIPO_CARGA'
      'set'
      '  DS_TIPO_CARGA = :DS_TIPO_CARGA,'
      '  DT_TRANSACAO = :DT_TRANSACAO'
      'where'
      '  CD_TIPO_CARGA = :OLD_CD_TIPO_CARGA')
    Active = True
    Left = 234
    Top = 80
    object CAD_TIPO_CARGACD_TIPO_CARGA: TIntegerField
      FieldName = 'CD_TIPO_CARGA'
      Origin = 'CAD_TIPO_CARGA.CD_TIPO_CARGA'
      Required = True
    end
    object CAD_TIPO_CARGADS_TIPO_CARGA: TIBStringField
      FieldName = 'DS_TIPO_CARGA'
      Origin = 'CAD_TIPO_CARGA.DS_TIPO_CARGA'
      Required = True
      Size = 100
    end
    object CAD_TIPO_CARGADT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_TIPO_CARGA.DT_TRANSACAO'
      Required = True
    end
  end
  object IBQCAD_TIPO_CARGA: TIBQuery
    Database = Conection
    Transaction = Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CAD_TIPO_CARGA')
    Left = 456
    Top = 72
    object IBQCAD_TIPO_CARGACD_TIPO_CARGA: TIntegerField
      FieldName = 'CD_TIPO_CARGA'
      Origin = 'CAD_TIPO_CARGA.CD_TIPO_CARGA'
      Required = True
    end
    object IBQCAD_TIPO_CARGADS_TIPO_CARGA: TIBStringField
      FieldName = 'DS_TIPO_CARGA'
      Origin = 'CAD_TIPO_CARGA.DS_TIPO_CARGA'
      Required = True
      Size = 100
    end
    object IBQCAD_TIPO_CARGADT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_TIPO_CARGA.DT_TRANSACAO'
      Required = True
    end
  end
  object CAD_PESSOA: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_PESSOA'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    InsertSQL.Strings = (
      'insert into CAD_PESSOA'
      '  (NM_RZ_SOCIAL, TP_PESSOA, DT_TRANSACAO)'
      'values'
      '  (:NM_RZ_SOCIAL, :TP_PESSOA, :DT_TRANSACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_PESSOA,'
      '  NM_RZ_SOCIAL,'
      '  TP_PESSOA,'
      '  DT_TRANSACAO'
      'from CAD_PESSOA '
      'where'
      '  CD_PESSOA = :CD_PESSOA')
    SelectSQL.Strings = (
      'select * from CAD_PESSOA where CD_PESSOA = :PCDPESSOA')
    ModifySQL.Strings = (
      'update CAD_PESSOA'
      'set'
      '  NM_RZ_SOCIAL = :NM_RZ_SOCIAL,'
      '  TP_PESSOA = :TP_PESSOA,'
      '  DT_TRANSACAO = :DT_TRANSACAO'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    Active = True
    Left = 232
    Top = 136
    object CAD_PESSOACD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'CAD_PESSOA.CD_PESSOA'
      Required = True
    end
    object CAD_PESSOANM_RZ_SOCIAL: TIBStringField
      FieldName = 'NM_RZ_SOCIAL'
      Origin = 'CAD_PESSOA.NM_RZ_SOCIAL'
      Required = True
      Size = 100
    end
    object CAD_PESSOATP_PESSOA: TIBStringField
      FieldName = 'TP_PESSOA'
      Origin = 'CAD_PESSOA.TP_PESSOA'
      FixedChar = True
      Size = 1
    end
    object CAD_PESSOADT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_PESSOA.DT_TRANSACAO'
      Required = True
    end
  end
  object CAD_FISICA: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_FISICA'
      'where'
      '  NR_RG = :OLD_NR_RG and'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    InsertSQL.Strings = (
      'insert into CAD_FISICA'
      '  (CD_PESSOA, NR_CPF, DT_NASCIMENTO, IN_SEXO)'
      'values'
      '  (:CD_PESSOA, :NR_CPF, :DT_NASCIMENTO, :IN_SEXO)')
    RefreshSQL.Strings = (
      'Select '
      '  NR_RG,'
      '  CD_PESSOA,'
      '  NR_CPF,'
      '  DT_NASCIMENTO,'
      '  IN_SEXO'
      'from CAD_FISICA '
      'where'
      '  NR_RG = :NR_RG and'
      '  CD_PESSOA = :CD_PESSOA')
    SelectSQL.Strings = (
      
        'select * from CAD_FISICA where CD_PESSOA = :PCDPESSOA and NR_RG ' +
        '= :PCDRG')
    ModifySQL.Strings = (
      'update CAD_FISICA'
      'set'
      '  NR_CPF = :NR_CPF,'
      '  DT_NASCIMENTO = :DT_NASCIMENTO,'
      '  IN_SEXO = :IN_SEXO'
      'where'
      '  NR_RG = :OLD_NR_RG and'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    Active = True
    Left = 232
    Top = 200
    object CAD_FISICANR_RG: TIBStringField
      FieldName = 'NR_RG'
      Origin = 'CAD_FISICA.NR_RG'
      Required = True
      Size = 15
    end
    object CAD_FISICACD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'CAD_FISICA.CD_PESSOA'
      Required = True
    end
    object CAD_FISICANR_CPF: TIBStringField
      FieldName = 'NR_CPF'
      Origin = 'CAD_FISICA.NR_CPF'
      Size = 11
    end
    object CAD_FISICADT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'CAD_FISICA.DT_NASCIMENTO'
    end
    object CAD_FISICAIN_SEXO: TIBStringField
      FieldName = 'IN_SEXO'
      Origin = 'CAD_FISICA.IN_SEXO'
      FixedChar = True
      Size = 1
    end
  end
  object CAD_JURIDICA: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_JURIDICA'
      'where'
      '  NR_CNPJ = :OLD_NR_CNPJ')
    InsertSQL.Strings = (
      'insert into CAD_JURIDICA'
      '  (CD_PESSOA, NR_CNPJ, NR_INSC_EST, NM_FANTASIA)'
      'values'
      '  (:CD_PESSOA, :NR_CNPJ, :NR_INSC_EST, :NM_FANTASIA)')
    RefreshSQL.Strings = (
      'Select '
      '  NR_CNPJ,'
      '  CD_PESSOA,'
      '  NR_INSC_EST,'
      '  NM_FANTASIA'
      'from CAD_JURIDICA '
      'where'
      '  NR_CNPJ = :NR_CNPJ')
    SelectSQL.Strings = (
      
        'select * from CAD_JURIDICA where CD_PESSOA = :PCDPESSOA and NR_C' +
        'NPJ = :PCDCNPJ')
    ModifySQL.Strings = (
      'update CAD_JURIDICA'
      'set'
      '  NR_INSC_EST = :NR_INSC_EST,'
      '  NM_FANTASIA = :NM_FANTASIA'
      'where'
      '  NR_CNPJ = :OLD_NR_CNPJ')
    Active = True
    Left = 232
    Top = 256
    object CAD_JURIDICANR_CNPJ: TIBStringField
      FieldName = 'NR_CNPJ'
      Origin = 'CAD_JURIDICA.NR_CNPJ'
      Required = True
      Size = 14
    end
    object CAD_JURIDICACD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'CAD_JURIDICA.CD_PESSOA'
      Required = True
    end
    object CAD_JURIDICANR_INSC_EST: TIBStringField
      FieldName = 'NR_INSC_EST'
      Origin = 'CAD_JURIDICA.NR_INSC_EST'
      Size = 15
    end
    object CAD_JURIDICANM_FANTASIA: TIBStringField
      FieldName = 'NM_FANTASIA'
      Origin = 'CAD_JURIDICA.NM_FANTASIA'
      Size = 60
    end
  end
  object CAD_CLIENTE: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_CLIENTE'
      'where'
      '  CD_CLIENTE = :OLD_CD_CLIENTE')
    InsertSQL.Strings = (
      'insert into CAD_CLIENTE'
      '  (CD_PESSOA, DT_TRANSACAO)'
      'values'
      '  (:CD_PESSOA, :DT_TRANSACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_CLIENTE,'
      '  CD_PESSOA,'
      '  DT_TRANSACAO'
      'from CAD_CLIENTE '
      'where'
      '  CD_CLIENTE = :CD_CLIENTE')
    SelectSQL.Strings = (
      'select * from CAD_CLIENTE where CD_CLIENTE = :PCDCLIENTE')
    ModifySQL.Strings = (
      'update CAD_CLIENTE'
      'set'
      '  CD_PESSOA = :CD_PESSOA,'
      '  DT_TRANSACAO = :DT_TRANSACAO'
      'where'
      '  CD_CLIENTE = :OLD_CD_CLIENTE')
    Active = True
    Left = 232
    Top = 320
    object CAD_CLIENTECD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CAD_CLIENTE.CD_CLIENTE'
      Required = True
    end
    object CAD_CLIENTECD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'CAD_CLIENTE.CD_PESSOA'
      Required = True
    end
    object CAD_CLIENTEDT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_CLIENTE.DT_TRANSACAO'
      Required = True
    end
  end
  object CAD_MOTORISTA: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_MOTORISTA'
      'where'
      '  CD_MOTORISTA = :OLD_CD_MOTORISTA')
    InsertSQL.Strings = (
      'insert into CAD_MOTORISTA'
      '  (CD_PESSOA, NR_CNH, DS_CATEG_CNH, DT_TRANSACAO)'
      'values'
      '  (:CD_PESSOA, :NR_CNH, :DS_CATEG_CNH, :DT_TRANSACAO)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_MOTORISTA,'
      '  CD_PESSOA,'
      '  NR_CNH,'
      '  DS_CATEG_CNH,'
      '  DT_TRANSACAO'
      'from CAD_MOTORISTA '
      'where'
      '  CD_MOTORISTA = :CD_MOTORISTA')
    SelectSQL.Strings = (
      'select * from CAD_MOTORISTA where CD_MOTORISTA = :PCDMOTORISTA')
    ModifySQL.Strings = (
      'update CAD_MOTORISTA'
      'set'
      '  CD_PESSOA = :CD_PESSOA,'
      '  NR_CNH = :NR_CNH,'
      '  DS_CATEG_CNH = :DS_CATEG_CNH,'
      '  DT_TRANSACAO = :DT_TRANSACAO'
      'where'
      '  CD_MOTORISTA = :OLD_CD_MOTORISTA')
    Active = True
    Left = 232
    Top = 376
  end
  object IBQCAD_ENDERECO: TIBQuery
    Database = Conection
    Transaction = Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select endereco.cd_pessoa, endereco.nr_seq, endereco.ds_logradou' +
        'ro, endereco.ds_numero, endereco.ds_bairro, endereco.ds_cep, end' +
        'ereco.dt_transacao, endereco.cd_cidade, cidade.nm_cidade'
      'from cad_endereco endereco'
      
        'inner join cad_cidade cidade on (endereco.cd_cidade = cidade.cd_' +
        'cidade)'
      'where endereco.cd_pessoa = :PCDPESSOA')
    Left = 464
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PCDPESSOA'
        ParamType = ptUnknown
      end>
    object IBQCAD_ENDERECOCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'CAD_ENDERECO.CD_PESSOA'
      Required = True
    end
    object IBQCAD_ENDERECONR_SEQ: TIntegerField
      FieldName = 'NR_SEQ'
      Origin = 'CAD_ENDERECO.NR_SEQ'
      Required = True
    end
    object IBQCAD_ENDERECODS_LOGRADOURO: TIBStringField
      FieldName = 'DS_LOGRADOURO'
      Origin = 'CAD_ENDERECO.DS_LOGRADOURO'
      Size = 100
    end
    object IBQCAD_ENDERECODS_NUMERO: TIBStringField
      FieldName = 'DS_NUMERO'
      Origin = 'CAD_ENDERECO.DS_NUMERO'
      FixedChar = True
      Size = 30
    end
    object IBQCAD_ENDERECODS_BAIRRO: TIBStringField
      FieldName = 'DS_BAIRRO'
      Origin = 'CAD_ENDERECO.DS_BAIRRO'
      Size = 60
    end
    object IBQCAD_ENDERECODS_CEP: TIBStringField
      FieldName = 'DS_CEP'
      Origin = 'CAD_ENDERECO.DS_CEP'
      Size = 8
    end
    object IBQCAD_ENDERECODT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_ENDERECO.DT_TRANSACAO'
      Required = True
    end
    object IBQCAD_ENDERECOCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CAD_ENDERECO.CD_CIDADE'
      Required = True
    end
    object IBQCAD_ENDERECONM_CIDADE: TIBStringField
      FieldName = 'NM_CIDADE'
      Origin = 'CAD_CIDADE.NM_CIDADE'
      Size = 50
    end
  end
  object CAD_CONTATO: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_CONTATO'
      'where'
      '  NR_SEQ = :OLD_NR_SEQ and'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    InsertSQL.Strings = (
      'insert into CAD_CONTATO'
      '  (CD_PESSOA, NM_CONTATO, NR_TELEFONE, DS_EMAIL)'
      'values'
      '  (:CD_PESSOA, :NM_CONTATO, :NR_TELEFONE, :DS_EMAIL)')
    RefreshSQL.Strings = (
      'Select '
      '  NR_SEQ,'
      '  CD_PESSOA,'
      '  NM_CONTATO,'
      '  NR_TELEFONE,'
      '  DS_EMAIL'
      'from CAD_CONTATO '
      'where'
      '  NR_SEQ = :NR_SEQ and'
      '  CD_PESSOA = :CD_PESSOA')
    SelectSQL.Strings = (
      'select * from CAD_CONTATO where CD_PESSOA = :PCDPESSOA')
    ModifySQL.Strings = (
      'update CAD_CONTATO'
      'set'
      '  NM_CONTATO = :NM_CONTATO,'
      '  NR_TELEFONE = :NR_TELEFONE,'
      '  DS_EMAIL = :DS_EMAIL'
      'where'
      '  NR_SEQ = :OLD_NR_SEQ and'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    Active = True
    Left = 232
    Top = 504
    object CAD_CONTATONR_SEQ: TIntegerField
      DisplayWidth = 12
      FieldName = 'NR_SEQ'
      Origin = 'CAD_CONTATO.NR_SEQ'
      Required = True
    end
    object CAD_CONTATOCD_PESSOA: TIntegerField
      DisplayWidth = 13
      FieldName = 'CD_PESSOA'
      Origin = 'CAD_CONTATO.CD_PESSOA'
      Required = True
    end
    object CAD_CONTATONM_CONTATO: TIBStringField
      DisplayWidth = 24
      FieldName = 'NM_CONTATO'
      Origin = 'CAD_CONTATO.NM_CONTATO'
      Required = True
      Size = 60
    end
    object CAD_CONTATONR_TELEFONE: TIBStringField
      DisplayWidth = 16
      FieldName = 'NR_TELEFONE'
      Origin = 'CAD_CONTATO.NR_TELEFONE'
      Size = 12
    end
    object CAD_CONTATODS_EMAIL: TIBStringField
      DisplayWidth = 14
      FieldName = 'DS_EMAIL'
      Origin = 'CAD_CONTATO.DS_EMAIL'
      Size = 30
    end
  end
  object CAD_ENDERECO: TIBDataSet
    Database = Conection
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAD_ENDERECO'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA and'
      '  NR_SEQ = :OLD_NR_SEQ')
    InsertSQL.Strings = (
      'insert into CAD_ENDERECO'
      '  (CD_PESSOA, DS_LOGRADOURO, DS_NUMERO, DS_BAIRRO, DS_CEP, '
      'DT_TRANSACAO, CD_CIDADE)'
      'values'
      '  (:CD_PESSOA, :DS_LOGRADOURO, :DS_NUMERO, :DS_BAIRRO, :DS_CEP, '
      ':DT_TRANSACAO, :CD_CIDADE)')
    RefreshSQL.Strings = (
      'Select '
      '  CD_PESSOA,'
      '  NR_SEQ,'
      '  DS_LOGRADOURO,'
      '  DS_NUMERO,'
      '  DS_BAIRRO,'
      '  DS_CEP,'
      '  DT_TRANSACAO,'
      '  CD_CIDADE'
      'from CAD_ENDERECO '
      'where'
      '  CD_PESSOA = :CD_PESSOA and'
      '  NR_SEQ = :NR_SEQ')
    SelectSQL.Strings = (
      
        'select * from CAD_ENDERECO where CD_PESSOA = :PCDPESSOA and NR_S' +
        'EQ = :PCDSEQ')
    ModifySQL.Strings = (
      'update CAD_ENDERECO'
      'set'
      '  DS_LOGRADOURO = :DS_LOGRADOURO,'
      '  DS_NUMERO = :DS_NUMERO,'
      '  DS_BAIRRO = :DS_BAIRRO,'
      '  DS_CEP = :DS_CEP,'
      '  DT_TRANSACAO = :DT_TRANSACAO,'
      '  CD_CIDADE = :CD_CIDADE'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA and'
      '  NR_SEQ = :OLD_NR_SEQ')
    Active = True
    Left = 232
    Top = 440
    object CAD_ENDERECOCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'CAD_ENDERECO.CD_PESSOA'
      Required = True
    end
    object CAD_ENDERECONR_SEQ: TIntegerField
      FieldName = 'NR_SEQ'
      Origin = 'CAD_ENDERECO.NR_SEQ'
      Required = True
    end
    object CAD_ENDERECODS_LOGRADOURO: TIBStringField
      FieldName = 'DS_LOGRADOURO'
      Origin = 'CAD_ENDERECO.DS_LOGRADOURO'
      Size = 100
    end
    object CAD_ENDERECODS_NUMERO: TIBStringField
      FieldName = 'DS_NUMERO'
      Origin = 'CAD_ENDERECO.DS_NUMERO'
      FixedChar = True
      Size = 30
    end
    object CAD_ENDERECODS_BAIRRO: TIBStringField
      FieldName = 'DS_BAIRRO'
      Origin = 'CAD_ENDERECO.DS_BAIRRO'
      Size = 60
    end
    object CAD_ENDERECODS_CEP: TIBStringField
      FieldName = 'DS_CEP'
      Origin = 'CAD_ENDERECO.DS_CEP'
      Size = 8
    end
    object CAD_ENDERECODT_TRANSACAO: TDateField
      FieldName = 'DT_TRANSACAO'
      Origin = 'CAD_ENDERECO.DT_TRANSACAO'
      Required = True
    end
    object CAD_ENDERECOCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = 'CAD_ENDERECO.CD_CIDADE'
      Required = True
    end
  end
end
