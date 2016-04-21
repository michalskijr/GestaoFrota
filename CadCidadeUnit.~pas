unit CadCidadeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, DBCtrls, StdCtrls, Buttons, Mask,
  ExtCtrls;

type
    TFormCadCidade = class(TForm)
    Panel: TPanel;
    Label1: TLabel;
    edtCod: TDBEdit;
    DataSource: TDataSource;
    Label2: TLabel;
    edtNome: TDBEdit;
    Label3: TLabel;
    edtDtTransacao: TDBEdit;
    Label4: TLabel;
    BitBtnConsulta: TBitBtn;
    Label5: TLabel;
    DBPais: TDBLookupComboBox;
    DBEstado: TDBLookupComboBox;
    PanelBotoes: TPanel;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    DataSourcePais: TDataSource;
    DataSourceEstado: TDataSource;
    IBQESTADO: TIBQuery;
    IBQESTADOCD_UF: TIntegerField;
    IBQESTADOSG_UF: TIBStringField;
    IBQESTADONM_UF: TIBStringField;
    IBQESTADODT_TRANSACAO: TDateField;
    IBQESTADOCD_PAIS: TIntegerField;
    procedure DBPaisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure CommitRegistro();
    procedure habilitarBotoes(Boolean: Boolean);
    procedure LimparCampos();
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure BitBtnConsultaClick(Sender: TObject);
    procedure edtCodExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadCidade: TFormCadCidade;
  tipoRegistro: Boolean = True;

implementation

uses DMUnit, ConCidadeUnit;

{$R *.dfm}

//Executa ao selecionar um país na comboBox
procedure TFormCadCidade.DBPaisClick(Sender: TObject);
begin
  if(DBPais.Text = '') then
    begin
      Abort;
    end;

  IBQESTADO.Active := True;
  IBQESTADO.Close;
  IBQESTADO.ParamByName('PCDPAIS').Value := DM.IBQCAD_PAISCD_PAIS.Value;
  IBQESTADO.Open;

  IBQESTADO.Last;
  IBQESTADO.First;
end;

//Executa ao abrir Form
procedure TFormCadCidade.FormShow(Sender: TObject);
begin
  DM.IBQCAD_PAIS.Active := True;
  DM.IBQCAD_PAIS.Close;
  DM.IBQCAD_PAIS.SQL.Clear;
  DM.IBQCAD_PAIS.SQL.Add('SELECT * FROM CAD_PAIS');
  DM.IBQCAD_PAIS.Open;

  DM.IBQCAD_PAIS.Last;
  DM.IBQCAD_PAIS.First;
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
procedure TFormCadCidade.btnNovoClick(Sender: TObject);
begin
  DM.CAD_CIDADE.Append;
  DM.CAD_CIDADECD_CIDADE.AsInteger := 0;
  DM.CAD_CIDADEDT_TRANSACAO.AsDateTime := Date;
  tipoRegistro := True;
  habilitarBotoes(False);
end;

//Commit o registro no banco de dados
procedure TFormCadCidade.CommitRegistro();
begin
  DM.CAD_CIDADE.Post;
  DM.Transaction.CommitRetaining;
  DM.IBQCAD_CIDADE.Close;
end;

//Habilita/Desabilita os botões: ... e Excluir
procedure TFormCadCidade.habilitarBotoes(Boolean: Boolean);
begin
  BitBtnConsulta.Enabled := Boolean;
  btnExcluir.Enabled := Boolean;
end;

//Limpa os EditTex e LookupComboBox
procedure TFormCadCidade.LimparCampos();
var
  i : Integer;

begin
  for i := 0 to FormCadCidade.ComponentCount -1 do
    begin
      if FormCadCidade.Components[i] is TDBEdit then
        begin
          TDBEdit(FormCadCidade.Components[i]).Text := '';
        end
      else if FormCadCidade.Components[i] is TDBLookupComboBox then
        begin
          TDBLookupComboBox(FormCadCidade.Components[i]).KeyValue := null;
        end;
    end;
end;

//Ao clicar no botão Excluir
procedure TFormCadCidade.btnExcluirClick(Sender: TObject);
begin
  if(DM.CAD_CIDADE.IsEmpty) then
    begin
      ShowMessage('Selecione um registro para excluir!');
      Abort;
    end
  else if(edtCod.Text = '0') or (edtNome.Text = '') then
    begin
      LimparCampos;
      DM.CAD_CIDADE.Cancel;
      Abort;
    end;

  if(MessageDlg('Deseja excluir este Registro?', mtConfirmation, mbYesNoCancel, 0) = mrYes) then
    begin
      DM.CAD_CIDADE.Delete;
      DM.Transaction.CommitRetaining;
      ShowMessage('Registro excluído com sucesso!');
      DM.IBQCAD_CIDADE.Close;
      habilitarBotoes(True);
    end
  else
    begin
      DM.CAD_CIDADE.Cancel;
      tipoRegistro := True;
      Abort;
    end;
end;

//Ao clicar no botão Gravar: registra no banco a gravação ou alteração
procedure TFormCadCidade.btnGravarClick(Sender: TObject);
begin
  //executa se for um novo registro
  if(tipoRegistro) then
    begin
      if(edtNome.Text = '') then
        begin
          ShowMessage('Informe o nome da cidade!');
          edtNome.SetFocus;
          Abort;
        end
      else if(DBPais.Text = '') then
        begin
          ShowMessage('Selecione um país!');
          DBPais.SetFocus;
          Abort;
        end
      else if(DBEstado.Text = '') then
        begin
          ShowMessage('Selecione um estado!');
          DBEstado.SetFocus;
          Abort;
        end;
      CommitRegistro;
      ShowMessage('Registro gravado com sucesso!');
    end
  //executa quando for alterãção no registro
  else
    begin
      DM.CAD_CIDADE.Edit;
      CommitRegistro;
      ShowMessage('Registro alterado com sucesso!');
    end;
  LimparCampos;
  habilitarBotoes(True);
end;

//Cancelar transação
procedure TFormCadCidade.btnCancelarClick(Sender: TObject);
begin
  DM.CAD_CIDADE.Cancel;
  LimparCampos;
  habilitarBotoes(True);
end;

//Executa ao clicar no botão ...
procedure TFormCadCidade.BitBtnConsultaClick(Sender: TObject);
begin
  DM.CAD_CIDADE.Append;
  FormConsultaCidade.ShowModal;

  if(FormConsultaCidade.ModalResult = mrOk) then
    begin
      DM.CAD_CIDADECD_CIDADE.Value := DM.IBQCAD_CIDADECD_CIDADE.Value;
      edtCodExit(Sender);
      tipoRegistro := False;
    end
  else
    begin
      LimparCampos;
    end;
end;

//Executa ao sair do campo código da Cidade
procedure TFormCadCidade.edtCodExit(Sender: TObject);
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
      DM.CAD_CIDADE.Active := True;
      DM.CAD_CIDADE.Close;
      DM.CAD_CIDADE.ParamByName('PCDCIDADE').Value := cod;
      DM.CAD_CIDADE.Open;

      DM.CAD_UF.Active := True;
      DM.CAD_UF.Close;
      DM.CAD_UF.ParamByName('PCDUF').Value := DM.CAD_CIDADECD_UF.Value;
      DM.CAD_UF.Open;

      if(DM.CAD_CIDADE.IsEmpty = True) then
        begin
          edtCod.SetFocus;
        end
      else
        begin
          edtNome.Text := DM.CAD_CIDADENM_CIDADE.Value;
          DBPais.KeyValue := DM.CAD_UFCD_PAIS.Value;
          DBPaisClick(Sender);
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
//Pronto
end.
