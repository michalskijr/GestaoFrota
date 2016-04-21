unit ConEstadoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB;

type
    TFormConsultaEstado = class(TForm)
    DT_CONSULTA: TDataSource;
    Painel: TPanel;
    Label6: TLabel;
    labelPesquisa: TLabel;
    cbTipoConsulta: TComboBox;
    edtValorPesquisa: TEdit;
    btnPesquisar: TBitBtn;
    GridConsulta: TDBGrid;
    btnNovo: TBitBtn;
    btnCancelar: TBitBtn;
    btnOk: TBitBtn;
    procedure btnPesquisarClick(Sender: TObject);
    procedure GridConsultaDblClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cbTipoConsultaSelect(Sender: TObject);
    procedure HabilitarCampo(Boolean: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsultaEstado: TFormConsultaEstado;

implementation

uses DMUnit, CadEstadoUnit;

{$R *.dfm}

//Pesquisa
procedure TFormConsultaEstado.btnPesquisarClick(Sender: TObject);
var
  cdEstado : Integer;

begin
  //Geral
  if(cbTipoConsulta.ItemIndex = 0) then
    begin
      DM.IBQCAD_ESTADO.Active := TRUE;
      DM.IBQCAD_ESTADO.Close;
      DM.IBQCAD_ESTADO.SQL.Clear;
      DM.IBQCAD_ESTADO.SQL.Add('SELECT UF.CD_UF, UF.NM_UF, UF.SG_UF, UF.CD_PAIS, PAIS.NM_PAIS, UF.DT_TRANSACAO');
      DM.IBQCAD_ESTADO.SQL.Add(' FROM CAD_UF UF');
      DM.IBQCAD_ESTADO.SQL.Add(' INNER JOIN CAD_PAIS PAIS ON (UF.CD_PAIS = PAIS.CD_PAIS)');
      DM.IBQCAD_ESTADO.Open;
    end;

  //Código
  if(cbTipoConsulta.ItemIndex = 1) then
    begin
      if(not TryStrToInt(edtValorPesquisa.Text,cdEstado)) then
        begin
          ShowMessage('Informe um valor para a pesquisa!');
          edtValorPesquisa.Clear;
          edtValorPesquisa.SetFocus;
          Abort;
        end;

      if(cdEstado < 0) then
        begin
          ShowMessage('Valor incorreto! Informe novamente!');
          edtValorPesquisa.Clear;
          edtValorPesquisa.SetFocus;
          Abort;
        end;

      DM.IBQCAD_ESTADO.Active := TRUE;
      DM.IBQCAD_ESTADO.Close;
      DM.IBQCAD_ESTADO.SQL.Clear;
      DM.IBQCAD_ESTADO.SQL.Add('SELECT UF.CD_UF, UF.NM_UF, UF.SG_UF, UF.CD_PAIS, PAIS.NM_PAIS, UF.DT_TRANSACAO');
      DM.IBQCAD_ESTADO.SQL.Add(' FROM CAD_UF UF');
      DM.IBQCAD_ESTADO.SQL.Add(' INNER JOIN CAD_PAIS PAIS ON (UF.CD_PAIS = PAIS.CD_PAIS)');
      DM.IBQCAD_ESTADO.SQL.Add(' WHERE UF.CD_UF =:PCDUF');
      DM.IBQCAD_ESTADO.ParamByName('PCDUF').AsInteger := cdEstado;
      DM.IBQCAD_ESTADO.Open;
    end;

  //Nome
  if(cbTipoConsulta.ItemIndex = 2) then
    begin
      if(edtValorPesquisa.Text = '') then
        begin
          ShowMessage('Informe um valor para a pesquisa!');
          edtValorPesquisa.Clear;
          edtValorPesquisa.SetFocus;
          Abort;
        end;

      DM.IBQCAD_ESTADO.Active := TRUE;
      DM.IBQCAD_ESTADO.Close;
      DM.IBQCAD_ESTADO.SQL.Clear;
      DM.IBQCAD_ESTADO.SQL.Add('SELECT UF.CD_UF, UF.NM_UF, UF.SG_UF, UF.CD_PAIS, PAIS.NM_PAIS, UF.DT_TRANSACAO');
      DM.IBQCAD_ESTADO.SQL.Add(' FROM CAD_UF UF');
      DM.IBQCAD_ESTADO.SQL.Add(' INNER JOIN CAD_PAIS PAIS ON (UF.CD_PAIS = PAIS.CD_PAIS)');
      DM.IBQCAD_ESTADO.SQL.Add(' WHERE UF.NM_UF LIKE ''%' + edtValorPesquisa.Text + '%''');
      DM.IBQCAD_ESTADO.Open;
    end;

  //Sigla
  if(cbTipoConsulta.ItemIndex = 3) then
    begin
      if(edtValorPesquisa.Text = '') then
        begin
          ShowMessage('Informe um valor para a pesquisa!');
          edtValorPesquisa.Clear;
          edtValorPesquisa.SetFocus;
          Abort;
        end;

      DM.IBQCAD_ESTADO.Active := TRUE;
      DM.IBQCAD_ESTADO.Close;
      DM.IBQCAD_ESTADO.SQL.Clear;
      DM.IBQCAD_ESTADO.SQL.Add('SELECT UF.CD_UF, UF.NM_UF, UF.SG_UF, UF.CD_PAIS, PAIS.NM_PAIS, UF.DT_TRANSACAO');
      DM.IBQCAD_ESTADO.SQL.Add(' FROM CAD_UF UF');
      DM.IBQCAD_ESTADO.SQL.Add(' INNER JOIN CAD_PAIS PAIS ON (UF.CD_PAIS = PAIS.CD_PAIS)');
      DM.IBQCAD_ESTADO.SQL.Add(' WHERE UF.SG_UF LIKE ''%' + edtValorPesquisa.Text + '%''');
      DM.IBQCAD_ESTADO.Open;
    end;

  //País
  if(cbTipoConsulta.ItemIndex = 4) then
    begin
      if(edtValorPesquisa.Text = '') then
        begin
          ShowMessage('Informe um valor para a pesquisa!');
          edtValorPesquisa.Clear;
          edtValorPesquisa.SetFocus;
          Abort;
        end;

      DM.IBQCAD_ESTADO.Active := TRUE;
      DM.IBQCAD_ESTADO.Close;
      DM.IBQCAD_ESTADO.SQL.Clear;
      DM.IBQCAD_ESTADO.SQL.Add('SELECT UF.CD_UF, UF.NM_UF, UF.SG_UF, UF.CD_PAIS, PAIS.NM_PAIS, UF.DT_TRANSACAO');
      DM.IBQCAD_ESTADO.SQL.Add(' FROM CAD_UF UF');
      DM.IBQCAD_ESTADO.SQL.Add(' INNER JOIN CAD_PAIS PAIS ON (UF.CD_PAIS = PAIS.CD_PAIS)');
      DM.IBQCAD_ESTADO.SQL.Add(' WHERE PAIS.NM_PAIS LIKE ''%' + edtValorPesquisa.Text + '%''');
      DM.IBQCAD_ESTADO.Open;
    end;
end;

//Duplo clique na Grid: Pega a linha selecionada e passa para a tela de cadastro
procedure TFormConsultaEstado.GridConsultaDblClick(Sender: TObject);
begin
  btnOkClick(Sender);
end;

//Executa ao selecionar uma opção na comboBox
procedure TFormConsultaEstado.cbTipoConsultaSelect(Sender: TObject);
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
procedure TFormConsultaEstado.HabilitarCampo(Boolean: Boolean);
begin
    edtValorPesquisa.Text := '';
    labelPesquisa.Visible := Boolean;
    edtValorPesquisa.Visible := Boolean;
end;

//Executa ao clicar no botão OK
procedure TFormConsultaEstado.btnOkClick(Sender: TObject);
begin
  FormConsultaEstado.ModalResult := mrOk;
end;

//Executa ao clicar no botão Cancelar
procedure TFormConsultaEstado.btnCancelarClick(Sender: TObject);
begin
  FormConsultaEstado.ModalResult := mrCancel;
end;

//Executa ao clicar no botão Novo
procedure TFormConsultaEstado.btnNovoClick(Sender: TObject);
begin
  if(FormCadEstado.Showing) then
    begin
      FormConsultaEstado.Close;
    end
  else
    begin
      FormCadEstado.ShowModal;
    end;
end;
//Pronto
end.
