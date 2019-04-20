unit Pattern.State;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
    TContext = class;

    { IState }

    IState = interface
    ['{D992C938-03C4-4E98-9547-BACE52AB36DD}']
    function Next(c:TContext):Integer;
    function Prev(c:TContext):Integer;
    function GetName:string;
    end;

    { TRunState }

    TRunState = class(TInterfacedObject,IState)
    public
    constructor Create;
    destructor Destroy; override;
    function Next(c:TContext):Integer;
    function Prev(c:TContext):Integer;
    function GetName:string;
    end;

    { THoldState }

    THoldState = class(TInterfacedObject,IState)
    public
    constructor Create;
    destructor Destroy; override;
    function Next(c:TContext):Integer;
    function Prev(c:TContext):Integer;
    function GetName:string;
    end;

    { TStopState }

    TStopState = class(TInterfacedObject,IState)
    public
    constructor Create;
    destructor Destroy; override;
    function Next(c:TContext):Integer;
    function Prev(c:TContext):Integer;
    function GetName:string;
    end;

    {TContext}
    TContext = class
             private
             FLimit:Integer;
             FCount:Integer;
      public
      FState:IState;
      constructor Create;
      function ChangeState:IState;
      function CurrentState:string;
      end;

implementation

{ TContext }

constructor TContext.Create;
begin
  FLimit:=5;
  FCount := 0;
  FState := TStopState.Create;
end;

function TContext.ChangeState: IState;
var
  LState:IState;
begin
  if FCount < FLimit then begin
   FState.Next(Self);
     end  else
  begin
   FState.Prev(Self);
   FCount:=0;
  end;
     Inc(FCount);
  Result := FState;
end;

function TContext.CurrentState: string;
begin
  if FState = nil then
     Result := ''; exit;

  Result := FState.GetName;
end;

constructor THoldState.Create;
begin
  inherited Create;
end;

destructor THoldState.Destroy;
begin
  inherited Destroy;
end;

{ THoldState }
function THoldState.Next(c: TContext): Integer;
begin
  c.FState := TStopState.Create;
end;

function THoldState.Prev(c: TContext): Integer;
begin
     c.FState := TRunState.Create;
end;

function THoldState.GetName: string;
begin
  Result := 'HOLD';
end;

{ TStopState }

constructor TStopState.Create;
begin
       inherited Create;
end;

destructor TStopState.Destroy;
begin
  inherited Destroy;
end;

function TStopState.Next(c: TContext): Integer;
begin
   c.FState := TRUNState.Create;
end;

function TStopState.Prev(c: TContext): Integer;
begin
     c.FState := THoldState.Create;
end;

function TStopState.GetName: string;
begin
  Result := 'STOP';
end;

{ TRunState }

constructor TRunState.Create;
begin
    inherited Create;
end;

destructor TRunState.Destroy;
begin
  inherited Destroy;
end;

function TRunState.Next(c: TContext): Integer;
begin
     c.FState := THoldState.Create;
end;

function TRunState.Prev(c: TContext): Integer;
begin
     c.FState := TStopState.Create;
end;

function TRunState.GetName: string;
begin
     Result := 'RUN';
end;

end.

