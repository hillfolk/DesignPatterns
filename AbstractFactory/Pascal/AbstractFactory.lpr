program AbstractFactory;

uses uFactory,uMessage, Unit1;

var
  FFactory : TMessageFactory;
begin
  FFactory := TMessageFactory.Create;
  Writeln(FFactory.CreateMessage(emtAck).toMessageString);
  Writeln(FFactory.CreateMessage(emtStatus).toMessageString);
  readln;
end.

