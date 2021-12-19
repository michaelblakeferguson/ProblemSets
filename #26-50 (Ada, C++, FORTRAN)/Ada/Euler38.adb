---------------------------------------------------------------------
-- Euler38 ~ Pandigital multiples
-- 
-- Problem Statement:
-- 
-- Take the number 192 and multiply it by each of 1, 2, and 3:
-- 
--		192 × 1 = 192
--		192 × 2 = 384
--		192 × 3 = 576
-- 
-- By concatenating each product we get the 1 to 9 pandigital,
-- 192384576. We will call 192384576 the concatenated product of 192
-- and (1,2,3)
-- 
-- The same can be achieved by starting with 9 and multiplying by 1,
-- 2, 3, 4, and 5, giving the pandigital, 918273645, which is the
-- concatenated product of 9 and (1,2,3,4,5).
-- 
-- What is the largest 1 to 9 pandigital 9-digit number that can be
-- formed as the concatenated product of an integer with
-- (1,2, ... , n) where n > 1?
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- Tests values each from 1..n concatenating their substrings to a
-- length of 9. If it is pandigital it casts it to an int and checks
-- if it is larger than the previously found value.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Numerics.Elementary_Functions;
use  Ada.Numerics.Elementary_Functions;

procedure Euler38 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;

   function pandigital (str : Unbounded_String) return Boolean
   is
      zero  : integer := 0;
      one   : integer := 0;
      two   : integer := 0;
      three : integer := 0;
      four  : integer := 0;
      five  : integer := 0;
      six   : integer := 0;
      seven : integer := 0;
      eight : integer := 0;
      nine  : integer := 0;
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
         elsif(Slice(str,i,i) = "8") then
            eight := eight + 1;
         elsif(Slice(str,i,i) = "9") then
            nine := nine + 1;
         end if; 
      end loop;

      if ((zero = 0) and (one = 1) and (two = 1) and
          (three = 1) and (four = 1) and (five = 1) and
          (six = 1) and (seven = 1) and (eight = 1) and (nine = 1)) then
         return TRUE;
      end if;

      return FALSE;
   end pandigital;
   
   s1 : Unbounded_String := To_Unbounded_String("");
   s2 : Unbounded_String;
   total_length, k : integer;       
   
begin
   start_time := Ada.Real_Time.Clock;

   for i in 9..9999 loop
      s2 := To_Unbounded_String("");
      total_length := 0;
      for j in 1..2 loop
         k := i*j;
         s1 := Trim(To_Unbounded_String(k'Image),Ada.Strings.Left);
         Append(s2,s1);
         total_length := total_length + Length(s1);
         if total_length = 9 then
            if pandigital(s2) then
               if solution < Integer'Value(To_String(s2)) then
                  solution := Integer'Value(To_String(s2));
               end if;
            else
               EXIT;
            end if;
         elsif total_length > 9 then
            EXIT;
         end if;
      end loop;
   end loop;       
          
   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler38;
