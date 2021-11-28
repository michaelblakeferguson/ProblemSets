!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler46 ~ Goldbach's other conjecture
! 
! Problem Statement:
! 
! It was proposed by Christian Goldbach that every odd composite
! number can be written as the sum of a prime and twice a square.
! 
!		9  =  7 + 2×1^2
!		15 =  7 + 2×2^2
!		21 =  3 + 2×3^2
!		25 =  7 + 2×3^2
!		27 = 19 + 2×2^2
!		33 = 31 + 2×1^2
! 
! It turns out that the conjecture was false.
! 
! What is the smallest odd composite that cannot be written as the
! sum of a prime and twice a square?
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Iterates upwards looking for odd composite numbers. Then the value
! is tested using two nested for loops, one to find prime values and
! the other to test twice square values. If no twice squares are
! found for the prime, the loops break and the solution is set to i.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler46
	
	implicit none
	integer :: time_start, time_finish, clock_finish, solution = 0
	integer :: i, j, k, r
	logical :: f = .false.
	
	call SYSTEM_CLOCK(time_start)
	
	do i = 3,10000,2
		if (prime(i) .eqv. .false.) then
			do j = 2,(i-1)
				if (prime(j)) then
					r = i - j
					do k = 1,(r/2+1)
						if (r == (2*k*k)) then
							f = .true.
							EXIT
						end if
					end do
					if (f) then
						EXIT
					end if
				end if
			end do
			if(f .eqv. .false.) then
				solution = i
				EXIT
			end if
			f = .false.
		end if
	end do

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

end program Euler46
