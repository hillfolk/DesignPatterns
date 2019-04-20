unit Pattern.State;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
    TContext = class;

    IState = interface
    ['{D992C938-03C4-4E98-9547-BACE52AB36DD}']
    function Next(c:TContext):Integer;
    function Prev(c:TContext):Integer;
    function GetName:string;
    end;

    { TRunState }

    TRunState = class(TInterfacedObject,IState)
    public
    function Next(c:TContext):Integer;
    function Prev(c:TContext):Integer;
    function GetName:string;
    end;

    { THoldState }

    THoldState = class(TInterfacedObject,IState)
    public
    function Next(c:TContext):Integer;
    function Prev(c:TContext):Integer;
    function GetName:string;
    end;

    { TStopState }

    TStopState = class(TInterfacedObject,IState)
    public
    function Next(c:TContext):Integer;
    function Prev(c:TContext):Integer;
    function GetName:string;
    end;

    {TContext}
    TContext = class
      public
      FState:IState;
      constructor Create;
      function CurrentState:string;
      end;

implementation

{ TContext }

constructor TContext.Create;
begin
  FState := nil;
end;

function TContext.CurrentState: string;
begin
  if FState = nil then
        Resutl := ''; exit;

  Result := FState.GetName;
end;

{ THoldState }
function THoldState.Next(c: TContext): Integer;
begin
     if c.FState  <> nil then
     FreeAndNil(c.FState);

     c.FState = TStopState.Create;

end;

function THoldState.Prev(c: TContext): Integer;
begin
       if c.FState  <> nil then
     FreeAndNil(c.FState);

     c.FState = TRunState.Create;
end;

function THoldState.GetName: string;
begin
     Result := 'HOLD';
end;

{ TStopState }

function TStopState.Next(c: TContext): Integer;
begin
       if c.FState  <> nil then
     FreeAndNil(c.FState);

     c.FState = TRunState.Create;
end;

function TStopState.Prev(c: TContext): Integer;
begin
       if c.FState  <> nil then
     FreeAndNil(c.FState);

     c.FState = THoldState.Create;
end;

function TStopState.GetName: string;
begin
  Result := 'STOP';
end;

{ TRunState }

function TRunState.Next(c: TContext): Integer;
begin
       if c.FState  <> nil then
     FreeAndNil(c.FState);

     c.FState = THoldState.Create;
end;

function TRunState.Prev(c: TContext): Integer;
begin
       if c.FState  <> nil then
     FreeAndNil(c.FState);

     c.FState = TStopState.Create;
end;

function TRunState.GetName: string;
begin
     Result := 'RUN';
end;

end.

