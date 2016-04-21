unit CadMarcaUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons;

type
    TFormCadMarca = class(TForm)
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
  FormCadMarca: TFormCadMarca;
  tipoRegistro: Boolean = True;

implementation

uses DMUnit, ConMarcaUnit;

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
procedure TFormCadMarca.btnNovoClick(Sender: TObject);
begin
  DM.CAD_MARCA.Append;
  DM.CAD_MARCACD_MARCA.AsInteger := 0;
  DM.CAD_MARCADT_TRANSACAO.AsDateTime := Date;
  tipoRegistro := True;
  habilitarBotoes(False);
end;

//Commit o registro no banco de dados
procedure TFormCadMarca.CommitRegistro();
begin
  DM.CAD_MARCA.Post;
  DM.Transaction.CommitRetaining;
  DM.IBQCAD_MARCA.Close;
end;

//Habilita/Desabilita os botões: ... e Excluir
procedure TFormCadMarca.habilitarBotoes(Boolean: Boolean);
begin
  BitBtnConsulta.Enabled := Boolean;
  btnExcluir.Enabled := Boolean;
end;

//Limpa os EditTex e LookupComboBox
procedure TFormCadMarca.LimparCampos();
var
  i : Integer;

begin
  for i := 0 to FormCadMarca.ComponentCount -1 do
    begin
      if FormCadMarca.Components[i] is TDBEdit then
        begin
          TDBEdit(FormCadMarca.Components[i]).Text := '';
        end
      else if FormCadMarca.Components[i] is TDBLookupComboBox then
        begin
          TDBLookupComboBox(FormCadMarca.Components[i]).KeyValue := null;
        end;
    end;
end;

//Ao clicar no botão Excluir
procedure TFormCadMarca.btnExcluirClick(Sender: TObject);
begin
  if(DM.CAD_MARCA.IsEmpty) then
    begin
      ShowMessage('Selecione um registro para excluir!');
      Abort;
    end
  else if(edtCod.Text = '0') or (edtNome.Text = '') then
    begin
      LimparCampos;
      DM.CAD_MARCA.Cancel;
      Abort;
    end;

  if(MessageDlg('Deseja excluir este Registro?', mtConfirmation, mbYesNoCancel, 0) = mrYes) then
    begin
      DM.CAD_MARCA.Delete;
      DM.Transaction.CommitRetaining;
      ShowMessage('Registro excluído com sucesso!');
      DM.IBQCAD_MARCA.Close;
      habilitarBotoes(True);
    end
  else
    begin
      DM.CAD_MARCA.Cancel;
      tipoRegistro := True;
      Abort;
    end;
end;

//Ao clicar no botão Gravar: registra no banco a gravação ou alteração
procedure TFormCadMarca.btnGravarClick(Sender: TObject);
begin
  //executa se for um novo registro
  if(tipoRegistro) then
    begin
      if(edtNome.Text = '') then
        begin
          ShowMessage('Informe a Marca!');
          edtNome.SetFocus;
          Abort;
        end;
      CommitRegistro;
      ShowMessage('Registro gravado com sucesso!');
    end
  //executa quando for alteração no registro
  else
    begin
      DM.CAD_MARCA.Edit;
      CommitRegistro;
      ShowMessage('Registro alterado com sucesso!');
    end;
  LimparCampos;
  habilitarBotoes(True);
end;

//Cancelar transação
procedure TFormCadMarca.btnCancelarClick(Sender: TObject);
begin
  DM.CAD_MARCA.Cancel;
  LimparCampos;
  habilitarBotoes(True);
end;

//Executa ao clicar no botão ...
procedure TFormCadMarca.BitBtnConsultaClick(Sender: TObject);
begin
  DM.CAD_MARCA.Append;
  FormConsultaMarca.ShowModal;

  if(FormConsultaMarca.ModalResult = mrOk) then
    begin
      DM.CAD_MARCACD_MARCA.Value := DM.IBQCAD_MARCACD_MARCA.Value;
      edtCodExit(Sender);
      tipoRegistro := False;
    end
  else
    begin
      LimparCampos;
    end;
end;

//Executa ao sair do campo código da Cidade
procedure TFormCadMarca.edtCodExit(Sender: TObject);
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
      DM.CAD_MARCA.Active := True;
      DM.CAD_MARCA.Close;
      DM.CAD_MARCA.ParamByName('PCDMARCA').Value := cod;
      DM.CAD_MARCA.Open;

      if(DM.CAD_MARCA.IsEmpty = True) then
        begin
          edtCod.SetFocus;
        end
      else
        begin
          edtNome.Text := DM.CAD_MARCANM_MARCA.Value;
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
