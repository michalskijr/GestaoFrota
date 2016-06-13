unit CadContatoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Mask, DBCtrls, ExtCtrls;

type
  TFormCadContato = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtNr: TDBEdit;
    DataSource: TDataSource;
    Label2: TLabel;
    edtCodPessoa: TDBEdit;
    Label3: TLabel;
    edtContato: TDBEdit;
    Label4: TLabel;
    edtTelefone: TDBEdit;
    Label5: TLabel;
    edtEmail: TDBEdit;
    PanelBotoes: TPanel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure CommitRegistro();
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadContato: TFormCadContato;
  tipoRegistro: Boolean = True;

implementation

uses DMUnit;

{$R *.dfm}

procedure TFormCadContato.FormShow(Sender: TObject);
begin
  DM.CAD_CONTATO.Append;
  DM.CAD_CONTATONR_SEQ.AsInteger := 0;
  DM.CAD_CONTATOCD_PESSOA.AsInteger := DM.CAD_PESSOACD_PESSOA.AsInteger;
end;

//Commit o registro no banco de dados
procedure TFormCadContato.CommitRegistro();
begin
  DM.CAD_CONTATO.Post;
  DM.Transaction.CommitRetaining;
  DM.IBQCAD_CONTATO.Close;
end;


procedure TFormCadContato.btnGravarClick(Sender: TObject);
begin
  //executa se for um novo registro
  if(tipoRegistro) then
    begin
      if(edtContato.Text = '') then
        begin
          ShowMessage('Informe o nome do contato!');
          edtContato.SetFocus;
          Abort;
        end
      else if(edtTelefone.Text = '') then
        begin
          ShowMessage('Informe o número do telefone!');
          edtTelefone.SetFocus;
          Abort;
        end
      else if(edtEmail.Text = '') then
        begin
          ShowMessage('Informe o E-Mail!');
          edtEmail.SetFocus;
          Abort;
        end;
      CommitRegistro;
      ShowMessage('Registro gravado com sucesso!');
      FormCadContato.ModalResult := 1;
      FormCadContato.Close;
    end
  //executa quando for alteração no registro
  else
    begin
      DM.CAD_CONTATO.Edit;
      CommitRegistro;
      ShowMessage('Registro alterado com sucesso!');
    end;
  //LimparCampos;
end;

procedure TFormCadContato.btnCancelarClick(Sender: TObject);
begin
  DM.CAD_CONTATO.Cancel;
  FormCadContato.Close;
end;

end.
