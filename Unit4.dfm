object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'GitHub Estagi'#225'rio Eletr'#244'nico'
  ClientHeight = 542
  ClientWidth = 978
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 978
    Height = 440
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 249
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 577
      Height = 438
      Align = alLeft
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Memo2: TMemo
      Left = 584
      Top = 1
      Width = 393
      Height = 438
      Align = alRight
      Lines.Strings = (
        '')
      TabOrder = 1
      ExplicitLeft = 585
      ExplicitTop = -160
      ExplicitHeight = 409
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 440
    Width = 978
    Height = 102
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 7
      Width = 88
      Height = 13
      Caption = 'Linha de Comando'
    end
    object BtnGitInit: TButton
      Left = 16
      Top = 52
      Width = 100
      Height = 41
      Caption = 'Git Init'
      TabOrder = 0
      OnClick = BtnGitInitClick
    end
    object BtnStatus: TButton
      Left = 121
      Top = 52
      Width = 100
      Height = 41
      Caption = 'Git Status'
      TabOrder = 1
      OnClick = BtnStatusClick
    end
    object Edit1: TEdit
      Left = 16
      Top = 25
      Width = 510
      Height = 21
      TabOrder = 2
    end
    object Button5: TButton
      Left = 544
      Top = 18
      Width = 75
      Height = 28
      Caption = 'Executar'
      TabOrder = 3
      OnClick = Button5Click
    end
    object BtnAdd: TButton
      Left = 228
      Top = 52
      Width = 100
      Height = 41
      Caption = 'Git Add -A'
      TabOrder = 4
      OnClick = BtnAddClick
    end
    object BtnLog: TButton
      Left = 334
      Top = 52
      Width = 100
      Height = 41
      Caption = 'Git Log'
      TabOrder = 5
      OnClick = BtnLogClick
    end
    object BtnCommit: TButton
      Left = 440
      Top = 52
      Width = 100
      Height = 41
      Caption = 'Commit'
      TabOrder = 6
      OnClick = BtnCommitClick
    end
    object BtnPush: TButton
      Left = 546
      Top = 52
      Width = 100
      Height = 41
      Caption = 'Git Push'
      TabOrder = 7
      OnClick = BtnPushClick
    end
    object BtnFetch: TButton
      Left = 652
      Top = 52
      Width = 100
      Height = 41
      Caption = 'Git Fetch'
      TabOrder = 8
      OnClick = BtnFetchClick
    end
    object BtnPull: TButton
      Left = 758
      Top = 52
      Width = 100
      Height = 41
      Caption = 'Git Pull'
      TabOrder = 9
      OnClick = BtnPullClick
    end
  end
  object DosCommand1: TDosCommand
    InputToOutput = False
    MaxTimeAfterBeginning = 0
    MaxTimeAfterLastOutput = 1000
    OnNewLine = DosCommand1NewLine
    OnTerminated = DosCommand1Terminated
    Left = 32
    Top = 24
  end
end
