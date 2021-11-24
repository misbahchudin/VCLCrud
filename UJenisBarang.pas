unit UJenisBarang;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  UInduk,
  Data.DB,
  MemDS,
  DBAccess,
  Uni,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  Vcl.Menus,
  System.Actions,
  Vcl.ActnList,
  Vcl.StdCtrls,
  Vcl.Mask;

type
  TfJenisBarang = class(TfInduk)
    Kode: TLabeledEdit;
    Nama: TLabeledEdit;
    Button2: TButton;
    procedure TampilDataExecute(Sender: TObject);
    procedure InsertExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fJenisBarang: TfJenisBarang;

implementation

{$R *.dfm}

uses UDM;

procedure TfJenisBarang.InsertExecute(Sender: TObject);
begin
  inherited;
  // Insert Data To Database.
  try
    with dm.UniStoredProc1 do
    begin
      SQL.Clear;
      CreateProcCall('tbl_jenis_barang_insert');
      ParamByName('fKode').AsString := Kode.Text;
      ParamByName('fNama').AsString := Nama.Text;
      Execute;
      { message }
      MessageDlg('Data Berhasil disimpan', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbYes], 0);
      { Refresh }
      TampilDataExecute(Sender);
    end;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;

end;

procedure TfJenisBarang.TampilDataExecute(Sender: TObject);
begin
  inherited;
  with UniStoredProc1 do
  begin
    SQL.Clear;
    CreateProcCall('sp_tbl_jenis_barang_view');
    ExecProc;
  end;
  { FitGrid }
  dm.FitGrid(DBGrid1);

end;

end.
