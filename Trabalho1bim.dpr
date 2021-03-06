program Trabalho1bim;

uses
  Forms,
  FormPrincipalUnit in 'FormPrincipalUnit.pas' {FormPrincipal},
  DMUnit in 'DMUnit.pas' {DM: TDataModule},
  CadPaisUnit in 'CadPaisUnit.pas' {FormCadPais},
  CadEstadoUnit in 'CadEstadoUnit.pas' {FormCadEstado},
  ConPaisUnit in 'ConPaisUnit.pas' {FormConsultaPais},
  ConEstadoUnit in 'ConEstadoUnit.pas' {FormConsultaEstado},
  CadCidadeUnit in 'CadCidadeUnit.pas' {FormCadCidade},
  ConCidadeUnit in 'ConCidadeUnit.pas' {FormConsultaCidade},
  CadMarcaUnit in 'CadMarcaUnit.pas' {FormCadMarca},
  ConMarcaUnit in 'ConMarcaUnit.pas' {FormConsultaMarca},
  CadModeloUnit in 'CadModeloUnit.pas' {FormCadModelo},
  ConModeloUnit in 'ConModeloUnit.pas' {FormConsultaModelo},
  CadTipoVeiculoUnit in 'CadTipoVeiculoUnit.pas' {FormCadTipoVeiculo},
  ConTipoVeiculoUnit in 'ConTipoVeiculoUnit.pas' {FormConsultaTipoVeiculo},
  CadCorUnit in 'CadCorUnit.pas' {FormCadCor},
  ConCorUnit in 'ConCorUnit.pas' {FormConsultaCor},
  CadCombustiveisUnit in 'CadCombustiveisUnit.pas' {FormCadCombustiveis},
  ConCombustiveisUnit in 'ConCombustiveisUnit.pas' {FormConsultaCombustiveis},
  CadVeiculoUnit in 'CadVeiculoUnit.pas' {FormCadVeiculo},
  ConVeiculoUnit in 'ConVeiculoUnit.pas' {FormConsultaVeiculo},
  CadTipoCargaUnit in 'CadTipoCargaUnit.pas' {FormCadTipoCarga},
  CadClienteUnit in 'CadClienteUnit.pas' {FormCadCliente},
  CadEnderecoUnit in 'CadEnderecoUnit.pas' {FormCadEndereco},
  CadContatoUnit in 'CadContatoUnit.pas' {FormCadContato},
  CadMotoristaUnit in 'CadMotoristaUnit.pas' {FormCadMotorista},
  NF in 'NF.pas' {Form1},
  MovFreteUnit in 'MovFreteUnit.pas' {FormMovFrete},
  ConClienteUnit in 'ConClienteUnit.pas' {FormConsultaCliente},
  ConTpCargaUnit in 'ConTpCargaUnit.pas' {FormConsultaTpCarga},
  ConMotoristaUnit in 'ConMotoristaUnit.pas' {FormConsultaMotorista};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormCadPais, FormCadPais);
  Application.CreateForm(TFormCadEstado, FormCadEstado);
  Application.CreateForm(TFormConsultaPais, FormConsultaPais);
  Application.CreateForm(TFormConsultaEstado, FormConsultaEstado);
  Application.CreateForm(TFormCadCidade, FormCadCidade);
  Application.CreateForm(TFormConsultaCidade, FormConsultaCidade);
  Application.CreateForm(TFormCadMarca, FormCadMarca);
  Application.CreateForm(TFormConsultaMarca, FormConsultaMarca);
  Application.CreateForm(TFormCadModelo, FormCadModelo);
  Application.CreateForm(TFormConsultaModelo, FormConsultaModelo);
  Application.CreateForm(TFormCadTipoVeiculo, FormCadTipoVeiculo);
  Application.CreateForm(TFormConsultaTipoVeiculo, FormConsultaTipoVeiculo);
  Application.CreateForm(TFormCadCor, FormCadCor);
  Application.CreateForm(TFormConsultaCor, FormConsultaCor);
  Application.CreateForm(TFormCadCombustiveis, FormCadCombustiveis);
  Application.CreateForm(TFormConsultaCombustiveis, FormConsultaCombustiveis);
  Application.CreateForm(TFormCadVeiculo, FormCadVeiculo);
  Application.CreateForm(TFormConsultaVeiculo, FormConsultaVeiculo);
  Application.CreateForm(TFormCadTipoCarga, FormCadTipoCarga);
  Application.CreateForm(TFormCadCliente, FormCadCliente);
  Application.CreateForm(TFormCadEndereco, FormCadEndereco);
  Application.CreateForm(TFormCadContato, FormCadContato);
  Application.CreateForm(TFormCadMotorista, FormCadMotorista);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormMovFrete, FormMovFrete);
  Application.CreateForm(TFormConsultaCliente, FormConsultaCliente);
  Application.CreateForm(TFormConsultaTpCarga, FormConsultaTpCarga);
  Application.CreateForm(TFormConsultaMotorista, FormConsultaMotorista);
  Application.Run;
end.
