unit CadTipoCargaUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, ComCtrls, Grids,
  DBGrids;

type
    TFormCadTipoCarga = class(TForm)
    PageControl: TPageControl;
    TabCadastro: TTabSheet;
    TabConsulta: TTabSheet;
    PanelBotoes: TPanel;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnAlterar: TBitBtn;
    Label1: TLabel;
    edtCod: TDBEdit;
    DataSource: TDataSource;
    Label2: TLabel;
    edtNome: TDBEdit;
    Label3: TLabel;
    edtDtTransacao: TDBEdit;
    Label6: TLabel;
    cbTipoConsulta: TComboBox;
    labelPesquisa: TLabel;
    edtValorPesquisa: TEdit;
    btnPesquisar: TBitBtn;
    GridConsulta: TDBGrid;
    btnOk: TBitBtn;
    DataSourceConsulta: TDataSource;
    procedure CommitRegistro();
    procedure LimparCampos();
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCodExit(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure habilitarCampos(Sender: TObject; estado :Boolean) ;
    procedure habilitarBotoes(Sender:TObject);
    procedure desabilitarBotoes(Sender:TObject);
    procedure DataSourceStateChange(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure GridConsultaDblClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cbTipoConsultaSelect(Sender: TObject);
    procedure HabilitarCampo(Boolean: Boolean);
    procedure ComandosPesquisa(msg: String);
    procedure Select(SQL: String; Parametro: String; cod: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadTipoCarga: TFormCadTipoCarga;

implementation

uses DMUnit;

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
procedure TFormCadTipoCarga.btnNovoClick(Sender: TObject);
begin
  DM.CAD_TIPO_CARGA.Append;
  DM.CAD_TIPO_CARGACD_TIPO_CARGA.AsInteger := 0;
  DM.CAD_TIPO_CARGADT_TRANSACAO.AsDateTime := Date;
end;

//Commit o registro no banco de dados
procedure TFormCadTipoCarga.CommitRegistro();
begin
  DM.CAD_TIPO_CARGA.Post;
  DM.Transaction.CommitRetaining;
  DM.IBQCAD_TIPO_CARGA.Close;
end;

//Limpa os EditTex e LookupComboBox
procedure TFormCadTipoCarga.LimparCampos();
var
  i : Integer;

begin
  for i := 0 to FormCadTipoCarga.ComponentCount -1 do
    begin
      if FormCadTipoCarga.Components[i] is TDBEdit then
        begin
          TDBEdit(FormCadTipoCarga.Components[i]).Text := '';
        end
      else if FormCadTipoCarga.Components[i] is TDBLookupComboBox then
        begin
          TDBLookupComboBox(FormCadTipoCarga.Components[i]).KeyValue := null;
        end;
    end;
end;

//Ao clicar no botão Excluir
procedure TFormCadTipoCarga.btnExcluirClick(Sender: TObject);
begin
  if(DM.CAD_TIPO_CARGA.IsEmpty) then
    begin
      ShowMessage('Selecione um registro para excluir!');
      PageControl.TabIndex := 1;
      Abort;
    end
  else if(edtCod.Text = '0') or (edtNome.Text = '') then
    begin
      LimparCampos;
      DM.CAD_TIPO_CARGA.Cancel;
      Abort;
    end;

  if(MessageDlg('Deseja excluir este Registro?', mtConfirmation, mbYesNoCancel, 0) = mrYes) then
    begin
      DM.CAD_TIPO_CARGA.Delete;
      DM.Transaction.CommitRetaining;
      ShowMessage('Registro excluído com sucesso!');
      DM.IBQCAD_TIPO_CARGA.Close;
    end
  else
    begin
      DM.CAD_TIPO_CARGA.Cancel;
      Abort;
    end;
end;

//Ao clicar no botão Gravar: registra no banco a gravação ou alteração
procedure TFormCadTipoCarga.btnGravarClick(Sender: TObject);
begin
  //executa se for um novo registro
  if(edtNome.Text = '') then
    begin
      ShowMessage('Informe a descrição do tipo da carga!');
      edtNome.SetFocus;
      Abort;
    end;
      CommitRegistro;
      ShowMessage('Registro gravado com sucesso!');
  LimparCampos;
end;

//Cancelar transação
procedure TFormCadTipoCarga.btnCancelarClick(Sender: TObject);
begin
  DM.CAD_TIPO_CARGA.Cancel;
  LimparCampos;
end;

//Executa ao sair do campo código da Cidade
procedure TFormCadTipoCarga.edtCodExit(Sender: TObject);
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
      DM.CAD_TIPO_CARGA.Active := True;
      DM.CAD_TIPO_CARGA.Close;
      DM.CAD_TIPO_CARGA.ParamByName('PCDTIPOCARGA').Value := cod;
      DM.CAD_TIPO_CARGA.Open;

      if(DM.CAD_TIPO_CARGA.IsEmpty = True) then
        begin
          edtCod.SetFocus;
        end
      else
        begin
          edtNome.Text := DM.CAD_TIPO_CARGADS_TIPO_CARGA.Value;
        end;
    end
  else
    begin
      ShowMessage('valor informado incorreto!');
      edtCod.Clear;
      edtCod.SetFocus;
    end;
end;

//Botão Alterar
procedure TFormCadTipoCarga.btnAlterarClick(Sender: TObject);
begin
  if(DM.CAD_TIPO_CARGA.IsEmpty) then
    begin
      ShowMessage('Selecione um registro para Alterar!');
      PageControl.TabIndex := 1;
      Abort;
    end;
  DM.CAD_TIPO_CARGA.Edit;
end;

procedure TFormCadTipoCarga.habilitarBotoes(Sender:TObject);
begin
  btnNovo.Enabled:=true;
  btnAlterar.Enabled:=true;
  btnExcluir.Enabled:=true;

  btnGravar.Enabled:=false;
  btnCancelar.Enabled:=false;

  habilitarCampos(sender,false);
end;

procedure TFormCadTipoCarga.desabilitarBotoes(Sender:TObject);
begin
  btnNovo.Enabled:=false;
  btnAlterar.Enabled:=false;
  btnExcluir.Enabled:=false;

  btnGravar.Enabled:=true;
  btnCancelar.Enabled:=true;

  habilitarCampos(sender,true);
end;

procedure TFormCadTipoCarga.habilitarCampos(Sender: TObject; estado: Boolean);
begin
  edtCod.Enabled := false;
  edtNome.Enabled := estado;
  edtDtTransacao.Enabled := false;
end;

procedure TFormCadTipoCarga.DataSourceStateChange(Sender: TObject);
begin
  if(DM.CAD_TIPO_CARGA.State IN [dsinsert,dsedit]) then
    begin
      desabilitarBotoes(sender);
    end
  else
    begin
      habilitarBotoes(sender);
    end;
end;

//Pesquisas
procedure TFormCadTipoCarga.btnPesquisarClick(Sender: TObject);
var
  cod : Integer;
  tipoConsulta : Integer;
  sqlSelect: String;

begin
  tipoConsulta := cbTipoConsulta.ItemIndex;
  sqlSelect := '';

  if(edtValorPesquisa.Text = '') and (tipoConsulta <> 0) then
    begin
      ComandosPesquisa('Informe um valor para a pesquisa!');
    end
  else
    begin
      case tipoConsulta of
        //Pesquisa geral
        0:
          begin
            sqlSelect := ('SELECT * FROM CAD_TIPO_CARGA');
            Select(sqlSelect, '', cod);
          end;
        //Pesquisa por código
        1:
          begin
            if(not TryStrToInt(edtValorPesquisa.Text, cod)) then
              begin
                ComandosPesquisa('Informe um código para a pesquisa!');
              end;

            if(cod < 0) then
              begin
                ComandosPesquisa('Valor incorreto! Informe novamente!');
              end;

            sqlSelect := ('SELECT * FROM CAD_TIPO_CARGA');
            sqlSelect := sqlSelect + (' WHERE CD_TIPO_CARGA =:PCDTIPOCARGA');

            Select(sqlSelect, 'PCDTIPOCARGA', cod);
          end;
        //Pesquisa por nome
        2:
          begin
            sqlSelect := ('SELECT * FROM CAD_TIPO_CARGA');
            sqlSelect := sqlSelect + (' WHERE DS_TIPO_CARGA LIKE ''%' + edtValorPesquisa.Text + '%''');

            Select(sqlSelect, '', cod);
          end;
      else
        ShowMessage('Tipo de pesquisa incorreto!');
      end;
    end;
end;

//Comandos para pesquisa
procedure TFormCadTipoCarga.ComandosPesquisa(msg: String);
begin
  ShowMessage(msg);
  edtValorPesquisa.Clear;
  edtValorPesquisa.SetFocus;
  Abort;
end;

//Comando select
procedure TFormCadTipoCarga.Select(SQL: String; Parametro: String; cod: Integer);
begin
  DM.IBQCAD_TIPO_CARGA.Active := TRUE;
  DM.IBQCAD_TIPO_CARGA.Close;
  DM.IBQCAD_TIPO_CARGA.SQL.Clear;
  DM.IBQCAD_TIPO_CARGA.SQL.Add(SQL);
  if(Parametro <> '') then
    begin
      DM.IBQCAD_TIPO_CARGA.ParamByName(Parametro).AsInteger := cod;
    end;
  DM.IBQCAD_TIPO_CARGA.Open;
end;

//Duplo clique na Grid: Pega a linha selecionada e passa para a tela de cadastro
procedure TFormCadTipoCarga.GridConsultaDblClick(Sender: TObject);
begin
  btnOkClick(Sender);
end;

//Executa ao selecionar uma opção na comboBox
procedure TFormCadTipoCarga.cbTipoConsultaSelect(Sender: TObject);
begin
  if(cbTipoConsulta.ItemIndex = 0) then
    begin
      HabilitarCampo(False);
    end
  else
    begin
      HabilitarCampo(True);
    end;
end;

//Habilita campo para pesquisa
procedure TFormCadTipoCarga.HabilitarCampo(Boolean: Boolean);
begin
    edtValorPesquisa.Text := '';
    labelPesquisa.Visible := Boolean;
    edtValorPesquisa.Visible := Boolean;
end;

//Executa ao clicar no botão OK
procedure TFormCadTipoCarga.btnOkClick(Sender: TObject);
begin
  if(DM.IBQCAD_TIPO_CARGA.IsEmpty) then
    begin
      ShowMessage('Selecione um Registro!');
      Abort;
    end;
  DM.CAD_TIPO_CARGA.Active := True;
  DM.CAD_TIPO_CARGA.Close;
  DM.CAD_TIPO_CARGA.ParamByName('PCDTIPOCARGA').AsInteger := DM.IBQCAD_TIPO_CARGACD_TIPO_CARGA.AsInteger;
  DM.CAD_TIPO_CARGA.Open;
  PageControl.TabIndex := 0;
end;

end.
