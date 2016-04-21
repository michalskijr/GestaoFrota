unit DMUnit;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase, IBQuery;

type
  TDM = class(TDataModule)
    Conection: TIBDatabase;
    Transaction: TIBTransaction;
    CAD_PAIS: TIBDataSet;
    CAD_UF: TIBDataSet;
    CAD_CIDADE: TIBDataSet;
    CAD_PAISCD_PAIS: TIntegerField;
    CAD_PAISNM_PAIS: TIBStringField;
    CAD_PAISDT_TRANSACAO: TDateField;
    CAD_UFCD_UF: TIntegerField;
    CAD_UFSG_UF: TIBStringField;
    CAD_UFNM_UF: TIBStringField;
    CAD_UFDT_TRANSACAO: TDateField;
    CAD_UFCD_PAIS: TIntegerField;
    CAD_CIDADECD_CIDADE: TIntegerField;
    CAD_CIDADENM_CIDADE: TIBStringField;
    CAD_CIDADEDT_TRANSACAO: TDateField;
    CAD_CIDADECD_UF: TIntegerField;
    IBQCAD_PAIS: TIBQuery;
    IBQCAD_PAISCD_PAIS: TIntegerField;
    IBQCAD_PAISNM_PAIS: TIBStringField;
    IBQCAD_PAISDT_TRANSACAO: TDateField;
    IBQCAD_ESTADO: TIBQuery;
    IBQCAD_CIDADE: TIBQuery;
    IBQCAD_ESTADOCD_UF: TIntegerField;
    IBQCAD_ESTADOSG_UF: TIBStringField;
    IBQCAD_ESTADONM_UF: TIBStringField;
    IBQCAD_ESTADODT_TRANSACAO: TDateField;
    IBQCAD_ESTADOCD_PAIS: TIntegerField;
    IBQCAD_CIDADECD_CIDADE: TIntegerField;
    IBQCAD_CIDADENM_CIDADE: TIBStringField;
    IBQCAD_CIDADEDT_TRANSACAO: TDateField;
    IBQCAD_CIDADECD_UF: TIntegerField;
    IBQCAD_ESTADONM_PAIS: TIBStringField;
    IBQCAD_CIDADENM_UF: TIBStringField;
    CAD_MARCA: TIBDataSet;
    CAD_MARCACD_MARCA: TIntegerField;
    CAD_MARCANM_MARCA: TIBStringField;
    CAD_MARCADT_TRANSACAO: TDateField;
    IBQCAD_MARCA: TIBQuery;
    IBQCAD_MARCACD_MARCA: TIntegerField;
    IBQCAD_MARCANM_MARCA: TIBStringField;
    IBQCAD_MARCADT_TRANSACAO: TDateField;
    CAD_MODELO: TIBDataSet;
    CAD_MODELOCD_MODELO: TIntegerField;
    CAD_MODELOCD_MARCA: TIntegerField;
    CAD_MODELODS_MODELO: TIBStringField;
    CAD_MODELODS_OBSERVACAO: TIBStringField;
    CAD_MODELODT_TRANSACAO: TDateField;
    IBQCAD_MODELO: TIBQuery;
    IBQCAD_MODELOCD_MODELO: TIntegerField;
    IBQCAD_MODELODS_MODELO: TIBStringField;
    IBQCAD_MODELOCD_MARCA: TIntegerField;
    IBQCAD_MODELONM_MARCA: TIBStringField;
    IBQCAD_MODELODS_OBSERVACAO: TIBStringField;
    IBQCAD_MODELODT_TRANSACAO: TDateField;
    CAD_TIPO_VEICULO: TIBDataSet;
    CAD_TIPO_VEICULOCD_TIPO_VEICULO: TIntegerField;
    CAD_TIPO_VEICULONM_TIPO_VEICULO: TIBStringField;
    CAD_TIPO_VEICULODT_TRANSACAO: TDateField;
    IBQCAD_TIPO_VEICULO: TIBQuery;
    IBQCAD_TIPO_VEICULOCD_TIPO_VEICULO: TIntegerField;
    IBQCAD_TIPO_VEICULONM_TIPO_VEICULO: TIBStringField;
    IBQCAD_TIPO_VEICULODT_TRANSACAO: TDateField;
    CAD_COR: TIBDataSet;
    CAD_CORCD_COR: TIntegerField;
    CAD_CORDS_COR: TIBStringField;
    CAD_CORDT_TRANSACAO: TDateField;
    IBQCAD_COR: TIBQuery;
    IBQCAD_CORCD_COR: TIntegerField;
    IBQCAD_CORDS_COR: TIBStringField;
    IBQCAD_CORDT_TRANSACAO: TDateField;
    CAD_COMBUSTIVEL: TIBDataSet;
    CAD_COMBUSTIVELCD_COMBUSTIVEL: TIntegerField;
    CAD_COMBUSTIVELNM_COMBUSTIVEL: TIBStringField;
    CAD_COMBUSTIVELDT_TRANSACAO: TDateField;
    IBQCAD_COMBUSTIVEL: TIBQuery;
    IBQCAD_COMBUSTIVELCD_COMBUSTIVEL: TIntegerField;
    IBQCAD_COMBUSTIVELNM_COMBUSTIVEL: TIBStringField;
    IBQCAD_COMBUSTIVELDT_TRANSACAO: TDateField;
    CAD_VEICULO: TIBDataSet;
    CAD_VEICULOCD_VEICULO: TIntegerField;
    CAD_VEICULOCD_COMBUSTIVEL: TIntegerField;
    CAD_VEICULOCD_CIDADE_PLACA: TIntegerField;
    CAD_VEICULOCD_COR: TIntegerField;
    CAD_VEICULOCD_TIPO_VEICULO: TIntegerField;
    CAD_VEICULOCD_MODELO: TIntegerField;
    CAD_VEICULODS_PLACA: TIBStringField;
    CAD_VEICULONR_CHASSI: TIBStringField;
    CAD_VEICULONR_RENAVAM: TIBStringField;
    CAD_VEICULODS_VEICULO: TIBStringField;
    CAD_VEICULONR_EIXOS: TIntegerField;
    CAD_VEICULODS_ANO_FABRICACAO: TIntegerField;
    CAD_VEICULODS_ANO_MODELO: TIntegerField;
    CAD_VEICULOVL_ODOMETRO: TFloatField;
    CAD_VEICULOVL_HORIMETRO: TFloatField;
    CAD_VEICULODT_TRANSACAO: TDateField;
    IBQCAD_VEICULO: TIBQuery;
    IBQCAD_VEICULOCD_VEICULO: TIntegerField;
    IBQCAD_VEICULODS_VEICULO: TIBStringField;
    IBQCAD_VEICULOCD_COR: TIntegerField;
    IBQCAD_VEICULODS_COR: TIBStringField;
    IBQCAD_VEICULOCD_COMBUSTIVEL: TIntegerField;
    IBQCAD_VEICULONM_COMBUSTIVEL: TIBStringField;
    IBQCAD_VEICULOCD_CIDADE_PLACA: TIntegerField;
    IBQCAD_VEICULONM_CIDADE: TIBStringField;
    IBQCAD_VEICULOCD_TIPO_VEICULO: TIntegerField;
    IBQCAD_VEICULONM_TIPO_VEICULO: TIBStringField;
    IBQCAD_VEICULOCD_MODELO: TIntegerField;
    IBQCAD_VEICULODS_MODELO: TIBStringField;
    IBQCAD_VEICULODS_PLACA: TIBStringField;
    IBQCAD_VEICULONR_CHASSI: TIBStringField;
    IBQCAD_VEICULONR_RENAVAM: TIBStringField;
    IBQCAD_VEICULONR_EIXOS: TIntegerField;
    IBQCAD_VEICULODS_ANO_FABRICACAO: TIntegerField;
    IBQCAD_VEICULODS_ANO_MODELO: TIntegerField;
    IBQCAD_VEICULOVL_ODOMETRO: TFloatField;
    IBQCAD_VEICULOVL_HORIMETRO: TFloatField;
    IBQCAD_VEICULODT_TRANSACAO: TDateField;
    CAD_TIPO_CARGA: TIBDataSet;
    CAD_TIPO_CARGACD_TIPO_CARGA: TIntegerField;
    CAD_TIPO_CARGADS_TIPO_CARGA: TIBStringField;
    CAD_TIPO_CARGADT_TRANSACAO: TDateField;
    IBQCAD_TIPO_CARGA: TIBQuery;
    IBQCAD_TIPO_CARGACD_TIPO_CARGA: TIntegerField;
    IBQCAD_TIPO_CARGADS_TIPO_CARGA: TIBStringField;
    IBQCAD_TIPO_CARGADT_TRANSACAO: TDateField;
    CAD_PESSOA: TIBDataSet;
    CAD_PESSOACD_PESSOA: TIntegerField;
    CAD_PESSOANM_RZ_SOCIAL: TIBStringField;
    CAD_PESSOATP_PESSOA: TIBStringField;
    CAD_PESSOADT_TRANSACAO: TDateField;
    CAD_FISICA: TIBDataSet;
    CAD_FISICANR_RG: TIBStringField;
    CAD_FISICACD_PESSOA: TIntegerField;
    CAD_FISICANR_CPF: TIBStringField;
    CAD_FISICADT_NASCIMENTO: TDateField;
    CAD_FISICAIN_SEXO: TIBStringField;
    CAD_JURIDICA: TIBDataSet;
    CAD_JURIDICANR_CNPJ: TIBStringField;
    CAD_JURIDICACD_PESSOA: TIntegerField;
    CAD_JURIDICANR_INSC_EST: TIBStringField;
    CAD_JURIDICANM_FANTASIA: TIBStringField;
    CAD_CLIENTE: TIBDataSet;
    CAD_CLIENTECD_CLIENTE: TIntegerField;
    CAD_CLIENTECD_PESSOA: TIntegerField;
    CAD_CLIENTEDT_TRANSACAO: TDateField;
    CAD_MOTORISTA: TIBDataSet;
    CAD_ENDERECO: TIBDataSet;
    CAD_ENDERECOCD_PESSOA: TIntegerField;
    CAD_ENDERECONR_SEQ: TIntegerField;
    CAD_ENDERECODS_LOGRADOURO: TIBStringField;
    CAD_ENDERECODS_NUMERO: TIBStringField;
    CAD_ENDERECODS_BAIRRO: TIBStringField;
    CAD_ENDERECODS_CEP: TIBStringField;
    CAD_ENDERECODT_TRANSACAO: TDateField;
    IBQCAD_ENDERECO: TIBQuery;
    IBQCAD_ENDERECOCD_PESSOA: TIntegerField;
    IBQCAD_ENDERECONR_SEQ: TIntegerField;
    IBQCAD_ENDERECODS_LOGRADOURO: TIBStringField;
    IBQCAD_ENDERECODS_NUMERO: TIBStringField;
    IBQCAD_ENDERECODS_BAIRRO: TIBStringField;
    IBQCAD_ENDERECODS_CEP: TIBStringField;
    IBQCAD_ENDERECODT_TRANSACAO: TDateField;
    CAD_CONTATO: TIBDataSet;
    CAD_CONTATONR_SEQ: TIntegerField;
    CAD_CONTATOCD_PESSOA: TIntegerField;
    CAD_CONTATONM_CONTATO: TIBStringField;
    CAD_CONTATONR_TELEFONE: TIBStringField;
    CAD_CONTATODS_EMAIL: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.