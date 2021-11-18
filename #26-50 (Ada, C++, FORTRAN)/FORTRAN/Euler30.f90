!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler30 ~ Digit fifth powers
! 
! Problem Statement:
! 
! Surprisingly there are only three numbers that can be written as
! the sum of fourth powers of their digits:
! 
!		1634 = 1^4 + 6^4 + 3^4 + 4^4
!		8208 = 8^4 + 2^4 + 0^4 + 8^4
!		9474 = 9^4 + 4^4 + 7^4 + 4^4
! 
! As 1 = 1^4 is not a sum it is not included.
! 
! The sum of these numbers is 1634 + 8208 + 9474 = 19316
! 
! Find the sum of all the numbers that can be written as the sum
! of fifth powers of their digits.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Loops up to 1 million checking if the number is a sum of fifth
! powers by using modulo 10 to extract each digit and raise to
! the fifth power, then adding its sum to solution if it passes. 
! 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler30

integer :: time_start, time_finish, clock_finish, solution = 0
integer :: sum_, size_, digit, num

call SYSTEM_CLOCK(time_start)

do n = 2,999999
	num = n
	sum_ = 0
	size_ = AINT(LOG10(REAL(num))) + 1 !get length of num
	do i = 0,size_ !raise each digit to the 5th power and add
		digit = MOD(num,10)
		
		sum_ = sum_ + digit**5
		num = num / 10
	end do
	
	if (sum_ == n) then
		solution = solution + sum_
	end if
end do

call SYSTEM_CLOCK(time_finish)
clock_finish = time_finish - time_start
write (*,"(A10,I10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."
end program Euler30
