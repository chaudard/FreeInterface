program FreeInterface;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  UClass in 'UClass.pas',
  UInterface in 'UInterface.pas';

var
  inti: MyInterface;
  intj: MyInterface;
  int: integer;
begin
  ReportMemoryLeaksOnShutdown := true;
  try
    inti := TMyClass.create(1);
    intj := TMyClass.create(2);
    int := inti.getMyAttr;
    writeln(format('i = %d', [int]));
    int := intj.getMyAttr;
    writeln(format('j = %d', [int]));
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
