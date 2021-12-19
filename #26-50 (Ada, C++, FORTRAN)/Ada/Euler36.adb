---------------------------------------------------------------------
-- Euler36 ~ Double-base palindromes
-- 
-- Problem Statement:
-- 
-- The decimal number, 585 = 10010010012 (binary), is palindromic in
-- both bases.
-- 
-- Find the sum of all numbers, less than one million, which are
-- palindromic in base 10 and base 2.
-- 
-- (Please note that the palindromic number, in either base, may not
-- include leading zeros.)
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- Converts the integer in base 10 to a string and checks if it is
-- a palindrome. Then converts the integer to base 2 and repeats the
-- process. If it passes both palindrome checks the integer value is
-- added to the solution.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Euler36 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;
   
   function palindrome(str : Unbounded_String) return boolean
   is
      i : integer := 0;
   begin
      while i < (Length(str)/2) loop
         if not((Slice(str,i+1,i+1)) = (Slice(str,(Length(str)-i),(Length(str)-i)))) then
            return FALSE;   
         end if;
         i := i + 1;
      end loop;
      return TRUE;
   end palindrome;

   function To_Binary(Value : Natural) return String
   is
      Result : Unbounded_String := Null_Unbounded_String;
      Num_Digits : constant String := "0123456789abcdefghijklmnopqrstuvwxyz";
      Temp : Natural := Value;
      Base_Digit : String(1..1);
   begin
      if Temp = 0 then
         return "0";
      end if;
      while Temp > 0 loop
         Base_Digit(1) := Num_Digits((Temp mod 2) + 1);
         if Result = Null_Unbounded_String then
            Append(Result, Base_Digit);
         else
            Insert(Source => Result,
               Before => 1,
               New_Item => Base_Digit);
         end if;
         Temp := Temp / 2;
      end loop;
      return To_String(Result);
   end To_Binary;
                
   s1 : Unbounded_String;       
       
begin
   start_time := Ada.Real_Time.Clock;
   
   for i in 1..999999 loop
      s1 := Trim(To_Unbounded_String(i'Image), Ada.Strings.Left);
      if (palindrome(s1)) then
         s1 :=  Trim(To_Unbounded_String(To_Binary(i)), Ada.Strings.Left);
         if (palindrome(s1)) then
            solution := solution + i;
         end if;
      end if;
   end loop;

   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler36;
