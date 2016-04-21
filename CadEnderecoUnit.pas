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
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure dbEstadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadEndereco: TFormCadEndereco;

implementation

uses DMUnit;

{$R *.dfm}

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

end;

//Ao selecionar um Estado � preenchido a combo de Cidade
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

end.
