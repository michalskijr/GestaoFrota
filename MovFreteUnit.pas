unit MovFreteUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB,
  IBCustomDataSet, IBQuery, Grids, DBGrids;

type
    TFormMovFrete = class(TForm)
    Panel: TPanel;
    PageControl: TPageControl;
    tabFrete: TTabSheet;
    tabDestino: TTabSheet;
    DSFrete: TDataSource;
    Label2: TLabel;
    edtCodVeiculo: TDBEdit;
    Label3: TLabel;
    edtCodMotorista: TDBEdit;
    Label4: TLabel;
    edtCodTpCarga: TDBEdit;
    Label5: TLabel;
    edtCodCliente: TDBEdit;
    Label6: TLabel;
    edtCodCidade: TDBEdit;
    Label7: TLabel;
    edtEndereco: TDBEdit;
    Label8: TLabel;
    edtValor: TDBEdit;
    edtCod: TDBEdit;
    Label1: TLabel;
    Label9: TLabel;
    edtDtTransacao: TDBEdit;
    btnVeiculo: TBitBtn;
    btnCliente: TBitBtn;
    edtCliente: TEdit;
    btnCidade: TBitBtn;
    edtCidade: TEdit;
    btnTpCarga: TBitBtn;
    edtTpCarga: TEdit;
    btnMotorista: TBitBtn;
    edtMotorista: TEdit;
    edtVeiculo: TEdit;
    PanelBotoes: TPanel;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    Label10: TLabel;
    edtNrSeq: TDBEdit;
    DSDESTINO: TDataSource;
    Label12: TLabel;
    edtCodCidadeDestino: TDBEdit;
    Label13: TLabel;
    edtLogradouro: TDBEdit;
    Label14: TLabel;
    edtNumero: TDBEdit;
    Label15: TLabel;
    edtBairro: TDBEdit;
    Label16: TLabel;
    edtCep: TDBEdit;
    Label17: TLabel;
    edtObs: TDBEdit;
    btnCidadeDestino: TBitBtn;
    edtCidadeDestino: TEdit;
    DBGrid1: TDBGrid;
    btnAdicionar: TButton;
    btnRemover: TButton;
    IBQGRID: TIBQuery;
    DSGRID: TDataSource;
    IBQGRIDNR_SEQ: TIntegerField;
    IBQGRIDCD_FRETE: TIntegerField;
    IBQGRIDDS_LOGRADOURO: TIBStringField;
    IBQGRIDDS_NUMERO: TIBStringField;
    IBQGRIDDS_BAIRRO: TIBStringField;
    tabConsulta: TTabSheet;
    GridConsulta: TDBGrid;
    DBGrid3: TDBGrid;
    Label11: TLabel;
    cbTipoConsulta: TComboBox;
    edtValorPesquisa: TEdit;
    labelPesquisa: TLabel;
    btnPesquisar: TBitBtn;
    Label18: TLabel;
    IBQFRETE: TIBQuery;
    DSGRIDFRETE: TDataSource;
    DSGRIDDESTINO: TDataSource;
    IBQGRIDDESTINO: TIBQuery;
    IBQGRIDDESTINONR_SEQ: TIntegerField;
    IBQGRIDDESTINOCD_FRETE: TIntegerField;
    IBQGRIDDESTINOCD_CIDADE: TIntegerField;
    IBQGRIDDESTINONM_CIDADE: TIBStringField;
    IBQGRIDDESTINODS_LOGRADOURO: TIBStringField;
    IBQGRIDDESTINODS_NUMERO: TIBStringField;
    IBQGRIDDESTINODS_BAIRRO: TIBStringField;
    IBQGRIDDESTINODS_CEP: TIBStringField;
    IBQGRIDDESTINODS_OBSERVACAO: TIBStringField;
    IBQGRIDDESTINODT_TRANSACAO: TDateField;
    IBQFRETECD_FRETE: TIntegerField;
    IBQFRETECD_VEICULO: TIntegerField;
    IBQFRETEDS_PLACA: TIBStringField;
    IBQFRETECD_MOTORISTA: TIntegerField;
    IBQFRETEMOTORISTA: TIBStringField;
    IBQFRETECD_TIPO_CARGA: TIntegerField;
    IBQFRETEDS_TIPO_CARGA: TIBStringField;
    IBQFRETECD_CLIENTE: TIntegerField;
    IBQFRETECLIENTE: TIBStringField;
    IBQFRETECD_CIDADE_ORIGEM: TIntegerField;
    IBQFRETENM_CIDADE: TIBStringField;
    IBQFRETEDS_END_DESTINO: TIBStringField;
    IBQFRETEVL_FRETE: TFloatField;
    IBQFRETEDT_TRANSACAO: TDateField;
    procedure FormShow(Sender: TObject);
    procedure habilitarAba(Boolean: Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure validarCampos();
    procedure CommitRegistro();
    procedure btnCancelarClick(Sender: TObject);
    procedure LimparCampos();
    procedure BitBtnConsultaClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnCidadeClick(Sender: TObject);
    procedure btnTpCargaClick(Sender: TObject);
    procedure btnMotoristaClick(Sender: TObject);
    procedure btnVeiculoClick(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure edtCodCidadeExit(Sender: TObject);
    procedure edtCodTpCargaExit(Sender: TObject);
    procedure edtCodMotoristaExit(Sender: TObject);
    procedure edtCodVeiculoExit(Sender: TObject);
    procedure edtCodExit(Sender: TObject);
    procedure DSFreteStateChange(Sender: TObject);
    procedure btnCidadeDestinoClick(Sender: TObject);
    procedure edtCodCidadeDestinoExit(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure validarDestino();
    procedure limparCamposDestino();
    procedure btnRemoverClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure GridConsultaDblClick(Sender: TObject);
    procedure cbTipoConsultaSelect(Sender: TObject);
    procedure HabilitarCampo(Boolean: Boolean);
    procedure ComandosPesquisa(msg: String);
    procedure Select(SQL: String; Parametro: String; cod: Integer);
    procedure GridConsultaCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMovFrete: TFormMovFrete;
  tipoRegistro: Boolean = True;

implementation

uses DMUnit, ConClienteUnit, ConCidadeUnit, CadTipoCargaUnit,
  ConTpCargaUnit, ConMotoristaUnit, ConVeiculoUnit, CadCidadeUnit;

{$R *.dfm}

//Executa ao criar o Form
procedure TFormMovFrete.FormShow(Sender: TObject);
begin
  PageControl.TabIndex := 0;
  DM.Conection.Connected := True;
  DM.Transaction.Active := True;
  DM.MOV_FRETE.Active := True;
end;

procedure TFormMovFrete.habilitarAba(Boolean: Boolean);
begin
  tabDestino.Enabled := Boolean;
end;

//Executa ao clicar no botão Novo
procedure TFormMovFrete.btnNovoClick(Sender: TObject);
begin
  LimparCampos;
  DM.MOV_FRETE.Append;
  DM.MOV_FRETECD_FRETE.AsInteger := 0;
  DM.MOV_FRETEDT_TRANSACAO.AsDateTime := Date;
  tipoRegistro := True;
  habilitarAba(False);
end;

//Executa ao clicar no botão Excluir
procedure TFormMovFrete.btnExcluirClick(Sender: TObject);
begin
  if(DM.MOV_FRETE.IsEmpty) then
    begin
      ShowMessage('Selecione um registro para excluir!');
      Abort;
    end
  else if(edtCod.Text = '0') then
    begin
      LimparCampos;
      DM.MOV_FRETE.Cancel;
      Abort;
    end;

  if(MessageDlg('Deseja excluir este Registro?', mtConfirmation, mbYesNoCancel, 0) = mrYes) then
    begin
      if not (IBQGRID.IsEmpty) then
        begin
          DM.MOV_DESTINO_FRETE.Active := True;
          DM.MOV_DESTINO_FRETE.Close;
          DM.MOV_DESTINO_FRETE.SelectSQL.Clear;
          DM.MOV_DESTINO_FRETE.SelectSQL.Add('SELECT * FROM MOV_DESTINO_FRETE WHERE CD_FRETE = :PCDFRETE AND NR_SEQ = :PNRSEG');
          DM.MOV_DESTINO_FRETE.ParamByName('PCDFRETE').Value := DM.MOV_FRETECD_FRETE.Value;
          DM.MOV_DESTINO_FRETE.ParamByName('PNRSEG').Value := IBQGRIDNR_SEQ.Value;
          DM.MOV_DESTINO_FRETE.Open;

          DM.MOV_DESTINO_FRETE.First;
          while not DM.MOV_DESTINO_FRETE.Eof do
            begin
              DM.MOV_DESTINO_FRETE.Delete;
              DM.MOV_DESTINO_FRETE.Next;
              DM.MOV_DESTINO_FRETE.First;
            end;
        end;

      DM.MOV_FRETE.Delete;
      DM.Transaction.CommitRetaining;
      ShowMessage('Registro excluído com sucesso!');
      LimparCampos;
      habilitarAba(False);
    end;
end;

//Executa ao clicar no botão gravar
procedure TFormMovFrete.btnGravarClick(Sender: TObject);
begin
  //executa se for um novo registro
  if(tipoRegistro) then
    begin
      validarCampos;
      CommitRegistro;
      ShowMessage('Registro gravado com sucesso!');
    end
  //executa quando for alteração no registro
  else
    begin
      validarCampos;
      CommitRegistro;
      ShowMessage('Registro alterado com sucesso!');
    end;
  habilitarAba(True);
end;

//Valida os campos
procedure TFormMovFrete.validarCampos();
begin
  if(edtCod.Text = '') then
    begin
      ShowMessage('Código não informado!');
      edtCod.SetFocus;
      Abort;
    end
    else if(edtDtTransacao.Text = '') then
      begin
        ShowMessage('Data não informada!');
        edtDtTransacao.SetFocus;
        Abort;
      end
      else if(edtCodCliente.Text = '') then
        begin
          ShowMessage('Código não informado!');
          edtCodCliente.SetFocus;
          Abort;
        end
        else if(edtCodCidade.Text = '') then
          begin
            ShowMessage('Código não informado!');
            edtCodCidade.SetFocus;
            Abort;
          end
          else if(edtCodTpCarga.Text = '') then
            begin
              ShowMessage('Código não informado!');
              edtCodTpCarga.SetFocus;
              Abort;
            end
            else if(edtCodMotorista.Text = '') then
              begin
                ShowMessage('Código não informado!');
                edtCodMotorista.SetFocus;
                Abort;
              end
              else if(edtCodVeiculo.Text = '') then
                begin
                  ShowMessage('Código não informado!');
                  edtCodVeiculo.SetFocus;
                  Abort;
                end
                else if(edtEndereco.Text = '') then
                  begin
                    ShowMessage('Endereço não informado!');
                    edtEndereco.SetFocus;
                    Abort;
                  end
                  else if(edtValor.Text = '') then
                    begin
                      ShowMessage('Valor não informado!');
                      edtValor.SetFocus;
                      Abort
                    end;
end;

//Commit o registro no banco de dados
procedure TFormMovFrete.CommitRegistro();
begin
  DM.MOV_FRETE.Post;
  DM.Transaction.CommitRetaining;
  //DM.IBQCAD_COMBUSTIVEL.Close;
end;

//Cancela a transação
procedure TFormMovFrete.btnCancelarClick(Sender: TObject);
begin
  DM.MOV_FRETE.Cancel;
  LimparCampos;
  habilitarAba(False);
end;

//Limpa os EditTex e LookupComboBox
procedure TFormMovFrete.LimparCampos();
var
  i : Integer;
begin
  for i := 0 to FormMovFrete.ComponentCount -1 do
    begin
      if FormMovFrete.Components[i] is TDBEdit then
        begin
          TDBEdit(FormMovFrete.Components[i]).Text := '';
        end
      else if FormMovFrete.Components[i] is TDBLookupComboBox then
        begin
          TDBLookupComboBox(FormMovFrete.Components[i]).KeyValue := null;
        end
      else if FormMovFrete.Components[i] is TMaskEdit then
        begin
          TMaskEdit(FormMovFrete.Components[i]).Text := '';
        end
        else if FormMovFrete.Components[i] is TEdit then
          begin
            TEdit(FormMovFrete.Components[i]).Text := '';
          end;
    end;

  DM.IBQMOV_DESTINO_FRETE.Close;
end;

procedure TFormMovFrete.BitBtnConsultaClick(Sender: TObject);
begin
  DM.MOV_FRETE.Append;
  //terminar
end;

procedure TFormMovFrete.btnClienteClick(Sender: TObject);
begin
  FormConsultaCliente.ShowModal;

  if(FormConsultaCliente.ModalResult = mrOk) then
    begin
      DM.MOV_FRETECD_CLIENTE.Value := DM.IBQCAD_CLIENTECD_CLIENTE.Value;
      edtCliente.Text := DM.IBQCAD_CLIENTENM_RZ_SOCIAL.Value;
    end;
end;

procedure TFormMovFrete.edtCodClienteExit(Sender: TObject);
var
  cod: Integer;
  sqlSelect: String;
begin
  sqlSelect := '';
  if(edtCodCliente.Text = '') then
    begin
      edtCliente.Clear;
      Abort;
    end
    else if(TryStrToInt(edtCodCliente.Text, cod) = True) then
      begin
        DM.IBQCAD_CLIENTE.Active := True;
        DM.IBQCAD_CLIENTE.Close;
        DM.IBQCAD_CLIENTE.SQL.Clear;

        sqlSelect := ('SELECT CLIENTE.CD_CLIENTE, PESSOA.NM_RZ_SOCIAL, CLIENTE.CD_PESSOA, CLIENTE.DT_TRANSACAO');
        sqlSelect := sqlSelect + (' FROM CAD_CLIENTE CLIENTE');
        sqlSelect := sqlSelect + (' INNER JOIN CAD_PESSOA PESSOA ON (PESSOA.CD_PESSOA = CLIENTE.CD_PESSOA)');
        sqlSelect := sqlSelect + (' WHERE CLIENTE.CD_CLIENTE = ' + edtCodCliente.Text);

        DM.IBQCAD_CLIENTE.SQL.Add(sqlSelect);
        DM.IBQCAD_CLIENTE.Open;

        if(DM.IBQCAD_CLIENTE.IsEmpty) then
          begin
            edtCodCliente.SetFocus;
          end
          else
            begin
              edtCliente.Text := DM.IBQCAD_CLIENTENM_RZ_SOCIAL.Value;
            end;
      end
      else
        begin
          ShowMessage('Valor informado incorreto!');
          edtCodCliente.Clear;
          edtCodCliente.SetFocus;
        end;
end;

procedure TFormMovFrete.btnCidadeClick(Sender: TObject);
begin
  FormConsultaCidade.ShowModal;

  if(FormConsultaCidade.ModalResult = mrOk) then
    begin
      DM.MOV_FRETECD_CIDADE_ORIGEM.Value := DM.IBQCAD_CIDADECD_CIDADE.Value;
      edtCidade.Text := DM.IBQCAD_CIDADENM_CIDADE.Value;
    end;
end;

procedure TFormMovFrete.edtCodCidadeExit(Sender: TObject);
var
  cod : Integer;
begin
  if(edtCodCidade.Text = '') then
    begin
      edtCidade.Clear;
      Abort;
    end
  else if(TryStrToInt(edtCodCidade.Text, cod) = True) then
    begin
      DM.CAD_CIDADE.Active := True;
      DM.CAD_CIDADE.Close;
      DM.CAD_CIDADE.ParamByName('PCDCIDADE').Value := cod;
      DM.CAD_CIDADE.Open;

      if(DM.CAD_CIDADE.IsEmpty = True) then
        begin
          edtCodCidade.SetFocus;
        end
      else
        begin
          edtCidade.Text := DM.CAD_CIDADENM_CIDADE.Value;
        end;
    end
  else
    begin
      ShowMessage('valor informado incorreto!');
      edtCidade.Clear;
      edtCidade.SetFocus;
    end;
end;

procedure TFormMovFrete.btnTpCargaClick(Sender: TObject);
begin
  FormConsultaTpCarga.ShowModal;

  if(FormConsultaTpCarga.ModalResult = mrOk) then
    begin
      DM.MOV_FRETECD_TIPO_CARGA.Value := DM.IBQCAD_TIPO_CARGACD_TIPO_CARGA.Value;
      edtTpCarga.Text := DM.IBQCAD_TIPO_CARGADS_TIPO_CARGA.Value;
    end;
end;

procedure TFormMovFrete.edtCodTpCargaExit(Sender: TObject);
var
  cod : Integer;

begin
  if(edtCodTpCarga.Text = '') then
    begin
      edtTpCarga.Clear;
      Abort;
    end
  else if(TryStrToInt(edtCodTpCarga.Text, cod) = True) then
    begin
      DM.CAD_TIPO_CARGA.Active := True;
      DM.CAD_TIPO_CARGA.Close;
      DM.CAD_TIPO_CARGA.ParamByName('PCDTIPOCARGA').Value := cod;
      DM.CAD_TIPO_CARGA.Open;

      if(DM.CAD_TIPO_CARGA.IsEmpty = True) then
        begin
          edtCodTpCarga.SetFocus;
        end
      else
        begin
          edtTpCarga.Text := DM.CAD_TIPO_CARGADS_TIPO_CARGA.Value;
        end;
    end
  else
    begin
      ShowMessage('valor informado incorreto!');
      edtCodTpCarga.Clear;
      edtCodTpCarga.SetFocus;
    end;
end;

procedure TFormMovFrete.btnMotoristaClick(Sender: TObject);
begin
  FormConsultaMotorista.ShowModal;

  if(FormConsultaMotorista.ModalResult = mrOk) then
    begin
      DM.MOV_FRETECD_MOTORISTA.Value := DM.IBQCAD_MOTORISTACD_MOTORISTA.Value;
      edtMotorista.Text := DM.IBQCAD_MOTORISTANM_RZ_SOCIAL.Value;
    end;
end;

procedure TFormMovFrete.edtCodMotoristaExit(Sender: TObject);
var
  cod: Integer;
  sqlSelect: String;
begin
  sqlSelect := '';
  if(edtCodMotorista.Text = '') then
    begin
      edtMotorista.Clear;
      Abort;
    end
    else if(TryStrToInt(edtCodMotorista.Text, cod) = True) then
      begin
        DM.IBQCAD_MOTORISTA.Active := True;
        DM.IBQCAD_MOTORISTA.Close;
        DM.IBQCAD_MOTORISTA.SQL.Clear;

        sqlSelect := ('SELECT MOTORISTA.CD_MOTORISTA, PESSOA.NM_RZ_SOCIAL, MOTORISTA.CD_PESSOA');
        sqlSelect := sqlSelect + (' FROM CAD_MOTORISTA MOTORISTA');
        sqlSelect := sqlSelect + (' INNER JOIN CAD_PESSOA PESSOA ON (PESSOA.CD_PESSOA = MOTORISTA.CD_PESSOA)');
        sqlSelect := sqlSelect + (' WHERE MOTORISTA.CD_MOTORISTA = ' + edtCodMotorista.Text);

        DM.IBQCAD_MOTORISTA.SQL.Add(sqlSelect);
        DM.IBQCAD_MOTORISTA.Open;

        if(DM.IBQCAD_MOTORISTA.IsEmpty) then
          begin
            edtCodMotorista.SetFocus;
          end
          else
            begin
              edtMotorista.Text := DM.IBQCAD_MOTORISTANM_RZ_SOCIAL.Value;
            end;
      end
      else
        begin
          ShowMessage('Valor informado incorreto!');
          edtCodMotorista.Clear;
          edtCodMotorista.SetFocus;
        end;
end;

procedure TFormMovFrete.btnVeiculoClick(Sender: TObject);
begin
  FormConsultaVeiculo.ShowModal;

  if(FormConsultaVeiculo.ModalResult = mrOk) then
    begin
      DM.MOV_FRETECD_VEICULO.Value := DM.IBQCAD_VEICULOCD_VEICULO.Value;
      edtVeiculo.Text := DM.IBQCAD_VEICULODS_VEICULO.Value;
    end;
end;

procedure TFormMovFrete.edtCodVeiculoExit(Sender: TObject);
var
  cod : Integer;

begin
  if(edtCodVeiculo.Text = '') then
    begin
      edtVeiculo.Clear;
      Abort;
    end
  else if(TryStrToInt(edtCodVeiculo.Text, cod) = True) then
    begin
      DM.CAD_VEICULO.Active := True;
      DM.CAD_VEICULO.Close;
      DM.CAD_VEICULO.ParamByName('PCDVEICULO').Value := cod;
      DM.CAD_VEICULO.Open;

      if(DM.CAD_VEICULO.IsEmpty = True) then
        begin
          edtCodVeiculo.SetFocus;
        end
      else
        begin
          edtVeiculo.Text := DM.CAD_VEICULODS_VEICULO.Value;
        end;
    end
  else
    begin
      ShowMessage('valor informado incorreto!');
      edtCodVeiculo.Clear;
      edtCodVeiculo.SetFocus;
    end;
end;

procedure TFormMovFrete.edtCodExit(Sender: TObject);
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
        DM.MOV_FRETE.Active := True;
        DM.MOV_FRETE.Close;
        DM.MOV_FRETE.ParamByName('PCDFRETE').Value := cod;
        DM.MOV_FRETE.Open;

        if(DM.MOV_FRETE.IsEmpty) then
          begin
            edtCod.SetFocus;
          end
          else
            begin
              edtCodClienteExit(Sender);
              edtCodCidadeExit(Sender);
              edtCodTpCargaExit(Sender);
              edtCodMotoristaExit(Sender);
              edtCodVeiculoExit(Sender);
              tipoRegistro := False;
              habilitarAba(True);

              IBQGRID.Active := True;
              IBQGRID.Close;
              IBQGRID.ParamByName('PCDFRETE').Value := DM.MOV_FRETECD_FRETE.Value;
              IBQGRID.Open;


              DM.MOV_FRETE.Edit;
            end;
      end;
end;

procedure TFormMovFrete.DSFreteStateChange(Sender: TObject);
begin
  if(edtCod.Text = '') or (edtCod.Text = '0') then
    begin
      tabDestino.Enabled := False;
    end
    else
      begin
        tabDestino.Enabled := True;
      end;
  if(DM.MOV_FRETE.State IN [DSINSERT,DSEDIT]) then
    begin
      btnNovo.Enabled := False;

      btnGravar.Enabled := True;
      btnExcluir.Enabled := True;

      btnVeiculo.Enabled := True;
      btnCliente.Enabled := True;
      btnCidade.Enabled := True;
      btnTpCarga.Enabled := True;
      btnMotorista.Enabled := True;

      edtCodVeiculo.Enabled := True;
      edtCodCliente.Enabled := True;
      edtCodCidade.Enabled := True;
      edtCodTpCarga.Enabled := True;
      edtCodMotorista.Enabled := True;
    end
    else
      begin
        btnNovo.Enabled := True;

        btnGravar.Enabled := False;
        btnExcluir.Enabled := False;

        btnVeiculo.Enabled := False;
        btnCliente.Enabled := False;
        btnCidade.Enabled := False;
        btnTpCarga.Enabled := False;
        btnMotorista.Enabled := False;

        edtCodVeiculo.Enabled := False;
        edtCodCliente.Enabled := False;
        edtCodCidade.Enabled := False;
        edtCodTpCarga.Enabled := False;
        edtCodMotorista.Enabled := False;
      end;
end;

procedure TFormMovFrete.btnCidadeDestinoClick(Sender: TObject);
begin
  FormConsultaCidade.ShowModal;

  if(FormConsultaCidade.ModalResult = mrOk) then
    begin
      DM.MOV_DESTINO_FRETECD_CIDADE.Value := DM.IBQCAD_CIDADECD_CIDADE.Value;
      edtCidadeDestino.Text := DM.IBQCAD_CIDADENM_CIDADE.Value;
    end;
end;

procedure TFormMovFrete.edtCodCidadeDestinoExit(Sender: TObject);
var
  cod : Integer;
begin
  if(edtCodCidadeDestino.Text = '') then
    begin
      edtCidadeDestino.Clear;
      Abort;
    end
  else if(TryStrToInt(edtCodCidadeDestino.Text, cod) = True) then
    begin
      DM.CAD_CIDADE.Active := True;
      DM.CAD_CIDADE.Close;
      DM.CAD_CIDADE.ParamByName('PCDCIDADE').Value := cod;
      DM.CAD_CIDADE.Open;

      if(DM.CAD_CIDADE.IsEmpty = True) then
        begin
          edtCodCidadeDestino.SetFocus;
        end
      else
        begin
          edtCidadeDestino.Text := DM.CAD_CIDADENM_CIDADE.Value;
        end;
    end
  else
    begin
      ShowMessage('valor informado incorreto!');
      edtCidadeDestino.Clear;
      edtCodCidadeDestino.SetFocus;
    end;
end;

procedure TFormMovFrete.btnAdicionarClick(Sender: TObject);
begin
  validarDestino;

  DM.MOV_DESTINO_FRETE.Active := True;
  DM.MOV_DESTINO_FRETENR_SEQ.AsInteger := 0;
  DM.MOV_DESTINO_FRETEDT_TRANSACAO.AsDateTime := Date;
  DM.MOV_DESTINO_FRETECD_FRETE.AsInteger := DM.MOV_FRETECD_FRETE.AsInteger;

  DM.MOV_DESTINO_FRETE.Post;
  DM.Transaction.CommitRetaining;

  ShowMessage('Registro gravado com sucesso!');
  limparCamposDestino;

  IBQGRID.Active := True;
  IBQGRID.Close;
  IBQGRID.ParamByName('PCDFRETE').Value := DM.MOV_FRETECD_FRETE.Value;
  IBQGRID.Open;
  DM.MOV_DESTINO_FRETE.Close;
  DM.MOV_DESTINO_FRETE.Open;
end;

procedure TFormMovFrete.validarDestino();
begin
  if(edtLogradouro.Text = '') then
    begin
      ShowMessage('Informe um valor!');
      edtLogradouro.SetFocus;
      Abort;
    end
    else if(edtNumero.Text = '') then
      begin
        ShowMessage('Informe um valor!');
        edtNumero.SetFocus;
        Abort;
      end
      else if(edtBairro.Text = '') then
        begin
          ShowMessage('Informe um valor!');
          edtBairro.SetFocus;
          Abort;
        end
        else if(edtCodCidadeDestino.Text = '') then
          begin
            ShowMessage('Informe um valor!');
            edtCodCidadeDestino.SetFocus;
            Abort;
          end
          else if(edtCep.Text = '') then
            begin
              ShowMessage('Informe um valor!');
              edtCep.SetFocus;
              Abort;
            end
            else if(edtObs.Text = '') then
              begin
                ShowMessage('Informe um valor!');
                edtObs.SetFocus;
                Abort;
              end;
end;

procedure TFormMovFrete.limparCamposDestino();
begin
  edtNrSeq.Text := '';
  edtLogradouro.Text := '';
  edtNumero.Text := '';
  edtBairro.Text := '';
  edtCodCidadeDestino.Text := '';
  edtCidadeDestino.Text := '';
  edtCep.Text := '';
  edtObs.Text := '';
end;

procedure TFormMovFrete.btnRemoverClick(Sender: TObject);
begin
  if(MessageDlg('Deseja excluir este registro?', mtWarning, mbOKCancel,0) = mrOk) then
    begin
      DM.MOV_DESTINO_FRETE.Active := True;
      DM.MOV_DESTINO_FRETE.Close;
      DM.MOV_DESTINO_FRETE.SelectSQL.Clear;
      DM.MOV_DESTINO_FRETE.SelectSQL.Add('SELECT * FROM MOV_DESTINO_FRETE WHERE CD_FRETE = :PCDFRETE AND NR_SEQ = :PNRSEG');
      DM.MOV_DESTINO_FRETE.ParamByName('PCDFRETE').Value := DM.MOV_FRETECD_FRETE.Value;
      DM.MOV_DESTINO_FRETE.ParamByName('PNRSEG').Value := IBQGRIDNR_SEQ.Value;
      DM.MOV_DESTINO_FRETE.Open;

      if(DM.MOV_DESTINO_FRETE.IsEmpty) then
        begin
          ShowMessage('Nenhum registro selecionado!');
          Abort;
        end;

      DM.MOV_DESTINO_FRETE.Delete;
      DM.Transaction.CommitRetaining;

      IBQGRID.Active := True;
      IBQGRID.Close;
      IBQGRID.ParamByName('PCDFRETE').Value := DM.MOV_FRETECD_FRETE.Value;
      IBQGRID.Open;
    end;
end;

//Aba de consulta
//Pesquisas
procedure TFormMovFrete.btnPesquisarClick(Sender: TObject);
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
            sqlSelect := ('SELECT FRETE.CD_FRETE, FRETE.CD_VEICULO, VEICULO.DS_PLACA,');
            sqlSelect := sqlSelect + (' FRETE.CD_MOTORISTA, PESSOAMOT.NM_RZ_SOCIAL AS MOTORISTA, FRETE.CD_TIPO_CARGA, TPCARGA.DS_TIPO_CARGA,');
            sqlSelect := sqlSelect + (' FRETE.CD_CLIENTE, PESSOACLI.NM_RZ_SOCIAL AS CLIENTE, FRETE.cd_cidade_origem, CIDADE.NM_CIDADE,');
            sqlSelect := sqlSelect + (' FRETE.DS_END_DESTINO, FRETE.VL_FRETE, FRETE.DT_TRANSACAO');
            sqlSelect := sqlSelect + (' FROM MOV_FRETE FRETE');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_VEICULO VEICULO ON (VEICULO.CD_VEICULO = FRETE.CD_VEICULO)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_MOTORISTA MOTORISTA ON (MOTORISTA.CD_MOTORISTA = FRETE.CD_MOTORISTA)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_TIPO_CARGA TPCARGA ON (TPCARGA.CD_TIPO_CARGA = FRETE.CD_TIPO_CARGA)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_CLIENTE CLIENTE ON (CLIENTE.CD_CLIENTE = FRETE.CD_CLIENTE)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_CIDADE CIDADE ON (CIDADE.CD_CIDADE = FRETE.cd_cidade_origem)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_PESSOA PESSOAMOT ON (MOTORISTA.CD_PESSOA = PESSOAMOT.CD_PESSOA)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_PESSOA PESSOACLI ON (CLIENTE.CD_PESSOA = PESSOACLI.CD_PESSOA)');
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

            sqlSelect := ('SELECT FRETE.CD_FRETE, FRETE.CD_VEICULO, VEICULO.DS_PLACA,');
            sqlSelect := sqlSelect + (' FRETE.CD_MOTORISTA, PESSOAMOT.NM_RZ_SOCIAL AS MOTORISTA, FRETE.CD_TIPO_CARGA, TPCARGA.DS_TIPO_CARGA,');
            sqlSelect := sqlSelect + (' FRETE.CD_CLIENTE, PESSOACLI.NM_RZ_SOCIAL AS CLIENTE, FRETE.cd_cidade_origem, CIDADE.NM_CIDADE,');
            sqlSelect := sqlSelect + (' FRETE.DS_END_DESTINO, FRETE.VL_FRETE, FRETE.DT_TRANSACAO');
            sqlSelect := sqlSelect + (' FROM MOV_FRETE FRETE');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_VEICULO VEICULO ON (VEICULO.CD_VEICULO = FRETE.CD_VEICULO)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_MOTORISTA MOTORISTA ON (MOTORISTA.CD_MOTORISTA = FRETE.CD_MOTORISTA)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_TIPO_CARGA TPCARGA ON (TPCARGA.CD_TIPO_CARGA = FRETE.CD_TIPO_CARGA)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_CLIENTE CLIENTE ON (CLIENTE.CD_CLIENTE = FRETE.CD_CLIENTE)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_CIDADE CIDADE ON (CIDADE.CD_CIDADE = FRETE.cd_cidade_origem)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_PESSOA PESSOAMOT ON (MOTORISTA.CD_PESSOA = PESSOAMOT.CD_PESSOA)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_PESSOA PESSOACLI ON (CLIENTE.CD_PESSOA = PESSOACLI.CD_PESSOA)');
            sqlSelect := sqlSelect + (' WHERE FRETE.CD_FRETE =:PCDFRETE');

            Select(sqlSelect, 'PCDFRETE', cod);
          end;
        //Pesquisa por cliente
        2:
          begin
            sqlSelect := ('SELECT FRETE.CD_FRETE, FRETE.CD_VEICULO, VEICULO.DS_PLACA,');
            sqlSelect := sqlSelect + (' FRETE.CD_MOTORISTA, PESSOAMOT.NM_RZ_SOCIAL AS MOTORISTA, FRETE.CD_TIPO_CARGA, TPCARGA.DS_TIPO_CARGA,');
            sqlSelect := sqlSelect + (' FRETE.CD_CLIENTE, PESSOACLI.NM_RZ_SOCIAL AS CLIENTE, FRETE.cd_cidade_origem, CIDADE.NM_CIDADE,');
            sqlSelect := sqlSelect + (' FRETE.DS_END_DESTINO, FRETE.VL_FRETE, FRETE.DT_TRANSACAO');
            sqlSelect := sqlSelect + (' FROM MOV_FRETE FRETE');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_VEICULO VEICULO ON (VEICULO.CD_VEICULO = FRETE.CD_VEICULO)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_MOTORISTA MOTORISTA ON (MOTORISTA.CD_MOTORISTA = FRETE.CD_MOTORISTA)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_TIPO_CARGA TPCARGA ON (TPCARGA.CD_TIPO_CARGA = FRETE.CD_TIPO_CARGA)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_CLIENTE CLIENTE ON (CLIENTE.CD_CLIENTE = FRETE.CD_CLIENTE)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_CIDADE CIDADE ON (CIDADE.CD_CIDADE = FRETE.cd_cidade_origem)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_PESSOA PESSOAMOT ON (MOTORISTA.CD_PESSOA = PESSOAMOT.CD_PESSOA)');
            sqlSelect := sqlSelect + (' INNER JOIN CAD_PESSOA PESSOACLI ON (CLIENTE.CD_PESSOA = PESSOACLI.CD_PESSOA)');
            sqlSelect := sqlSelect + (' WHERE PESSOACLI.nm_rz_social LIKE ''%' + edtValorPesquisa.Text + '%''');

            Select(sqlSelect, '', cod);
          end;
      else
        ShowMessage('Tipo de pesquisa incorreto!');
      end;
    end;
end;

//Comandos para pesquisa
procedure TFormMovFrete.ComandosPesquisa(msg: String);
begin
  ShowMessage(msg);
  edtValorPesquisa.Clear;
  edtValorPesquisa.SetFocus;
  Abort;
end;

//Comando select
procedure TFormMovFrete.Select(SQL: String; Parametro: String; cod: Integer);
begin
  IBQFRETE.Active := TRUE;
  IBQFRETE.Close;
  IBQFRETE.SQL.Clear;
  IBQFRETE.SQL.Add(SQL);
  if(Parametro <> '') then
    begin
      IBQFRETE.ParamByName(Parametro).AsInteger := cod;
    end;
  IBQFRETE.Open;
end;

//Duplo clique na Grid: Pega a linha selecionada e passa para a tela de cadastro
procedure TFormMovFrete.GridConsultaDblClick(Sender: TObject);
begin
  DM.MOV_FRETE.Active := True;
  DM.MOV_FRETE.Close;
  DM.MOV_FRETE.ParamByName('PCDFRETE').Value := IBQFRETECD_FRETE.Value;
  DM.MOV_FRETE.Open;

  edtCodClienteExit(Sender);
  edtCodCidadeExit(Sender);
  edtCodTpCargaExit(Sender);
  edtCodMotoristaExit(Sender);
  edtCodVeiculoExit(Sender);
  tipoRegistro := False;
  habilitarAba(True);

  IBQGRID.Active := True;
  IBQGRID.Close;
  IBQGRID.ParamByName('PCDFRETE').Value := DM.MOV_FRETECD_FRETE.Value;
  IBQGRID.Open;

  DM.MOV_FRETE.Edit;
  PageControl.TabIndex := 0;
end;

//Executa ao selecionar uma opção na comboBox
procedure TFormMovFrete.cbTipoConsultaSelect(Sender: TObject);
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
procedure TFormMovFrete.HabilitarCampo(Boolean: Boolean);
begin
    edtValorPesquisa.Text := '';
    labelPesquisa.Visible := Boolean;
    edtValorPesquisa.Visible := Boolean;
end;

procedure TFormMovFrete.GridConsultaCellClick(Column: TColumn);
begin
  IBQGRIDDESTINO.Active := True;
  IBQGRIDDESTINO.Close;
  IBQGRIDDESTINO.ParamByName('PCDFRETE').Value := IBQFRETECD_FRETE.Value;
  IBQGRIDDESTINO.Open;
end;

end.
