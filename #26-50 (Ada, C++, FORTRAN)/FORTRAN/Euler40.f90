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
	integer :: i = 0, length = 0, prev_length = 0 
	logical :: aNotSet = .true., bNotSet = .true., cNotSet = .true.
	logical :: dNotSet = .true., eNotSet = .true., fNotSet = .true.
	logical :: gNotSet = .true.
	character :: a = "1",b,c,d,e,f,g
	character(7) :: num
	
	call SYSTEM_CLOCK(time_start)
	
	do while (length <= 1000000)
		i = i + 1
		write(num,'(I0)') i
		length = prev_length + LEN(trim(num))
		if(length > 10 .and. bNotSet) then
			b = num((10-prev_length):(10-prev_length))
			bNotSet = .false.
		end if
		if(length > 100 .and. cNotSet) then
			c = num((100-prev_length):(100-prev_length))
			cNotSet = .false.
		end if
		if(length > 1000 .and. dNotSet) then
			d = num((1000-prev_length):(1000-prev_length))
			dNotSet = .false.
		end if
		if(length > 10000 .and. eNotSet) then
			e = num((10000-prev_length):(10000-prev_length))
			eNotSet = .false.
		end if
		if(length > 100000 .and. fNotSet) then
			f = num((100000-prev_length):(100000-prev_length))
			fNotSet = .false.
		end if
		if(length > 1000000 .and. gNotSet) then
			g = num((1000000-prev_length):(1000000-prev_length))
			gNotSet = .false.
		end if
		prev_length = length
	end do
	
	solution = (ICHAR(a)-48)*(ICHAR(b)-48)*(ICHAR(c)-48)*(ICHAR(d)-48)* &
	           (ICHAR(e)-48)*(ICHAR(f)-48)*(ICHAR(g)-48)

	call SYSTEM_CLOCK(time_finish)
	clock_finish = time_finish - time_start
	write (*,"(A10,I10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."

end program Euler40
