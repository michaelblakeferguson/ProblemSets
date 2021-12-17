---------------------------------------------------------------------
-- Euler47 ~ Distinct primes factors
-- 
-- Problem Statement:
-- 
-- The first two consecutive numbers to have two distinct prime
-- factors are:
-- 
--		14 = 2 × 7
--		15 = 3 × 5
-- 
-- The first three consecutive numbers to have three distinct prime
-- factors are:
-- 
--		644 = 2^2 × 7 × 23
--		645 = 3   × 5 × 43
--		646 = 2   × 17 × 19.
-- 
-- Find the first four consecutive integers to have four distinct
-- prime factors each. What is the first of these numbers?
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- Iterates upwards getting the factors of each number and checking
-- if there are at least four prime factors. Increments consecutive
-- when found and resets to zero if the next numbers do not contain
-- four prime factors. Once consecutive reaches four the program
-- breaks.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;
with Ada.Numerics.Elementary_Functions;
use  Ada.Numerics.Elementary_Functions;

procedure Euler47 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;

   p : integer := 0;
   consecutive : integer := 0;
   
   function isPrime (num : Integer) return Boolean
   is
   begin
      for i in 2..Integer(Sqrt(Float(num))) loop
         if ((num mod i) = 0) then
            return FALSE;
         end if;
      end loop;
      if (num = 1) then
         return FALSE;
      end if;
      return TRUE;
   end isPrime;

begin
   start_time := Ada.Real_Time.Clock;

   for i in 646..999999 loop
      p := 0;
      for j in 1..(i/2) loop
         if (i mod j = 0) then
            if (isPrime(j)) then
               p := p + 1;
            end if;
         end if;
      end loop;

      if (p >= 4) then
         consecutive := consecutive + 1;
      else
         consecutive := 0;
      end if;

      if (consecutive = 4) then
         solution := i;
         EXIT;
      end if;

   end loop;

   solution := solution - 3; --we want the first of the four consecutive numbers

   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler47;
