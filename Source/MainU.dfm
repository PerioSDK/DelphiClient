object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Perio Rest Api '#304'stemci '#214'rnek Uygulamas'#305
  ClientHeight = 681
  ClientWidth = 995
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SplitterMain: TSplitter
    Left = 0
    Top = 409
    Width = 995
    Height = 9
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 164
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 418
    Height = 263
    ExplicitLeft = 216
    ExplicitTop = 240
    ExplicitHeight = 100
  end
  object pnlConnSettings: TPanel
    Left = 0
    Top = 0
    Width = 995
    Height = 79
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlConnSettings'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 731
    object edtUserName: TLabeledEdit
      Left = 71
      Top = 42
      Width = 94
      Height = 21
      EditLabel.Width = 57
      EditLabel.Height = 13
      EditLabel.Caption = 'Username   '
      LabelPosition = lpLeft
      TabOrder = 0
      Text = 'SYSDBA'
    end
    object edtPassword: TLabeledEdit
      Left = 235
      Top = 42
      Width = 94
      Height = 21
      EditLabel.Width = 55
      EditLabel.Height = 13
      EditLabel.Caption = 'Password   '
      LabelPosition = lpLeft
      TabOrder = 1
      Text = 'password'
    end
    object edtHost: TLabeledEdit
      Left = 71
      Top = 10
      Width = 258
      Height = 21
      EditLabel.Width = 55
      EditLabel.Height = 13
      EditLabel.Caption = 'Host           '
      LabelPosition = lpLeft
      TabOrder = 2
      Text = 'http://192.168.1.221/api/'
    end
    object btnLogin: TButton
      Left = 348
      Top = 23
      Width = 75
      Height = 25
      Caption = 'Login'
      TabOrder = 3
      OnClick = btnLoginClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 79
    Width = 995
    Height = 44
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel3'
    ShowCaption = False
    TabOrder = 1
    ExplicitWidth = 1130
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 36
      Height = 13
      Caption = 'Method'
    end
    object cmbMethod: TComboBox
      Left = 74
      Top = 8
      Width = 79
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'GET'
      OnChange = cmbMethodChange
      Items.Strings = (
        'GET'
        'POST'
        'PUT'
        'DELETE')
    end
    object edtUrl: TLabeledEdit
      Left = 195
      Top = 8
      Width = 483
      Height = 21
      EditLabel.Width = 25
      EditLabel.Height = 13
      EditLabel.Caption = 'Url    '
      LabelPosition = lpLeft
      TabOrder = 1
    end
    object btnSend: TButton
      Left = 694
      Top = 6
      Width = 75
      Height = 25
      Caption = 'G'#246'nder'
      TabOrder = 2
      OnClick = btnSendClick
    end
  end
  object pnlBody: TPanel
    Left = 0
    Top = 123
    Width = 995
    Height = 286
    Align = alTop
    BorderWidth = 5
    Caption = 'pnlBody'
    ShowCaption = False
    TabOrder = 2
    object mmBody: TMemo
      Left = 6
      Top = 6
      Width = 983
      Height = 274
      Align = alClient
      Lines.Strings = (
        '')
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 47
      ExplicitWidth = 475
      ExplicitHeight = 316
    end
  end
  object pnlResponse: TPanel
    Left = 3
    Top = 418
    Width = 992
    Height = 263
    Align = alClient
    BorderWidth = 5
    Caption = 'pnlBody'
    ShowCaption = False
    TabOrder = 3
    ExplicitLeft = 0
    ExplicitTop = 173
    ExplicitWidth = 995
    ExplicitHeight = 205
    object mmResponse: TMemo
      Left = 6
      Top = 6
      Width = 980
      Height = 251
      Align = alClient
      Lines.Strings = (
        '')
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 47
      ExplicitWidth = 475
      ExplicitHeight = 316
    end
  end
end
