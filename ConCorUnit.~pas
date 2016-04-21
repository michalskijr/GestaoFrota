unit ConCorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons;

type
    TFormConsultaCor = class(TForm)
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
  FormConsultaCor: TFormConsultaCor;

implementation

uses DMUnit, CadCorUnit;

{$R *.dfm}

//Pesquisas
procedure TFormConsultaCor.btnPesquisarClick(Sender: TObject);
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
            sqlSelect := ('SELECT * FROM CAD_COR');
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

            sqlSelect := ('SELECT * FROM CAD_COR');
            sqlSelect := sqlSelect + (' WHERE CD_COR =:PCDCOR');

            Select(sqlSelect, 'PCDCOR', cod);
          end;
        //Pesquisa por nome
        2:
          begin
            sqlSelect := ('SELECT * FROM CAD_COR');
            sqlSelect := sqlSelect + (' WHERE DS_COR LIKE ''%' + edtValorPesquisa.Text + '%''');

            Select(sqlSelect, '', cod);
          end;
      else
        ShowMessage('Tipo de pesquisa incorreto!');
      end;
    end;
end;

//Comandos para pesquisa
procedure TFormConsultaCor.ComandosPesquisa(msg: String);
begin
  ShowMessage(msg);
  edtValorPesquisa.Clear;
  edtValorPesquisa.SetFocus;
  Abort;
end;

//Comando select
procedure TFormConsultaCor.Select(SQL: String; Parametro: String; cod: Integer);
begin
  DM.IBQCAD_COR.Active := TRUE;
  DM.IBQCAD_COR.Close;
  DM.IBQCAD_COR.SQL.Clear;
  DM.IBQCAD_COR.SQL.Add(SQL);
  if(Parametro <> '') then
    begin
      DM.IBQCAD_COR.ParamByName(Parametro).AsInteger := cod;
    end;
  DM.IBQCAD_COR.Open;
end;

//Duplo clique na Grid: Pega a linha selecionada e passa para a tela de cadastro
procedure TFormConsultaCor.GridConsultaDblClick(Sender: TObject);
begin
  btnOkClick(Sender);
end;

//Executa ao selecionar uma opção na comboBox
procedure TFormConsultaCor.cbTipoConsultaSelect(Sender: TObject);
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
procedure TFormConsultaCor.HabilitarCampo(Boolean: Boolean);
begin
    edtValorPesquisa.Text := '';
    labelPesquisa.Visible := Boolean;
    edtValorPesquisa.Visible := Boolean;
end;

//Executa ao clicar no botão OK
procedure TFormConsultaCor.btnOkClick(Sender: TObject);
begin
  FormConsultaCor.ModalResult := mrOk;
end;

//Executa ao clicar no botão Cancelar
procedure TFormConsultaCor.btnCancelarClick(Sender: TObject);
begin
  FormConsultaCor.ModalResult := mrCancel;
end;

//Executa ao clicar no botão Novo
procedure TFormConsultaCor.btnNovoClick(Sender: TObject);
begin
  if(FormCadCor.Showing) then
    begin
      FormConsultaCor.Close;
    end
  else
    begin
      FormCadCor.ShowModal;
    end;
end;
//Pronto!
end.
