unit ufactory;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils,uMessage;

type
{ MessageFactory }
TMessageFactory = class(TObject)
public
    function   CreateMessage(AMessageType:EMessageType):IMessage;
end;

implementation


{ TMessageFactory }

function TMessageFactory.CreateMessage(AMessageType: EMessageType): IMessage;
begin
  case AMessageType of
  emtAck:
    begin
      Result := TAckMessage.Create;
    end;
  emtStatus:
    begin
      Result := TStatusMessage.Create;
    end;
  end;
end;

end.

