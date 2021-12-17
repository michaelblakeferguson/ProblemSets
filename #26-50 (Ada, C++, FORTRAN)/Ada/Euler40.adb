---------------------------------------------------------------------
-- Euler40 ~ Champernowne's constant
-- 
-- Problem Statement:
-- 
-- An irrational decimal fraction is created by concatenating the
-- positive integers:
-- 
--		0.123456789101112131415161718192021...
-- 
-- It can be seen that the 12th digit of the fractional part is 1.
-- 
-- If dn represents the nth digit of the fractional part, find the
-- value of the following expression.
-- 
--		d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- Iterates up to 1 million appending i to the string champ. When
-- finished, it gets the digits at the specified indexes, casts them
-- to ints and multiplies together into solution.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Euler40 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;
   
   package SU renames Ada.Strings.Unbounded;
   champ : SU.Unbounded_String;
   
   i : integer := 0;
   length : integer := 0;
   
begin
   start_time := Ada.Real_Time.Clock;
   
   while length <= 1000000 loop
      
      i := i + 1;
      Append(champ, Trim(To_Unbounded_String(i'Image), Ada.Strings.Left));
      length := To_String(champ)'Length;
      
   end loop;
   
   solution := Integer'Value (To_String(To_Unbounded_String(Slice(champ,1,1)))) *
               Integer'Value (To_String(To_Unbounded_String(Slice(champ,10,10)))) *
               Integer'Value (To_String(To_Unbounded_String(Slice(champ,100,100)))) *
               Integer'Value (To_String(To_Unbounded_String(Slice(champ,1000,1000)))) *
               Integer'Value (To_String(To_Unbounded_String(Slice(champ,10000,10000)))) *
               Integer'Value (To_String(To_Unbounded_String(Slice(champ,100000,100000)))) *
               Integer'Value (To_String(To_Unbounded_String(Slice(champ,1000000,1000000))));
   
   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler40;
