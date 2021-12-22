---------------------------------------------------------------------
-- Euler29 ~ Distinct powers
--
-- Problem Statement:
--
-- Consider all integer combinations of a^b for 2 <= a <= 5 and
-- 2 <= b <= 5:
--
--      2^2 = 4,  2^3 = 8,    2^4 = 16,  2^5 = 32
--      3^2 = 9,  3^3 = 27,   3^4 = 81,  3^5 = 243
--      4^2 = 16  4^3 = 64,   4^4 = 256, 4^5 = 1024
--      5^2 = 25, 5^3 = 125,  5^4 = 625, 5^5 = 3125
--
-- If they are then placed in numerical order, with any repeats
-- removed, we get the following sequence of 15 distinct terms:
--
-- 4, 8, 9, 16, 25, 27, 32, 64, 81, 125, 243, 256, 625, 1024, 3125
--
-- How many distinct terms are in the sequence generated by
-- a^b for 2 <= a <= 100 and 2 <= b <= 100?
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
--
-- Big_Numbers library is used to calculate large values of the
-- exponents before converting to strings for comparison and storage.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;
with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Euler29 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;

   rop : Big_Integer;
   bigA : Big_Integer := To_Big_Integer(2);
   b : Natural := 2;
   numbers : array (0..9999) of Big_Integer;
   num : Unbounded_String;
   found : Boolean := false;

begin
   start_time := Ada.Real_Time.Clock;

   numbers := (others => To_Big_Integer(0));
   
   for a in 2..100 loop
      for b in 2..100 loop
         bigA := To_Big_Integer(a);
         rop := bigA ** b;
         for i in 0..solution loop
            if numbers(i) = rop then
               found := TRUE;
               EXIT;
            end if;
         end loop;
         
         if found = FALSE then
            solution := solution + 1;
            numbers(solution) := rop;
         end if;
         found := FALSE;
      end loop;
   end loop;

   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler29;
