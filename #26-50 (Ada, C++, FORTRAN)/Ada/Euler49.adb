---------------------------------------------------------------------
-- Euler49 ~ Prime permutations
-- 
-- Problem Statement:
-- 
-- The arithmetic sequence, 1487, 4817, 8147, in which each of the
-- terms increases by 3330, is unusual in two ways: (i) each of the
-- three terms are prime, and, (ii) each of the 4-digit numbers are
-- permutations of one another.
-- 
-- There are no arithmetic sequences made up of three 1-, 2-, or
-- 3-digit primes, exhibiting this property, but there is one other
-- 4-digit increasing sequence.
-- 
-- What 12-digit number do you form by concatenating the three terms
-- in this sequence?
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- Iterates upwards looking for prime numbers, when found it checks
-- to see if p + 3330 is a permutation & prime. Then it checks if
-- p + 2*3330 is a permutation & prime. The integers are then
-- cast to strings and appended to the solution.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Numerics.Elementary_Functions;
use  Ada.Numerics.Elementary_Functions;

procedure Euler49 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : Unbounded_String := Null_Unbounded_String;
   
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
   
   function isPermutation(a : Unbounded_String; b : Unbounded_String) return boolean
   is
      type strDigits is array (1..10) of Integer;
      aDigits : strDigits := (others => 0);
      bDigits : strDigits := (others => 0);
      
   begin
      for i in 1..4 loop
         if    Slice(a,i,i) = "0" then
            aDigits(1) := aDigits(1) + 1;
         elsif Slice(a,i,i) = "1" then
            aDigits(2) := aDigits(2) + 1;
         elsif Slice(a,i,i) = "2" then
            aDigits(3) := aDigits(3) + 1;
         elsif Slice(a,i,i) = "3" then
            aDigits(4) := aDigits(4) + 1;
         elsif Slice(a,i,i) = "4" then
            aDigits(5) := aDigits(5) + 1;
         elsif Slice(a,i,i) = "5" then
            aDigits(6) := aDigits(6) + 1;
         elsif Slice(a,i,i) = "6" then
            aDigits(7) := aDigits(7) + 1;
         elsif Slice(a,i,i) = "7" then
            aDigits(8) := aDigits(8) + 1;
         elsif Slice(a,i,i) = "8" then
            aDigits(9) := aDigits(9) + 1;
         elsif Slice(a,i,i) = "9" then
            aDigits(10) := aDigits(10) + 1;
         end if;
      end loop;
      
      for i in 1..4 loop
         if    Slice(b,i,i) = "0" then
            bDigits(1) := bDigits(1) + 1;
         elsif Slice(b,i,i) = "1" then
            bDigits(2) := bDigits(2) + 1;
         elsif Slice(b,i,i) = "2" then
            bDigits(3) := bDigits(3) + 1;
         elsif Slice(b,i,i) = "3" then
            bDigits(4) := bDigits(4) + 1;
         elsif Slice(b,i,i) = "4" then
            bDigits(5) := bDigits(5) + 1;
         elsif Slice(b,i,i) = "5" then
            bDigits(6) := bDigits(6) + 1;
         elsif Slice(b,i,i) = "6" then
            bDigits(7) := bDigits(7) + 1;
         elsif Slice(b,i,i) = "7" then
            bDigits(8) := bDigits(8) + 1;
         elsif Slice(b,i,i) = "8" then
            bDigits(9) := bDigits(9) + 1;
         elsif Slice(b,i,i) = "9" then
            bDigits(10) := bDigits(10) + 1;
         end if;
      end loop;
      if aDigits = bDigits then
         return TRUE;
      end if;
      return FALSE;
   end isPermutation;
   
   j, k : integer;
   
begin
   start_time := Ada.Real_Time.Clock;
   
   for i in 2968..2970 loop
      if isPrime(i) then
         j := i + 3330;
         if isPermutation(Trim(To_Unbounded_String(i'Image),Ada.Strings.Left),
                          Trim(To_Unbounded_String(j'Image),Ada.Strings.Left)) then
            if isPrime(j) then
               k := j + 3330;
               if isPermutation(Trim(To_Unbounded_String(i'Image),Ada.Strings.Left),
                                Trim(To_Unbounded_String(k'Image),Ada.Strings.Left)) then
                  if isPrime(k) then
                     Append(solution,Trim(To_Unbounded_String(i'Image),Ada.Strings.Left));
                     Append(solution,Trim(To_Unbounded_String(j'Image),Ada.Strings.Left));
                     Append(solution,Trim(To_Unbounded_String(k'Image),Ada.Strings.Left));
                  end if;
               end if;
            end if;
         end if;
      end if;
   end loop;
          
   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & To_String(solution)); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler49;
