---------------------------------------------------------------------
-- Euler28 ~ Number spiral diagonals
--
-- Problem Statement:
-- 
-- Starting with the number 1 and moving to the right in a clockwise
-- direction a 5 by 5 spiral is formed as follows:
-- 
--                          21 22 23 24 25
--                          20  7  8  9 10
--                          19  6  1  2 11
--                          18  5  4  3 12
--                          17 16 15 14 13
--
-- It can be verified that the sum of the numbers on the diagonals
-- is 101.
--
-- What is the sum of the numbers on the diagonals in a 1001 by 1001
-- spiral formed in the same way?
-- 
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- Each diagonal follows the same pattern of increasing the change
-- between each value by 8. Thus we can loop through each diagonal
-- and increment up to the 500th element.
--
--                       43 44 45 46 47 48 49 
--                       42 21 22 23 24 25 26
--                       41 20  7  8  9 10 27
--                       40 19  6  1  2 11 28
--                       39 18  5  4  3 12 29
--                       38 17 16 15 14 13 30
--                       37 36 35 34 33 32 31
-- 
-- e.g. bottom-right diagonal: 1  --> 3  (+2)
--                             3  --> 13 (+10)
--                             13 --> 31 (+18)
-- 
--      bottom-left diagonal:  1  --> 5  (+4)
--                             5  --> 17 (+12)
--                             17 --> 37 (+20) 
-- 
--      top-left diagonal:     1  --> 7  (+6)
--                             7  --> 21 (+14)
--                             21 --> 43 (+22) 
-- 
--      top-right diagonal:    1  --> 9  (+8)
--                             9  --> 25 (+16)
--                             25 --> 49 (+24)
-- 
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;

procedure Euler28 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;
   
   b : integer;
   a : array (1..4) of integer;
   c : array (1..4) of integer;
   sum : array (1..4) of integer;
   
begin
   start_time := Ada.Real_Time.Clock;
   
   a := (3,5,7,9);
   c := (10,12,14,16);
   sum := (3,5,7,9); 
   
   for i in 1..4 loop
      for j in 1..499 loop
         b := a(i) + c(i);
         c(i) := c(i) + 8;
         a(i) := b;
         sum(i) := sum(i) + b;
      end loop;
   end loop;
   
   solution := sum(1) + sum(2) + sum(3) + sum(4) + 1;
   
   end_time := Ada.Real_Time.Clock;   
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler28;
