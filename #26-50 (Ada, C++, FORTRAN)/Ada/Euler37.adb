---------------------------------------------------------------------
-- Euler37 ~ Truncatable primes
-- 
-- Problem Statement:
-- 
-- The number 3797 has an interesting property. Being prime itself,
-- it is possible to continuously remove digits from left to right,
-- and remain prime at each stage: 3797, 797, 97, and 7. Similarly
-- we can work from right to left: 3797, 379, 37, and 3.
-- 
-- Find the sum of the only eleven primes that are both truncatable
-- from left to right and right to left.
-- 
-- NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- Iterates upwards checking if the number truncates from the left
-- and right side while maintaining primality. Uses recursion to
-- accept arbitrary length integers. When found the integers are
-- added to the solution.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Numerics.Elementary_Functions;
use  Ada.Numerics.Elementary_Functions;

procedure Euler37 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;

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

   function truncatableLeft(numIn : integer) return boolean
   is
      s1 : Unbounded_String;
      num : integer := numIn;
   begin
      if(isPrime(num)) then
         s1 := Trim(To_Unbounded_String(num'Image), Ada.Strings.Left);
         if (Length(s1) > 2) then
            s1 := Trim(To_Unbounded_String(Slice(s1,2,Length(s1))), Ada.Strings.Left);
         else
            s1 := Trim(To_Unbounded_String(Slice(s1,2,2)), Ada.Strings.Left);
         end if;
         num := Integer'Value(To_String(s1));

         if num > 10 then
            return truncatableLeft(num);
         else
            if isPrime(num) then
               return TRUE;
            end if;
         end if;
      end if;
      return FALSE;
   end truncatableLeft;

   function truncatableRight(numIn : integer) return boolean
   is
      s1 : Unbounded_String;
      num : integer := numIn;
   begin
      if(isPrime(num)) then
         s1 := Trim(To_Unbounded_String(num'Image), Ada.Strings.Left);

         if (Length(s1) > 2) then
            s1 := Trim(To_Unbounded_String(Slice(s1,1,Length(s1)-1)), Ada.Strings.Left);
         else
            s1 := Trim(To_Unbounded_String(Slice(s1,1,1)), Ada.Strings.Left);
         end if;
         num := Integer'Value(To_String(s1));

         if num > 10 then
            return truncatableRight(num);
         else
            if isPrime(num) then
               return TRUE;
            end if;
         end if;
      end if;
      return FALSE;
   end truncatableRight;

   i : integer := 10;
   primes : integer := 0;

begin
   start_time := Ada.Real_Time.Clock;

   while primes < 11 loop
      if truncatableLeft(i) then
         if truncatableRight(i) then
            primes := primes + 1;
            solution := solution + i;
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
end Euler37;
