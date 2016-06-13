unit CadEnderecoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, DB, StdCtrls, Mask, ExtCtrls, IBCustomDataSet, IBQuery,
  Buttons;

type
    TFormCadEndereco = class(TForm)
    Panel: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource: TDataSource;
    Label2: TLabel;
    edtNumSeq: TDBEdit;
    Label3: TLabel;
    edtLogradouro: TDBEdit;
    Label4: TLabel;
    edtNum: TDBEdit;
    Label5: TLabel;
    edtBairro: TDBEdit;
    Label6: TLabel;
    edtCep: TDBEdit;
    Label7: TLabel;
    edtDtTransacao: TDBEdit;
    Label9: TLabel;
    dbEstado: TDBLookupComboBox;
    Label8: TLabel;
    dbCidade: TDBLookupComboBox;
    DataSourceEstado: TDataSource;
    IBQESTADO: TIBQuery;
    IBQESTADOCD_UF: TIntegerField;
    IBQESTADONM_UF: TIBStringField;
    DataSourceCidade: TDataSource;
    IBQCIDADE: TIBQuery;
    IBQCIDADECD_CIDADE: TIntegerField;
    IBQCIDADENM_CIDADE: TIBStringField;
    IBQCIDADEDT_TRANSACAO: TDateField;
    IBQCIDADECD_UF: TIntegerField;
    PanelBotoes: TPanel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure dbEstadoClick(Sender: TObject);
    procedure CommitRegistro();
    procedure LimparCampos();
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure preencherCampos();

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadEndereco: TFormCadEndereco;
  tipoRegistro: Boolean = True;

implementation

uses DMUnit;

{$R *.dfm}

//Ao criar o Form é preenchido o combo box do Estado
procedure TFormCadEndereco.FormShow(Sender: TObject);
begin
  IBQESTADO.Active := True;
  IBQESTADO.Close;
  IBQESTADO.SQL.Clear;
  IBQESTADO.SQL.Add('SELECT UF.CD_UF, UF.NM_UF');
  IBQESTADO.SQL.Add(' FROM CAD_UF UF');
  IBQESTADO.SQL.Add(' WHERE UF.CD_UF IN (SELECT CIDADE.CD_UF');
  IBQESTADO.SQL.Add(' FROM CAD_CIDADE CIDADE)');
  IBQESTADO.Open;

  IBQESTADO.Last;
  IBQESTADO.First;

  DM.CAD_ENDERECO.Append;
  DM.CAD_ENDERECONR_SEQ.AsInteger := 0;
  DM.CAD_ENDERECODT_TRANSACAO.AsDateTime := Date;
  DM.CAD_ENDERECOCD_PESSOA.AsInteger := DM.CAD_PESSOACD_PESSOA.AsInteger;

end;

//Ao selecionar um Estado é preenchido a combo de Cidade
procedure TFormCadEndereco.dbEstadoClick(Sender: TObject);
begin
  if(dbEstado.Text = '') then
    begin
      Abort;
    end;

  IBQCIDADE.Active := True;
  IBQCIDADE.Close;
  IBQCIDADE.ParamByName('PCDUF').Value := IBQESTADOCD_UF.Value;
  IBQCIDADE.Open;

  IBQCIDADE.Last;
  IBQCIDADE.First;

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

//Commit o registro no banco de dados
procedure TFormCadEndereco.CommitRegistro();
begin
  DM.CAD_ENDERECO.Post;
  DM.Transaction.CommitRetaining;
  DM.IBQCAD_ENDERECO.Close;
end;

//Limpa os EditTex e LookupComboBox
procedure TFormCadEndereco.LimparCampos();
var
  i : Integer;

begin
  for i := 0 to FormCadEndereco.ComponentCount -1 do
    begin
      if FormCadEndereco.Components[i] is TDBEdit then
        begin
          TDBEdit(FormCadEndereco.Components[i]).Text := '';
        end
      else if FormCadEndereco.Components[i] is TDBLookupComboBox then
        begin
          TDBLookupComboBox(FormCadEndereco.Components[i]).KeyValue := null;
        end;
    end;
end;

//Ao clicar no botão Gravar: registra no banco a gravação ou alteração
procedure TFormCadEndereco.btnGravarClick(Sender: TObject);
begin
  //executa se for um novo registro
  if(tipoRegistro) then
    begin
      if(edtLogradouro.Text = '') then
        begin
          ShowMessage('Informe o logradouro!');
          edtLogradouro.SetFocus;
          Abort;
        end
      else if(edtNum.Text = '') then
        begin
          ShowMessage('Informe o número do endereço!');
          edtNum.SetFocus;
          Abort;
        end
      else if(edtBairro.Text = '') then
        begin
          ShowMessage('Informe o bairro!');
          edtBairro.SetFocus;
          Abort;
        end
      else if(edtCep.Text = '') then
        begin
          ShowMessage('Informe o CEP!');
          edtCep.SetFocus;
          Abort;
        end
      else if(dbCidade.Text = '') then
        begin
          ShowMessage('Selecione uma cidade!');
          dbCidade.SetFocus;
          Abort;
        end;
      CommitRegistro;
      ShowMessage('Registro gravado com sucesso!');
      FormCadEndereco.ModalResult := 1;
      FormCadEndereco.Close;
    end
  //executa quando for alteração no registro
  else
    begin
      DM.CAD_ENDERECO.Edit;
      CommitRegistro;
      ShowMessage('Registro alterado com sucesso!');
    end;
  //LimparCampos;
end;

//Cancelar transação
procedure TFormCadEndereco.btnCancelarClick(Sender: TObject);
begin
  DM.CAD_ENDERECO.Cancel;
  LimparCampos;
end;

//Preenche os campos
procedure TFormCadEndereco.preencherCampos();
var
  cod : Integer;

begin
  if(edtNumSeq.Text = '') then
    begin
      LimparCampos;
      Abort;
    end
  else if(TryStrToInt(edtNumSeq.Text, cod) = True) then
    begin
      DM.CAD_ENDERECO.Active := True;
      DM.CAD_ENDERECO.Close;
      DM.CAD_ENDERECO.ParamByName('PCDSEQ').Value := cod;
      DM.CAD_ENDERECO.Open;

      if(DM.CAD_ENDERECO.IsEmpty = True) then
        begin
          //edtCod.SetFocus;
        end
      else
        begin
          //edtNome.Text := DM.CAD_CIDADENM_CIDADE.Value;
          //DBPais.KeyValue := DM.CAD_UFCD_PAIS.Value;
          //DBPaisClick(Sender);
        end;
    end
  else
    begin
      ShowMessage('valor informado incorreto!');
    end;
end;
//Em construção
end.
