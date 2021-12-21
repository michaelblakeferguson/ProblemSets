---------------------------------------------------------------------
-- Euler32 ~ Pandigital products
--
-- Problem Statement:
--
-- We shall say that an n-digit number is pandigital if it makes
-- use of all the digits 1 to n exactly once; for example, the
-- 5-digit number, 15234, is 1 through 5 pandigital.
--
-- The product 7254 is unusual, as the identity, 39 × 186 = 7254,
-- containing multiplicand, multiplier, and product is 1 through 9
-- pandigital.
--
-- Find the sum of all products whose multiplicand/multiplier/
-- product identity can be written as a 1 through 9 pandigital.
--
-- HINT: Some products can be obtained in more than one way so be
-- sure to only include it once in your sum.
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
--
-- Figuring out the max limit to calculate values is the biggest
-- hurdle in reducing the run time. By inspection, when churning
-- out values without an upper limit we can tell that the factors
-- begin to repeat in opposite order, e.g. 39 x 186 and 186 x 39
-- give the same product 7254. It can also be seen that for integers
-- 1-9 there are not factors of products greater than 50 and 2000,
-- so those can serve as our upper limit. We just then need to make
-- sure no repeats are added into the product vector and calculate
-- the sum when finished.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Euler32 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;

   function pandigital (strA : Unbounded_String;
                        strB : Unbounded_String;
                        strC : Unbounded_String) return Boolean
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

      tmpA : String(1..1);
      tmpB : String(1..1);
      tmpC : String(1..1);
   begin
      for i in 1..Length(strA) loop
         tmpA := Slice(strA,i,i);
         if(tmpA = "0") then
            zero := zero + 1;
         elsif(tmpA = "1") then
            one := one + 1;
         elsif(tmpA = "2") then
            two := two + 1;
         elsif(tmpA = "3") then
            three := three + 1;
         elsif(tmpA = "4") then
            four := four + 1;
         elsif(tmpA = "5") then
            five := five + 1;
         elsif(tmpA = "6") then
            six := six + 1;
         elsif(tmpA = "7") then
            seven := seven + 1;
         elsif(tmpA = "8") then
            eight := eight + 1;
         elsif(tmpA = "9") then
            nine := nine + 1;
         end if;
      end loop;

      for i in 1..Length(strB) loop
         tmpB := Slice(strB,i,i);
         if(tmpB = "0") then
            zero := zero + 1;
         elsif(tmpB = "1") then
            one := one + 1;
         elsif(tmpB = "2") then
            two := two + 1;
         elsif(tmpB = "3") then
            three := three + 1;
         elsif(tmpB = "4") then
            four := four + 1;
         elsif(tmpB = "5") then
            five := five + 1;
         elsif(tmpB = "6") then
            six := six + 1;
         elsif(tmpB = "7") then
            seven := seven + 1;
         elsif(tmpB = "8") then
            eight := eight + 1;
         elsif(tmpB = "9") then
            nine := nine + 1;
         end if;
      end loop;

      for i in 1..Length(strC) loop
         tmpC := Slice(strC,i,i);
         if(tmpC = "0") then
            zero := zero + 1;
         elsif(tmpC = "1") then
            one := one + 1;
         elsif(tmpC = "2") then
            two := two + 1;
         elsif(tmpC = "3") then
            three := three + 1;
         elsif(tmpC = "4") then
            four := four + 1;
         elsif(tmpC = "5") then
            five := five + 1;
         elsif(tmpC = "6") then
            six := six + 1;
         elsif(tmpC = "7") then
            seven := seven + 1;
         elsif(tmpC = "8") then
            eight := eight + 1;
         elsif(tmpC = "9") then
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

   a : integer := 1;
   b : integer := 1;
   c : integer := 1;

   Astr : Unbounded_String := To_Unbounded_String("");
   Bstr : Unbounded_String := To_Unbounded_String("");
   Cstr : Unbounded_String := To_Unbounded_String("");

   products : array (0..30) of Integer := (others => 0);
   found : integer := 0;
   f : boolean := FALSE;

begin
   start_time := Ada.Real_Time.Clock;
   for a in 1..49 loop
      for b in 1..1999 loop
         c := a*b;
         Astr := To_Unbounded_String(a'Image);
         Bstr := To_Unbounded_String(b'Image);
         Cstr := To_Unbounded_String(c'Image);

         if(pandigital(Astr,Bstr,Cstr)) then
            for i in 0..30 loop
               if(products(i) = c) then
                  f := TRUE;
               end if;
            end loop;
            if not f then
               products(found) := c;
               found := found + 1;
               solution := solution + c;
            end if;
         end if;
         f := FALSE;
      end loop;
   end loop;

   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler32;
