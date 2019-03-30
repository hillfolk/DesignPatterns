unit uMessage;

{$mode objfpc}{$H+}
interface

uses
  Classes, SysUtils;

type
    EMessageType = (emtAck,emtStatus);

    IMessage = interface
        function ToMessageString:string;
        end;
  type

   { TAckMessage }

   TAckMessage = class(TInterfacedObject, IMessage)
     function ToMessageString:string;
   end;

   { TStatusMessage }

   TStatusMessage = class(TInterfacedObject, IMessage)
        function ToMessageString:string;
   end;

implementation

{ TStatusMessage }

function TStatusMessage.ToMessageString: string;
begin
     Result := 'Status Message';
end;

{ TAckMessage }

function TAckMessage.ToMessageString: string;
begin
     Result := 'Ack Message';
end;

end.

