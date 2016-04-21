unit CadCombustiveisUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Mask, DBCtrls, ExtCtrls;

type
    TFormCadCombustiveis = class(TForm)
    Panel: TPanel;
    Label1: TLabel;
    edtCod: TDBEdit;
    DataSource: TDataSource;
    Label2: TLabel;
    edtNome: TDBEdit;
    Label3: TLabel;
    edtDtTransacao: TDBEdit;
    BitBtnConsulta: TBitBtn;
    PanelBotoes: TPanel;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure CommitRegistro();
    procedure habilitarBotoes(Boolean: Boolean);
    procedure LimparCampos();
    procedure btnNovoClick(Sender: TObject);
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
  FormCadCombustiveis: TFormCadCombustiveis;
  tipoRegistro: Boolean = True;

implementation

uses DMUnit, ConCombustiveisUnit;

{$R *.dfm}

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
procedure TFormCadCombustiveis.btnNovoClick(Sender: TObject);
begin
  DM.CAD_COMBUSTIVEL.Append;
  DM.CAD_COMBUSTIVELCD_COMBUSTIVEL.AsInteger := 0;
  DM.CAD_COMBUSTIVELDT_TRANSACAO.AsDateTime := Date;
  tipoRegistro := True;
  habilitarBotoes(False);
end;

//Commit o registro no banco de dados
procedure TFormCadCombustiveis.CommitRegistro();
begin
  DM.CAD_COMBUSTIVEL.Post;
  DM.Transaction.CommitRetaining;
  DM.IBQCAD_COMBUSTIVEL.Close;
end;

//Habilita/Desabilita os botões: ... e Excluir
procedure TFormCadCombustiveis.habilitarBotoes(Boolean: Boolean);
begin
  BitBtnConsulta.Enabled := Boolean;
  btnExcluir.Enabled := Boolean;
end;

//Limpa os EditTex e LookupComboBox
procedure TFormCadCombustiveis.LimparCampos();
var
  i : Integer;

begin
  for i := 0 to FormCadCombustiveis.ComponentCount -1 do
    begin
      if FormCadCombustiveis.Components[i] is TDBEdit then
        begin
          TDBEdit(FormCadCombustiveis.Components[i]).Text := '';
        end
      else if FormCadCombustiveis.Components[i] is TDBLookupComboBox then
        begin
          TDBLookupComboBox(FormCadCombustiveis.Components[i]).KeyValue := null;
        end;
    end;
end;

//Ao clicar no botão Excluir
procedure TFormCadCombustiveis.btnExcluirClick(Sender: TObject);
begin
  if(DM.CAD_COMBUSTIVEL.IsEmpty) then
    begin
      ShowMessage('Selecione um registro para excluir!');
      Abort;
    end
  else if(edtCod.Text = '0') or (edtNome.Text = '') then
    begin
      LimparCampos;
      DM.CAD_COMBUSTIVEL.Cancel;
      Abort;
    end;

  if(MessageDlg('Deseja excluir este Registro?', mtConfirmation, mbYesNoCancel, 0) = mrYes) then
    begin
      DM.CAD_COMBUSTIVEL.Delete;
      DM.Transaction.CommitRetaining;
      ShowMessage('Registro excluído com sucesso!');
      DM.IBQCAD_COMBUSTIVEL.Close;
      habilitarBotoes(True);
    end
  else
    begin
      DM.CAD_COMBUSTIVEL.Cancel;
      tipoRegistro := True;
      Abort;
    end;
end;

//Ao clicar no botão Gravar: registra no banco a gravação ou alteração
procedure TFormCadCombustiveis.btnGravarClick(Sender: TObject);
begin
  //executa se for um novo registro
  if(tipoRegistro) then
    begin
      if(edtNome.Text = '') then
        begin
          ShowMessage('Informe a descrição do combustível!');
          edtNome.SetFocus;
          Abort;
        end;
      CommitRegistro;
      ShowMessage('Registro gravado com sucesso!');
    end
  //executa quando for alteração no registro
  else
    begin
      DM.CAD_COMBUSTIVEL.Edit;
      CommitRegistro;
      ShowMessage('Registro alterado com sucesso!');
    end;
  LimparCampos;
  habilitarBotoes(True);
end;

//Cancelar transação
procedure TFormCadCombustiveis.btnCancelarClick(Sender: TObject);
begin
  DM.CAD_COMBUSTIVEL.Cancel;
  LimparCampos;
  habilitarBotoes(True);
end;

//Executa ao clicar no botão ...
procedure TFormCadCombustiveis.BitBtnConsultaClick(Sender: TObject);
begin
  DM.CAD_COMBUSTIVEL.Append;
  FormConsultaCombustiveis.ShowModal;

  if(FormConsultaCombustiveis.ModalResult = mrOk) then
    begin
      DM.CAD_COMBUSTIVELCD_COMBUSTIVEL.Value := DM.IBQCAD_COMBUSTIVELCD_COMBUSTIVEL.Value;
      edtCodExit(Sender);
      tipoRegistro := False;
    end
  else
    begin
      LimparCampos;
    end;
end;

//Executa ao sair do campo código da Cidade
procedure TFormCadCombustiveis.edtCodExit(Sender: TObject);
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
      DM.CAD_COMBUSTIVEL.Active := True;
      DM.CAD_COMBUSTIVEL.Close;
      DM.CAD_COMBUSTIVEL.ParamByName('PCDCOMBUSTIVEL').Value := cod;
      DM.CAD_COMBUSTIVEL.Open;

      if(DM.CAD_COMBUSTIVEL.IsEmpty = True) then
        begin
          edtCod.SetFocus;
        end
      else
        begin
          edtNome.Text := DM.CAD_COMBUSTIVELNM_COMBUSTIVEL.Value;
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
//Pronto!
end.
