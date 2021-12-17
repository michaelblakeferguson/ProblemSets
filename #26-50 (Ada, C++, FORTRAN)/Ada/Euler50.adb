---------------------------------------------------------------------
-- Euler50 ~ Consecutive prime sum
--
-- Problem Statement:
--
-- The prime 41, can be written as the sum of six consecutive primes:
--
--		41 = 2 + 3 + 5 + 7 + 11 + 13
--
-- This is the longest sum of consecutive primes that adds to a
-- prime below one-hundred.
--
-- The longest sum of consecutive primes below one-thousand that adds
-- to a prime, contains 21 terms, and is equal to 953.
--
-- Which prime, below one-million, can be written as the sum of the
-- most consecutive primes?
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
--
-- Iterates upwards checking for primality and adding to sum. Once
-- the sum becomes greater than 1 million the loop ends. This problem
-- is straightforward, with one caveat: the consecutive primes do not
-- need to start at 2. By increasing the starting prime from 2 to 3,
-- we get a different result, and as it turns out, the greatest sum
-- is reached by starting at 7.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;
with Ada.Numerics.Elementary_Functions;
use  Ada.Numerics.Elementary_Functions;

procedure Euler50 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;

   p : Boolean := false;
   i : integer := 7;
   sum : integer := 0;
   
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

   while sum <= 1000000 loop
      if (isPrime(i)) then   
          sum := sum + i;
          if (isPrime(sum)) then
             if (sum > solution) then
                solution := sum;
             end if;
          end if;
      end if;
      i := i + 1;
   end loop;

   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler50;
