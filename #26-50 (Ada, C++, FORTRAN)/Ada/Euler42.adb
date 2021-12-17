---------------------------------------------------------------------
-- Euler42 ~ Coded triangle numbers
-- 
-- Problem Statement:
-- 
-- The nth term of the sequence of triangle numbers is given by,
-- t_n = 1/2*n(n+1); so the first ten triangle numbers are:
-- 
--		1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
-- 
-- By converting each letter in a word to a number corresponding to
-- its alphabetical position and adding these values we form a word
-- value. For example, the word value for SKY is 19 + 11 + 25 = 55
-- = t_10. If the word value is a triangle number then we shall call
-- the word a triangle word.
-- 
-- Using words.txt, a 16K text file containing nearly two-thousand
-- common English words, how many are triangle words?
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- Loads words.txt into a vector and iterates checking for chars that
-- are alphanumeric. When the start of a word is found, the length is
-- determined, a value is calculated for it, it is checked for
-- triangularity. If it passes, solution is incremented.
-- Lower bound is set to the 1st given value, upper bound is set to
-- marginally above the largest found value.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Euler42 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : Integer := 0;

   function isTriangular (val : Integer) return Boolean
   is
   begin
      if ((val = 1) or (val = 3) or (val = 6) or
         (val = 10) or (val = 15) or (val = 21) or
         (val = 28) or (val = 36) or (val = 45) or
         (val = 55) or (val = 66) or (val = 78) or
         (val = 91) or (val = 105) or (val = 120) or
         (val = 136) or (val = 153) or (val = 171)) then
         return TRUE;
      end if;
      return FALSE;
   end isTriangular;

   F         : File_Type;
   File_Name : constant String := "words.txt";
   str : Unbounded_String := To_Unbounded_String("");
   c: Character;
   s : String := " ";

   i : Integer := 1;
   value : Integer := 0;
   len : Integer := 0;
   size, j : Integer;

begin
   start_time := Ada.Real_Time.Clock;

   Open (F, In_File, File_Name);
   str := To_Unbounded_String(Get_Line(F));
   Close (F);

   size := Length(str);
   while i <= size loop

      --find starting alphanumeric char of word
      s := Slice(str,i,i);
      c := s(1);
      if (Character'Pos (c) >= 65 and
          Character'Pos (c) <= 90) then
         
         --determine length of word
         j := 0;
         while (Character'Pos (c) >= 65 and
                Character'Pos (c) <= 90) loop
            len := len + 1;
            j := j + 1;
            s := Slice(str,i+j,i+j);
            c := s(1);
         end loop;

         --calculate value of word
         for k in i..(i+j-1) loop
            s := Slice(str,k,k);
            c := s(1);
            value := value + Character'Pos (c)-64;
         end loop;

         --determine if word is triangular
         if(isTriangular(value)) then
            solution := solution + 1;
         end if;
         
         i := i + j - 1;
      end if;
      
      i := i + 1;
      len := 0;
      value := 0;
   end loop;

   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler42;
