---------------------------------------------------------------------
-- Euler34 ~ Digit factorials
-- 
-- Problem Statement:
-- 
-- 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
-- 
-- Find the sum of all numbers which are equal to the sum of the
-- factorial of their digits.
-- 
-- Note: As 1! = 1 and 2! = 2 are not sums they are not included.
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- Uses modulo to extract digits then calculates the factorial for
-- each and summing together. If the sum equals the full number it
-- is added to the total sum.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;

procedure Euler28 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;

   cur_sum, digit, f, j, k : integer;

begin
   start_time := Ada.Real_Time.Clock;

   for i in 3..10000000 loop
      j := i;
      cur_sum := 0;
      while True loop
         f := 1;
         digit := j mod 10;
         k := digit;
         while (k > 0) loop
            f := f * k;
            k := k - 1;
         end loop;
         cur_sum := cur_sum + f;
         if j < 10 then
            exit;
         end if;
         j := j / 10;
      end loop;
      if cur_sum = i then
         solution := solution + cur_sum;
      end if;
   end loop;

   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler28;
