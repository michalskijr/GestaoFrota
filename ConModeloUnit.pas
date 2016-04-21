unit ConModeloUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons;

type
    TFormConsultaModelo = class(TForm)
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
  FormConsultaModelo: TFormConsultaModelo;

implementation

uses DMUnit, CadModeloUnit;

{$R *.dfm}

//Pesquisas
procedure TFormConsultaModelo.btnPesquisarClick(Sender: TObject);
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
            sqlSelect := ('SELECT MODELO.CD_MODELO, MODELO.DS_MODELO, MODELO.CD_MARCA, MARCA.NM_MARCA, MODELO.DT_TRANSACAO, MODELO.DS_OBSERVACAO');
            sqlSelect := sqlSelect + (' FROM CAD_MODELO MODELO');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_MARCA MARCA ON (MODELO.CD_MARCA = MARCA.CD_MARCA)');
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

            sqlSelect := ('SELECT MODELO.CD_MODELO, MODELO.DS_MODELO, MODELO.CD_MARCA, MARCA.NM_MARCA, MODELO.DT_TRANSACAO, MODELO.DS_OBSERVACAO');
            sqlSelect := sqlSelect + (' FROM CAD_MODELO MODELO');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_MARCA MARCA ON (MODELO.CD_MARCA = MARCA.CD_MARCA)');
            sqlSelect := sqlSelect + (' WHERE MODELO.CD_MODELO =:PCDMODELO');

            Select(sqlSelect, 'PCDMODELO', cod);
          end;
        //Pesquisa por nome
        2:
          begin
            sqlSelect := ('SELECT MODELO.CD_MODELO, MODELO.DS_MODELO, MODELO.CD_MARCA, MARCA.NM_MARCA, MODELO.DT_TRANSACAO, MODELO.DS_OBSERVACAO');
            sqlSelect := sqlSelect + (' FROM CAD_MODELO MODELO');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_MARCA MARCA ON (MODELO.CD_MARCA = MARCA.CD_MARCA)');
            sqlSelect := sqlSelect + (' WHERE MODELO.DS_MODELO LIKE ''%' + edtValorPesquisa.Text + '%''');

            Select(sqlSelect, '', cod);
          end;
        //Pesquisa por Marca
        3:
          begin
            sqlSelect := ('SELECT MODELO.CD_MODELO, MODELO.DS_MODELO, MODELO.CD_MARCA, MARCA.NM_MARCA, MODELO.DT_TRANSACAO, MODELO.DS_OBSERVACAO');
            sqlSelect := sqlSelect + (' FROM CAD_MODELO MODELO');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_MARCA MARCA ON (MODELO.CD_MARCA = MARCA.CD_MARCA)');
            sqlSelect := sqlSelect + (' WHERE MARCA.NM_MARCA LIKE ''%' + edtValorPesquisa.Text + '%''');

            Select(sqlSelect, '', cod);
          end;
      else
        ShowMessage('Tipo de pesquisa incorreto!');
      end;
    end;
end;

//Comandos para pesquisa
procedure TFormConsultaModelo.ComandosPesquisa(msg: String);
begin
  ShowMessage(msg);
  edtValorPesquisa.Clear;
  edtValorPesquisa.SetFocus;
  Abort;
end;

//Comando select
procedure TFormConsultaModelo.Select(SQL: String; Parametro: String; cod: Integer);
begin
  DM.IBQCAD_MODELO.Active := TRUE;
  DM.IBQCAD_MODELO.Close;
  DM.IBQCAD_MODELO.SQL.Clear;
  DM.IBQCAD_MODELO.SQL.Add(SQL);
  if(Parametro <> '') then
    begin
      DM.IBQCAD_MODELO.ParamByName(Parametro).AsInteger := cod;
    end;
  DM.IBQCAD_MODELO.Open;
end;

//Duplo clique na Grid: Pega a linha selecionada e passa para a tela de cadastro
procedure TFormConsultaModelo.GridConsultaDblClick(Sender: TObject);
begin
  btnOkClick(Sender);
end;

//Executa ao selecionar uma opção na comboBox
procedure TFormConsultaModelo.cbTipoConsultaSelect(Sender: TObject);
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
procedure TFormConsultaModelo.HabilitarCampo(Boolean: Boolean);
begin
    edtValorPesquisa.Text := '';
    labelPesquisa.Visible := Boolean;
    edtValorPesquisa.Visible := Boolean;
end;

//Executa ao clicar no botão OK
procedure TFormConsultaModelo.btnOkClick(Sender: TObject);
begin
  FormConsultaModelo.ModalResult := mrOk;
end;

//Executa ao clicar no botão Cancelar
procedure TFormConsultaModelo.btnCancelarClick(Sender: TObject);
begin
  FormConsultaModelo.ModalResult := mrCancel;
end;

//Executa ao clicar no botão Novo
procedure TFormConsultaModelo.btnNovoClick(Sender: TObject);
begin
  if(FormCadModelo.Showing) then
    begin
      FormConsultaModelo.Close;
    end
  else
    begin
      FormCadModelo.ShowModal;
    end;
end;
//Pronto! (novo código de pesquisa)
end.
