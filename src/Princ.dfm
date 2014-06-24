object FmPrinc: TFmPrinc
  Left = 0
  Top = 0
  Caption = 'Sinaleiros'
  ClientHeight = 567
  ClientWidth = 1223
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
  object EdChange: TEdit
    Left = 135
    Top = 538
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object CbSelect: TComboBox
    Left = 8
    Top = 538
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Selecione o sinaleiro'
  end
  object BtnSetName: TButton
    Left = 262
    Top = 536
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 3
    OnClick = BtnSetNameClick
  end
end
