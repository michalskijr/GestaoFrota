unit FormPrincipalUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Pas1: TMenuItem;
    Estado1: TMenuItem;
    Cidade1: TMenuItem;
    Marca1: TMenuItem;
    Modelo1: TMenuItem;
    Consulta1: TMenuItem;
    Pasi1: TMenuItem;
    Estado2: TMenuItem;
    Cidade2: TMenuItem;
    Marca2: TMenuItem;
    Modelo2: TMenuItem;
    Ferramentas1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    ipoVeculo1: TMenuItem;
    ipoVeculo2: TMenuItem;
    Cor1: TMenuItem;
    Combustvel1: TMenuItem;
    Cor2: TMenuItem;
    Combustvel2: TMenuItem;
    Veculo1: TMenuItem;
    ipoCarga1: TMenuItem;
    Cliente1: TMenuItem;
    Motorista1: TMenuItem;
    Frete1: TMenuItem;
    procedure Pas1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Estado1Click(Sender: TObject);
    procedure Cidade1Click(Sender: TObject);
    procedure Marca1Click(Sender: TObject);
    procedure Pasi1Click(Sender: TObject);
    procedure Estado2Click(Sender: TObject);
    procedure Cidade2Click(Sender: TObject);
    procedure Marca2Click(Sender: TObject);
    procedure Modelo1Click(Sender: TObject);
    procedure Modelo2Click(Sender: TObject);
    procedure ipoVeculo1Click(Sender: TObject);
    procedure ipoVeculo2Click(Sender: TObject);
    procedure Cor1Click(Sender: TObject);
    procedure Cor2Click(Sender: TObject);
    procedure Combustvel1Click(Sender: TObject);
    procedure Combustvel2Click(Sender: TObject);
    procedure Veculo1Click(Sender: TObject);
    procedure ipoCarga1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Motorista1Click(Sender: TObject);
    procedure Frete1Click(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses CadPaisUnit, CadEstadoUnit, CadCidadeUnit, CadMarcaUnit, ConPaisUnit,
  ConEstadoUnit, ConCidadeUnit, ConMarcaUnit, CadModeloUnit, ConModeloUnit,
  CadTipoVeiculoUnit, ConTipoVeiculoUnit, CadCorUnit, ConCorUnit,
  CadCombustiveisUnit, ConCombustiveisUnit, CadVeiculoUnit,
  CadTipoCargaUnit, CadClienteUnit, CadContatoUnit, CadMotoristaUnit,
  MovFreteUnit;

{$R *.dfm}

procedure TFormPrincipal.Pas1Click(Sender: TObject);
begin
  FormCadPais.ShowModal;
end;

procedure TFormPrincipal.Button1Click(Sender: TObject);
begin
  FormCadPais.ShowModal;
end;

procedure TFormPrincipal.Estado1Click(Sender: TObject);
begin
  FormCadEstado.ShowModal;
end;


procedure TFormPrincipal.Cidade1Click(Sender: TObject);
begin
  FormCadCidade.ShowModal;
end;

procedure TFormPrincipal.Marca1Click(Sender: TObject);
begin
  FormCadMarca.ShowModal;
end;

procedure TFormPrincipal.Pasi1Click(Sender: TObject);
begin
  FormConsultaPais.ShowModal;
end;

procedure TFormPrincipal.Estado2Click(Sender: TObject);
begin
  FormConsultaEstado.ShowModal;
end;

procedure TFormPrincipal.Cidade2Click(Sender: TObject);
begin
  FormConsultaCidade.ShowModal;
end;

procedure TFormPrincipal.Marca2Click(Sender: TObject);
begin
  FormConsultaMarca.ShowModal;
end;

procedure TFormPrincipal.Modelo1Click(Sender: TObject);
begin
  FormCadModelo.ShowModal;
end;

procedure TFormPrincipal.Modelo2Click(Sender: TObject);
begin
  FormConsultaModelo.ShowModal;
end;

procedure TFormPrincipal.ipoVeculo1Click(Sender: TObject);
begin
  FormCadTipoVeiculo.ShowModal;
end;

procedure TFormPrincipal.ipoVeculo2Click(Sender: TObject);
begin
  FormConsultaTipoVeiculo.ShowModal;
end;

procedure TFormPrincipal.Cor1Click(Sender: TObject);
begin
  FormCadCor.ShowModal;
end;

procedure TFormPrincipal.Cor2Click(Sender: TObject);
begin
  FormConsultaCor.ShowModal;
end;

procedure TFormPrincipal.Combustvel1Click(Sender: TObject);
begin
  FormCadCombustiveis.ShowModal;
end;

procedure TFormPrincipal.Combustvel2Click(Sender: TObject);
begin
  FormConsultaCombustiveis.ShowModal;
end;

procedure TFormPrincipal.Veculo1Click(Sender: TObject);
begin
  FormCadVeiculo.ShowModal;
end;

procedure TFormPrincipal.ipoCarga1Click(Sender: TObject);
begin
  FormCadTipoCarga.ShowModal;
end;

procedure TFormPrincipal.Cliente1Click(Sender: TObject);
begin
  FormCadCliente.ShowModal;
end;

procedure TFormPrincipal.Motorista1Click(Sender: TObject);
begin
  FormCadMotorista.ShowModal;
end;

procedure TFormPrincipal.Frete1Click(Sender: TObject);
begin
  FormMovFrete.ShowModal;
end;

end.
