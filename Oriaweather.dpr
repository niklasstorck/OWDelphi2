program Oriaweather;



uses
  Vcl.Forms,

  // Main in 'Main.pas' {Mainform},
  Main in 'Main.pas'  {Mainform},
  Setup in 'Setup.pas',
  WUnit in 'WUnit.pas',
  InformationScreen in 'InformationScreen.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainform, Mainform);
  Application.Run;
end.
