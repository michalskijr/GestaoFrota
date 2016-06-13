unit ConMotoristaUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB;

type
    TFormConsultaMotorista = class(TForm)
    Label6: TLabel;
    cbTipoConsulta: TComboBox;
    labelPesquisa: TLabel;
    edtValorPesquisa: TEdit;
    btnPesquisar: TBitBtn;
    GridConsulta: TDBGrid;
    btnNovo: TBitBtn;
    btnCancelar: TBitBtn;
    btnOk: TBitBtn;
    DSMOTORISTA: TDataSource;
    Label1: TLabel;
    gridEndereco: TDBGrid;
    Label2: TLabel;
    gridContato: TDBGrid;
    DSIBQENDERECO: TDataSource;
    DSIBQCONTATO: TDataSource;
    procedure btnPesquisarClick(Sender: TObject);
    procedure ComandosPesquisa(msg: String);
    procedure Select(SQL: String; Parametro: String; cod: Integer);
    procedure GridConsultaDblClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cbTipoConsultaSelect(Sender: TObject);
    procedure HabilitarCampo(Boolean: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure GridConsultaCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsultaMotorista: TFormConsultaMotorista;

implementation

uses DMUnit, CadMotoristaUnit;

{$R *.dfm}

//Pesquisas
procedure TFormConsultaMotorista.btnPesquisarClick(Sender: TObject);
var
  cod: Integer;
  tipoConsulta: Integer;
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
            sqlSelect := ('SELECT MOTORISTA.CD_MOTORISTA, PESSOA.NM_RZ_SOCIAL, MOTORISTA.CD_PESSOA');
            sqlSelect := sqlSelect + (' FROM CAD_MOTORISTA MOTORISTA');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_PESSOA PESSOA ON (PESSOA.CD_PESSOA = MOTORISTA.CD_PESSOA)');
            Select(sqlSelect, '', cod);
          end;
        //Pesquisa por nome
        1:
          begin
            sqlSelect := ('SELECT MOTORISTA.CD_MOTORISTA, PESSOA.NM_RZ_SOCIAL, MOTORISTA.CD_PESSOA');
            sqlSelect := sqlSelect + (' FROM CAD_MOTORISTA MOTORISTA');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_PESSOA PESSOA ON (PESSOA.CD_PESSOA = MOTORISTA.CD_PESSOA)');
            sqlSelect := sqlSelect + (' WHERE PESSOA.NM_RZ_SOCIAL LIKE ''%' + edtValorPesquisa.Text + '%''');

            Select(sqlSelect, '', cod);
          end;
      else
        ShowMessage('Tipo de pesquisa incorreto!');
      end;
    end;
end;

//Comandos para pesquisa
procedure TFormConsultaMotorista.ComandosPesquisa(msg: String);
begin
  ShowMessage(msg);
  edtValorPesquisa.Clear;
  edtValorPesquisa.SetFocus;
  Abort;
end;

//Comando select
procedure TFormConsultaMotorista.Select(SQL: String; Parametro: String; cod: Integer);
begin
  DM.IBQCAD_MOTORISTA.Active := TRUE;
  DM.IBQCAD_MOTORISTA.Close;
  DM.IBQCAD_MOTORISTA.SQL.Clear;
  DM.IBQCAD_MOTORISTA.SQL.Add(SQL);
  if(Parametro <> '') then
    begin
      DM.IBQCAD_MOTORISTA.ParamByName(Parametro).AsInteger := cod;
    end;
  DM.IBQCAD_MOTORISTA.Open;
end;

procedure TFormConsultaMotorista.GridConsultaDblClick(Sender: TObject);
begin
  btnOkClick(Sender);
end;

procedure TFormConsultaMotorista.btnOkClick(Sender: TObject);
begin
  FormConsultaMotorista.ModalResult := mrOk;
end;

procedure TFormConsultaMotorista.cbTipoConsultaSelect(Sender: TObject);
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
procedure TFormConsultaMotorista.HabilitarCampo(Boolean: Boolean);
begin
    edtValorPesquisa.Text := '';
    labelPesquisa.Visible := Boolean;
    edtValorPesquisa.Visible := Boolean;
end;

procedure TFormConsultaMotorista.btnCancelarClick(Sender: TObject);
begin
  FormConsultaMotorista.ModalResult := mrCancel;
  FormConsultaMotorista.Close;
end;

procedure TFormConsultaMotorista.btnNovoClick(Sender: TObject);
begin
  if(FormCadMotorista.Showing) then
    begin
      FormConsultaMotorista.Close;
    end
  else
    begin
      FormCadMotorista.ShowModal;
    end;
end;

procedure TFormConsultaMotorista.GridConsultaCellClick(Column: TColumn);
begin
  DM.IBQCAD_ENDERECO.Active := True;
  DM.IBQCAD_ENDERECO.Close;
  DM.IBQCAD_ENDERECO.ParamByName('PCDPESSOA').Value := DM.IBQCAD_MOTORISTACD_PESSOA.Value;
  DM.IBQCAD_ENDERECO.Open;

  DM.IBQCAD_CONTATO.Active := True;
  DM.IBQCAD_CONTATO.Close;
  DM.IBQCAD_CONTATO.ParamByName('PCDPESSOA').Value := DM.IBQCAD_MOTORISTACD_PESSOA.Value;
  DM.IBQCAD_CONTATO.Open;
end;

end.
