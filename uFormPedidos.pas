unit uFormPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, FMTBcd, ExtCtrls, Grids, DBGrids, DB, SqlExpr,
  Provider, DBClient, ComCtrls, AppEvnts, StdCtrls;

type
  TformPedidos = class(TForm)
    appEvents: TApplicationEvents;
    pgControl: TPageControl;
    tbPesquisa: TTabSheet;
    tbEdicao: TTabSheet;
    dsItens: TDataSource;
    dsPedidos: TDataSource;
    cdsPedidos: TClientDataSet;
    cdsItens: TClientDataSet;
    dspPedidos: TDataSetProvider;
    dspItens: TDataSetProvider;
    SQLConnection: TSQLConnection;
    sqlPedidos: TSQLDataSet;
    sqlItens: TSQLDataSet;
    sqlProdutos: TSQLDataSet;
    dsProdutos: TDataSource;
    cdsProdutos: TClientDataSet;
    dspProdutos: TDataSetProvider;
    cdsPedidosID: TIntegerField;
    cdsPedidosCLIENTE: TStringField;
    cdsPedidosVRTOTALPEDIDO: TFMTBCDField;
    cdsPedidosDATAPEDIDO: TSQLTimeStampField;
    cdsPedidosDATADIGITACAO: TSQLTimeStampField;
    cdsPedidosOBSERVACAO: TStringField;
    cdsItensID: TIntegerField;
    cdsItensPEDIDOID: TIntegerField;
    cdsItensPRODUTOID: TIntegerField;
    cdsItensQUANTIDADE: TIntegerField;
    cdsItensVRUNITARIO: TFMTBCDField;
    cdsItensDESCONTOITEM: TFMTBCDField;
    cdsItensVRTOTALITEM: TFMTBCDField;
    cdsItensOBSERVACAO: TStringField;
    cdsProdutosID: TIntegerField;
    cdsProdutosDESCRICAO: TStringField;
    grdPesquisaItem: TDBGrid;
    Splitter1: TSplitter;
    grdPesquisaPedido: TDBGrid;
    pnlPesquisaItens: TPanel;
    edtFiltraItenPedido: TEdit;
    Label1: TLabel;
    pnlPesquisaPedido: TPanel;
    Label2: TLabel;
    edtFiltraPedido: TEdit;
    btIncluirPedido: TButton;
    btExcluirPedido: TButton;
    btEditarPedido: TButton;
    pnlTopPesquisa: TPanel;
    grdEditPedido: TDBGrid;
    pnlMidlePesquisa: TPanel;
    grdEditaItem: TDBGrid;
    Splitter2: TSplitter;
    btExcluirItem: TButton;
    btGravarPedido: TButton;
    btCancelarEdicao: TButton;
    btIncluirPedidoED: TButton;
    btExcluirPedidoED: TButton;
    cdsItenslkpDescricaoProduto: TStringField;
    cdsPedidoscalcMaxIDPed: TAggregateField;
    cdsItenscalcMaxIDItem: TAggregateField;
    cdsItenscalcValorTotalItens: TAggregateField;
    btEnviarAoBanco: TButton;
    procedure appEventsException(Sender: TObject; E: Exception);
    procedure edtFiltraPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btIncluirPedidoClick(Sender: TObject);
    procedure btExcluirPedidoClick(Sender: TObject);
    procedure btEditarPedidoClick(Sender: TObject);
    procedure edtFiltraItenPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsPedidosAfterScroll(DataSet: TDataSet);
    procedure btGravarPedidoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btExcluirItemClick(Sender: TObject);
    procedure cdsPedidosAfterInsert(DataSet: TDataSet);
    procedure cdsItensAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btCancelarEdicaoClick(Sender: TObject);
    procedure cdsItensBeforePost(DataSet: TDataSet);
    procedure cdsPedidosBeforePost(DataSet: TDataSet);
    procedure cdsItensBeforeInsert(DataSet: TDataSet);
    procedure pgControlChange(Sender: TObject);
    procedure grdPesquisaPedidoDblClick(Sender: TObject);
    procedure btEnviarAoBancoClick(Sender: TObject);
    procedure grdEditaItemExit(Sender: TObject);
    procedure dsPedidosStateChange(Sender: TObject);
    procedure dsItensStateChange(Sender: TObject);
    procedure cdsItensAfterScroll(DataSet: TDataSet);
    procedure cdsItensAfterPost(DataSet: TDataSet);
    procedure cdsItensAfterDelete(DataSet: TDataSet);
    procedure cdsPedidosBeforeDelete(DataSet: TDataSet);
    procedure cdsItensBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    procedure FiltraItensDePedido;
  public
    { Public declarations }
  end;

var
  formPedidos: TformPedidos;

implementation

uses Math, StrUtils;

var
  vMaxIdItem : Integer ;

{$R *.dfm}

procedure TformPedidos.appEventsException(Sender: TObject; E: Exception);
begin
  // exceções

  if E.ClassType = EDatabaseError then
  begin
    MessageDlg('Erro de dados: '+ E.Message +', verifique!', mtWarning, [mbOk], 0);
  end else
  if Pos('Key violation', E.Message) > 0 then
  begin
    MessageDlg('Violação de chave, duplicidade de produtos, verifique!', mtError, [mbOk], 0);
  end else
  begin
    MessageDlg('Erro não esperado: '+E.Message+' , verifique!', mtError, [mbOk], 0);
  end;

end;

procedure TformPedidos.edtFiltraPedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key in [vk_Return] then
  begin
    if edtFiltraPedido.Text = '' then
    begin
      cdsPedidos.Filtered   := false;
      cdsPedidos.Filter     := '' ;
    end else
    begin
      cdsPedidos.Filtered   := false;
      cdsPedidos.Filter     := 'ID = '+edtFiltraPedido.Text ;
      cdsPedidos.Filtered   := true;
    end;
  end;

  FiltraItensDePedido;
end;

procedure TformPedidos.btIncluirPedidoClick(Sender: TObject);
begin
  pgControl.ActivePage := tbEdicao;
  cdsPedidos.Insert;
  grdEditPedido.SetFocus;
end;

procedure TformPedidos.btExcluirPedidoClick(Sender: TObject);
begin
  cdsPedidos.Delete;
end;

procedure TformPedidos.btEditarPedidoClick(Sender: TObject);
begin
  pgControl.ActivePage := tbEdicao;
  cdsPedidos.Edit;
end;

procedure TformPedidos.edtFiltraItenPedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key in [vk_Return] then
  begin
    if edtFiltraItenPedido.Text = '' then
      begin
        cdsItens.Filtered   := False;
        cdsItens.Filter     := '( PEDIDOID = '+cdsPedidosID.AsString+' ) ';
        cdsItens.Filtered   := True;
      end else
      begin
        cdsItens.Filtered   := False;
        cdsItens.Filter     := '(PRODUTOID = '+edtFiltraItenPedido.Text + ') AND ( PEDIDOID = '+cdsPedidosID.AsString+' ) ';
        cdsItens.Filtered   := True;
      end;
    end;
  end;
procedure TformPedidos.FiltraItensDePedido;
begin
  cdsItens.Filtered := False;
  if cdsPedidosID.AsString <> '' then
  begin
    cdsItens.Filter   := 'PEDIDOID = '+ cdsPedidosID.AsString ;
    cdsItens.Filtered := True;
  end;
end;

procedure TformPedidos.cdsPedidosAfterScroll(DataSet: TDataSet);
begin
  if cdsItens.State in [dsEdit, dsInsert] then
  begin
    ShowMessage('Itens em edição, favor conferir!');
    exit;
  end;
  FiltraItensDePedido;
  dsPedidosStateChange( cdsPedidos );
end;

procedure TformPedidos.btGravarPedidoClick(Sender: TObject);
begin
  cdsPedidos.Post;
//  cdsPedidos.ApplyUpdates(0);
end;

procedure TformPedidos.FormShow(Sender: TObject);
begin
  cdsPedidos.Open;
  cdsItens.Open;
  cdsProdutos.Open;
end;

procedure TformPedidos.btExcluirItemClick(Sender: TObject);
begin
  cdsItens.Delete;
end;

procedure TformPedidos.cdsPedidosAfterInsert(DataSet: TDataSet);
begin
  cdsPedidosID.AsInteger := StrToIntDef( cdsPedidoscalcMaxIDPed.AsString, 0) + 1 ;

  cdsPedidosVRTOTALPEDIDO.AsFloat     := 0;
  cdsPedidosDATAPEDIDO.AsDateTime     := Trunc( Now );
  cdsPedidosDATADIGITACAO.AsDateTime  := Trunc( Now );

end;

procedure TformPedidos.cdsItensAfterInsert(DataSet: TDataSet);
begin
  cdsItensID.AsInteger         := vMaxIdItem + 1 ;
  cdsItensPEDIDOID.AsInteger   := cdsPedidosID.AsInteger ;

  cdsItensVRUNITARIO.AsFloat   := 0 ;
  cdsItensDESCONTOITEM.AsFloat := 0 ;
  cdsItensQUANTIDADE.AsFloat   := 0 ;
  cdsItensVRTOTALITEM.AsFloat  := 0 ;

end;

procedure TformPedidos.FormCreate(Sender: TObject);
begin
  pgControl.TabIndex := 0 ;
  vMaxIdItem         := 0 ;
end;

procedure TformPedidos.btCancelarEdicaoClick(Sender: TObject);
begin
  cdsPedidos.Cancel;
end;

procedure TformPedidos.cdsItensBeforePost(DataSet: TDataSet);
begin
  if cdsItensQUANTIDADE.AsFloat = 0 then
  begin
    MessageDlg('Necessário informar quantidade para item, verifique!', mtWarning, [mbOk], 0);
    abort;
  end;

  if cdsItensVRUNITARIO.AsFloat = 0 then
  begin
    MessageDlg('Necessário informar valor unitário para item, verifique!', mtWarning, [mbOk], 0);
    abort;
  end;

  cdsItensVRTOTALITEM.AsFloat := ( cdsItensQUANTIDADE.AsFloat * cdsItensVRUNITARIO.AsFloat ) -
                                   StrToFloatDef( cdsItensDESCONTOITEM.AsString, 0);
end;

procedure TformPedidos.cdsPedidosBeforePost(DataSet: TDataSet);
begin

  // data digitação
  cdsPedidosDATADIGITACAO.AsDateTime := Trunc( Now );

end;

procedure TformPedidos.cdsItensBeforeInsert(DataSet: TDataSet);
begin
  if cdsPedidos.Eof then
  begin
    MessageDlg('É necessário existir um pedido para inserir um item, verifique!', mtWarning, [mbOk], 0);
    Abort;
  end;

  try
    cdsItens.DisableControls;
    cdsItens.Filtered := False;
    vMaxIdItem := StrToIntDef( cdsItenscalcMaxIDItem.AsString, 0 ) ;
  finally
    cdsItens.Filtered := True;
    cdsItens.EnableControls;
  end;
end;

procedure TformPedidos.pgControlChange(Sender: TObject);
begin

  if (cdsPedidos.State in [dsInsert, dsEdit]) or 
     (cdsItens.State in [dsInsert, dsEdit]) then
  begin
    MessageDlg('Pedido ou itens em edição, verifique!', mtWarning, [mbOk], 0);
    pgControl.ActivePageIndex := 1;
  end;

  if pgControl.ActivePage = tbEdicao then
  begin
    FiltraItensDePedido;
  end;
end;

procedure TformPedidos.grdPesquisaPedidoDblClick(Sender: TObject);
begin
  if cdsPedidos.RecordCount > 0 then
  begin
    btEditarPedido.Click;
  end;
end;

procedure TformPedidos.btEnviarAoBancoClick(Sender: TObject);
begin
  cdsPedidos.ApplyUpdates(-1);
  cdsItens.ApplyUpdates(-1);

  cdsItens.ApplyUpdates(-1);
  cdsPedidos.ApplyUpdates(-1);
end;

procedure TformPedidos.grdEditaItemExit(Sender: TObject);
begin
  if cdsItens.State in [ dsInsert, dsEdit ] then
  begin
    cdsItens.Post;
  end;
end;

procedure TformPedidos.dsPedidosStateChange(Sender: TObject);
begin
  btExcluirPedido.Enabled   := cdsPedidos.RecordCount > 0 ;
  btExcluirPedidoED.Enabled := cdsPedidos.RecordCount > 0 ;

  btEditarPedido.Enabled    := cdsPedidos.RecordCount > 0 ;

  btCancelarEdicao.Enabled  := cdsPedidos.State in [ dsInsert, dsEdit ] ;
  btGravarPedido.Enabled    := cdsPedidos.State in [ dsInsert, dsEdit ] ;
end;

procedure TformPedidos.dsItensStateChange(Sender: TObject);
begin
  btExcluirItem.Enabled := cdsItens.RecordCount > 0 ;
end;

procedure TformPedidos.cdsItensAfterScroll(DataSet: TDataSet);
begin
  dsItensStateChange( cdsItens );
end;

procedure TformPedidos.cdsItensAfterPost(DataSet: TDataSet);
begin
  // verificando se está em edição
  if not(cdsPedidos.State in [dsInsert, dsEdit]) then
  begin
    cdsPedidos.Edit;
  end;

  // calculo do total
  if cdsItens.RecordCount <> 0 then
  begin
    cdsPedidosVRTOTALPEDIDO.AsFloat := StrToFloatDef( cdsItenscalcValorTotalItens.AsString, 0) ;
  end else
  begin
    cdsPedidosVRTOTALPEDIDO.AsFloat := 0 ;
  end;

end;

procedure TformPedidos.cdsItensAfterDelete(DataSet: TDataSet);
begin
  cdsItensAfterPost(cdsItens);
end;

procedure TformPedidos.cdsPedidosBeforeDelete(DataSet: TDataSet);
begin
  try
    cdsItens.BeforeDelete := nil ;

    if MessageDlg('Confirma exclusão de pedido?', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
    begin
      Abort;
    end;

    // excluindo itens antes do pedido
    while not cdsItens.Eof do
    begin
      cdsItens.Delete;
    end;
  finally
    cdsItens.BeforeDelete := cdsItensBeforeDelete;
  end;
end;

procedure TformPedidos.cdsItensBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Confirma exclusão de item?', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
  begin
    Abort;
  end;
end;

end.
