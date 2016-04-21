unit ConMarcaUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons;

type
    TFormConsultaMarca = class(TForm)
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
  FormConsultaMarca: TFormConsultaMarca;

implementation

uses DMUnit, CadMarcaUnit;

{$R *.dfm}

//Pesquisas
procedure TFormConsultaMarca.btnPesquisarClick(Sender: TObject);
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
            sqlSelect := ('SELECT * FROM CAD_MARCA');
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

            sqlSelect := ('SELECT * FROM CAD_MARCA');
            sqlSelect := sqlSelect + (' WHERE CD_MARCA =:PCDMARCA');

            Select(sqlSelect, 'PCDMARCA', cod);
          end;
        //Pesquisa por nome
        2:
          begin
            sqlSelect := ('SELECT * FROM CAD_MARCA');
            sqlSelect := sqlSelect + (' WHERE NM_MARCA LIKE ''%' + edtValorPesquisa.Text + '%''');

            Select(sqlSelect, '', cod);
          end;
      else
        ShowMessage('Tipo de pesquisa incorreto!');
      end;
    end;
end;

//Comandos para pesquisa
procedure TFormConsultaMarca.ComandosPesquisa(msg: String);
begin
  ShowMessage(msg);
  edtValorPesquisa.Clear;
  edtValorPesquisa.SetFocus;
  Abort;
end;

//Comando select
procedure TFormConsultaMarca.Select(SQL: String; Parametro: String; cod: Integer);
begin
  DM.IBQCAD_MARCA.Active := TRUE;
  DM.IBQCAD_MARCA.Close;
  DM.IBQCAD_MARCA.SQL.Clear;
  DM.IBQCAD_MARCA.SQL.Add(SQL);
  if(Parametro <> '') then
    begin
      DM.IBQCAD_MARCA.ParamByName(Parametro).AsInteger := cod;
    end;
  DM.IBQCAD_MARCA.Open;
end;

//Duplo clique na Grid: Pega a linha selecionada e passa para a tela de cadastro
procedure TFormConsultaMarca.GridConsultaDblClick(Sender: TObject);
begin
  btnOkClick(Sender);
end;

//Executa ao selecionar uma opção na comboBox
procedure TFormConsultaMarca.cbTipoConsultaSelect(Sender: TObject);
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
procedure TFormConsultaMarca.HabilitarCampo(Boolean: Boolean);
begin
    edtValorPesquisa.Text := '';
    labelPesquisa.Visible := Boolean;
    edtValorPesquisa.Visible := Boolean;
end;

//Executa ao clicar no botão OK
procedure TFormConsultaMarca.btnOkClick(Sender: TObject);
begin
  FormConsultaMarca.ModalResult := mrOk;
end;

//Executa ao clicar no botão Cancelar
procedure TFormConsultaMarca.btnCancelarClick(Sender: TObject);
begin
  FormConsultaMarca.ModalResult := mrCancel;
end;

//Executa ao clicar no botão Novo
procedure TFormConsultaMarca.btnNovoClick(Sender: TObject);
begin
  if(FormCadMarca.Showing) then
    begin
      FormConsultaMarca.Close;
    end
  else
    begin
      FormCadMarca.ShowModal;
    end;
end;
//Pronto
end.
