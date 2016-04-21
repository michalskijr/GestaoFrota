unit ConVeiculoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons;

type
  TFormConsultaVeiculo = class(TForm)
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
  FormConsultaVeiculo: TFormConsultaVeiculo;

implementation

uses DMUnit, CadVeiculoUnit;

{$R *.dfm}

//Pesquisas
procedure TFormConsultaVeiculo.btnPesquisarClick(Sender: TObject);
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
            sqlSelect := ('SELECT V.CD_VEICULO, V.DS_VEICULO, V.CD_COR, COR.DS_COR, V.CD_COMBUSTIVEL, COMB.NM_COMBUSTIVEL,');
            sqlSelect := sqlSelect + (' V.CD_CIDADE_PLACA, CIDADE.NM_CIDADE, V.CD_TIPO_VEICULO, TPVEICULO.NM_TIPO_VEICULO,');
            sqlSelect := sqlSelect + (' V.CD_MODELO, MODELO.DS_MODELO, V.DS_PLACA, V.NR_CHASSI, V.NR_RENAVAM, V.NR_EIXOS, V.DS_ANO_FABRICACAO,');
            sqlSelect := sqlSelect + (' V.DS_ANO_MODELO, V.VL_ODOMETRO, V.VL_HORIMETRO, V.DT_TRANSACAO');
            sqlSelect := sqlSelect + (' FROM CAD_VEICULO V');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_COR COR ON (V.CD_COR = COR.CD_COR)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_COMBUSTIVEL COMB ON (V.CD_COMBUSTIVEL = COMB.CD_COMBUSTIVEL)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_CIDADE CIDADE ON (V.CD_CIDADE_PLACA = CIDADE.CD_CIDADE)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_TIPO_VEICULO TPVEICULO ON (V.CD_TIPO_VEICULO = TPVEICULO.CD_TIPO_VEICULO)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_MODELO MODELO ON (V.CD_MODELO = MODELO.CD_MODELO)');
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

            sqlSelect := ('SELECT V.CD_VEICULO, V.DS_VEICULO, V.CD_COR, COR.DS_COR, V.CD_COMBUSTIVEL, COMB.NM_COMBUSTIVEL,');
            sqlSelect := sqlSelect + (' V.CD_CIDADE_PLACA, CIDADE.NM_CIDADE, V.CD_TIPO_VEICULO, TPVEICULO.NM_TIPO_VEICULO,');
            sqlSelect := sqlSelect + (' V.CD_MODELO, MODELO.DS_MODELO, V.DS_PLACA, V.NR_CHASSI, V.NR_RENAVAM, V.NR_EIXOS, V.DS_ANO_FABRICACAO,');
            sqlSelect := sqlSelect + (' V.DS_ANO_MODELO, V.VL_ODOMETRO, V.VL_HORIMETRO, V.DT_TRANSACAO');
            sqlSelect := sqlSelect + (' FROM CAD_VEICULO V');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_COR COR ON (V.CD_COR = COR.CD_COR)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_COMBUSTIVEL COMB ON (V.CD_COMBUSTIVEL = COMB.CD_COMBUSTIVEL)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_CIDADE CIDADE ON (V.CD_CIDADE_PLACA = CIDADE.CD_CIDADE)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_TIPO_VEICULO TPVEICULO ON (V.CD_TIPO_VEICULO = TPVEICULO.CD_TIPO_VEICULO)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_MODELO MODELO ON (V.CD_MODELO = MODELO.CD_MODELO)');
            sqlSelect := sqlSelect + (' WHERE V.CD_VEICULO =:PCDVEICULO');

            Select(sqlSelect, 'PCDVEICULO', cod);
          end;
        //Pesquisa por descrição
        2:
          begin
            sqlSelect := ('SELECT V.CD_VEICULO, V.DS_VEICULO, V.CD_COR, COR.DS_COR, V.CD_COMBUSTIVEL, COMB.NM_COMBUSTIVEL,');
            sqlSelect := sqlSelect + (' V.CD_CIDADE_PLACA, CIDADE.NM_CIDADE, V.CD_TIPO_VEICULO, TPVEICULO.NM_TIPO_VEICULO,');
            sqlSelect := sqlSelect + (' V.CD_MODELO, MODELO.DS_MODELO, V.DS_PLACA, V.NR_CHASSI, V.NR_RENAVAM, V.NR_EIXOS, V.DS_ANO_FABRICACAO,');
            sqlSelect := sqlSelect + (' V.DS_ANO_MODELO, V.VL_ODOMETRO, V.VL_HORIMETRO, V.DT_TRANSACAO');
            sqlSelect := sqlSelect + (' FROM CAD_VEICULO V');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_COR COR ON (V.CD_COR = COR.CD_COR)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_COMBUSTIVEL COMB ON (V.CD_COMBUSTIVEL = COMB.CD_COMBUSTIVEL)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_CIDADE CIDADE ON (V.CD_CIDADE_PLACA = CIDADE.CD_CIDADE)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_TIPO_VEICULO TPVEICULO ON (V.CD_TIPO_VEICULO = TPVEICULO.CD_TIPO_VEICULO)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_MODELO MODELO ON (V.CD_MODELO = MODELO.CD_MODELO)');
            sqlSelect := sqlSelect + (' WHERE VEICULO.DS_VEICULO LIKE ''%' + edtValorPesquisa.Text + '%''');

            Select(sqlSelect, '', cod);
          end;
        //Pesquisa por placa
        3:
          begin
            sqlSelect := ('SELECT V.CD_VEICULO, V.DS_VEICULO, V.CD_COR, COR.DS_COR, V.CD_COMBUSTIVEL, COMB.NM_COMBUSTIVEL,');
            sqlSelect := sqlSelect + (' V.CD_CIDADE_PLACA, CIDADE.NM_CIDADE, V.CD_TIPO_VEICULO, TPVEICULO.NM_TIPO_VEICULO,');
            sqlSelect := sqlSelect + (' V.CD_MODELO, MODELO.DS_MODELO, V.DS_PLACA, V.NR_CHASSI, V.NR_RENAVAM, V.NR_EIXOS, V.DS_ANO_FABRICACAO,');
            sqlSelect := sqlSelect + (' V.DS_ANO_MODELO, V.VL_ODOMETRO, V.VL_HORIMETRO, V.DT_TRANSACAO');
            sqlSelect := sqlSelect + (' FROM CAD_VEICULO V');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_COR COR ON (V.CD_COR = COR.CD_COR)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_COMBUSTIVEL COMB ON (V.CD_COMBUSTIVEL = COMB.CD_COMBUSTIVEL)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_CIDADE CIDADE ON (V.CD_CIDADE_PLACA = CIDADE.CD_CIDADE)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_TIPO_VEICULO TPVEICULO ON (V.CD_TIPO_VEICULO = TPVEICULO.CD_TIPO_VEICULO)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_MODELO MODELO ON (V.CD_MODELO = MODELO.CD_MODELO)');
            sqlSelect := sqlSelect + (' WHERE VEICULO.DS_PLACA LIKE ''%' + edtValorPesquisa.Text + '%''');

            Select(sqlSelect, '', cod);
          end;
        //Pesquisa por modelo
        4:
          begin
            sqlSelect := ('SELECT V.CD_VEICULO, V.DS_VEICULO, V.CD_COR, COR.DS_COR, V.CD_COMBUSTIVEL, COMB.NM_COMBUSTIVEL,');
            sqlSelect := sqlSelect + (' V.CD_CIDADE_PLACA, CIDADE.NM_CIDADE, V.CD_TIPO_VEICULO, TPVEICULO.NM_TIPO_VEICULO,');
            sqlSelect := sqlSelect + (' V.CD_MODELO, MODELO.DS_MODELO, V.DS_PLACA, V.NR_CHASSI, V.NR_RENAVAM, V.NR_EIXOS, V.DS_ANO_FABRICACAO,');
            sqlSelect := sqlSelect + (' V.DS_ANO_MODELO, V.VL_ODOMETRO, V.VL_HORIMETRO, V.DT_TRANSACAO');
            sqlSelect := sqlSelect + (' FROM CAD_VEICULO V');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_COR COR ON (V.CD_COR = COR.CD_COR)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_COMBUSTIVEL COMB ON (V.CD_COMBUSTIVEL = COMB.CD_COMBUSTIVEL)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_CIDADE CIDADE ON (V.CD_CIDADE_PLACA = CIDADE.CD_CIDADE)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_TIPO_VEICULO TPVEICULO ON (V.CD_TIPO_VEICULO = TPVEICULO.CD_TIPO_VEICULO)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_MODELO MODELO ON (V.CD_MODELO = MODELO.CD_MODELO)');
            sqlSelect := sqlSelect + (' WHERE MODELO.DS_MODELO LIKE ''%' + edtValorPesquisa.Text + '%''');

            Select(sqlSelect, '', cod);
          end;
      else
        ShowMessage('Tipo de pesquisa incorreto!');
      end;
    end;
end;

//Comandos para pesquisa
procedure TFormConsultaVeiculo.ComandosPesquisa(msg: String);
begin
  ShowMessage(msg);
  edtValorPesquisa.Clear;
  edtValorPesquisa.SetFocus;
  Abort;
end;

//Comando select
procedure TFormConsultaVeiculo.Select(SQL: String; Parametro: String; cod: Integer);
begin
  DM.IBQCAD_VEICULO.Active := TRUE;
  DM.IBQCAD_VEICULO.Close;
  DM.IBQCAD_VEICULO.SQL.Clear;
  DM.IBQCAD_CIDADE.SQL.Add(SQL);
  if(Parametro <> '') then
    begin
      DM.IBQCAD_VEICULO.ParamByName(Parametro).AsInteger := cod;
    end;
  DM.IBQCAD_VEICULO.Open;
end;

//Duplo clique na Grid: Pega a linha selecionada e passa para a tela de cadastro
procedure TFormConsultaVeiculo.GridConsultaDblClick(Sender: TObject);
begin
  btnOkClick(Sender);
end;

//Executa ao selecionar uma opção na comboBox
procedure TFormConsultaVeiculo.cbTipoConsultaSelect(Sender: TObject);
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
procedure TFormConsultaVeiculo.HabilitarCampo(Boolean: Boolean);
begin
    edtValorPesquisa.Text := '';
    labelPesquisa.Visible := Boolean;
    edtValorPesquisa.Visible := Boolean;
end;

//Executa ao clicar no botão OK
procedure TFormConsultaVeiculo.btnOkClick(Sender: TObject);
begin
  FormConsultaVeiculo.ModalResult := mrOk;
end;

//Executa ao clicar no botão Cancelar
procedure TFormConsultaVeiculo.btnCancelarClick(Sender: TObject);
begin
  FormConsultaVeiculo.ModalResult := mrCancel;
end;

//Executa ao clicar no botão Novo
procedure TFormConsultaVeiculo.btnNovoClick(Sender: TObject);
begin
  if(FormCadVeiculo.Showing) then
    begin
      FormConsultaVeiculo.Close;
    end
  else
    begin
      FormCadVeiculo.ShowModal;
    end;
end;
//em teste
end.
