unit unClassSemaforo;

interface
  uses ExtCtrls, Classes, Controls, Graphics, MMSystem;

Type
  TSemaforo = class(TImage)
    private
      // Fields
      FTamLamp: Byte;
      FTimer  : TTimer;
      FAtual  : Byte;
      FAlerta : Boolean;
      FAcende : Boolean;

      procedure Desenha;
      procedure Lampada(Pos: Byte; Liga: Boolean);
      procedure ResetAberto;
      procedure ResetFechado;
      procedure MudaAlerta(Init, Prox: TSemaforo);

      // Eventos
      procedure FTimerTimer (Sender: TObject);
    procedure SetAlerta(const Value: Boolean);
    public
      Proximo: TSemaforo;

      constructor Create(X, Y: Integer; crTamLamp: Byte; AOwner: TComponent);
      destructor Destroy;

      property Alerta: Boolean read FAlerta Write SetAlerta;

  end;

implementation

{ TSemaforo }

constructor TSemaforo.Create(X, Y: Integer; crTamLamp: Byte;
  AOwner: TComponent);
begin
  inherited Create(AOwner);

  Parent := TWinControl(AOwner);

  Left := X;
  Top  := Y;

  FTamLamp := CrTamLamp;
  Width    := 3 * FTamLamp;
  Height   := 6 * FTamLamp;

  FAtual   := 7;
  FAlerta  := True;
  Desenha;

  FTimer := TTimer.Create(AOwner);
  FTimer.Interval := 500;
  FTimer.Enabled  := True;
  FTimer.OnTimer  := FTimerTImer;
end;

procedure TSemaforo.Desenha;
var i: Byte;
begin
  with Canvas do
  begin
    Pen.Color := clBlack;
    Brush.Color := clSilver;

    Rectangle(0, 0, 3 * FTamLamp, 6 * FTamLamp);

    for I := 1 to 13 do
      Lampada(i, False);
  end;
end;

destructor TSemaforo.Destroy;
begin
  FTimer.Free;
  inherited;
end;

procedure TSemaforo.FTimerTimer(Sender: TObject);
begin
  if FAlerta then
    begin
      FAcende := Not FAcende;
      Lampada(7, FAcende);
    end
  else
    begin
      // Incrementando o Atual
      if FAtual = 13 then
        FAtual := 1
      else
        inc(FAtual);

      case FAtual of
        1    : Begin
          Lampada(13, False);
          Lampada(1, True);
          Lampada(6, True);
        End;
        2..7,
        9..13: begin
          if(FAtual = 3) AND (Proximo <> Nil) then
            Proximo.FTimer.Enabled := True;

          Lampada(FAtual - 1, False);
          Lampada(FAtual, True);
        end;
        8    : begin
            FTimer.Enabled := False;
            Lampada(7, False);
            Lampada(8, True);
            Lampada(13, True);
        end;
      end;

    end;
end;

procedure TSemaforo.Lampada(Pos: Byte; Liga: Boolean);
var x, y: Integer;
    cor: TColor;
begin
  case Pos of
    1..6 : begin
      X   := FTamLamp * 2;
      Y   := FTamLamp * (Pos - 1);
      cor := clLime;
    end;
    7    : begin
      X   := FTamLamp;
      Y   := FTamLamp * 5;
      cor := clYellow;
    end;
    8..13: begin
      X   := 0;
      Y   := FTamLamp * (Pos - 8);
      cor := clRed;
    end;
  end;

  if Not Liga then
    cor := clBlack;

  with Canvas do
  begin
    Pen.Color := clBlack;
    Brush.Color := clSilver;
    Rectangle(x, y, x + FTamLamp, y + FTamLamp);

    Brush.Color := cor;
    Ellipse(x, y, x + FTamLamp, y + FTamLamp);
  end;
end;

procedure TSemaforo.MudaAlerta(Init, Prox: TSemaforo);
begin
  if(Init = Prox) OR (Proximo = Nil) then
    with Init do
    begin
      Desenha;
      FTimer.Enabled := False;
      FAcende := False;
      if Not FAlerta then
        ResetAberto
      else
        FAtual := 7;
      FTimer.Enabled := True;
    end
  else
    with Prox do
    begin
      Desenha;
      FTimer.Enabled := False;
      FAcende := False;
      FAlerta := Init.FAlerta;

      if Not FAlerta then
        ResetFechado
      else
        FAtual := 7;

      if Proximo <> Nil then
        MudaAlerta(Init, Proximo);

      FTimer.Enabled := FAlerta;
    end;
end;

procedure TSemaforo.ResetAberto;
begin
  FAtual := 1;
  Lampada(1, True);
  Lampada(6, True);
end;

procedure TSemaforo.ResetFechado;
begin
  FAtual := 8;
  Lampada(8, True);
  Lampada(13, True);
end;

procedure TSemaforo.SetAlerta(const Value: Boolean);
begin
  if Value <> FAlerta then
    begin
      FAlerta := Value;
      MudaAlerta(Self, Proximo);
    end;
end;

end.
