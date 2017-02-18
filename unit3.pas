unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, Unit1;

type

  { TForm3 }

  TForm3 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
   // procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;
  highscoresList : Unit1.a_highscores;
  fieldState : Unit1.a_container;
  score : Unit1.r_highscore;
  saveFile: File of Unit1.r_highscore;


procedure saveHighscore();

implementation
{$R *.lfm}

{ TForm3 }
procedure swap(left, right:Integer);
var tempScore : Unit1.r_highscore;
begin
  tempScore := highscoresList[left];
  highscoresList[left]:= highscoresList[right];
  highscoresList[right] := tempScore;
end;



procedure sortList(left, right:Integer);
var i, pivot, fLeft, fRight : Integer;
  comparison : Unit1.r_highscore;
begin
  if left < right then
begin
  pivot := (left + right)div 2;
  comparison := highscoresList[pivot];
  fLeft := left;
  fRight := right;
  while fLeft <= fRight do
  begin
    while highscoresList[fLeft].points < comparison.points do
    fLeft := fLeft + 1;
    while highscoresList[fRight].points > comparison.points do
    fRight := fRight - 1;
    if fLeft <= fRight then
      begin
        swap(fLeft,fRight);
        fLeft := fLeft + 1;
        fRight := fRight - 1;
      end;
  end;
  sortList(left,fRight);
  sortList(fLeft,right);
end;

end;

procedure saveHighscore();
var i : Integer;
begin
 sortList(1,10);
 Rewrite(saveFile);

  try
    for i := 1 to 10 do
      Write(saveFile, highscoresList[i]);
 finally
   CloseFile(saveFile);
 end;
 Reset(saveFile);
  Seek(saveFile,0);

  Form3.Label1.Caption :=  highscoresList[10].name;
  Form3.Label2.Caption :=  IntToStr(highscoresList[10].points);
  Form3.Label3.Caption :=  highscoresList[9].name;
  Form3.Label4.Caption :=  IntToStr(highscoresList[9].points);
  Form3.Label5.Caption :=  highscoresList[8].name;
  Form3.Label6.Caption :=  IntToStr(highscoresList[8].points);
  Form3.Label7.Caption :=  highscoresList[7].name;
  Form3.Label8.Caption :=  IntToStr(highscoresList[7].points);
  Form3.Label9.Caption :=  highscoresList[6].name;
  Form3.Label10.Caption :=  IntToStr(highscoresList[6].points);
  Form3.Label11.Caption :=  highscoresList[5].name;
  Form3.Label12.Caption :=  IntToStr(highscoresList[5].points);
  Form3.Label13.Caption :=  highscoresList[4].name;
  Form3.Label14.Caption :=  IntToStr(highscoresList[4].points);
  Form3.Label15.Caption :=  highscoresList[3].name;
  Form3.Label16.Caption :=  IntToStr(highscoresList[3].points);
  Form3.Label17.Caption :=  highscoresList[2].name;
  Form3.Label18.Caption :=  IntToStr(highscoresList[2].points);
  Form3.Label19.Caption :=  highscoresList[1].name;
  Form3.Label20.Caption :=  IntToStr(highscoresList[1].points);

end;

procedure TForm3.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  AssignFile(saveFile,'highscore.dat');
  Reset(saveFile);
  Seek(saveFile,0);

  try
    i := 1;
    while not EOF(saveFile) do
    begin
      Read(saveFile, score);
      highscoresList[i] := score;
      Inc(i);
    end;
  finally
   CloseFile(saveFile);
  end;

  Label1.Caption :=  highscoresList[10].name;
  Label2.Caption :=  IntToStr(highscoresList[10].points);
  Label3.Caption :=  highscoresList[9].name;
  Label4.Caption :=  IntToStr(highscoresList[9].points);
  Label5.Caption :=  highscoresList[8].name;
  Label6.Caption :=  IntToStr(highscoresList[8].points);
  Label7.Caption :=  highscoresList[7].name;
  Label8.Caption :=  IntToStr(highscoresList[7].points);
  Label9.Caption :=  highscoresList[6].name;
  Label10.Caption :=  IntToStr(highscoresList[6].points);
  Label11.Caption :=  highscoresList[5].name;
  Label12.Caption :=  IntToStr(highscoresList[5].points);
  Label13.Caption :=  highscoresList[4].name;
  Label14.Caption :=  IntToStr(highscoresList[4].points);
  Label15.Caption :=  highscoresList[3].name;
  Label16.Caption :=  IntToStr(highscoresList[3].points);
  Label17.Caption :=  highscoresList[2].name;
  Label18.Caption :=  IntToStr(highscoresList[2].points);
  Label19.Caption :=  highscoresList[1].name;
  Label20.Caption :=  IntToStr(highscoresList[1].points);

  Unit1.lowestScore := highscoresList[1].points;
  Unit1.highscore := highscoresList[10].points;
 end;

procedure TForm3.Label1Click(Sender: TObject);
begin

end;

procedure TForm3.Label2Click(Sender: TObject);
begin

end;

procedure TForm3.Label3Click(Sender: TObject);
begin

end;


procedure TForm3.BitBtn1Click(Sender: TObject);
var i :Integer;
begin
  for i := 1 to 10 do begin
   highscoresList[i].points := Unit1.points;
   highscoresList[i].name := Unit1.name;
  end;
 Rewrite(saveFile);

  try
    for i := 1 to 10 do
      Write(saveFile, highscoresList[i]);
 finally
   CloseFile(saveFile);
 end;

 Label1.Caption :=  highscoresList[10].name;
  Label2.Caption :=  IntToStr(highscoresList[10].points);
  Label3.Caption :=  highscoresList[9].name;
  Label4.Caption :=  IntToStr(highscoresList[9].points);
  Label5.Caption :=  highscoresList[8].name;
  Label6.Caption :=  IntToStr(highscoresList[8].points);
  Label7.Caption :=  highscoresList[7].name;
  Label8.Caption :=  IntToStr(highscoresList[7].points);
  Label9.Caption :=  highscoresList[6].name;
  Label10.Caption :=  IntToStr(highscoresList[6].points);
  Label11.Caption :=  highscoresList[5].name;
  Label12.Caption :=  IntToStr(highscoresList[5].points);
  Label13.Caption :=  highscoresList[4].name;
  Label14.Caption :=  IntToStr(highscoresList[4].points);
  Label15.Caption :=  highscoresList[3].name;
  Label16.Caption :=  IntToStr(highscoresList[3].points);
  Label17.Caption :=  highscoresList[2].name;
  Label18.Caption :=  IntToStr(highscoresList[2].points);
  Label19.Caption :=  highscoresList[1].name;
  Label20.Caption :=  IntToStr(highscoresList[1].points);

end;


end.

