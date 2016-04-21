unit ConPaisUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons;

type
    TFormConsultaPais = class(TForm)
    Label4: TLabel;
    CBTipoConsulta: TComboBox;
    edtValor: TEdit;
    labelPesquisa: TLabel;
    btnPesquisar: TBitBtn;
    DBGrid: TDBGrid;
    DT_CONSULTA: TDataSource;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    btnNovo: TBitBtn;
    procedure btnPesquisarClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure CBTipoConsultaSelect(Sender: TObject);
    procedure HabilitarCampo(Boolean: Boolean);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
  { Public declarations }
  end;

var
  FormConsultaPais: TFormConsultaPais;

implementation

uses DMUnit, CadPaisUnit;

{$R *.dfm}

//Pesquisa
procedure TFormConsultaPais.btnPesquisarClick(Sender: TObject);
var
  cdPais : Integer;

begin
  //Geral
  if(CBTipoConsulta.ItemIndex = 0) then
    begin
      DM.IBQCAD_PAIS.Active := TRUE;
      DM.IBQCAD_PAIS.Close;
      DM.IBQCAD_PAIS.SQL.Clear;
      DM.IBQCAD_PAIS.SQL.Add('SELECT * FROM CAD_PAIS');
      DM.IBQCAD_PAIS.Open;
    end;

  //Código
  if(CBTipoConsulta.ItemIndex = 1) then
    begin
      if(not TryStrToInt(EdtValor.Text,cdPais)) then
        begin
          ShowMessage('Informe um valor inteiro positivo');
          EdtValor.Clear;
          EdtValor.SetFocus;
          Abort;
        end;

      if(cdPais < 0) then
        begin
        ShowMessage('Informe um valor inteiro positivo');
        EdtValor.Clear;
        EdtValor.SetFocus;
        Abort;
      end;

      DM.IBQCAD_PAIS.Active := TRUE;
      DM.IBQCAD_PAIS.Close;
      DM.IBQCAD_PAIS.SQL.Clear;
      DM.IBQCAD_PAIS.SQL.Add('SELECT * FROM CAD_PAIS WHERE CD_PAIS =:PCDPAIS');
      DM.IBQCAD_PAIS.ParamByName('PCDPAIS').AsInteger := cdPais;
      DM.IBQCAD_PAIS.Open;
    end;

  //Nome
  if(CBTipoConsulta.ItemIndex = 2) then
    begin
      if(EdtValor.Text = '') then
        begin
          ShowMessage('Informe um valor para a pesquisa!');
          EdtValor.Clear;
          EdtValor.SetFocus;
          Abort;
        end;

      DM.IBQCAD_PAIS.Active := TRUE;
      DM.IBQCAD_PAIS.Close;
      DM.IBQCAD_PAIS.SQL.Clear;
      DM.IBQCAD_PAIS.SQL.Add('SELECT * FROM CAD_PAIS WHERE NM_PAIS LIKE ''%' + EdtValor.Text + '%''');
      DM.IBQCAD_PAIS.Open;
    end;
end;

//Duplo clique na Grid: Pega a linha selecionada e passa para a tela de cadastro
procedure TFormConsultaPais.DBGridDblClick(Sender: TObject);
begin
  btnOkClick(Sender);
end;

//Executa ao selecionar uma opção na comboBox
procedure TFormConsultaPais.CBTipoConsultaSelect(Sender: TObject);
begin
  if(CBTipoConsulta.ItemIndex = 0) then
    begin
      HabilitarCampo(False);
    end
  else
    begin
      HabilitarCampo(True);
    end;
end;

//Habilita campo para pesquisa
procedure TFormConsultaPais.HabilitarCampo(Boolean: Boolean);
begin
    edtValor.Text := '';
    labelPesquisa.Visible := Boolean;
    edtValor.Visible := Boolean;
end;

//Executa ao clicar no botão OK
procedure TFormConsultaPais.btnOkClick(Sender: TObject);
begin
  FormConsultaPais.ModalResult := mrOk;
end;

procedure TFormConsultaPais.btnCancelarClick(Sender: TObject);
begin
  FormConsultaPais.ModalResult := mrCancel;
end;

procedure TFormConsultaPais.btnNovoClick(Sender: TObject);
begin
  if(FormCadPais.Showing) then
    begin
      FormConsultaPais.Close;
    end
  else
    begin
      FormCadPais.ShowModal;
    end;
end;
//Pronto
end.
