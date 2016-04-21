unit CadVeiculoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, DB, ExtCtrls, IBCustomDataSet,
  IBQuery;

type
  TFormCadVeiculo = class(TForm)
    Panel: TPanel;
    Label1: TLabel;
    edtCod: TDBEdit;
    DataSource: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    edtCodCidade: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtChassi: TDBEdit;
    Label9: TLabel;
    edtRenavam: TDBEdit;
    Label10: TLabel;
    edtNome: TDBEdit;
    Label11: TLabel;
    edtEixos: TDBEdit;
    Label12: TLabel;
    edtAnoFabricacao: TDBEdit;
    Label13: TLabel;
    edtAnoModelo: TDBEdit;
    Label14: TLabel;
    edtOdometro: TDBEdit;
    Label15: TLabel;
    edtHorimetro: TDBEdit;
    Label16: TLabel;
    edtDtTransacao: TDBEdit;
    BitBtnConsulta: TBitBtn;
    Label17: TLabel;
    DBMarca: TDBLookupComboBox;
    DBModelo: TDBLookupComboBox;
    edtMaskPlaca: TMaskEdit;
    edtPlaca: TDBEdit;
    DBCombustivel: TDBLookupComboBox;
    DBTipoVeiculo: TDBLookupComboBox;
    DBCor: TDBLookupComboBox;
    BitBtnCidade: TBitBtn;
    Label18: TLabel;
    PanelBotoes: TPanel;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    DataSourceMarca: TDataSource;
    DataSourceCombustivel: TDataSource;
    DataSourceTipoVeiculo: TDataSource;
    DataSourceCor: TDataSource;
    IBQMODELO: TIBQuery;
    IBQMODELOCD_MODELO: TIntegerField;
    IBQMODELOCD_MARCA: TIntegerField;
    IBQMODELODS_MODELO: TIBStringField;
    IBQMODELODS_OBSERVACAO: TIBStringField;
    IBQMODELODT_TRANSACAO: TDateField;
    DataSourceModelo: TDataSource;
    edtNomeCidade: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure DBMarcaClick(Sender: TObject);
    procedure edtMaskPlacaExit(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure CommitRegistro();
    procedure habilitarBotoes(Boolean: Boolean);
    procedure LimparCampos();
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure BitBtnConsultaClick(Sender: TObject);
    procedure edtCodExit(Sender: TObject);
    procedure edtCodCidadeExit(Sender: TObject);
    procedure BitBtnCidadeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadVeiculo: TFormCadVeiculo;
  tipoRegistro: Boolean = True;

implementation

uses DMUnit, ConVeiculoUnit, ConCidadeUnit;

{$R *.dfm}

//Executa ao carregar o Form
procedure TFormCadVeiculo.FormShow(Sender: TObject);
begin
  DM.IBQCAD_MARCA.Active := True;
  DM.IBQCAD_MARCA.Close;
  DM.IBQCAD_MARCA.SQL.Clear;
  DM.IBQCAD_MARCA.SQL.Add('SELECT * FROM CAD_MARCA');
  DM.IBQCAD_MARCA.Open;

  DM.IBQCAD_MARCA.Last;
  DM.IBQCAD_MARCA.First;

  DM.IBQCAD_COMBUSTIVEL.Active := True;
  DM.IBQCAD_COMBUSTIVEL.Close;
  DM.IBQCAD_COMBUSTIVEL.SQL.Clear;
  DM.IBQCAD_COMBUSTIVEL.SQL.Add('SELECT * FROM CAD_COMBUSTIVEL');
  DM.IBQCAD_COMBUSTIVEL.Open;

  DM.IBQCAD_COMBUSTIVEL.Last;
  DM.IBQCAD_COMBUSTIVEL.First;

  DM.IBQCAD_TIPO_VEICULO.Active := True;
  DM.IBQCAD_TIPO_VEICULO.Close;
  DM.IBQCAD_TIPO_VEICULO.SQL.Clear;
  DM.IBQCAD_TIPO_VEICULO.SQL.Add('SELECT * FROM CAD_TIPO_VEICULO');
  DM.IBQCAD_TIPO_VEICULO.Open;

  DM.IBQCAD_TIPO_VEICULO.Last;
  DM.IBQCAD_TIPO_VEICULO.First;

  DM.IBQCAD_COR.Active := True;
  DM.IBQCAD_COR.Close;
  DM.IBQCAD_COR.SQL.Clear;
  DM.IBQCAD_COR.SQL.Add('SELECT * FROM CAD_COR');
  DM.IBQCAD_COR.Open;

  DM.IBQCAD_COR.Last;
  DM.IBQCAD_COR.First;
end;

//Executa ao selecionar uma marca na comboBox
procedure TFormCadVeiculo.DBMarcaClick(Sender: TObject);
begin
  if(DBMarca.Text = '') then
    begin
      Abort;
    end;

  IBQMODELO.Active := True;
  IBQMODELO.Close;
  IBQMODELO.ParamByName('PCDMARCA').Value := DM.IBQCAD_MARCACD_MARCA.Value;
  IBQMODELO.Open;

  IBQMODELO.Last;
  IBQMODELO.First;
end;

//Passa o valor do campo MaskEdit para EditText ligado ao banco de dados
procedure TFormCadVeiculo.edtMaskPlacaExit(Sender: TObject);
begin
  edtPlaca.Text := edtMaskPlaca.Text;
end;

function IsNumerix(S: String) : Boolean;
begin
  Result := true;
  try
    StrToInt(S);
  except
    Result := false;
  end;
end;

//Ao clicar no botão Novo
procedure TFormCadVeiculo.btnNovoClick(Sender: TObject);
begin
  DM.CAD_VEICULO.Append;
  DM.CAD_VEICULOCD_VEICULO.AsInteger := 0;
  DM.CAD_VEICULODT_TRANSACAO.AsDateTime := Date;
  tipoRegistro := True;
  habilitarBotoes(False);
end;

//Commit o registro no banco de dados
procedure TFormCadVeiculo.CommitRegistro();
begin
  DM.CAD_VEICULO.Post;
  DM.Transaction.CommitRetaining;
  DM.IBQCAD_VEICULO.Close;
end;

//Habilita/Desabilita os botões: ... e Excluir
procedure TFormCadVeiculo.habilitarBotoes(Boolean: Boolean);
begin
  BitBtnConsulta.Enabled := Boolean;
  btnExcluir.Enabled := Boolean;
end;

//Limpa os EditTex e LookupComboBox
procedure TFormCadVeiculo.LimparCampos();
var
  i : Integer;

begin
  for i := 0 to FormCadVeiculo.ComponentCount -1 do
    begin
      if FormCadVeiculo.Components[i] is TDBEdit then
        begin
          TDBEdit(FormCadVeiculo.Components[i]).Text := '';
        end
      else if FormCadVeiculo.Components[i] is TDBLookupComboBox then
        begin
          TDBLookupComboBox(FormCadVeiculo.Components[i]).KeyValue := null;
        end
      else if FormCadVeiculo.Components[i] is TMaskEdit then
        begin
          TMaskEdit(FormCadVeiculo.Components[i]).Text := '';
        end;
    end;
end;

//Ao clicar no botão Excluir
procedure TFormCadVeiculo.btnExcluirClick(Sender: TObject);
begin
  if(DM.CAD_VEICULO.IsEmpty) then
    begin
      ShowMessage('Selecione um registro para excluir!');
      Abort;
    end
  else if(edtCod.Text = '0') or (edtNome.Text = '') then
    begin
      LimparCampos;
      DM.CAD_VEICULO.Cancel;
      Abort;
    end;

  if(MessageDlg('Deseja excluir este Registro?', mtConfirmation, mbYesNoCancel, 0) = mrYes) then
    begin
      DM.CAD_VEICULO.Delete;
      DM.Transaction.CommitRetaining;
      ShowMessage('Registro excluído com sucesso!');
      DM.IBQCAD_VEICULO.Close;
      habilitarBotoes(True);
    end
  else
    begin
      DM.CAD_VEICULO.Cancel;
      tipoRegistro := True;
      Abort;
    end;
end;

//Ao clicar no botão Gravar: registra no banco a gravação ou alteração
procedure TFormCadVeiculo.btnGravarClick(Sender: TObject);
var
  i: Integer;

begin
  //executa se for um novo registro
  if(tipoRegistro) then
    begin
      for i := 0 to FormCadVeiculo.ComponentCount -1 do
        begin
          if FormCadVeiculo.Components[i] is TDBEdit then
            begin
              if TDBEdit(FormCadVeiculo.Components[i]).Text = '' then
                begin
                  ShowMessage('Valor não informado!');
                  TDBEdit(FormCadVeiculo.Components[i]).SetFocus;
                  Abort;
                end;
            end
          else if FormCadVeiculo.Components[i] is TDBLookupComboBox then
            begin
              if TDBLookupComboBox(FormCadVeiculo.Components[i]).Text = '' then
                begin
                  ShowMessage('Selecione um valor!');
                  TDBLookupComboBox(FormCadVeiculo.Components[i]).SetFocus;
                  Abort;
                end;
            end
          else if FormCadVeiculo.Components[i] is TMaskEdit then
            begin
              if TMaskEdit(FormCadVeiculo.Components[i]).Text = '' then
                begin
                  ShowMessage('Valor não informado!');
                  TMaskEdit(FormCadVeiculo.Components[i]).SetFocus;
                  Abort;
                end;
            end;
      end;

      CommitRegistro;
      ShowMessage('Registro gravado com sucesso!');
    end
  //executa quando for alterãção no registro
  else
    begin
      DM.CAD_VEICULO.Edit;
      CommitRegistro;
      ShowMessage('Registro alterado com sucesso!');
    end;
  LimparCampos;
  habilitarBotoes(True);
end;

//Cancelar transação
procedure TFormCadVeiculo.btnCancelarClick(Sender: TObject);
begin
  DM.CAD_VEICULO.Cancel;
  LimparCampos;
  habilitarBotoes(True);
end;

//Executa ao clicar no botão ...
procedure TFormCadVeiculo.BitBtnConsultaClick(Sender: TObject);
begin
  DM.CAD_VEICULO.Append;
  FormConsultaVeiculo.ShowModal;

  if(FormConsultaVeiculo.ModalResult = mrOk) then
    begin
      DM.CAD_VEICULOCD_VEICULO.Value := DM.IBQCAD_VEICULOCD_VEICULO.Value;
      edtCodExit(Sender);
      tipoRegistro := False;
    end
  else
    begin
      LimparCampos;
    end;
end;

//Executa ao sair do campo código da Cidade
procedure TFormCadVeiculo.edtCodExit(Sender: TObject);
var
  cod : Integer;

begin
  if(edtCod.Text = '') then
    begin
      edtNome.Clear;
      Abort;
    end
  else if(TryStrToInt(edtCod.Text, cod) = True) then
    begin
      DM.CAD_VEICULO.Active := True;
      DM.CAD_VEICULO.Close;
      DM.CAD_VEICULO.ParamByName('PCDVEICULO').Value := cod;
      DM.CAD_VEICULO.Open;

      DM.CAD_MODELO.Active := True;
      DM.CAD_MODELO.Close;
      DM.CAD_MODELO.ParamByName('PCDMODELO').Value := DM.CAD_VEICULOCD_MODELO.Value;
      DM.CAD_MODELO.Open;

      if(DM.CAD_VEICULO.IsEmpty = True) then
        begin
          edtCod.SetFocus;
        end
      else
        begin
          edtNome.Text := DM.CAD_VEICULODS_VEICULO.Value;
          DBMarca.KeyValue := DM.CAD_MODELOCD_MARCA.Value;
          DBMarcaClick(Sender);
          edtMaskPlaca.Text := edtPlaca.Text;
          tipoRegistro := false;
          habilitarBotoes(True);
        end;
    end
  else
    begin
      ShowMessage('valor informado incorreto!');
      edtCod.Clear;
      edtCod.SetFocus;
    end;
end;

//Ao sair do campo código da cidade
procedure TFormCadVeiculo.edtCodCidadeExit(Sender: TObject);
var
  codCidade : Integer;

begin
  if(edtCodCidade.Text = '') then
    begin
      edtNomeCidade.Clear;
      Abort;
    end
  else if(TryStrToInt(edtCodCidade.Text, codCidade) = True) then
    begin
      DM.CAD_CIDADE.Active := True;
      DM.CAD_CIDADE.Close;
      DM.CAD_CIDADE.ParamByName('PCDCIDADE').Value := codCidade;
      DM.CAD_CIDADE.Open;

      if(DM.CAD_CIDADE.IsEmpty = True) then
        begin
          edtCodCidade.SetFocus;
        end
      else
        begin
          edtNomeCidade.Text := DM.CAD_CIDADENM_CIDADE.Value;
        end;
    end
  else
    begin
      ShowMessage('valor informado incorreto!');
      edtCodCidade.Clear;
      edtCodCidade.SetFocus;
    end;
end;

//Executa ao clicar no botão ... da cidade
procedure TFormCadVeiculo.BitBtnCidadeClick(Sender: TObject);
begin
  FormConsultaCidade.ShowModal;

  if(FormConsultaCidade.ModalResult = mrOk) then
    begin
      DM.CAD_VEICULOCD_CIDADE_PLACA.Value := DM.IBQCAD_CIDADECD_CIDADE.Value;
      edtCodCidadeExit(Sender);
    end
  else
    begin
      LimparCampos;
    end;
end;
end.
