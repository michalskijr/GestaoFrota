unit CadEstadoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGrids, Mask,
  DBCtrls;

type
    TFormCadEstado = class(TForm)
    DataSource: TDataSource;
    DTConsultaPais: TDataSource;
    PanelCadastro: TPanel;
    Panel1: TPanel;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    Label5: TLabel;
    DBComboBoxPais: TDBLookupComboBox;
    edtCod: TDBEdit;
    Label2: TLabel;
    edtSigla: TDBEdit;
    Label3: TLabel;
    edtNomeEstado: TDBEdit;
    Label4: TLabel;
    edtData: TDBEdit;
    BitBtnConsulta: TBitBtn;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure LimparCampos();
    procedure habilitarBotoes(Boolean: Boolean);
    procedure CommitRegistro();
    procedure BitBtnConsultaClick(Sender: TObject);
    procedure edtCodExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadEstado: TFormCadEstado;
  tipoRegistro: Boolean = True;

implementation

uses DMUnit, ConEstadoUnit;

{$R *.dfm}

//Executado ao abrir Form
procedure TFormCadEstado.FormShow(Sender: TObject);
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

//Botão Novo
procedure TFormCadEstado.btnNovoClick(Sender: TObject);
begin
  DM.CAD_UF.Append;
  DM.CAD_UFCD_UF.AsInteger := 0;
  DM.CAD_UFDT_TRANSACAO.AsDateTime := Date;
  tipoRegistro := True;
  habilitarBotoes(False);
end;

//Botão Excluir
procedure TFormCadEstado.btnExcluirClick(Sender: TObject);
begin
  if(DM.CAD_UF.IsEmpty) then
    begin
      ShowMessage('Selecione um registro para excluir!');
      Abort;
    end
  else if(edtCod.Text = '0') or (edtNomeEstado.Text = '') then
    begin
      LimparCampos;
      DM.CAD_UF.Cancel;
      Abort;
    end;

  if(MessageDlg('Deseja excluir este Registro?', mtConfirmation, mbYesNoCancel, 0) = mrYes) then
    begin
      DM.CAD_UF.Delete;
      DM.Transaction.CommitRetaining;
      ShowMessage('Registro excluído com sucesso!');
      DM.IBQCAD_ESTADO.Close;
      habilitarBotoes(True);
    end
  else
    begin
      DM.CAD_UF.Cancel;
      tipoRegistro := True;
      Abort;
    end;
end;

//Grava ou altera o registro no Banco de Dados
procedure TFormCadEstado.btnGravarClick(Sender: TObject);
begin
  //executa se for um novo registro
  if(tipoRegistro) then
    begin
      if(edtNomeEstado.Text = '') then
        begin
          ShowMessage('Informe o nome do Estado!');
          edtNomeEstado.SetFocus;
          Abort;
        end
      else if(edtSigla.Text = '') then
        begin
          ShowMessage('Informe a sigla do Estado!');
          edtSigla.SetFocus;
          Abort;
        end
      else if(DBComboBoxPais.Text = '') then
        begin
          ShowMessage('Selecione um País!');
          DBComboBoxPais.SetFocus;
          Abort;
        end;
      CommitRegistro;
      ShowMessage('Registro gravado com sucesso!');
    end
    //Executa quando for alteração no registro
    else
      begin
        DM.CAD_UF.Edit;
        CommitRegistro;
        ShowMessage('Registro alterado com sucesso!');
      end;
  LimparCampos;
  habilitarBotoes(True);
end;

//Commit o registro no banco de dados
procedure TFormCadEstado.CommitRegistro();
begin
  DM.CAD_UF.Post;
  DM.Transaction.CommitRetaining;
  DM.IBQCAD_ESTADO.Close;
end;

//Cancelar transação
procedure TFormCadEstado.btnCancelarClick(Sender: TObject);
begin
  DM.CAD_UF.Cancel;
  LimparCampos;
  habilitarBotoes(True);
end;

//Habilita/Desabilita os botões: ... e Excluir
procedure TFormCadEstado.habilitarBotoes(Boolean: Boolean);
begin
  BitBtnConsulta.Enabled := Boolean;
  btnExcluir.Enabled := Boolean;
end;

//Executa ao clicar no botão ...
procedure TFormCadEstado.BitBtnConsultaClick(Sender: TObject);
begin
  DM.CAD_UF.Append;
  FormConsultaEstado.ShowModal;

  if(FormConsultaEstado.ModalResult = mrOk) then
    begin
      DM.CAD_UFCD_UF.Value := DM.IBQCAD_ESTADOCD_UF.Value;
      edtCodExit(Sender);
      tipoRegistro := false;
    end
  else
    begin
      LimparCampos;
    end;
end;

//Limpa os EditTex
procedure TFormCadEstado.LimparCampos();
var
  i : Integer;

begin
  for i := 0 to FormCadEstado.ComponentCount -1 do
    begin
      if FormCadEstado.Components[i] is TDBEdit then
        begin
          TDBEdit(FormCadEstado.Components[i]).Text := '';
        end
      else if FormCadEstado.Components[i] is TDBLookupComboBox then
        begin
          TDBLookupComboBox(FormCadEstado.Components[i]).KeyValue := null;
        end;
    end;
end;

//Executa ao sair do campo código do Estado
procedure TFormCadEstado.edtCodExit(Sender: TObject);
var
  cdEstado : Integer;

begin
  if(edtCod.Text = '') then
    begin
      edtNomeEstado.Clear;
      Abort;
    end;

  if(TryStrToInt(edtCod.Text, cdEstado) = True) then
    begin
      DM.CAD_UF.Active := True;
      DM.CAD_UF.Close;
      DM.CAD_UF.ParamByName('PCDUF').Value := cdEstado;
      DM.CAD_UF.Open;

      if(DM.CAD_UF.IsEmpty = True) then
        begin
          edtCod.SetFocus;
        end
      else
        begin
          edtNomeEstado.Text := DM.CAD_UFNM_UF.Value;
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
//Pronto
end.
