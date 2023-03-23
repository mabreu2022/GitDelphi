unit Unit4;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  DosCommand,
  Vcl.ExtCtrls;

type
  TForm4 = class(TForm)
    DosCommand1: TDosCommand;
    Panel1: TPanel;
    Memo1: TMemo;
    Memo2: TMemo;
    Panel2: TPanel;
    BtnGitInit: TButton;
    BtnStatus: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Button5: TButton;
    BtnAdd: TButton;
    BtnLog: TButton;
    BtnCommit: TButton;
    BtnPush: TButton;
    BtnFetch: TButton;
    BtnPull: TButton;
    procedure BtnStatusClick(Sender: TObject);
    procedure DosCommand1NewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
    procedure DosCommand1Terminated(Sender: TObject);
    procedure BtnLogClick(Sender: TObject);
    procedure BtnGitInitClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnCommitClick(Sender: TObject);
    procedure BtnPushClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnFetchClick(Sender: TObject);
    procedure BtnPullClick(Sender: TObject);

  private
    { Private declarations }
    function IsGitRepository(const APath: string): Boolean;
  public
    { Public declarations }
  end;
var
  Form4: TForm4;
implementation
{$R *.dfm}
uses System.IOUtils;
procedure TForm4.BtnStatusClick(Sender: TObject);
begin
  DosCommand1.CommandLine := 'cmd /c "cls"';
  DosCommand1.CommandLine := 'cmd /c "git status"';
  DosCommand1.CurrentDir:= 'C:\Fontes\GitBashnopanel';
  Memo1.Lines.Clear;
  DosCommand1.OutputLines := Memo1.Lines;
  BtnStatus.Enabled := False;
  DosCommand1.Execute;
  Memo1.Lines := DosCommand1.Lines;
end;
procedure TForm4.BtnLogClick(Sender: TObject);
begin
  DosCommand1.CommandLine := 'cmd /c "cls"';
  DosCommand1.CommandLine := 'cmd /c "git log"';
  DosCommand1.CurrentDir:= 'C:\Fontes\GitBashnopanel';
  Memo1.Lines.Clear;
  DosCommand1.OutputLines := Memo1.Lines;
  BtnLog.Enabled := False;
  DosCommand1.Execute;
  Memo1.Lines := DosCommand1.Lines;

end;

procedure TForm4.BtnGitInitClick(Sender: TObject);
begin
  DosCommand1.CommandLine := 'cmd /c "cls"';
  DosCommand1.CommandLine := 'cmd /c "git init"';
  DosCommand1.CurrentDir:= 'C:\Fontes\GitBashnopanel';
  Memo1.Lines.Clear;
  DosCommand1.OutputLines := Memo1.Lines;
   BtnGitInit.Enabled := False;
  DosCommand1.Execute;
  Memo1.Lines := DosCommand1.Lines;
end;

procedure TForm4.BtnCommitClick(Sender: TObject);
begin
  DosCommand1.CommandLine := 'cmd /c "cls"';
  DosCommand1.CommandLine := 'cmd /c git commit -am ' + QuotedStr(Memo2.Lines.Text);
  DosCommand1.CurrentDir:= 'C:\Fontes\GitBashnopanel';
  Memo1.Lines.Clear;
  DosCommand1.OutputLines := Memo1.Lines;
  BtnCommit.Enabled := False;
  DosCommand1.Execute;
  Memo1.Lines := DosCommand1.Lines;
end;

procedure TForm4.BtnFetchClick(Sender: TObject);
begin
  DosCommand1.CommandLine := 'cmd /c "cls"';
  DosCommand1.CommandLine := 'cmd /c "git fetch --all"';
  DosCommand1.CurrentDir:= 'C:\Fontes\GitBashnopanel';
  Memo1.Lines.Clear;
  DosCommand1.OutputLines := Memo1.Lines;
  BtnFetch.Enabled := False;
  DosCommand1.Execute;
  Memo1.Lines := DosCommand1.Lines;
end;

procedure TForm4.BtnPullClick(Sender: TObject);
begin
  DosCommand1.CommandLine := 'cmd /c "cls"';
  DosCommand1.CommandLine := 'cmd /c git pull';
  DosCommand1.CurrentDir:= 'C:\Fontes\GitBashnopanel';
  Memo1.Lines.Clear;
  DosCommand1.OutputLines := Memo1.Lines;
  BtnPull.Enabled := False;
  DosCommand1.Execute;
  Memo1.Lines := DosCommand1.Lines;
end;

procedure TForm4.Button5Click(Sender: TObject);
begin
  DosCommand1.CommandLine := 'cmd /c "cls"';
  DosCommand1.CommandLine := 'cmd /c git commit -am "Primeiro Commit"';
  DosCommand1.CurrentDir:= 'C:\Fontes\GitBashnopanel';
  Memo1.Lines.Clear;
  DosCommand1.OutputLines := Memo1.Lines;
  BtnCommit.Enabled := False;
  DosCommand1.Execute;
  Memo1.Lines := DosCommand1.Lines;
end;

procedure TForm4.BtnAddClick(Sender: TObject);
begin
  DosCommand1.CommandLine := 'cmd /c "cls"';
  DosCommand1.CommandLine := 'cmd /c "git add -A"';
  DosCommand1.CurrentDir:= 'C:\Fontes\GitBashnopanel';
  Memo1.Lines.Clear;
  DosCommand1.OutputLines := Memo1.Lines;
  BtnAdd.Enabled := False;
  DosCommand1.Execute;
  Memo1.Lines := DosCommand1.Lines;
end;

procedure TForm4.BtnPushClick(Sender: TObject);
begin
  DosCommand1.CommandLine := 'cmd /c "cls"';
  DosCommand1.CommandLine := 'cmd /c "git push -u origin master"';
  DosCommand1.CurrentDir:= 'C:\Fontes\GitBashnopanel';
  Memo1.Lines.Clear;
  DosCommand1.OutputLines := Memo1.Lines;
  BtnPush.Enabled := False;
  DosCommand1.Execute;
  Memo1.Lines := DosCommand1.Lines;
end;

procedure TForm4.DosCommand1NewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
begin
  if AOutputType = otEntireLine then
  begin
    Memo1.Lines.Add(ANewLine);
  end;
end;
procedure TForm4.DosCommand1Terminated(Sender: TObject);
begin
  BtnStatus.Enabled := True;
  BtnAdd.Enabled    := True;
  BtnLog.Enabled    := True;
  BtnPull.Enabled   := True;
  BtnFetch.Enabled  := True;
  BtnPush.Enabled   := True;
end;
procedure TForm4.FormShow(Sender: TObject);
begin
  if IsGitRepository('C:\Fontes\GitBashnopanel') then  //Como trocar para o diretorio escolhido?
  begin
    ShowMessage('O repositório Git existe.');
    BtnGitInit.Enabled:= False;
  end
  else
  begin
    ShowMessage('O repositório Git não existe.');
     BtnGitInit.Enabled:= True;
  end;
end;

function TForm4.IsGitRepository(const APath: string): Boolean;
begin
  Result := TDirectory.Exists(TPath.Combine(APath, '.git'));
end;

end.
