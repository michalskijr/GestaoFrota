unit ConClienteUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons;

type
    TFormConsultaCliente = class(TForm)
    Label6: TLabel;
    cbTipoConsulta: TComboBox;
    labelPesquisa: TLabel;
    edtValorPesquisa: TEdit;
    btnPesquisar: TBitBtn;
    GridConsulta: TDBGrid;
    btnNovo: TBitBtn;
    btnCancelar: TBitBtn;
    btnOk: TBitBtn;
    DSIBQCLIENTE: TDataSource;
    gridEndereco: TDBGrid;
    Label1: TLabel;
    DSIBQENDERECO: TDataSource;
    gridContato: TDBGrid;
    Label2: TLabel;
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
  FormConsultaCliente: TFormConsultaCliente;

implementation

uses DMUnit, CadClienteUnit;

{$R *.dfm}

//Pesquisas
procedure TFormConsultaCliente.btnPesquisarClick(Sender: TObject);
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
            sqlSelect := ('SELECT CLIENTE.CD_CLIENTE, PESSOA.NM_RZ_SOCIAL, CLIENTE.CD_PESSOA, CLIENTE.DT_TRANSACAO');
            sqlSelect := sqlSelect + (' FROM CAD_CLIENTE CLIENTE');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_PESSOA PESSOA ON (PESSOA.CD_PESSOA = CLIENTE.CD_PESSOA)');
            Select(sqlSelect, '', cod);
          end;
        //Pesquisa por nome
        1:
          begin
            sqlSelect := ('SELECT CLIENTE.CD_CLIENTE, PESSOA.NM_RZ_SOCIAL, CLIENTE.CD_PESSOA, CLIENTE.DT_TRANSACAO');
            sqlSelect := sqlSelect + (' FROM CAD_CLIENTE CLIENTE');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_PESSOA PESSOA ON (PESSOA.CD_PESSOA = CLIENTE.CD_PESSOA)');
            sqlSelect := sqlSelect + (' WHERE PESSOA.NM_RZ_SOCIAL LIKE ''%' + edtValorPesquisa.Text + '%''');

            Select(sqlSelect, '', cod);
          end;
      else
        ShowMessage('Tipo de pesquisa incorreto!');
      end;
    end;
end;

//Comandos para pesquisa
procedure TFormConsultaCliente.ComandosPesquisa(msg: String);
begin
  ShowMessage(msg);
  edtValorPesquisa.Clear;
  edtValorPesquisa.SetFocus;
  Abort;
end;

//Comando select
procedure TFormConsultaCliente.Select(SQL: String; Parametro: String; cod: Integer);
begin
  DM.IBQCAD_CLIENTE.Active := TRUE;
  DM.IBQCAD_CLIENTE.Close;
  DM.IBQCAD_CLIENTE.SQL.Clear;
  DM.IBQCAD_CLIENTE.SQL.Add(SQL);
  if(Parametro <> '') then
    begin
      DM.IBQCAD_CLIENTE.ParamByName(Parametro).AsInteger := cod;
    end;
  DM.IBQCAD_CLIENTE.Open;
end;

procedure TFormConsultaCliente.GridConsultaDblClick(Sender: TObject);
begin
  btnOkClick(Sender);
end;

procedure TFormConsultaCliente.btnOkClick(Sender: TObject);
begin
  FormConsultaCliente.ModalResult := mrOk;
end;

procedure TFormConsultaCliente.cbTipoConsultaSelect(Sender: TObject);
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
procedure TFormConsultaCliente.HabilitarCampo(Boolean: Boolean);
begin
    edtValorPesquisa.Text := '';
    labelPesquisa.Visible := Boolean;
    edtValorPesquisa.Visible := Boolean;
end;

procedure TFormConsultaCliente.btnCancelarClick(Sender: TObject);
begin
  FormConsultaCliente.ModalResult := mrCancel;
  FormConsultaCliente.Close;
end;

procedure TFormConsultaCliente.btnNovoClick(Sender: TObject);
begin
  if(FormCadCliente.Showing) then
    begin
      FormConsultaCliente.Close;
    end
  else
    begin
      FormCadCliente.ShowModal;
    end;
end;

procedure TFormConsultaCliente.GridConsultaCellClick(Column: TColumn);
begin
  DM.IBQCAD_ENDERECO.Active := True;
  DM.IBQCAD_ENDERECO.Close;
  DM.IBQCAD_ENDERECO.ParamByName('PCDPESSOA').Value := DM.IBQCAD_CLIENTECD_PESSOA.Value;
  DM.IBQCAD_ENDERECO.Open;

  DM.IBQCAD_CONTATO.Active := True;
  DM.IBQCAD_CONTATO.Close;
  DM.IBQCAD_CONTATO.ParamByName('PCDPESSOA').Value := DM.IBQCAD_CLIENTECD_PESSOA.Value;
  DM.IBQCAD_CONTATO.Open;
end;

end.
