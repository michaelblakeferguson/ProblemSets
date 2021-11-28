!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler47 ~ Distinct primes factors
! 
! Problem Statement:
! 
! The first two consecutive numbers to have two distinct prime
! factors are:
! 
!		14 = 2 × 7
!		15 = 3 × 5
! 
! The first three consecutive numbers to have three distinct prime
! factors are:
! 
!		644 = 2^2 × 7 × 23
!		645 = 3   × 5 × 43
!		646 = 2   × 17 × 19.
! 
! Find the first four consecutive integers to have four distinct
! prime factors each. What is the first of these numbers?
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Iterates upwards getting the factors of each number and checking
! if there are at least four prime factors. Increments consecutive
! when found and resets to zero if the next numbers do not contain
! four prime factors. Once consecutive reaches four the program
! breaks.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler47
	
	implicit none
	integer :: time_start, time_finish, clock_finish, solution = 0
	integer :: i, j, p, consecutive = 0
	call SYSTEM_CLOCK(time_start)
	
	do i = 646,1000000
		p = 0
		do j = 1,(i/2)
			if (modulo(i,j) == 0) then
				if (prime(j)) then
					p = p + 1
				end if
			end if
		end do
		if (p >= 4) then
			consecutive = consecutive + 1
		else
			consecutive = 0
		end if
		if (consecutive == 4) then
			solution = i
			EXIT
		end if
	end do

	solution = solution - 3 !we want the first of the four consecutive numbers

	call SYSTEM_CLOCK(time_finish)
	clock_finish = time_finish - time_start
	write (*,"(A10,I10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."

contains

	logical function prime(num)
		integer :: num, i
		if (num == 1) then
			prime = .false.
			return
		end if
		do i = 2,INT(sqrt(real(num)))
			if(modulo(num,i) == 0) then
				prime = .false.
				return
			end if
		end do
		prime = .true.
		return
    end

end program Euler47
