unit CadModeloUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, DB, Mask, ExtCtrls;

type
    TFormCadModelo = class(TForm)
    Panel: TPanel;
    Label1: TLabel;
    edtCod: TDBEdit;
    DataSource: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    edtNome: TDBEdit;
    Label4: TLabel;
    edtObservacao: TDBEdit;
    Label5: TLabel;
    edtDtTransacao: TDBEdit;
    BitBtnConsulta: TBitBtn;
    DBMarca: TDBLookupComboBox;
    DataSourceMarca: TDataSource;
    PanelBotoes: TPanel;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
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
  FormCadModelo: TFormCadModelo;
  tipoRegistro: Boolean = True;

implementation

uses DMUnit, ConModeloUnit;

{$R *.dfm}

//Executa ao abrir Form
procedure TFormCadModelo.FormShow(Sender: TObject);
begin
  DM.IBQCAD_MARCA.Active := True;
  DM.IBQCAD_MARCA.Close;
  DM.IBQCAD_MARCA.SQL.Clear;
  DM.IBQCAD_MARCA.SQL.Add('SELECT * FROM CAD_MARCA');
  DM.IBQCAD_MARCA.Open;

  DM.IBQCAD_MARCA.Last;
  DM.IBQCAD_MARCA.First;
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
procedure TFormCadModelo.btnNovoClick(Sender: TObject);
begin
  DM.CAD_MODELO.Append;
  DM.CAD_MODELOCD_MODELO.AsInteger := 0;
  DM.CAD_MODELODT_TRANSACAO.AsDateTime := Date;
  tipoRegistro := True;
  habilitarBotoes(False);
end;

//Commit o registro no banco de dados
procedure TFormCadModelo.CommitRegistro();
begin
  DM.CAD_MODELO.Post;
  DM.Transaction.CommitRetaining;
  DM.IBQCAD_MODELO.Close;
end;

//Habilita/Desabilita os botões: ... e Excluir
procedure TFormCadModelo.habilitarBotoes(Boolean: Boolean);
begin
  BitBtnConsulta.Enabled := Boolean;
  btnExcluir.Enabled := Boolean;
end;

//Limpa os EditTex e LookupComboBox
procedure TFormCadModelo.LimparCampos();
var
  i : Integer;

begin
  for i := 0 to FormCadModelo.ComponentCount -1 do
    begin
      if FormCadModelo.Components[i] is TDBEdit then
        begin
          TDBEdit(FormCadModelo.Components[i]).Text := '';
        end
      else if FormCadModelo.Components[i] is TDBLookupComboBox then
        begin
          TDBLookupComboBox(FormCadModelo.Components[i]).KeyValue := null;
        end;
    end;
end;

//Ao clicar no botão Excluir
procedure TFormCadModelo.btnExcluirClick(Sender: TObject);
begin
  if(DM.CAD_MODELO.IsEmpty) then
    begin
      ShowMessage('Selecione um registro para excluir!');
      Abort;
    end
  else if(edtCod.Text = '0') or (edtNome.Text = '') then
    begin
      LimparCampos;
      DM.CAD_MODELO.Cancel;
      Abort;
    end;

  if(MessageDlg('Deseja excluir este Registro?', mtConfirmation, mbYesNoCancel, 0) = mrYes) then
    begin
      DM.CAD_MODELO.Delete;
      DM.Transaction.CommitRetaining;
      ShowMessage('Registro excluído com sucesso!');
      DM.IBQCAD_MODELO.Close;
      habilitarBotoes(True);
    end
  else
    begin
      DM.CAD_MODELO.Cancel;
      tipoRegistro := True;
      Abort;
    end;
end;

//Ao clicar no botão Gravar: registra no banco a gravação ou alteração
procedure TFormCadModelo.btnGravarClick(Sender: TObject);
begin
  //executa se for um novo registro
  if(tipoRegistro) then
    begin
      if(edtNome.Text = '') then
        begin
          ShowMessage('Informe a descrição do modelo!');
          edtNome.SetFocus;
          Abort;
        end
      else if(DBMarca.Text = '') then
        begin
          ShowMessage('Selecione uma marca!');
          DBMarca.SetFocus;
          Abort;
        end;
      CommitRegistro;
      ShowMessage('Registro gravado com sucesso!');
    end
  //executa quando for alteração no registro
  else
    begin
      DM.CAD_MODELO.Edit;
      CommitRegistro;
      ShowMessage('Registro alterado com sucesso!');
    end;
  LimparCampos;
  habilitarBotoes(True);
end;

//Cancelar transação
procedure TFormCadModelo.btnCancelarClick(Sender: TObject);
begin
  DM.CAD_MODELO.Cancel;
  LimparCampos;
  habilitarBotoes(True);
end;

//Executa ao clicar no botão ...
procedure TFormCadModelo.BitBtnConsultaClick(Sender: TObject);
begin
  DM.CAD_MODELO.Append;
  FormConsultaModelo.ShowModal;

  if(FormConsultaModelo.ModalResult = mrOk) then
    begin
      DM.CAD_MODELOCD_MODELO.Value := DM.IBQCAD_MODELOCD_MODELO.Value;
      edtCodExit(Sender);
      tipoRegistro := False;
    end
  else
    begin
      LimparCampos;
    end;
end;

//Executa ao sair do campo código da Cidade
procedure TFormCadModelo.edtCodExit(Sender: TObject);
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
      DM.CAD_MODELO.Active := True;
      DM.CAD_MODELO.Close;
      DM.CAD_MODELO.ParamByName('PCDMODELO').Value := cod;
      DM.CAD_MODELO.Open;

      if(DM.CAD_MODELO.IsEmpty = True) then
        begin
          edtCod.SetFocus;
        end
      else
        begin
          edtNome.Text := DM.CAD_MODELODS_MODELO.Value;
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
