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
	character(len=:), allocatable :: champ
	character(7) :: num
	
	call SYSTEM_CLOCK(time_start)
	
	champ = ""
	do while (i <= 185184)
		i = i + 1
		write(num,'(I0)') i
		champ = champ // trim(num)
	end do
	
	solution = (ICHAR(champ(1:1))-48) * (ICHAR(champ(10:10))-48) * (ICHAR(champ(100:100))-48) * (ICHAR(champ(1000:1000))-48) * &
	           (ICHAR(champ(10000:10000))-48) * (ICHAR(champ(100000:100000))-48) * (ICHAR(champ(1000000:1000000))-48)

	call SYSTEM_CLOCK(time_finish)
	clock_finish = time_finish - time_start
	write (*,"(A10,I10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."

end program Euler40
