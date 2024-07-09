object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 192
  Top = 125
  Height = 243
  Width = 454
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 3306
    Database = 'penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Users\LENOVO LOQ\Downloads\libmysql (1).dll'
    Left = 40
    Top = 32
  end
  object zSatuan: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select * from satuan;')
    Params = <>
    Left = 128
    Top = 32
  end
  object dsSatuan: TDataSource
    DataSet = zSatuan
    Left = 208
    Top = 32
  end
end
