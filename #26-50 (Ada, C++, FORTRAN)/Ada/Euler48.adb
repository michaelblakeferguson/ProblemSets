--WORK IN PROGRESS!-- (BIG_INTEGER UPPER LIMIT ISSUE)
---------------------------------------------------------------------
-- Euler48 ~ Self powers
-- 
-- Problem Statement:
-- 
-- The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
--
-- Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ...
-- + 1000^1000.
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- Loops through 1 to 1000 adding each rop output to sum.
-- Extract the last 10 digits using substr.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;
with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Euler48 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : Unbounded_String;

   rop : Big_Integer;
   sum : Big_Integer := 0;

begin
   start_time := Ada.Real_Time.Clock;
   
   for i in 1..1000 loop
      rop := To_Big_Integer(i) ** Natural(i);
      sum := sum + rop;
   end loop;
   solution := To_Unbounded_String(sum'Image);


   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler48;
