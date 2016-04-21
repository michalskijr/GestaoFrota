unit CadClienteUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TFormCadCliente = class(TForm)
    Panel: TPanel;
    Label1: TLabel;
    edtCod: TDBEdit;
    DataSourcePessoa: TDataSource;
    LabelNome: TLabel;
    edtDescricao: TDBEdit;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    edtDtTransacao: TDBEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DataSourceFisica: TDataSource;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtnConsulta: TBitBtn;
    LabelCPFCNPJ: TLabel;
    MaskCPFCNPJ: TMaskEdit;
    LabelRGEstadual: TLabel;
    edtRGEstadual: TEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DataSourceJuridica: TDataSource;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    RadioGroup2: TRadioGroup;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    DataSourceCliente: TDataSource;
    PanelBotoes: TPanel;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    DataSourceEndereco: TDataSource;
    btnTeste: TButton;
    DSEnderecoConsulta: TDataSource;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label11: TLabel;
    DataSourceContato: TDataSource;
    procedure btnTesteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadCliente: TFormCadCliente;

implementation

uses DMUnit;

{$R *.dfm}

procedure TFormCadCliente.btnTesteClick(Sender: TObject);
begin
  DM.CAD_ENDERECONR_SEQ.AsInteger := 0;
  DM.CAD_ENDERECODT_TRANSACAO.AsDateTime := Date;
  DM.CAD_ENDERECO.Post;
  DM.Transaction.CommitRetaining;
  //DM.IBQCAD_CIDADE.Close;
  ShowMessage('Registro gravado com sucesso!');



end;

end.