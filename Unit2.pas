unit Unit2;

interface

uses
  SysUtils, Classes, DB, ZAbstractConnection, ZConnection,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDataModule2 = class(TDataModule)
    zqrySatuan: TZQuery;
    conSatuan: TZConnection;
    dsSatuan: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{$R *.dfm}

end.
