unit ConCidadeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons;

type
    TFormConsultaCidade = class(TForm)
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
  FormConsultaCidade: TFormConsultaCidade;

implementation

uses DMUnit, CadCidadeUnit;

{$R *.dfm}

//Pesquisas
procedure TFormConsultaCidade.btnPesquisarClick(Sender: TObject);
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
            sqlSelect := ('SELECT CIDADE.CD_CIDADE, CIDADE.NM_CIDADE, CIDADE.CD_UF, UF.NM_UF, CIDADE.DT_TRANSACAO');
            sqlSelect := sqlSelect + (' FROM CAD_CIDADE CIDADE');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_UF UF ON (CIDADE.CD_UF = UF.CD_UF)');
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

            sqlSelect := ('SELECT CIDADE.CD_CIDADE, CIDADE.NM_CIDADE, CIDADE.CD_UF, UF.NM_UF, CIDADE.DT_TRANSACAO');
            sqlSelect := sqlSelect + (' FROM CAD_CIDADE CIDADE');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_UF UF ON (CIDADE.CD_UF = UF.CD_UF)');
            sqlSelect := sqlSelect + (' WHERE CIDADE.CD_CIDADE =:PCDCIDADE');

            Select(sqlSelect, 'PCDCIDADE', cod);
          end;
        //Pesquisa por nome
        2:
          begin
            sqlSelect := ('SELECT CIDADE.CD_CIDADE, CIDADE.NM_CIDADE, CIDADE.CD_UF, UF.NM_UF, CIDADE.DT_TRANSACAO');
            sqlSelect := sqlSelect + (' FROM CAD_CIDADE CIDADE');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_UF UF ON (CIDADE.CD_UF = UF.CD_UF)');
            sqlSelect := sqlSelect + (' WHERE CIDADE.NM_CIDADE LIKE ''%' + edtValorPesquisa.Text + '%''');

            Select(sqlSelect, '', cod);
          end;
        //Pesquisa por Estado
        3:
          begin
            sqlSelect := ('SELECT CIDADE.CD_CIDADE, CIDADE.NM_CIDADE, CIDADE.CD_UF, UF.NM_UF, CIDADE.DT_TRANSACAO');
            sqlSelect := sqlSelect + (' FROM CAD_CIDADE CIDADE');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_UF UF ON (CIDADE.CD_UF = UF.CD_UF)');
            sqlSelect := sqlSelect + (' WHERE UF.NM_UF LIKE ''%' + edtValorPesquisa.Text + '%''');

            Select(sqlSelect, '', cod);
          end;
      else
        ShowMessage('Tipo de pesquisa incorreto!');
      end;
    end;
end;

//Comandos para pesquisa
procedure TFormConsultaCidade.ComandosPesquisa(msg: String);
begin
  ShowMessage(msg);
  edtValorPesquisa.Clear;
  edtValorPesquisa.SetFocus;
  Abort;
end;

//Comando select
procedure TFormConsultaCidade.Select(SQL: String; Parametro: String; cod: Integer);
begin
  DM.IBQCAD_CIDADE.Active := TRUE;
  DM.IBQCAD_CIDADE.Close;
  DM.IBQCAD_CIDADE.SQL.Clear;
  DM.IBQCAD_CIDADE.SQL.Add(SQL);
  if(Parametro <> '') then
    begin
      DM.IBQCAD_CIDADE.ParamByName(Parametro).AsInteger := cod;
    end;
  DM.IBQCAD_CIDADE.Open;
end;

//Duplo clique na Grid: Pega a linha selecionada e passa para a tela de cadastro
procedure TFormConsultaCidade.GridConsultaDblClick(Sender: TObject);
begin
  btnOkClick(Sender);
end;

//Executa ao selecionar uma opção na comboBox
procedure TFormConsultaCidade.cbTipoConsultaSelect(Sender: TObject);
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
procedure TFormConsultaCidade.HabilitarCampo(Boolean: Boolean);
begin
    edtValorPesquisa.Text := '';
    labelPesquisa.Visible := Boolean;
    edtValorPesquisa.Visible := Boolean;
end;

//Executa ao clicar no botão OK
procedure TFormConsultaCidade.btnOkClick(Sender: TObject);
begin
  FormConsultaCidade.ModalResult := mrOk;
end;

//Executa ao clicar no botão Cancelar
procedure TFormConsultaCidade.btnCancelarClick(Sender: TObject);
begin
  FormConsultaCidade.ModalResult := mrCancel;
end;

//Executa ao clicar no botão Novo
procedure TFormConsultaCidade.btnNovoClick(Sender: TObject);
begin
  if(FormCadCidade.Showing) then
    begin
      FormConsultaCidade.Close;
    end
  else
    begin
      FormCadCidade.ShowModal;
    end;
end;
//Pronto (novo código de pesquisa)
end.
