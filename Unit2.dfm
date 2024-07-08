object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 192
  Top = 152
  Height = 238
  Width = 424
  object zqrySatuan: TZQuery
    Connection = conSatuan
    Active = True
    SQL.Strings = (
      'SELECT * FROM satuan')
    Params = <>
    Left = 40
    Top = 56
  end
  object conSatuan: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3307
    Database = 'penjualan_uts'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\xampp\mysql\lib\libmysql.dll'
    Left = 40
    Top = 8
  end
  object dsSatuan: TDataSource
    DataSet = zqrySatuan
    Left = 40
    Top = 112
  end
end
