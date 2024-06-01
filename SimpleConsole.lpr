program SimpleConsole;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

type

  { TSimpleConsole }

  TSimpleConsole = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

{ TSimpleConsole }

procedure TSimpleConsole.DoRun;
var
  ErrorMsg: String;
begin
  // quick check parameters
  ErrorMsg:=CheckOptions('h', 'help');
  if ErrorMsg<>'' then begin
    ShowException(Exception.Create(ErrorMsg));
    Terminate;
    Exit;
  end;

  // parse parameters
  if HasOption('h', 'help') then begin
    WriteHelp;
    Terminate;
    Exit;
  end;

  { add your program here }
  WriteLn(FormatDateTime('MM-dd-YY hh:nn:ss.zzzz', Now) + '| Starting app...');
  while True do
  begin
    Randomize;
    Sleep(1000);
    WriteLn(IntToStr(Random(1000)));
  end;

  // stop program loop
  Terminate;
end;

constructor TSimpleConsole.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor TSimpleConsole.Destroy;
begin
  inherited Destroy;
end;

procedure TSimpleConsole.WriteHelp;
begin
  { add your help code here }
  writeln('Usage: ', ExeName, ' -h');
end;

var
  Application: TSimpleConsole;
begin
  Application:=TSimpleConsole.Create(nil);
  Application.Title:='Simple Console';
  Application.Run;
  Application.Free;
end.

