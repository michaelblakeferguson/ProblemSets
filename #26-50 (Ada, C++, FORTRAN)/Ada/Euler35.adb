---------------------------------------------------------------------
-- Euler35 ~ Circular primes
-- 
-- Problem Statement:
-- 
-- The number, 197, is called a circular prime because all rotations
-- of the digits: 197, 971, and 719, are themselves prime.
-- 
-- There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17,
-- 31, 37, 71, 73, 79, and 97.
-- 
-- How many circular primes are there below one million?
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- Loops up to 1 million, checking if the number is prime. Rotate()
-- is then called depending on the length of the number and each
-- cycle is checked for primality. If all of the rotations pass then
-- the total is incremented.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;
with Ada.Numerics.Elementary_Functions;
use  Ada.Numerics.Elementary_Functions;

procedure Euler35 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;
   
   function rotate(rIn : integer; d : integer) return integer
   is
      digit : array (0..d) of integer;
      x : integer;
      r : integer := rIn;
   begin   
      for i in 0..(d-2) loop
         digit(d-2-i) := r mod 10;
         r := r / 10;
      end loop;
      digit(d-1) := r;
      
      r := 0;
      x := d;
      while x > 0 loop
         r := r * 10 + digit(d-x);
         x := x - 1;
      end loop;
      
      return r;
   end rotate;
   
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
   
   allPrime : boolean := TRUE;
   j : integer;
   numDigits : integer := 0;

begin
   start_time := Ada.Real_Time.Clock;
   
   for i in 2..999999 loop
      
      if (isPrime(i)) then
         
         j := i;
         numDigits := 1;
         while j > 10 loop
            numDigits := numDigits + 1;
            j := j / 10;
         end loop;
         
         j := i;
         for k in 0..(numDigits-1) loop
            j := rotate(j, numDigits);
            if not(isPrime(j)) then
               allPrime := FALSE;
               EXIT;
            end if;
         end loop;
         if allPrime then
            solution := solution + 1;
         end if;
         allPrime := TRUE;
      end if;
   end loop;
   

   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler35;
