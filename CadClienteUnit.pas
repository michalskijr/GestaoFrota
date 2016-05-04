unit CadClienteUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, Buttons,
  ComCtrls;

type
    TFormCadCliente = class(TForm)
    Panel: TPanel;
    Label1: TLabel;
    edtCod: TDBEdit;
    DataSourcePessoa: TDataSource;
    LabelNome: TLabel;
    edtDescricao: TDBEdit;
    Label4: TLabel;
    edtDtTransacao: TDBEdit;
    DataSourceFisica: TDataSource;
    radioTpPessoa: TRadioGroup;
    radioFisica: TRadioButton;
    radioJuridica: TRadioButton;
    BitBtnConsulta: TBitBtn;
    DataSourceJuridica: TDataSource;
    DataSourceCliente: TDataSource;
    PanelBotoes: TPanel;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    DataSourceEndereco: TDataSource;
    DataSourceContato: TDataSource;
    PageControl: TPageControl;
    TabEndereco: TTabSheet;
    TabContato: TTabSheet;
    gridEndereco: TDBGrid;
    DBGrid2: TDBGrid;
    TabDados: TTabSheet;
    LabelCPFCNPJ: TLabel;
    maskCPFCNPJ: TMaskEdit;
    LabelRGEstadual: TLabel;
    edtRGEstadual: TEdit;
    labelNomeFantasia: TLabel;
    edtNomeFantasia: TDBEdit;
    labelDtNascimento: TLabel;
    edtDtNascimento: TDBEdit;
    radioGroupSexo: TRadioGroup;
    radioMasculino: TRadioButton;
    radioFeminino: TRadioButton;
    procedure radioFisicaClick(Sender: TObject);
    procedure radioJuridicaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  FormCadCliente: TFormCadCliente;
  tipoRegistro: Boolean = True;

implementation

uses DMUnit, CadEnderecoUnit, Math, StrUtils;

{$R *.dfm}

//Ao selecionar a opção de Pessoa Física
//altera os campos para PF
procedure TFormCadCliente.radioFisicaClick(Sender: TObject);
begin
  maskCPFCNPJ.EditMask := '999.999.999-99';
  LabelCPFCNPJ.Caption := 'CPF';
  LabelRGEstadual.Caption := 'RG';
  edtNomeFantasia.Visible := False;
  labelNomeFantasia.Visible := False;
  labelDtNascimento.Visible := True;
  edtDtNascimento.Visible := True;
  radioGroupSexo.Visible := True;
  radioMasculino.Visible := True;
  radioFeminino.Visible := True;

  DM.CAD_FISICA.Append;
  DM.CAD_JURIDICA.Cancel;
end;

//Ao selecionar a opção de Pessoa Jurídica
//altera os campos para PJ
procedure TFormCadCliente.radioJuridicaClick(Sender: TObject);
begin
  maskCPFCNPJ.EditMask := '99.999.999/9999-99';
  LabelCPFCNPJ.Caption := 'CNPJ';
  LabelRGEstadual.Caption := 'Inscrição Estadual';
  edtNomeFantasia.Visible := True;
  labelNomeFantasia.Visible := True;
  labelDtNascimento.Visible := False;
  edtDtNascimento.Visible := False;
  radioGroupSexo.Visible := False;
  radioMasculino.Visible := False;
  radioFeminino.Visible := False;

  DM.CAD_JURIDICA.Append;
  DM.CAD_FISICA.Cancel;
end;

//Executa ao criar o Form
procedure TFormCadCliente.FormShow(Sender: TObject);
begin
  PageControl.TabIndex := 0;

  DM.CAD_PESSOA.Active := True;
  DM.CAD_FISICA.Active := True;
  DM.CAD_JURIDICA.Active := True;
  DM.CAD_CLIENTE.Active := True;
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
procedure TFormCadCliente.btnNovoClick(Sender: TObject);
begin
  DM.CAD_PESSOA.Append;
  DM.CAD_CLIENTE.Append;

  DM.IBQCD_PESSOA.Active := True;
  DM.IBQCD_PESSOA.Close;
  DM.IBQCD_PESSOA.Open;

  DM.CAD_PESSOACD_PESSOA.Value := DM.IBQCD_PESSOACD_PESSOA.Value;
  DM.CAD_PESSOADT_TRANSACAO.Value := Date;


//  DM.CAD_CLIENTECD_CLIENTE.AsInteger := 0;
//  DM.CAD_PESSOACD_PESSOA.AsInteger := 0;
  DM.CAD_CLIENTEDT_TRANSACAO.AsDateTime := Date;
  tipoRegistro := True;
  habilitarBotoes(False);
end;

//Commit o registro no banco de dados
procedure TFormCadCliente.CommitRegistro();
begin
  DM.CAD_CLIENTE.Post;
  DM.Transaction.CommitRetaining;
  //DM.IBQCAD_CLIENTE.Close;
end;

//Habilita/Desabilita os botões: ... e Excluir
procedure TFormCadCliente.habilitarBotoes(Boolean: Boolean);
begin
  BitBtnConsulta.Enabled := Boolean;
  btnExcluir.Enabled := Boolean;
end;

//Limpa os EditTex e LookupComboBox
procedure TFormCadCliente.LimparCampos();
var
  i : Integer;

begin
  for i := 0 to FormCadCliente.ComponentCount -1 do
    begin
      if FormCadCliente.Components[i] is TDBEdit then
        begin
          TDBEdit(FormCadCliente.Components[i]).Text := '';
        end
      else if FormCadCliente.Components[i] is TDBLookupComboBox then
        begin
          TDBLookupComboBox(FormCadCliente.Components[i]).KeyValue := null;
        end;
    end;
end;

//Ao clicar no botão Excluir
procedure TFormCadCliente.btnExcluirClick(Sender: TObject);
begin
  if(DM.CAD_PESSOA.IsEmpty) then
    begin
      ShowMessage('Selecione um registro para excluir!');
      Abort;
    end
  else if(edtCod.Text = '0') or (edtDescricao.Text = '') then
    begin
      LimparCampos;
      DM.CAD_PESSOA.Cancel;
      DM.CAD_FISICA.Cancel;
      DM.CAD_JURIDICA.Cancel;
      DM.CAD_CLIENTE.Cancel;
      Abort;
    end;

  if(MessageDlg('Deseja excluir este Registro?', mtConfirmation, mbYesNoCancel, 0) = mrYes) then
    begin
      DM.CAD_PESSOA.Delete;
      if(radioFisica.Checked) then
        begin
          DM.CAD_FISICA.Delete;
        end
      else
        begin
          DM.CAD_JURIDICA.Delete;
        end;

      DM.CAD_CLIENTE.Delete;
      DM.Transaction.CommitRetaining;
      ShowMessage('Registro excluído com sucesso!');
      //DM.IBQCAD_CLIENTE.Close;
      habilitarBotoes(True);
    end
  else
    begin
      DM.CAD_PESSOA.Cancel;
      DM.CAD_FISICA.Cancel;
      DM.CAD_JURIDICA.Cancel;
      DM.CAD_CLIENTE.Cancel;
      tipoRegistro := True;
      Abort;
    end;
end;

//Ao clicar no botão Gravar: registra no banco a gravação ou alteração
procedure TFormCadCliente.btnGravarClick(Sender: TObject);
begin
  if(radioFisica.Checked) then   //pessoa fisica
    begin
      DM.CAD_PESSOATP_PESSOA.Value := 'F';

      DM.CAD_FISICACD_PESSOA.Value := DM.IBQCD_PESSOACD_PESSOA.Value;
      DM.CAD_FISICANR_RG.Value := edtRGEstadual.Text;
      DM.CAD_FISICANR_CPF.Value := AnsiReplaceStr(maskCPFCNPJ.Text, '.''-', '');
      if(radioMasculino.Checked) then
        begin   //sexo masculino
          DM.CAD_FISICAIN_SEXO.Value := 'M';
        end
      else //sexo feminino
        begin
          DM.CAD_FISICAIN_SEXO.Value := 'F';
        end;
    end
  else //pessoa juridica
    begin
      DM.CAD_PESSOATP_PESSOA.Value := 'J';

      DM.CAD_JURIDICACD_PESSOA.Value := DM.IBQCD_PESSOACD_PESSOA.Value;
      DM.CAD_JURIDICANR_INSC_EST.Value := edtRGEstadual.Text;
      DM.CAD_JURIDICANR_CNPJ.Value := AnsiReplaceStr(maskCPFCNPJ.Text, '.''/''-', '');
    end;

  DM.CAD_PESSOA.Post;

  if(radioFisica.Checked) then
    begin
      DM.CAD_FISICA.Post;
    end
  else
    begin
      DM.CAD_JURIDICA.Post;
    end;

  DM.Transaction.CommitRetaining;

  DM.CAD_CLIENTECD_CLIENTE.AsInteger := 0;
  DM.CAD_CLIENTECD_PESSOA.Value := DM.IBQCD_PESSOACD_PESSOA.Value;
  DM.CAD_CLIENTEDT_TRANSACAO.Value := Date;
  DM.CAD_CLIENTE.Post;

  DM.Transaction.CommitRetaining;

  LimparCampos;
  habilitarBotoes(True);

  //não terminado
end;

//Cancelar transação
procedure TFormCadCliente.btnCancelarClick(Sender: TObject);
begin
  DM.CAD_PESSOA.Cancel;
  DM.CAD_FISICA.Cancel;
  DM.CAD_JURIDICA.Cancel;
  DM.CAD_CLIENTE.Cancel;

  LimparCampos;
  habilitarBotoes(True);
end;

//Executa ao clicar no botão ...
procedure TFormCadCliente.BitBtnConsultaClick(Sender: TObject);
begin
  DM.CAD_PESSOA.Append;
  if(radioFisica.Checked) then
    begin
      DM.CAD_FISICA.Append;
    end
  else
    begin
      DM.CAD_JURIDICA.Append;
    end;
  DM.CAD_CLIENTE.Append;
//  FormConsultaCor.ShowModal;

end;

//Executa ao sair do campo código da Cidade
procedure TFormCadCliente.edtCodExit(Sender: TObject);
var
  cod : Integer;

begin
//construir
end;
//Em construção
end.
