object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 186
  ClientWidth = 302
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PopupMenu = PopupMenu1
  OnActivate = FormShow
  OnCreate = FormCreate
  TextHeight = 15
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 302
    Height = 186
    Hint = 'H'#246'gerklicka f'#246'r inst'#228'llningar'
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 0
    ExplicitWidth = 298
    ExplicitHeight = 185
  end
  object Timer1: TTimer
    Interval = 15000
    OnTimer = Timer1Timer
    Left = 24
    Top = 72
  end
  object PopupMenu1: TPopupMenu
    Left = 120
    Top = 72
    object Instllningar1: TMenuItem
      Caption = '&Inst'#228'llningar'
      OnClick = Instllningar1Click
    end
    object Readme1: TMenuItem
      Caption = '&Read me'
      OnClick = Readme1Click
    end
  end
end
