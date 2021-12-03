!~WORK IN PROGRESS~

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler43 ~ Sub-string divisibility
! 
! Problem Statement:
! 
! The number, 1406357289, is a 0 to 9 pandigital number because it
! is made up of each of the digits 0 to 9 in some order, but it
! also has a rather interesting sub-string divisibility property.
! 
! Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this
! way, we note the following:
! 
!		d2d3d4  = 406 is divisible by 2
!		d3d4d5  = 063 is divisible by 3
!		d4d5d6  = 635 is divisible by 5
!		d5d6d7  = 357 is divisible by 7
!		d6d7d8  = 572 is divisible by 11
!		d7d8d9  = 728 is divisible by 13
!		d8d9d10 = 289 is divisible by 17
! 
! Find the sum of all 0 to 9 pandigital numbers with this property.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Uses lexicographic sorting to iterate through permutations of
! digits 0-9 stored in a string. Each string is already pandigital
! and thus doesn't need to be checked again. The digit triples are
! extracted using substr and tested for divisibility of the primes.
! Lower bound is set to the 1st given value, upper bound is set to
! marginally above the largest found value.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler43
	
	implicit none
	integer :: time_start, time_finish, clock_finish
	integer*8 :: solution = 0
	
	character(:), allocatable :: str
	character(3)  :: s234, s345, s456, s567, s678, s789, s8910
	integer       :: i234, i345, i456, i567, i678, i789, i8910
	integer*8     :: max_ = 4200000000, strINT = 1402356789
	integer, dimension(10) :: reverse, numbers = (/ 1,4,0,2,3,5,6,7,8,9 /)
	integer :: i, j, u, x, y, z
	
	call SYSTEM_CLOCK(time_start)

	str = "1402356789"
	do while(strINT .LT. max_)
	
		do i = 8,0,-1
			if(numbers(i+1) .LT. numbers(i+2)) then
				x = i
				EXIT
			end if
		end do
		
		do i = 9,0,-1
			if (numbers(x+1) .LT. numbers(i+1)) then
				y = i
				EXIT
			end if
		end do
		
		z = numbers(x+1)
		numbers(x+1) = numbers(y+1)
		numbers(y+1) = z
		
		do i = 9,(x+1),-1 
			reverse(9-i+1) = numbers(i+1)
		end do
		
		do i = 0,(9-x)
			j = x + 1 !mbf
			numbers(j+1) = reverse(i+1)
			j = j + 1
		end do
			
		str = ""
		do u = 0,9
			str = str // CHAR(numbers(u+1)+48)
		end do
		
		s234 = str(1:3)
		s345 = str(2:4)
		s456 = str(3:5)
		s567 = str(4:6)
		s678 = str(5:7)
		s789 = str(6:8)
		s8910 = str(7:9)
		
		read(s234,*) i234
		read(s345,*) i345
		read(s456,*) i456
		read(s567,*) i567
		read(s678,*) i678
		read(s789,*) i789
		read(s8910,*) i8910
		read(str,*) strINT
		if( (modulo(i234,10)==0) .and. (modulo(i345,10)==0) .and. (modulo(i456,10)==0) .and. &
			(modulo(i567,10)==0) .and. (modulo(i678,10)==0) .and. (modulo(i789,10)==0) .and. &
			(modulo(i8910,10)==0) ) then
		
			solution = solution + strINT
		end if
	
	end do
	call SYSTEM_CLOCK(time_finish)
	clock_finish = time_finish - time_start
	write (*,"(A10,I10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."

end program Euler43
