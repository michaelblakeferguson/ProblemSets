!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler28 ~ Number spiral diagonals
!
! Problem Statement:
! 
! Starting with the number 1 and moving to the right in a clockwise
! direction a 5 by 5 spiral is formed as follows:
! 
!                          21 22 23 24 25
!                          20  7  8  9 10
!                          19  6  1  2 11
!                          18  5  4  3 12
!                          17 16 15 14 13
!
! It can be verified that the sum of the numbers on the diagonals
! is 101.
!
! What is the sum of the numbers on the diagonals in a 1001 by 1001
! spiral formed in the same way?
! 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Each diagonal follows the same pattern of increasing the change
! between each value by 8. Thus we can loop through each diagonal
! and increment up to the 500th element.
!
!                       43 44 45 46 47 48 49 
!                       42 21 22 23 24 25 26
!                       41 20  7  8  9 10 27
!                       40 19  6  1  2 11 28
!                       39 18  5  4  3 12 29
!                       38 17 16 15 14 13 30
!                       37 36 35 34 33 32 31
! 
! e.g. bottom-right diagonal: 1  --> 3  (+2)
!                             3  --> 13 (+10)
!                             13 --> 31 (+18)
! 
!      bottom-left diagonal:  1  --> 5  (+4)
!                             5  --> 17 (+12)
!                             17 --> 37 (+20) 
! 
!      top-left diagonal:     1  --> 7  (+6)
!                             7  --> 21 (+14)
!                             21 --> 43 (+22) 
! 
!      top-right diagonal:    1  --> 9  (+8)
!                             9  --> 25 (+16)
!                             25 --> 49 (+24)
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler28

integer :: time_start, time_finish, clock_finish, solution
integer :: b, a(4), c(4), add(4)

call SYSTEM_CLOCK(time_start)

a = (/3,5,7,9/)
c = (/10,12,14,16/)
add = (/3,5,7,9/)

do i = 1,4
	do j = 2,500
		b = a(i) + c(i)
		c(i) = c(i) + 8
		a(i) = b
		add(i) = add(i) + b
	end do
end do

solution = add(1) + add(2) + add(3) + add(4) + 1

call SYSTEM_CLOCK(time_finish)
clock_finish = time_finish - time_start
write (*,"(A10,I10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."
end program Euler28
