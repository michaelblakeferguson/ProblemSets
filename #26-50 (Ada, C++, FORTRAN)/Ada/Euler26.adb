---------------------------------------------------------------------
-- Euler 26 ~ Reciprocal cycles
--
-- Problem Statement:
-- 
-- A unit fraction contains 1 in the numerator. The decimal
-- representation of the unit fractions with denominators 2 to 10
-- are given:
-- 
-- 1/2  = 0.5
-- 1/3  = 0.(3)
-- 1/4  = 0.25
-- 1/5  = 0.2
-- 1/6  = 0.1(6)
-- 1/7  = 0.(142857)
-- 1/8  = 0.125
-- 1/9  = 0.(1)
-- 1/10 = 0.1
-- 
-- Where 0.1(6) means 0.166666..., and has a 1-digit recurring
-- cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
-- 
-- Find the value of d < 1000 for which 1/d contains the longest
-- recurring cycle in its decimal fraction part.
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- This question boils down to finding the highest full reptend
-- prime < 1000. Long division is used to store the decimals
-- for each unit fraction up to the nth - 1 digit, +10 additional
-- digits to check for repetition. If the 10 digits being checked
-- aren't found in the middle of the expansion and match the end,
-- we know we have found a full reptend prime. And since the larger
-- the denominator the larger the reptend, we only need to find the
-- first full reptend starting from 1000 to know we have the largest
-- full reptend prime.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Euler26 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;     
   
   p : integer := 999;
   a, b, c, i : integer;
   
   decimals : Unbounded_String := Null_Unbounded_String;
   front  : Unbounded_String := Null_Unbounded_String;
   middle : Unbounded_String := Null_Unbounded_String;
   ending : Unbounded_String := Null_Unbounded_String;
   
begin
   start_time := Ada.Real_Time.Clock;
   
   while p > 1 loop
      a := 10;
      b := p;
      i := 0;
      
      while a > 0 and i < (b+9) loop --use long division to get decimal expansion
         
         if b > a then
            a := a * 10;
            Append(decimals,Trim(To_Unbounded_String("0"),Ada.Strings.Left));
         else
            c := a/b;
            a := a - b*c;
            a := a*10;
            Append(decimals,Trim(To_Unbounded_String(c'Image),Ada.Strings.Left));
         end if;
         i := i + 1;
      end loop;
      
      if a > 0 then --check if it is a full reptend prime
         front := To_Unbounded_String(Slice(decimals,1,10));
         middle := To_Unbounded_String(Slice(decimals,11,(p-10)));
         ending := To_Unbounded_String(Slice(decimals,(p),Length(decimals)));
        
         i := 1;
         while i <= (Length(middle) - Length(front) + 1) loop
            if (Slice(middle,i,i+Length(front)-1) = front) then
               EXIT;
            end if;
            i := i + 1;
            if i = (Length(middle) - Length(front) + 1) then
               if(front = ending) then
                  solution := p;
                  goto FINISH;
               end if;
            end if;
         end loop;
         
      end if;
      decimals := Null_Unbounded_String;
      p := p - 1;
   end loop;

   <<FINISH>>     
   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler26;
