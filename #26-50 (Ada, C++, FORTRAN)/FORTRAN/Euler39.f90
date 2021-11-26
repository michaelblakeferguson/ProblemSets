!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler39 ~ Integer right triangles
! 
! Problem Statement:
! 
! If p is the perimeter of a right angle triangle with integral
! length sides, {a,b,c}, there are exactly three solutions for
! p = 120.
! 
!		{20,48,52}, {24,45,51}, {30,40,50}
! 
! For which value of p ≤ 1000, is the number of solutions maximised?
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Iterates through values of a,b,c and checks if they are a
! pythagorean triplet. If they pass, then they form a right triangle
! and the perimeter is found from a+b+c. Then the triangles array
! uses the perimiter as an index and increments the number of found
! triangles.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler39
	
	implicit none
	integer :: time_start, time_finish, clock_finish, solution = 0
	integer :: a,b,c,p,max_
	integer, dimension(1000) :: triangles_found_for_p
	
	call SYSTEM_CLOCK(time_start)
	triangles_found_for_p = 0
	do a = 4,500
		do b = 1,a
			do c = 1,999-a-b
				if ((a*a+b*b) == (c*c)) then
					triangles_found_for_p(a+b+c+1) = triangles_found_for_p(a+b+c+1) + 1
				end if
			end do
		end do
	end do
	
	max_ = 0
	do p = 0,999
		if (triangles_found_for_p(p+1) > max_) then
			max_ = triangles_found_for_p(p+1)
			solution = p
		end if
	end do

	call SYSTEM_CLOCK(time_finish)
	clock_finish = time_finish - time_start
	write (*,"(A10,I10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."

end program Euler39
