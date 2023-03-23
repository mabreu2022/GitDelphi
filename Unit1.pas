unit Unit1;

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
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function OpenGitBashInPanel(APanel: TPanel): Boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
OpenGitBashInPanel(Panel1);

end;

function TForm1.OpenGitBashInPanel(APanel: TPanel): Boolean;
var
  CommandLine: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  SecurityAttr: TSecurityAttributes;
  ReadPipe, WritePipe: THandle;
  Buffer: array[0..255] of AnsiChar;
  BytesRead: DWORD;
begin
  // Define o comando para abrir o Git Bash
  CommandLine := 'C:\Program Files\Git\bin\bash.exe';

  // Cria um pipe para redirecionar a saída do processo
  SecurityAttr.nLength := SizeOf(TSecurityAttributes);
  SecurityAttr.bInheritHandle := True;
  SecurityAttr.lpSecurityDescriptor := nil;
  if not CreatePipe(ReadPipe, WritePipe, @SecurityAttr, 0) then
  begin
    ShowMessage('Erro ao criar o pipe: ' + SysErrorMessage(GetLastError));
    Exit(False);
  end;

  // Define as propriedades do processo
  ZeroMemory(@StartupInfo, SizeOf(TStartupInfo));
  StartupInfo.cb := SizeOf(TStartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
  StartupInfo.wShowWindow := SW_HIDE;
  StartupInfo.hStdInput := GetStdHandle(STD_INPUT_HANDLE);
  StartupInfo.hStdOutput := WritePipe;
  StartupInfo.hStdError := WritePipe;

  // Inicia o processo
  if not CreateProcess(nil, PChar(CommandLine), nil, nil, True, 0, nil, nil, StartupInfo, ProcessInfo) then
  begin
    ShowMessage('Erro ao criar o processo: ' + SysErrorMessage(GetLastError));
    CloseHandle(ReadPipe);
    CloseHandle(WritePipe);
    Exit(False);
  end;

  // Lê a saída do processo e exibe no TPanel
  while True do
  begin
    if not ReadFile(ReadPipe, Buffer, SizeOf(Buffer), BytesRead, nil) or (BytesRead = 0) then
      Break;
    APanel.Caption := APanel.Caption + string(Buffer);
    Application.ProcessMessages; // permite que o aplicativo responda enquanto lê a saída do processo
  end;

  // Espera o processo terminar
  if WaitForSingleObject(ProcessInfo.hProcess, INFINITE) <> WAIT_OBJECT_0 then
  begin
    ShowMessage('Erro ao esperar o processo terminar: ' + SysErrorMessage(GetLastError));
  end;

  // Fecha os handles
  CloseHandle(ProcessInfo.hProcess);
  CloseHandle(ProcessInfo.hThread);
  CloseHandle(ReadPipe);
  CloseHandle(WritePipe);

  Result := True;

end;

end.
