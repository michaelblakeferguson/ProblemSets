---------------------------------------------------------------------
-- Euler33 ~ Digit cancelling fractions
-- 
-- Problem Statement:
-- 
-- The fraction 49/98 is a curious fraction, as an inexperienced
-- mathematician in attempting to simplify it may incorrectly
-- believe that 49/98 = 4/8, which is correct, is obtained by
-- cancelling the 9s.
--
-- We shall consider fractions like, 30/50 = 3/5, to be trivial
-- examples.
--
-- There are exactly four non-trivial examples of this type of
-- fraction, less than one in value, and containing two digits
-- in the numerator and denominator.
--
-- If the product of these four fractions is given in its lowest
-- common terms, find the value of the denominator.
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- Two for loops iterate through the possible values for the 2-digit
-- numerator and denominator. The digits are then extracted and
-- compared to check for equality. The decimal form is then found
-- for the digits that aren't cancelled and checked for equality
-- to q. The last step is to calculate the product and reduce the
-- denominator.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;
with Ada.Numerics.Generic_Elementary_Functions;

procedure Euler33 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;
   
   type Real is digits 18;
   package Real_Funcs is new Ada.Numerics.Generic_Elementary_Functions(Real);
   use Real_Funcs;
   package Real_IO is new Ada.Text_IO.Float_IO(Real);
   use Real_IO;

   function Approx_Equal (Left : Real; Right : Real) return Boolean is
      eps : Real := Real'Max(Left, Right) * 1.0e-9;
   begin
      if left > Right then
         return Left - Right < eps;
      else
         return Right - Left < eps;
      end if;
   end Approx_Equal;
   
   a, b, c, d : integer;
   numer : integer := 1;
   denom : integer := 1;
   q : Real;

begin
   start_time := Ada.Real_Time.Clock;
   
   for i in 11..99 loop
      for j in (i+1)..99 loop
         a := (i/10) mod 10;
         b := i mod 10;
         c := (j/10) mod 10;
         d := j mod 10;
         
         q := Real(i) / Real(j);
         if q < 1.0 then
            if ( not(b = 0) and not(d = 0)) then
               if (a = c) then
                  if (Approx_Equal(Real(b)/Real(d),q)) then
                     numer := numer * i;
                     denom := denom * j;
                  end if;
               elsif (a = d) then
                  if (Approx_Equal(Real(b)/Real(c),q)) then
                     numer := numer * i;
                     denom := denom * j;
                  end if;
               end if;
               
               if (b = c) then
                  if (Approx_Equal(Real(a)/Real(d),q)) then
                     numer := numer * i;
                     denom := denom * j;
                  end if;
               elsif (b = d) then
                  if (Approx_Equal(Real(a)/Real(c),q)) then
                     numer := numer * i;
                     denom := denom * j;
                  end if;
               end if;
            end if;
         end if;
      end loop;
   end loop;
   
   solution := denom / numer;

   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler33;
