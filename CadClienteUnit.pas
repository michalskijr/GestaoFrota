unit CadClienteUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, Buttons,
  ComCtrls, IBCustomDataSet, IBQuery;

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
    DataSourceIBQEndereco: TDataSource;
    DataSourceIBQContato: TDataSource;
    PageControl: TPageControl;
    TabEndereco: TTabSheet;
    TabContato: TTabSheet;
    gridEndereco: TDBGrid;
    gridContato: TDBGrid;
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
    btnAdd: TBitBtn;
    btnRemover: TBitBtn;
    PanelBotoes: TPanel;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnAddContato: TBitBtn;
    btnRemoverContato: TBitBtn;
    procedure radioFisicaClick(Sender: TObject);
    procedure radioJuridicaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CommitRegistro();
    procedure habilitarAbas(Boolean: Boolean);
    procedure LimparCampos();
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure setValores();
    procedure ValidarCampos();
    procedure btnCancelarClick(Sender: TObject);
    procedure BitBtnConsultaClick(Sender: TObject);
    procedure edtCodExit(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure preencherGridEndereco();
    procedure btnRemoverClick(Sender: TObject);
    procedure DataSourcePessoaStateChange(Sender: TObject);
    procedure btnAddContatoClick(Sender: TObject);
    procedure preencherGridContato();
    procedure btnRemoverContatoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadCliente: TFormCadCliente;
  tipoRegistro: Boolean = True;

implementation

uses DMUnit, CadEnderecoUnit, Math, StrUtils, MaskUtils, CadContatoUnit,
  ConClienteUnit;

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

  DM.Conection.Connected := True;
  DM.Transaction.Active := True;
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
  LimparCampos;
  btnCancelarClick(Sender);
  DM.CAD_PESSOA.Append;
  DM.CAD_CLIENTE.Append;

  DM.CAD_PESSOADT_TRANSACAO.AsDateTime := Date;
  DM.CAD_CLIENTEDT_TRANSACAO.AsDateTime := Date;

  DM.IBQCD_PESSOA.Close;
  DM.IBQCD_PESSOA.Open;
  DM.CAD_PESSOACD_PESSOA.AsInteger := DM.IBQCD_PESSOACD_PESSOA.AsInteger;
  DM.CAD_CLIENTECD_CLIENTE.AsInteger := 0;
  DM.CAD_CLIENTECD_PESSOA.AsInteger := DM.IBQCD_PESSOACD_PESSOA.AsInteger;

  tipoRegistro := True;
  habilitarAbas(False);
end;

//Habilita/Desabilita as abas: Endereço e Contato
procedure TFormCadCliente.habilitarAbas(Boolean: Boolean);
begin
  TabEndereco.Enabled := Boolean;
  TabContato.Enabled := Boolean;
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
        end
      else if FormCadCliente.Components[i] is TMaskEdit then
        begin
          TMaskEdit(FormCadCliente.Components[i]).Text := '';
        end
        else if FormCadCliente.Components[i] is TEdit then
          begin
            TEdit(FormCadCliente.Components[i]).Text := '';
          end;
    end;

  radioFisica.Checked := True;
  radioMasculino.Checked := True;
  DM.IBQCAD_ENDERECO.Close;
  DM.IBQCAD_CONTATO.Close;
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
      if not (DM.IBQCAD_ENDERECO.IsEmpty) then
        begin
          DM.CAD_ENDERECO.Active := True;
          DM.CAD_ENDERECO.Close;
          DM.CAD_ENDERECO.ParamByName('PCDPESSOA').Value := DM.CAD_PESSOACD_PESSOA.Value;
          DM.CAD_ENDERECO.Open;

          DM.CAD_ENDERECO.First;
          while not DM.CAD_ENDERECO.Eof do
            begin
              DM.CAD_ENDERECO.Delete;
              DM.CAD_ENDERECO.Next;
              DM.CAD_ENDERECO.First;
            end;
        end;
      //deleter contato
      if not (DM.IBQCAD_CONTATO.IsEmpty) then
        begin
          DM.CAD_CONTATO.Active := True;
          DM.CAD_CONTATO.Close;
          DM.CAD_CONTATO.ParamByName('PCDPESSOA').Value := DM.CAD_PESSOACD_PESSOA.Value;
          DM.CAD_CONTATO.Open;

          DM.CAD_CONTATO.First;
          while not DM.CAD_CONTATO.Eof do
            begin
              DM.CAD_CONTATO.Delete;
              DM.CAD_CONTATO.Next;
              DM.CAD_CONTATO.First;
            end;
        end;
      //DM.CAD_CLIENTECD_PESSOA.Value := DM.CAD_PESSOACD_PESSOA.Value;
      DM.CAD_CLIENTE.Delete;
      if(radioFisica.Checked) then
        begin
          DM.CAD_FISICA.Delete;
        end
        else
          begin
            DM.CAD_JURIDICA.Delete;
          end;

      DM.CAD_PESSOA.Delete;

      DM.Transaction.CommitRetaining;
      ShowMessage('Registro excluído com sucesso!');
      DM.IBQCAD_ENDERECO.Close;
      DM.IBQCAD_CONTATO.Close;

      habilitarAbas(False);
      LimparCampos;
    end;
end;

//Ao clicar no botão Gravar: registra no banco a gravação ou alteração
procedure TFormCadCliente.btnGravarClick(Sender: TObject);
begin
  ValidarCampos;
  if(tipoRegistro) then
    begin
      setValores;
      CommitRegistro;
      ShowMessage('Registro gravado com sucesso!');
      habilitarAbas(True);
    end
    //executa quando for alteração
    else
      begin
        setValores;
        CommitRegistro;
        ShowMessage('Registro alterado com sucesso!');
      end;
  //LimparCampos;
end;

//set os valores
procedure TFormCadCliente.setValores();
var
  cpfCnpj : String;
begin
      if(radioFisica.Checked) then   //pessoa fisica
        begin
          DM.CAD_PESSOATP_PESSOA.Value := 'F';
          DM.CAD_FISICACD_PESSOA.Value := DM.CAD_PESSOACD_PESSOA.Value;
          DM.CAD_FISICANR_RG.Value := edtRGEstadual.Text;

          cpfCnpj := AnsiReplaceStr(maskCPFCNPJ.Text, '.', '');  //remove os pontos do cpf
          cpfCnpj := AnsiReplaceStr(cpfCnpj, '-', '');           //remove o traço do cpf
          DM.CAD_FISICANR_CPF.Value := cpfCnpj;

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
              DM.CAD_JURIDICACD_PESSOA.Value := DM.CAD_PESSOACD_PESSOA.Value;
              DM.CAD_JURIDICANR_INSC_EST.Value := edtRGEstadual.Text;

              cpfCnpj := AnsiReplaceStr(maskCPFCNPJ.Text, '.', ''); //remove os pontos do cnpj
              cpfCnpj := AnsiReplaceStr(cpfCnpj, '-', '');          //remove o traço do cnpj
              cpfCnpj := AnsiReplaceStr(cpfCnpj, '/', '');          //remove a barra do cnpj
              DM.CAD_JURIDICANR_CNPJ.Value := cpfCnpj;
            end;
end;

//Valida se os campos estão preenchidos
procedure TFormCadCliente.ValidarCampos();
begin
  if(edtDtTransacao.Text = '') then
    begin
      ShowMessage('Valor não informado!');
      Abort;
    end
    else if(edtCod.Text = '') then
      begin
        ShowMessage('Valor não informado!');
        Abort;
      end
      else if(edtDescricao.Text = '') then
        begin
          ShowMessage('Valor não informado!');
          edtDescricao.SetFocus;
          Abort;
        end
        else if(maskCPFCNPJ.Text = '') then
          begin
            ShowMessage('Valor não informado!');
            maskCPFCNPJ.SetFocus;
            Abort;
          end
          else if(edtRGEstadual.Text = '') then
            begin
              ShowMessage('Valor não informado!');
              edtRGEstadual.SetFocus;
              Abort;
            end;
  if(radioFisica.Checked) then
    begin
      if(edtDtNascimento.Text = '') then
        begin
          ShowMessage('Data de nascimento não informada!');
          edtDtNascimento.SetFocus;
          Abort;
        end;
    end
    else
      begin
        if(edtNomeFantasia.Text = '') then
          begin
            ShowMessage('Nome fantasia da empresa não informado!');
            edtNomeFantasia.SetFocus;
            Abort;
          end;
      end;
end;

//Commit o registro no banco de dados
procedure TFormCadCliente.CommitRegistro();
begin
  DM.CAD_PESSOA.Post;

  if(radioFisica.Checked) then
    begin
      DM.CAD_FISICA.Post;
     end
     else
      begin
        DM.CAD_JURIDICA.Post;
      end;

  if(tipoRegistro) then
    begin
      DM.CAD_CLIENTE.Post;
    end;
  DM.Transaction.CommitRetaining;

  //DM.IBQCAD_CLIENTE.Close;
end;

//Cancelar transação
procedure TFormCadCliente.btnCancelarClick(Sender: TObject);
begin
  DM.CAD_PESSOA.Cancel;
  DM.CAD_FISICA.Cancel;
  DM.CAD_JURIDICA.Cancel;
  DM.CAD_CLIENTE.Cancel;

  LimparCampos;
  habilitarAbas(False);
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
  FormConsultaCliente.ShowModal;

  if(FormConsultaCliente.ModalResult = mrOk) then
    begin
      DM.CAD_PESSOACD_PESSOA.Value := DM.IBQCAD_CLIENTECD_PESSOA.Value;
      edtCodExit(Sender);
      tipoRegistro := False;
    end
  else
    begin
      LimparCampos;
    end;
end;

//Executa ao sair do campo código do Cliente
procedure TFormCadCliente.edtCodExit(Sender: TObject);
var
  cod : Integer;
begin
  if(edtCod.Text = '') then
    begin
      LimparCampos;
      Abort;
    end
    else if(TryStrToInt(edtCod.Text, cod) = True) then
      begin
        DM.CAD_PESSOA.Active := True;
        DM.CAD_PESSOA.Close;
        DM.CAD_PESSOA.ParamByName('PCDPESSOA').Value := cod;
        DM.CAD_PESSOA.Open;

        DM.CAD_CLIENTE.Active := True;
        DM.CAD_CLIENTE.Close;
        DM.CAD_CLIENTE.ParamByName('PCDPESSOA').Value := cod;
        DM.CAD_CLIENTE.Open;

        if(DM.CAD_PESSOA.IsEmpty = True) then
          begin
            edtCod.SetFocus;
          end
          else
            begin
              if(DM.CAD_PESSOATP_PESSOA.Value = 'F') then
                begin
                  radioFisica.Checked := True;
                  DM.CAD_FISICA.Active := True;
                  DM.CAD_FISICA.Close;
                  DM.CAD_FISICA.ParamByName('PCDPESSOA').Value := cod;
                  DM.CAD_FISICA.Open;

                  maskCPFCNPJ.Text := FormatMaskText('000.000.000-00;0', DM.CAD_FISICANR_CPF.Value);
                  edtRGEstadual.Text := DM.CAD_FISICANR_RG.Value;

                  if(DM.CAD_FISICAIN_SEXO.Value = 'M') then
                    begin
                      radioMasculino.Checked := True;
                    end
                    else
                      begin
                        radioFeminino.Checked := True;
                      end;
                end
                else
                  begin
                    radioJuridica.Checked := True;
                    DM.CAD_JURIDICA.Active := True;
                    DM.CAD_JURIDICA.Close;
                    DM.CAD_JURIDICA.ParamByName('PCDPESSOA').Value := cod;
                    DM.CAD_JURIDICA.Open;

                    maskCPFCNPJ.Text := FormatMaskText('00.000.000/0000-00;0', DM.CAD_JURIDICANR_CNPJ.Value);
                    edtRGEstadual.Text := DM.CAD_JURIDICANR_INSC_EST.Value;
                  end;
              tipoRegistro := False;
              habilitarAbas(True);
              preencherGridEndereco;
              preencherGridContato;
              DM.CAD_PESSOA.Edit;
              if(radioFisica.Checked) then
                begin
                  DM.CAD_FISICA.Edit;
                end
                else
                  begin
                    DM.CAD_JURIDICA.Edit;
                  end;
              DM.CAD_CLIENTE.Edit;
            end;
      end;
end;

//cadastrar endereço
procedure TFormCadCliente.btnAddClick(Sender: TObject);
begin
  FormCadEndereco.ShowModal;

  if(FormCadEndereco.ModalResult = 2) then
    begin
      preencherGridEndereco;
    end;
end;

//preencher a grid de endereço
procedure TFormCadCliente.preencherGridEndereco();
begin
  DM.IBQCAD_ENDERECO.Active := True;
  DM.IBQCAD_ENDERECO.Close;
  DM.IBQCAD_ENDERECO.ParamByName('PCDPESSOA').Value := edtCod.Text;
  DM.IBQCAD_ENDERECO.Open;
end;

//remove o cadastro de endereço
procedure TFormCadCliente.btnRemoverClick(Sender: TObject);
begin
  if(MessageDlg('Deseja excluir este registro?', mtWarning, mbOKCancel,0) = mrOk) then
    begin
      DM.CAD_ENDERECO.Active := True;
      DM.CAD_ENDERECO.Close;
      DM.CAD_ENDERECO.SelectSQL.Clear;
      DM.CAD_ENDERECO.SelectSQL.Add('SELECT * FROM CAD_ENDERECO WHERE CD_PESSOA = :PCDPESSOA AND NR_SEQ = :PNRSEG');
      DM.CAD_ENDERECO.ParamByName('PCDPESSOA').Value := DM.CAD_PESSOACD_PESSOA.Value;
      DM.CAD_ENDERECO.ParamByName('PNRSEG').Value := DM.IBQCAD_ENDERECONR_SEQ.Value;
      DM.CAD_ENDERECO.Open;

      if(DM.CAD_ENDERECO.IsEmpty) then
        begin
          ShowMessage('Nenhum registro selecionado!');
          Abort;
        end;

      DM.CAD_ENDERECO.Delete;
      DM.Transaction.CommitRetaining;

      preencherGridEndereco;
    end;
end;

procedure TFormCadCliente.DataSourcePessoaStateChange(Sender: TObject);
begin
  if(edtCod.Text = '') or (edtCod.Text = '0') then
    begin
      TabEndereco.Enabled := False;
      TabContato.Enabled := False;
    end
    else
      begin
        TabEndereco.Enabled := True;
        TabContato.Enabled := True;
      end;
  if(DM.CAD_PESSOA.State IN [DSINSERT,DSEDIT]) then
    begin
      btnNovo.Enabled := False;
      BitBtnConsulta.Enabled := False;

      btnGravar.Enabled := True;
      btnExcluir.Enabled := True;
    end
    else
      begin
        btnNovo.Enabled := True;
        BitBtnConsulta.Enabled := True;

        btnGravar.Enabled := False;
        btnExcluir.Enabled := False;
      end;
end;

procedure TFormCadCliente.btnAddContatoClick(Sender: TObject);
begin
  FormCadContato.ShowModal;

  if(FormCadContato.ModalResult = 2) then
    begin
      preencherGridContato;
    end;
end;

//preencher a grid de contato
procedure TFormCadCliente.preencherGridContato();
begin
  DM.IBQCAD_CONTATO.Active := True;
  DM.IBQCAD_CONTATO.Close;
  DM.IBQCAD_CONTATO.ParamByName('PCDPESSOA').Value := edtCod.Text;
  DM.IBQCAD_CONTATO.Open;
end;


procedure TFormCadCliente.btnRemoverContatoClick(Sender: TObject);
begin
  if(MessageDlg('Deseja excluir este registro?', mtWarning, mbOKCancel,0) = mrOk) then
    begin
      DM.CAD_CONTATO.Active := True;
      DM.CAD_CONTATO.Close;
      DM.CAD_CONTATO.SelectSQL.Clear;
      DM.CAD_CONTATO.SelectSQL.Add('SELECT * FROM CAD_CONTATO WHERE CD_PESSOA = :PCDPESSOA AND NR_SEQ = :PNRSEG');
      DM.CAD_CONTATO.ParamByName('PCDPESSOA').Value := DM.CAD_PESSOACD_PESSOA.Value;
      DM.CAD_CONTATO.ParamByName('PNRSEG').Value := DM.IBQCAD_CONTATONR_SEQ.Value;
      DM.CAD_CONTATO.Open;

      if(DM.CAD_CONTATO.IsEmpty) then
        begin
          ShowMessage('Nenhum registro selecionado!');
          Abort;
        end;

      DM.CAD_CONTATO.Delete;
      DM.Transaction.CommitRetaining;

      preencherGridContato;
    end;
end;

end.
