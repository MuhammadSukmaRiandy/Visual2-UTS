object Form1: TForm1
  Left = 192
  Top = 125
  Width = 1044
  Height = 540
  Caption = 'SATUAN'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 40
    Top = 56
    Width = 61
    Height = 19
    Caption = 'NAMA : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 40
    Top = 120
    Width = 94
    Height = 19
    Caption = 'DESKRIPSI : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 24
    Top = 240
    Width = 149
    Height = 19
    Caption = 'MASUKKAN NAMA : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edt1: TEdit
    Left = 152
    Top = 56
    Width = 209
    Height = 21
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 152
    Top = 120
    Width = 209
    Height = 21
    TabOrder = 1
  end
  object dbgrd1: TDBGrid
    Left = 16
    Top = 280
    Width = 953
    Height = 201
    DataSource = DataModule2.dsSatuan
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
  end
  object edt3: TEdit
    Left = 184
    Top = 240
    Width = 257
    Height = 21
    TabOrder = 3
    OnChange = edt3Change
  end
  object btn1: TButton
    Left = 584
    Top = 96
    Width = 97
    Height = 41
    Caption = 'BARU'
    TabOrder = 4
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 408
    Top = 160
    Width = 97
    Height = 41
    Caption = 'SIMPAN'
    TabOrder = 5
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 528
    Top = 160
    Width = 97
    Height = 41
    Caption = 'EDIT'
    TabOrder = 6
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 648
    Top = 160
    Width = 97
    Height = 41
    Caption = 'HAPUS'
    TabOrder = 7
    OnClick = btn4Click
  end
  object btn5: TButton
    Left = 768
    Top = 160
    Width = 97
    Height = 41
    Caption = 'BATAL'
    TabOrder = 8
    OnClick = btn5Click
  end
end
