!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler40 ~ Champernowne's constant
! 
! Problem Statement:
! 
! An irrational decimal fraction is created by concatenating the
! positive integers:
! 
!		0.123456789101112131415161718192021...
! 
! It can be seen that the 12th digit of the fractional part is 1.
! 
! If dn represents the nth digit of the fractional part, find the
! value of the following expression.
! 
!		d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Iterates up to 1 million appending i to the string champ. When
! finished, it gets the digits at the specified indexes, casts them
! to ints and multiplies together into solution.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler40
	
	implicit none
	integer :: time_start, time_finish, clock_finish, solution = 0
	integer :: i = 0
	character (len=:), allocatable :: champ
  
	call SYSTEM_CLOCK(time_start)
	
	do while (i <= 1000000)
		i = i + 1
		champ = champ // CHAR(i)
	end do
	
	solution = INT(champ(1:1))*INT(champ(10:10))*INT(champ(100:100))*INT(champ(1000:1000))*INT(champ(10000:10000))*INT(champ(100000:100000))*INT(champ(1000000:1000000))

	call SYSTEM_CLOCK(time_finish)
	clock_finish = time_finish - time_start
	write (*,"(A10,I10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."

end program Euler40
