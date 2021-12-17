---------------------------------------------------------------------
-- Euler41 ~ Pandigital prime
-- 
-- Problem Statement:
-- 
-- We shall say that an n-digit number is pandigital if it makes use
-- of all the digits 1 to n exactly once. For example, 2143 is a
-- 4-digit pandigital and is also prime.
-- 
-- What is the largest n-digit pandigital prime that exists?
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- Searching from 2143 upwards for pandigital primes and printing to
-- command line gives us the answer after ~40 seconds. Knowing the
-- upper limit of 7 digits, we can then search from 7654321
-- downwards to get the answer within milliseconds.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Numerics.Elementary_Functions;
use  Ada.Numerics.Elementary_Functions;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Euler41 is
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
      return TRUE;
   end isPrime;

   function pandigital (str : Unbounded_String; n : Integer) return Boolean
   is
      zero  : integer := 0;
      one   : integer := 0;
      two   : integer := 0;
      three : integer := 0;
      four  : integer := 0;
      five  : integer := 0;
      six   : integer := 0;
      seven : integer := 0;
   begin
      for i in 1..Length(str) loop
         if(Slice(str,i,i) = "0") then
            zero := zero + 1;
         elsif(Slice(str,i,i) = "1") then
            one := one + 1;
         elsif(Slice(str,i,i) = "2") then
            two := two + 1;
         elsif(Slice(str,i,i) = "3") then
            three := three + 1;
         elsif(Slice(str,i,i) = "4") then
            four := four + 1;
         elsif(Slice(str,i,i) = "5") then
            five := five + 1;
         elsif(Slice(str,i,i) = "6") then
            six := six + 1;
         elsif(Slice(str,i,i) = "7") then
            seven := seven + 1;
         end if; 
      end loop;

      if (n = 7) then
         if ((zero = 0) and (one = 1) and (two = 1) and (three = 1) and (four = 1) and (five = 1) and (six = 1) and (seven = 1)) then
            return TRUE;
         end if;
      elsif (n = 6) then
         if ((zero = 0) and (one = 1) and (two = 1) and (three = 1) and (four = 1) and (five = 1) and (six = 1)) then
            return TRUE;
         end if;
      elsif (n = 5) then
         if ((zero = 0) and (one = 1) and (two = 1) and (three = 1) and (four = 1) and (five = 1)) then
            return TRUE;
         end if;
      elsif (n = 4) then
         if ((zero = 0) and (one = 1) and (two = 1) and (three = 1) and (four = 1)) then
            return TRUE;
         end if;
      end if;

      return FALSE;
   end pandigital;

   i : integer := 7654321;
   s1 : Unbounded_String;

begin
   start_time := Ada.Real_Time.Clock;

   while i > 2143 loop
      s1 := Trim(To_Unbounded_String(i'Image), Ada.Strings.Left);
      if (pandigital(s1,Length(s1))) then
         if (isPrime(i)) then
            solution := i;
            EXIT;
         end if;
      end if;
      i := i - 1;
   end loop;

   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler41;
