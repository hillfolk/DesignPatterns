unit uFacotry;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils;

type
    MessageFactory = class(TObject)
      public
         function   CreateMessage:IMessage
    end;

implementation

end.

