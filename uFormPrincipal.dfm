object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Super Sorteio'
  ClientHeight = 296
  ClientWidth = 285
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 56
    Height = 13
    Caption = 'Qt. Pr'#234'mios'
  end
  object Edit1: TEdit
    Left = 72
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 35
    Width = 269
    Height = 254
    ColCount = 2
    DefaultColWidth = 100
    RowCount = 10
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 1
    RowHeights = (
      24
      25
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object Button1: TButton
    Left = 199
    Top = 8
    Width = 81
    Height = 25
    Caption = 'Gerar n'#250'meros'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 155
    Top = 264
    Width = 122
    Height = 25
    Caption = 'Gerar arquivos'
    TabOrder = 3
    OnClick = Button2Click
  end
end
