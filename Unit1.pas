unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edt1: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    dbgrd1: TDBGrid;
    edt2: TEdit;
    btn4: TButton;
    edt3: TEdit;
    btn5: TButton;
    procedure btn5Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure edt2Change(Sender: TObject);
    procedure OnCellClickSatuan(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

var
  temptString: string;
  id : string;
  id_int, last_id: Integer;

implementation
  uses Unit2;

{$R *.dfm}

procedure TForm1.btn5Click(Sender: TObject);
begin
edt1.Clear;
edt2.clear;
edt3.Clear;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
temptString := '';
if (edt1.Text = temptString) or (edt3.Text = temptString) then
  begin
    lbl4.Caption := 'input tidak boleh kosong';
  end
else
  begin
    DataModule2.zqrySatuan.SQL.Clear;
    DataModule2.zqrySatuan.SQL.Add('Insert into satuan values(null,"' + edt1.Text + '", "' + edt3.Text + '")');
    DataModule2.zqrySatuan.ExecSQL;

    DataModule2.zqrySatuan.SQL.Clear;
    DataModule2.zqrySatuan.SQL.Add('select * from satuan');
    DataModule2.zqrySatuan.Open;
    ShowMessage('added');

    lbl4.Caption := '';
    edt1.Text := '';
    edt3.Text := '';
  end;


end;

procedure TForm1.btn2Click(Sender: TObject);
begin
temptString := '';
if (edt1.Text = temptString) or (edt3.Text = temptString) then
  begin
    lbl4.Caption := 'input tidak boleh kosong';
  end
else
  begin
    DataModule2.zqrySatuan.SQL.Clear;
    DataModule2.zqrySatuan.SQL.Add('Update satuan set nama="' + edt1.Text + '", diskripsi="' + edt3.Text + '" Where id ="' + id + '"');
    DataModule2.zqrySatuan.ExecSQL;

    DataModule2.zqrySatuan.SQL.Clear;
    DataModule2.zqrySatuan.SQL.Add('select * from satuan');
    DataModule2.zqrySatuan.Open;
    ShowMessage('updated');

    lbl4.Caption := '';
    edt1.Text := '';
    edt3.Text := '';
  end

end;

procedure TForm1.btn3Click(Sender: TObject);
begin
temptString := '';
if edt1.Text = temptString then
  begin
    lbl4.Caption := 'input tidak boleh kosong';
  end
else
  begin
    DataModule2.zqrySatuan.SQL.Clear;
    DataModule2.zqrySatuan.SQL.Add('Delete From satuan Where id ="' + id + '"');
    DataModule2.zqrySatuan.ExecSQL;

    DataModule2.zqrySatuan.SQL.Clear;
    DataModule2.zqrySatuan.SQL.Add('select * from satuan');
    DataModule2.zqrySatuan.Open;
    ShowMessage('deleted');

    lbl4.Caption := '';
    edt1.Text := '';
    edt3.Text := '';
  end

end;

procedure TForm1.edt2Change(Sender: TObject);
begin
with DataModule2.zqrySatuan do
  begin
    SQL.Clear;
    SQL.Add('select * from satuan where nama like "%'+edt2.Text+'%"');
    Open;
  end;
end;

procedure TForm1.OnCellClickSatuan(Column: TColumn);
begin
  edt1.Text := DataModule2.zqrySatuan.Fields[1].AsString;
  edt3.Text := DataModule2.zqrySatuan.Fields[2].AsString;
  id:= DataModule2.zqrySatuan.Fields[0].AsString;
end;

end.
 