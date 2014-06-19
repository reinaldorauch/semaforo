program sinaleiro;

uses
  Vcl.Forms,
  Princ in '..\src\Princ.pas' {FmPrinc},
  unClassSemaforo in '..\src\unClassSemaforo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFmPrinc, FmPrinc);
  Application.Run;
end.
