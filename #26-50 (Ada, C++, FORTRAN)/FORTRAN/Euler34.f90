!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler34 ~ Digit factorials
! 
! Problem Statement:
! 
! 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
! 
! Find the sum of all numbers which are equal to the sum of the
! factorial of their digits.
! 
! Note: As 1! = 1 and 2! = 2 are not sums they are not included.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Uses modulo to extract digits then calculates the factorial for
! each and summing together. If the sum equals the full number it
! is added to the total sum.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler34

	implicit none
	integer :: time_start, time_finish, clock_finish, solution = 0
	integer :: cur_sum, digit, f, i, j, k

	call SYSTEM_CLOCK(time_start)

	do i = 3, 10000000
		j = i
		cur_sum = 0
		do while(.TRUE.)
			f = 1
			digit = modulo(j,10)
			k = digit
			do while(k > 0)
				f = f * k
				k = k - 1
			end do
			cur_sum = cur_sum + f
			
			if (j < 10) then
				EXIT
			end if
			
			j = j/10
		end do
		
		if (cur_sum == i) then
			solution = solution + cur_sum
		end if
	end do

	call SYSTEM_CLOCK(time_finish)
	clock_finish = time_finish - time_start
	write (*,"(A10,I10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."

end program Euler34
