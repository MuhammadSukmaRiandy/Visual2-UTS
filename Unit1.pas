unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    dbgrd1: TDBGrid;
    edt3: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure posisiawal;
    procedure bersih;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure edt3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a : string;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.bersih;
begin
edt1.clear;
edt2.Clear;
edt3.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
posisiawal;
bersih;
end;

procedure TForm1.posisiawal;
begin
bersih;
edt1.Enabled:= False;
edt2.Enabled:= False;
edt3.Enabled:= False;
btn1.Enabled:= True;
btn2.Enabled:= False;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= False;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
edt1.Enabled:= True;
edt2.Enabled:= True;
edt3.Enabled:= True;
btn1.Enabled:= False;
btn2.Enabled:= True;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= True;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
if (edt1.Text = '') or (edt2.Text = '') then
begin
  ShowMessage('Nama Satuan Tidak Boleh Kosong!');
end else
begin
  if DataModule2.Zsatuan.Locate('nama',edt1.Text,[]) and
     DataModule2.Zsatuan.Locate('diskripsi',edt2.Text,[]) then
  begin
    ShowMessage('Nama Satuan '+edt1.Text+' dan Deskripsi '+edt2.Text+' Sudah Ada Didalam Sistem');
  end else
  begin
    // Simpan data
    with DataModule2.Zsatuan do
    begin
      SQL.Clear;
      SQL.Add('insert into satuan (nama, diskripsi) values("' + edt1.Text + '", "' + edt2.Text + '")');
      ExecSQL;
      SQL.Clear;
      SQL.Add('select * from satuan');
      Open;
    end;
    ShowMessage('Data Berhasil Disimpan!');
  end;
end;
posisiawal;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
if (edt1.Text = '') or (edt2.Text = '') then
begin
  ShowMessage('Nama Satuan Tidak Boleh Kosong!');
end else
begin
  if (edt1.Text = DataModule2.Zsatuan.Fields[1].AsString) and
     (edt2.Text = DataModule2.Zsatuan.Fields[2].AsString) then
  begin
    ShowMessage('Nama Satuan '+edt1.Text+' dan Deskripsi '+edt2.Text+' Tidak Ada Perubahan');
  end else
  begin
    // Kode update
    with DataModule2.Zsatuan do
    begin
      SQL.Clear;
      SQL.Add('update satuan set nama = "' + edt1.Text + '", diskripsi = "' + edt2.Text + '" where id = "' + a + '"');
      ExecSQL;

      SQL.Clear;
      SQL.Add('select * from satuan');
      Open;
    end;
    ShowMessage('Data Berhasil Diupdate!');
  end;
end;
posisiawal;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
if MessageDlg('Apakah Anda Yakin Menghapus Data ini', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    with DataModule2.Zsatuan do
    begin
      SQL.Clear;
      SQL.Add('delete from satuan where id = "' + a + '"');
      ExecSQL;

      SQL.Clear;
      SQL.Add('select * from satuan');
      Open;
    end;
    ShowMessage('Data Berhasil DiDelete!');
  end else
  begin
    ShowMessage('Data Batal Dihapus!');
  end;
  posisiawal;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
posisiawal;
bersih;
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
edt1.Text:=DataModule2.Zsatuan.Fields[1].AsString;
edt2.Text:=DataModule2.Zsatuan.Fields[2].AsString;
a:= DataModule2.Zsatuan.Fields[0].AsString;
btn1.Enabled:= False;
btn2.Enabled:= False;
btn3.Enabled:= True;
btn4.Enabled:= True;
btn5.Enabled:= True;
edt1.Enabled:= True;
edt2.Enabled:= True;
edt3.Enabled:= True;
end;

procedure TForm1.edt3Change(Sender: TObject);
begin
 if Assigned(DataModule2) and Assigned(DataModule2.Zsatuan) then
  begin
    DataModule2.Zsatuan.SQL.Clear;
    DataModule2.Zsatuan.SQL.Add('SELECT * FROM satuan WHERE nama LIKE "%' + edt3.Text + '%"');
    DataModule2.Zsatuan.Open; // Tidak menggunakan ExecSQL
  end
  else
end;

end.
