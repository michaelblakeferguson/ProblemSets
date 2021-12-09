---------------------------------------------------------------------
-- Euler39 ~ Integer right triangles
--
-- Problem Statement:
--
-- If p is the perimeter of a right angle triangle with integral
-- length sides, {a,b,c}, there are exactly three solutions for
-- p = 120.
--
--		{20,48,52}, {24,45,51}, {30,40,50}
-- 
-- For which value of p <= 1000, is the number of solutions maximised?
--
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Algorithm Explanation:
-- 
-- Iterates through values of a,b,c and checks if they are a
-- pythagorean triplet. If they pass, then they form a right triangle
-- and the perimeter is found from a+b+c. Then the triangles array
-- uses the perimiter as an index and increments the number of found
-- triangles.
--
---------------------------------------------------------------------
with Ada.Text_IO;   use  Ada.Text_IO;
with Ada.Real_Time; use  Ada.Real_Time;

procedure Euler39 is
   package Time_IO is new Fixed_IO(Duration);
   start_time, end_time : Ada.Real_Time.Time;
   elapsed_seconds : Ada.Real_Time.Time_Span;
   solution : integer := 0;

   triangles_found_for_p : array (0 .. 999) of integer;
   b, max : integer;
   
begin
   start_time := Ada.Real_Time.Clock;

   triangles_found_for_p := (others => 0);
   for a in 4..500 loop
      b := 1;
      while (b < a) loop
         for c in 1..(999-a-b) loop
            if (a*a + b*b) = (c*c) then
               triangles_found_for_p(a+b+c) := triangles_found_for_p(a+b+c) + 1;
            end if;
         end loop;
         b := b + 1;
      end loop;
   end loop;
   
   max := 0;
   for p in 0..999 loop
      if (triangles_found_for_p(p) > max) then
         max := triangles_found_for_p(p);
         solution := p;
      end if;
   end loop;
   
   end_time := Ada.Real_Time.Clock;
   elapsed_seconds := end_time - start_time;
   Put("Solution: " & solution'Image); New_Line; New_Line;
   Put("Program completed in ");
   Time_IO.Put(To_Duration(elapsed_seconds), Fore => 0, Aft => 3);
   Put(" seconds");
end Euler39;
