unit CadPaisUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, Mask, DBCtrls, Buttons, ExtCtrls,
  ComCtrls;

type
    TFormCadPais = class(TForm)
    PBotoes: TPanel;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    DataSource: TDataSource;
    btnCancelar: TBitBtn;
    PCadastro: TPanel;
    Label1: TLabel;
    edtCod: TDBEdit;
    Label2: TLabel;
    edtNomePais: TDBEdit;
    Label3: TLabel;
    edtDtTransacao: TDBEdit;
    BitBtnConsulta: TBitBtn;
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure habilitarBotoes(Boolean: Boolean);
    procedure BitBtnConsultaClick(Sender: TObject);
    procedure LimparCampos();
    procedure edtCodExit(Sender: TObject);
    procedure CommitRegistro();

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadPais: TFormCadPais;
  tipoRegistro: Boolean = True;

implementation

uses DMUnit, ConPaisUnit;

{$R *.dfm}

function IsNumerix(S : String) : Boolean;
begin
  Result := True;
  Try
    StrToInt(S);
  Except
    Result := False;
  end;
end;

//Executa ao clicar no botão Novo
procedure TFormCadPais.btnNovoClick(Sender: TObject);
begin
  DM.CAD_PAIS.Append;
  DM.CAD_PAISCD_PAIS.AsInteger := 0;
  DM.CAD_PAISDT_TRANSACAO.AsDateTime := Date;
  tipoRegistro := True;
  habilitarBotoes(False);
end;

//Executa ao clicar no botão Excluir
procedure TFormCadPais.btnExcluirClick(Sender: TObject);
begin
  if(DM.CAD_PAIS.IsEmpty) then
    begin
      ShowMessage('Selecione um registro para excluir!');
      Abort;
    end
  else if(edtCod.Text = '0') or (edtNomePais.Text = '') then
    begin
      LimparCampos;
      DM.CAD_PAIS.Cancel;
      Abort;
    end;

  if(MessageDlg('Deseja excluir este Registro?',mtConfirmation,mbYesNoCancel,0) = mrYes) then
    begin
      DM.CAD_PAIS.delete;
      DM.Transaction.CommitRetaining;
      ShowMessage('Registro excluído com sucesso!');
      DM.IBQCAD_PAIS.Close;
      habilitarBotoes(True);
    end
  else
    begin
      DM.CAD_PAIS.Cancel;
      tipoRegistro := True;
      Abort;
    end;
end;

//Gravar registro no banco de dados
procedure TFormCadPais.btnGravarClick(Sender: TObject);
begin
  //Grava se for um novo registro
  if(tipoRegistro) then
    begin
      if(edtNomePais.Text = '') then
        begin
          ShowMessage('Informe o nome do País!');
          edtNomePais.SetFocus;
          Abort;
        end;
      CommitRegistro;
      ShowMessage('Registro gravado com sucesso!');
    end
    //Executa quando for alteração no registro
  else
    begin
      DM.CAD_PAIS.Edit;
      CommitRegistro;
      ShowMessage('Registro alterado com sucesso!');
    end;
  LimparCampos;
  habilitarBotoes(True);
end;

//Commit o registro no banco de dados
procedure TFormCadPais.CommitRegistro();
begin
  DM.CAD_PAIS.Post;
  DM.Transaction.CommitRetaining;
  DM.IBQCAD_PAIS.Close;
end;

//Cancelar transação
procedure TFormCadPais.btnCancelarClick(Sender: TObject);
begin
  DM.CAD_PAIS.Cancel;
  LimparCampos;
  habilitarBotoes(True);
end;

//Habilita/Desabilita os botões: ... e Excluir
procedure TFormCadPais.habilitarBotoes(Boolean: Boolean);
begin
  BitBtnConsulta.Enabled := Boolean;
  btnExcluir.Enabled := Boolean;
end;

//Executa ao clicar no botão ...
procedure TFormCadPais.BitBtnConsultaClick(Sender: TObject);
begin
  DM.CAD_PAIS.Append;
  FormConsultaPais.ShowModal;

  if(FormConsultaPais.ModalResult = mrOk) then
    begin
      DM.CAD_PAISCD_PAIS.Value := DM.IBQCAD_PAISCD_PAIS.Value;
      edtCodExit(Sender);
      tipoRegistro := false;
    end
  else
    begin
      LimparCampos;
    end;
end;

//Limpa os EditTex
procedure TFormCadPais.LimparCampos();
var
  i : Integer;

begin
  for i := 0 to FormCadPais.ComponentCount -1 do
    begin
      if FormCadPais.Components[i] is TDBEdit then
        begin
          TDBEdit(FormCadPais.Components[i]).Text := '';
        end;
    end;
end;

//Executa ao sair do campo código do País
procedure TFormCadPais.edtCodExit(Sender: TObject);
var
  cdPais : Integer;

begin
  if(edtCod.Text = '') then
    begin
      edtNomePais.Clear;
      Abort;
    end;

  if(TryStrToInt(edtCod.Text, cdPais) = True) then
    begin
      DM.CAD_PAIS.Active := True;
      DM.CAD_PAIS.Close;
      DM.CAD_PAIS.ParamByName('PCDPAIS').Value := cdPais;
      DM.CAD_PAIS.Open;

      if(DM.CAD_PAIS.IsEmpty = True) then
        begin
          edtCod.SetFocus;
        end
      else
        begin
          edtNomePais.Text := DM.CAD_PAISNM_PAIS.Value;
          tipoRegistro := false;
          habilitarBotoes(True);
        end;
    end
  else
    begin
      ShowMessage('Valor informado incorreto!');
      edtCod.Clear;
      edtCod.SetFocus;
    end;
end;

end.
