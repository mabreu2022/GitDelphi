
  program DemoListWindowsDir;

uses
  Vcl.Forms,
  Unit4 in 'Unit4.pas' {Form4},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Graphite');
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
