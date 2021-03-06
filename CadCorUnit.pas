unit CadCorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, Mask, DBCtrls;

type
    TFormCadCor = class(TForm)
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
  FormCadCor: TFormCadCor;
  tipoRegistro: Boolean = True;

implementation

uses DMUnit, ConCorUnit;

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

//Ao clicar no bot�o Novo
procedure TFormCadCor.btnNovoClick(Sender: TObject);
begin
  DM.CAD_COR.Append;
  DM.CAD_CORCD_COR.AsInteger := 0;
  DM.CAD_CORDT_TRANSACAO.AsDateTime := Date;
  tipoRegistro := True;
  habilitarBotoes(False);
end;

//Commit o registro no banco de dados
procedure TFormCadCor.CommitRegistro();
begin
  DM.CAD_COR.Post;
  DM.Transaction.CommitRetaining;
  DM.IBQCAD_COR.Close;
end;

//Habilita/Desabilita os bot�es: ... e Excluir
procedure TFormCadCor.habilitarBotoes(Boolean: Boolean);
begin
  BitBtnConsulta.Enabled := Boolean;
  btnExcluir.Enabled := Boolean;
end;

//Limpa os EditTex e LookupComboBox
procedure TFormCadCor.LimparCampos();
var
  i : Integer;

begin
  for i := 0 to FormCadCor.ComponentCount -1 do
    begin
      if FormCadCor.Components[i] is TDBEdit then
        begin
          TDBEdit(FormCadCor.Components[i]).Text := '';
        end
      else if FormCadCor.Components[i] is TDBLookupComboBox then
        begin
          TDBLookupComboBox(FormCadCor.Components[i]).KeyValue := null;
        end;
    end;
end;

//Ao clicar no bot�o Excluir
procedure TFormCadCor.btnExcluirClick(Sender: TObject);
begin
  if(DM.CAD_COR.IsEmpty) then
    begin
      ShowMessage('Selecione um registro para excluir!');
      Abort;
    end
  else if(edtCod.Text = '0') or (edtNome.Text = '') then
    begin
      LimparCampos;
      DM.CAD_COR.Cancel;
      Abort;
    end;

  if(MessageDlg('Deseja excluir este Registro?', mtConfirmation, mbYesNoCancel, 0) = mrYes) then
    begin
      DM.CAD_COR.Delete;
      DM.Transaction.CommitRetaining;
      ShowMessage('Registro exclu�do com sucesso!');
      DM.IBQCAD_COR.Close;
      habilitarBotoes(True);
    end
  else
    begin
      DM.CAD_COR.Cancel;
      tipoRegistro := True;
      Abort;
    end;
end;

//Ao clicar no bot�o Gravar: registra no banco a grava��o ou altera��o
procedure TFormCadCor.btnGravarClick(Sender: TObject);
begin
  //executa se for um novo registro
  if(tipoRegistro) then
    begin
      if(edtNome.Text = '') then
        begin
          ShowMessage('Informe a descri��o da cor!');
          edtNome.SetFocus;
          Abort;
        end;
      CommitRegistro;
      ShowMessage('Registro gravado com sucesso!');
    end
  //executa quando for altera��o no registro
  else
    begin
      DM.CAD_COR.Edit;
      CommitRegistro;
      ShowMessage('Registro alterado com sucesso!');
    end;
  LimparCampos;
  habilitarBotoes(True);
end;

//Cancelar transa��o
procedure TFormCadCor.btnCancelarClick(Sender: TObject);
begin
  DM.CAD_COR.Cancel;
  LimparCampos;
  habilitarBotoes(True);
end;

//Executa ao clicar no bot�o ...
procedure TFormCadCor.BitBtnConsultaClick(Sender: TObject);
begin
  DM.CAD_COR.Append;
  FormConsultaCor.ShowModal;

  if(FormConsultaCor.ModalResult = mrOk) then
    begin
      DM.CAD_CORCD_COR.Value := DM.IBQCAD_CORCD_COR.Value;
      edtCodExit(Sender);
      tipoRegistro := False;
    end
  else
    begin
      LimparCampos;
    end;
end;

//Executa ao sair do campo c�digo da Cidade
procedure TFormCadCor.edtCodExit(Sender: TObject);
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
      DM.CAD_COR.Active := True;
      DM.CAD_COR.Close;
      DM.CAD_COR.ParamByName('PCDCOR').Value := cod;
      DM.CAD_COR.Open;

      if(DM.CAD_COR.IsEmpty = True) then
        begin
          edtCod.SetFocus;
        end
      else
        begin
          edtNome.Text := DM.CAD_CORDS_COR.Value;
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
