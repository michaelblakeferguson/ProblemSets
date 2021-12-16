---------------------------------------------------------------------
-- Euler30 ~ Digit fifth powers
--
-- Problem Statement:
--
-- Surprisingly there are only three numbers that can be written as
-- the sum of fourth powers of their digits:
--
--		1634 = 1^4 + 6^4 + 3^4 + 4^4
--		8208 = 8^4 + 2^4 + 0^4 + 8^4
--		9474 = 9^4 + 4^4 + 7^4 + 4^4
--
-- As 1 = 1^4 is not a sum it is not included.
--
-- The sum of these numbers is 1634 + 8208 + 9474 = 19316
--
-- Find the sum of all the numbers that can be written as the sum
-- of fifth powers of their digits.
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
--
-- Loops up to 1 million checking if the number is a sum of fifth
-- powers by using modulo 10 to extract each digit and raise to
-- the fifth power, then adding its sum to solution if it passes.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

procedure Euler30 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;

   sum, size, digit, num, i : integer;

begin
   start_time := Ada.Real_Time.Clock;

   for n in 2..1000000 loop
      num := n;
      size := Integer(Float'Truncation((Log(Float(num),10.0)))) + 1;
      
      for i in 0..size loop
         digit := num mod 10;
         sum := sum + digit**5;
         num := num / 10;
      end loop;
      
      if sum = n then
         solution := solution + sum;
      end if;
      sum := 0;
   end loop;

   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler30;
