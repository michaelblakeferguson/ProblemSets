---------------------------------------------------------------------
-- Euler31 ~ Coin sums
-- 
-- Problem Statement:
-- 
-- In the United Kingdom the currency is made up of pound and pence.
-- There are eight coins in general circulation:
-- 
--      1p, 2p, 5p, 10p, 20p, 50p, $1, $2 (200p).
-- 
-- It is possible to make $2 in the following way:
-- 
--      1x$1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p
-- 
-- How many different ways can $2 be made using any number of coins?
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- Calls the countcoins() function with initial value of 200.
-- The function then begins to test values of the coins array
-- checking to see if they can be removed from the total to get
-- zero indicating they evenly add up to 200. By recursively
-- calling itself the function finds all possible iterations of the
-- coins from a topdown approach.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;

procedure Euler31 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;
   
   coins : array (0..7) of integer;

   function countcoins(total : Integer; coin : Integer) return Integer
   is
      sum : Integer := 0;
   begin
      if coin = 7 then
         return 1;
      end if;
      
      for i in coin..7 loop
         if (total - coins(i)) = 0 then
            sum := sum + 1;
         end if;
         if (total - coins(i) > 0) then
            sum := sum + countcoins((total-coins(i)),i);
         end if;
      end loop;
      return sum;
   end countcoins;

begin
   start_time := Ada.Real_Time.Clock;

   coins := (200,100,50,20,10,5,2,1);
   
   solution := countcoins(200,0);

   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler31;
