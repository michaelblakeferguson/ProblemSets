---------------------------------------------------------------------
-- Euler43 ~ Sub-string divisibility
--
-- Problem Statement:
--
-- The number, 1406357289, is a 0 to 9 pandigital number because it
-- is made up of each of the digits 0 to 9 in some order, but it
-- also has a rather interesting sub-string divisibility property.
--
-- Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this
-- way, we note the following:
--
--		d2d3d4  = 406 is divisible by 2
--		d3d4d5  = 063 is divisible by 3
--		d4d5d6  = 635 is divisible by 5
--		d5d6d7  = 357 is divisible by 7
--		d6d7d8  = 572 is divisible by 11
--		d7d8d9  = 728 is divisible by 13
--		d8d9d10 = 289 is divisible by 17
--
-- Find the sum of all 0 to 9 pandigital numbers with this property.
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
--
-- Uses lexicographic sorting to iterate through permutations of
-- digits 0-9 stored in a string. Each string is already pandigital
-- and thus doesn't need to be checked again. The digit triples are
-- extracted using substr and tested for divisibility of the primes.
-- Lower bound is set to the 1st given value, upper bound is set to
-- marginally above the largest found value.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Numerics.Elementary_Functions;
use  Ada.Numerics.Elementary_Functions;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Euler43 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : Long_Long_Integer := 0;

   str  : Unbounded_String := To_Unbounded_String("1406352789");
   usr  : Unbounded_String := To_Unbounded_String("");
   s234 : String := "   ";
   s345 : String := "   ";
   s456 : String := "   ";
   s567 : String := "   ";
   s678 : String := "   ";
   s789 : String := "   ";
   s8910: String := "   ";

   i, j, x, y, z, t : Integer;
   numbers : array (0..9) of Integer := (1,4,0,6,3,5,2,7,8,9);
   reversed : array (0..9) of Integer;
   max : Integer := 42; --maximum is 42e9

begin
   start_time := Ada.Real_Time.Clock;

   while (Integer'Value (Slice(str,1,2)) < max) loop --just check first 2 digits

      i := 8;
      while i >= 0 loop
         if (numbers(i) < numbers(i+1)) then
            x := i;
            EXIT;
         end if;
         i := i - 1;
      end loop;

      i := 9;
      while i >= 0 loop
         if (numbers(x) < numbers(i)) then
            y := i;
            EXIT;
         end if;
         i := i - 1;
      end loop;

      z := numbers(x);
      numbers(x) := numbers(y);
      numbers(y) := z;

      i := 9;
      while i >= x+1 loop
         reversed(9-i) := numbers(i);
         i := i - 1;
      end loop;

      j := x + 1;
      for i in 0..(9-x-1) loop
         numbers(j) := reversed(i);
         j := j + 1;
      end loop;

      str := To_Unbounded_String("");
      for i in 0..9 loop
         Append(str,Trim(To_Unbounded_String(numbers(i)'Image), Ada.Strings.Left));
      end loop;

      s234  := Slice(str,2,4);
      s345  := Slice(str,3,5);
      s456  := Slice(str,4,6);
      s567  := Slice(str,5,7);
      s678  := Slice(str,6,8);
      s789  := Slice(str,7,9);
      s8910 := Slice(str,8,10);

      if ( (Integer'Value(s234))  mod   2 = 0 and
           (Integer'Value(s345))  mod   3 = 0 and
           (Integer'Value(s456))  mod   5 = 0 and
           (Integer'Value(s567))  mod   7 = 0 and
           (Integer'Value(s678))  mod  11 = 0 and
           (Integer'Value(s789))  mod  13 = 0 and
           (Integer'Value(s8910)) mod  17 = 0) then
         solution := solution + Long_Long_Integer'Value (To_String(str));
      end if;

      t := Integer'Value (Slice(str,1,2));

   end loop;

   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler43;
