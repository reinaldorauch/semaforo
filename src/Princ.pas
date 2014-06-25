unit Princ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  unClassSemaforo, Vcl.StdCtrls;

type
  TFmPrinc = class(TForm)
    CbAlerta: TCheckBox;
    EdChange: TEdit;
    CbSelect: TComboBox;
    BtnSetName: TButton;
    CbAlerta2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CbAlertaClick(Sender: TObject);
    procedure BtnSetNameClick(Sender: TObject);
    procedure CbAlerta2Click(Sender: TObject);

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

procedure TFmPrinc.BtnSetNameClick(Sender: TObject);
begin
  if(Assigned(ListSemaforo[CbSelect.ItemIndex])) then
    ListSemaforo[CbSelect.ItemIndex].NomeRua := EdChange.Text;
end;

procedure TFmPrinc.CbAlerta2Click(Sender: TObject);
begin
  ListSemaforo[4].Alerta := CbAlerta2.Checked;
end;

procedure TFmPrinc.CbAlertaClick(Sender: TObject);
begin
  ListSemaforo[0].Alerta := CbAlerta.Checked;
end;

procedure TFmPrinc.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  SetLength(ListSemaforo, 8);

  ListSemaforo[0] := TSemaforo.Create(10, 50, 50, 'Rua A', 1, Self);
  ListSemaforo[1] := TSemaforo.Create(200, 50, 50, 'Avenida Vicente Machado', 2, Self);
  ListSemaforo[2] := TSemaforo.Create(510, 50, 50, 'Av. Cel. Carlos Cavalcanti', 3, Self);
  ListSemaforo[3] := TSemaforo.Create(700, 50, 50, 'Av. Dom Geraldo Pelana', 4, Self);

  ListSemaforo[4] := TSemaforo.Create(10, 450, 25, 'AOEUHEUH', 1, Self);
  ListSemaforo[5] := TSemaforo.Create(200, 450, 25, 'HOHOHOHOHOOHO', 4, Self);
  ListSemaforo[6] := TSemaforo.Create(510, 450, 25, 'HUAEHUEHUEHUE', 3, Self);
  ListSemaforo[7] := TSemaforo.Create(700, 450, 25, 'LOLOLOL', 2, Self);


  ListSemaforo[0].Proximo := ListSemaforo[1];
  ListSemaforo[1].Proximo := ListSemaforo[2];
  ListSemaforo[2].Proximo := ListSemaforo[3];
  ListSemaforo[3].Proximo := ListSemaforo[0];

  ListSemaforo[4].Proximo := ListSemaforo[5];
  ListSemaforo[5].Proximo := ListSemaforo[6];
  ListSemaforo[6].Proximo := ListSemaforo[7];
  ListSemaforo[7].Proximo := ListSemaforo[4];

  for I := 0 to Length(ListSemaforo) - 1 do
    CbSelect.Items.Add(IntToStr(i + 1));
end;

end.
