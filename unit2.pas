unit Unit2;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ComCtrls, Unit1,Unit3;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    TrackBar1: TTrackBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure LabeledEdit2Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;
  rowsCols : Integer;



implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin
  Unit1.win := StrToInt(LabeledEdit1.Text);
  Unit1.name := LabeledEdit2.Text;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Form3.ShowModal;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  LabeledEdit1.Text := IntToStr(Unit1.win);
  LabeledEdit2.Text := Unit1.name;
end;

procedure TForm2.Label1Click(Sender: TObject);
begin

end;

procedure TForm2.LabeledEdit2Change(Sender: TObject);
begin

end;

procedure TForm2.TrackBar1Change(Sender: TObject);
begin
     rowsCols := TrackBar1.Position;
     if ( rowsCols >= 3) and (rowsCols <= 8) then begin
     Unit1.arrSize := rowsCols;
     Unit1.resetGame();
  end;
end;

end.

