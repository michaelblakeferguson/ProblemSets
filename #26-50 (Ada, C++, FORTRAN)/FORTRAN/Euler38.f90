!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler38 ~ Pandigital multiples
! 
! Problem Statement:
! 
! Take the number 192 and multiply it by each of 1, 2, and 3:
! 
!		192 × 1 = 192
!		192 × 2 = 384
!		192 × 3 = 576
! 
! By concatenating each product we get the 1 to 9 pandigital,
! 192384576. We will call 192384576 the concatenated product of 192
! and (1,2,3)
! 
! The same can be achieved by starting with 9 and multiplying by 1,
! 2, 3, 4, and 5, giving the pandigital, 918273645, which is the
! concatenated product of 9 and (1,2,3,4,5).
! 
! What is the largest 1 to 9 pandigital 9-digit number that can be
! formed as the concatenated product of an integer with
! (1,2, ... , n) where n > 1?
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Tests values each from 1..n concatenating their substrings to a
! length of 9. If it is pandigital it casts it to an int and checks
! if it is larger than the previously found value.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler38
	
	implicit none
	integer :: time_start, time_finish, clock_finish, solution = 0
	integer :: i, j, n, total_length = 0
	character(9) :: str1
	character(9) :: str2
	
	call SYSTEM_CLOCK(time_start)
	
	do i = 9,10000
		str2 = ""
		total_length = 0
		do j = 1,3
			write(str1,'(I0)') (i*j)
			str2 = trim(str2) // trim(str1)
			total_length = total_length + LEN(trim(str1))
			if (total_length == 9) then
				if (pandigital(str2)) then
					read(str2,*) n
					if (solution < n) then
						solution = n
					end if
				else
					EXIT
				end if
			else
				if (total_length > 9) then
					EXIT
				end if
			end if
		end do
	end do
	
	call SYSTEM_CLOCK(time_finish)
	clock_finish = time_finish - time_start
	write (*,"(A10,I10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."
	
contains
	
	logical function pandigital(str)
		character(9) :: str
		integer :: i, zero, one, two, three, four, five, six, seven, eight, nine

		zero = 0
		one = 0
		two = 0
		three = 0
		four = 0
		five = 0
		six = 0
		seven = 0
		eight = 0
		nine = 0
		
		do i = 1,(LEN(str))
			if(str(i:i) == '0') then
				zero = zero + 1
			end if
			if(str(i:i) == '1') then
				one = one + 1
			end if
			if(str(i:i) == '2') then
				two = two + 1
			end if
			if(str(i:i) == '3') then
				three = three + 1
			end if
			if(str(i:i) == '4') then
				four = four + 1
			end if
			if(str(i:i) == '5') then
				five = five + 1
			end if
			if(str(i:i) == '6') then
				six = six + 1
			end if
			if(str(i:i) == '7') then
				seven = seven + 1
			end if
			if(str(i:i) == '8') then
				eight = eight + 1
			end if
			if(str(i:i) == '9') then
				nine = nine + 1
			end if
		end do
		
		if((zero == 0) .and. (one == 1) .and. (two == 1) .and. (three == 1) .and. &
    	   (four == 1) .and. (five == 1) .and. (six == 1) .and. (seven == 1) .and. &
		   (eight == 1) .and. (nine == 1)) then
			pandigital = .true.
			return
		end if
		pandigital = .false.
		return
	end

end program Euler38
