unit ConCombustiveisUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB;

type
  TFormConsultaCombustiveis = class(TForm)
    Label6: TLabel;
    cbTipoConsulta: TComboBox;
    labelPesquisa: TLabel;
    edtValorPesquisa: TEdit;
    btnPesquisar: TBitBtn;
    GridConsulta: TDBGrid;
    btnNovo: TBitBtn;
    btnCancelar: TBitBtn;
    btnOk: TBitBtn;
    DataSourceConsulta: TDataSource;
    procedure btnPesquisarClick(Sender: TObject);
    procedure GridConsultaDblClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cbTipoConsultaSelect(Sender: TObject);
    procedure HabilitarCampo(Boolean: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure ComandosPesquisa(msg: String);
    procedure Select(SQL: String; Parametro: String; cod: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsultaCombustiveis: TFormConsultaCombustiveis;

implementation

uses DMUnit, CadCombustiveisUnit;

{$R *.dfm}

//Pesquisas
procedure TFormConsultaCombustiveis.btnPesquisarClick(Sender: TObject);
var
  cod : Integer;
  tipoConsulta : Integer;
  sqlSelect: String;

begin
  tipoConsulta := cbTipoConsulta.ItemIndex;
  sqlSelect := '';

  if(edtValorPesquisa.Text = '') and (tipoConsulta <> 0) then
    begin
      ComandosPesquisa('Informe um valor para a pesquisa!');
    end
  else
    begin
      case tipoConsulta of
        //Pesquisa geral
        0:
          begin
            sqlSelect := ('SELECT * FROM CAD_COMBUSTIVEL');
            Select(sqlSelect, '', cod);
          end;
        //Pesquisa por código
        1:
          begin
            if(not TryStrToInt(edtValorPesquisa.Text, cod)) then
              begin
                ComandosPesquisa('Informe um código para a pesquisa!');
              end;

            if(cod < 0) then
              begin
                ComandosPesquisa('Valor incorreto! Informe novamente!');
              end;

            sqlSelect := ('SELECT * FROM CAD_COMBUSTIVEL');
            sqlSelect := sqlSelect + (' WHERE CD_COMBUSTIVEL =:PCDCOMBUSTIVEL');

            Select(sqlSelect, 'PCDCOMBUSTIVEL', cod);
          end;
        //Pesquisa por nome
        2:
          begin
            sqlSelect := ('SELECT * FROM CAD_COMBUSTIVEL');
            sqlSelect := sqlSelect + (' WHERE NM_COMBUSTIVEL LIKE ''%' + edtValorPesquisa.Text + '%''');

            Select(sqlSelect, '', cod);
          end;
      else
        ShowMessage('Tipo de pesquisa incorreto!');
      end;
    end;
end;

//Comandos para pesquisa
procedure TFormConsultaCombustiveis.ComandosPesquisa(msg: String);
begin
  ShowMessage(msg);
  edtValorPesquisa.Clear;
  edtValorPesquisa.SetFocus;
  Abort;
end;

//Comando select
procedure TFormConsultaCombustiveis.Select(SQL: String; Parametro: String; cod: Integer);
begin
  DM.IBQCAD_COMBUSTIVEL.Active := TRUE;
  DM.IBQCAD_COMBUSTIVEL.Close;
  DM.IBQCAD_COMBUSTIVEL.SQL.Clear;
  DM.IBQCAD_COMBUSTIVEL.SQL.Add(SQL);
  if(Parametro <> '') then
    begin
      DM.IBQCAD_COMBUSTIVEL.ParamByName(Parametro).AsInteger := cod;
    end;
  DM.IBQCAD_COMBUSTIVEL.Open;
end;

//Duplo clique na Grid: Pega a linha selecionada e passa para a tela de cadastro
procedure TFormConsultaCombustiveis.GridConsultaDblClick(Sender: TObject);
begin
  btnOkClick(Sender);
end;

//Executa ao selecionar uma opção na comboBox
procedure TFormConsultaCombustiveis.cbTipoConsultaSelect(Sender: TObject);
begin
  if(cbTipoConsulta.ItemIndex = 0) then
    begin
      HabilitarCampo(False);
    end
  else
    begin
      HabilitarCampo(True);
    end;
end;

//Habilita campo para pesquisa
procedure TFormConsultaCombustiveis.HabilitarCampo(Boolean: Boolean);
begin
    edtValorPesquisa.Text := '';
    labelPesquisa.Visible := Boolean;
    edtValorPesquisa.Visible := Boolean;
end;

//Executa ao clicar no botão OK
procedure TFormConsultaCombustiveis.btnOkClick(Sender: TObject);
begin
  FormConsultaCombustiveis.ModalResult := mrOk;
end;

//Executa ao clicar no botão Cancelar
procedure TFormConsultaCombustiveis.btnCancelarClick(Sender: TObject);
begin
  FormConsultaCombustiveis.ModalResult := mrCancel;
end;

//Executa ao clicar no botão Novo
procedure TFormConsultaCombustiveis.btnNovoClick(Sender: TObject);
begin
  if(FormCadCombustiveis.Showing) then
    begin
      FormConsultaCombustiveis.Close;
    end
  else
    begin
      FormCadCombustiveis.ShowModal;
    end;
end;
//Pronto!
end.
