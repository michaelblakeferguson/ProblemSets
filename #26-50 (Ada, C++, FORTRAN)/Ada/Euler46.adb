---------------------------------------------------------------------
-- Euler46 ~ Goldbach's other conjecture
-- 
-- Problem Statement:
-- 
-- It was proposed by Christian Goldbach that every odd composite
-- number can be written as the sum of a prime and twice a square.
-- 
--		9  =  7 + 2×1^2
--		15 =  7 + 2×2^2
--		21 =  3 + 2×3^2
--		25 =  7 + 2×3^2
--		27 = 19 + 2×2^2
--		33 = 31 + 2×1^2
-- 
-- It turns out that the conjecture was false.
-- 
-- What is the smallest odd composite that cannot be written as the
-- sum of a prime and twice a square?
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- Iterates upwards looking for odd composite numbers. Then the value
-- is tested using two nested for loops, one to find prime values and
-- the other to test twice square values. If no twice squares are
-- found for the prime, the loops break and the solution is set to i.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;
with Ada.Numerics.Elementary_Functions;
use  Ada.Numerics.Elementary_Functions;

procedure Euler46 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;
   
   r : integer;
   i : integer := 1;
   f : boolean := false;
   
   function isPrime (num : Integer) return Boolean
   is
   begin
      for i in 2..Integer(Sqrt(Float(num))) loop
         if ((num mod i) = 0) then
            return FALSE;
         end if;
      end loop;
      return TRUE;
   end isPrime;

begin
   start_time := Ada.Real_Time.Clock;

   while i < 10000 loop
      if (not(isPrime(i))) then
         for j in 2..(i-2) loop
            if (isPrime(j)) then
               r := i - j;
               for k in 1..(r/2) loop
                  if (r = (2*k*k)) then
                     f := true;
                     EXIT;
                  end if;
               end loop;
               if(f) then
                  EXIT;
               end if;
            end if;
         end loop;
         if (not(f)) then
            solution := i;
            EXIT;
         end if;
         f := false;
      end if;
      i := i + 2;
   end loop;

   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler46;
