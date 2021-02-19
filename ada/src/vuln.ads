with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Assertions;
with GNAT.Exception_Actions;
with Ada.Exceptions;

procedure Fuzzing_Example is
   Input : Unbounded_String;
   Fd : File_Type;
   Filename : aliased String := Ada.Command_Line.Argument(1);
   procedure Check_Secret (Password : Unbounded_String) is
     Fuzz : Unbounded_String;
   begin
     Fuzz := To_Unbounded_String("fuzz");
     if Fuzz = Input then
        Put_Line ("Fuzz Found!");
        raise Ada.Assertions.Assertion_Error;
     else
        Put_Line ("Not Found!");
     end if;
   end Check_Secret;
begin

  Open (File => Fd,
        Mode => In_File,
        Name => Filename);
  Input := To_Unbounded_String(Get_Line (FD));
  Check_Secret(Input);

exception
  when Occurence : others  =>
     GNAT.Exception_Actions.Core_Dump (Occurence);
end Fuzzing_Example;

