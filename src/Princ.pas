unit Princ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  unClassSemaforo, Vcl.StdCtrls;

type
  TFmPrinc = class(TForm)
    CbAlerta: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CbAlertaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmPrinc: TFmPrinc;
  ListSemaforo: Array of TSemaforo;

implementation

{$R *.dfm}

procedure TFmPrinc.CbAlertaClick(Sender: TObject);
begin
  ListSemaforo[0].Alerta := CbAlerta.Checked;
end;

procedure TFmPrinc.FormCreate(Sender: TObject);
begin
  SetLength(ListSemaforo, 3);

  ListSemaforo[0] := TSemaforo.Create(10, 50, 50, Self);
  ListSemaforo[1] := TSemaforo.Create(200, 50, 50, Self);
  ListSemaforo[2] := TSemaforo.Create(400, 50, 50, Self);

  ListSemaforo[0].Proximo := ListSemaforo[1];
  ListSemaforo[1].Proximo := ListSemaforo[2];
  ListSemaforo[2].Proximo := ListSemaforo[0];
end;

end.