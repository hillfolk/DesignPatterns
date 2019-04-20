program StateSample;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes,
  Pattern.State;
  var
    i:Integer;
    LContext:TContext;
begin
     LContext = TContext.Create;

     for i = 0;i < 100;i++ do
     begin
       LContext.;
     end;


end.

