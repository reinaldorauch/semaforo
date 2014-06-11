object FmPrinc: TFmPrinc
  Left = 0
  Top = 0
  Caption = 'Sinaleiros'
  ClientHeight = 567
  ClientWidth = 827
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
  object CbAlerta: TCheckBox
    Left = 24
    Top = 24
    Width = 97
    Height = 17
    Caption = 'Alerta'
    Checked = True
    State = cbChecked
    TabOrder = 0
    OnClick = CbAlertaClick
  end
end
