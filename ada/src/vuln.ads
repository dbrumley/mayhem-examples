-- This is a simplified ADA example.  
-- Ada supports afl++. This is an example to check binary-only.
-- See https://blog.adacore.com/running-american-fuzzy-lop-on-your-ada-code
-- https://blog.adacore.com/advanced-fuzz-testing-with-aflplusplus-3-00
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Assertions;
with GNAT.Exception_Actions;
with Ada.Exceptions;
with Ada.Command_Line;
pragma Warnings (Off);
procedure Fuzzing_Example is
   procedure Expose_Secrets_On_Correct_Password (Password : access String);
   procedure Expose_Secrets_On_Correct_Password (Password : access String) is
      Privileged : Integer := 0;
   begin
      if Password.all = "fuzz" then
	raise Ada.Assertions.Assertion_Error; 
      else 
	Put_Line ("Shhhh... the answer to life the universe and everything is 42");

      end if;
   end Expose_Secrets_On_Correct_Password;
   Entered_Password : aliased String := Ada.Command_Line.Argument (1);
begin
   Expose_Secrets_On_Correct_Password (Password => Entered_Password'Access);
exception
  when Occurence : others  =>
     Put_Line ("exception occured [" & Ada.Exceptions.Exception_Name (Occurence)
               & "] [" & Ada.Exceptions.Exception_Message (Occurence)
               & "] [" & Ada.Exceptions.Exception_Information (Occurence) & "]");
     GNAT.Exception_Actions.Core_Dump (Occurence);

end Fuzzing_Example;
