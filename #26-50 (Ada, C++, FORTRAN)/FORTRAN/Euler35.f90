!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler35 ~ Circular primes
! 
! Problem Statement:
! 
! The number, 197, is called a circular prime because all rotations
! of the digits: 197, 971, and 719, are themselves prime.
! 
! There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17,
! 31, 37, 71, 73, 79, and 97.
! 
! How many circular primes are there below one million?
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Loops up to 1 million, checking if the number is prime. Rotate()
! is then called depending on the length of the number and each
! cycle is checked for primality. If all of the rotations pass then
! the total is incremented.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler35

	implicit none
	integer :: time_start, time_finish, clock_finish, solution = 0
	logical :: allPrime = .true.
	integer :: i, j, k,z, digits_ = 0
	
	call SYSTEM_CLOCK(time_start)

	do i = 2,1000000
		if (prime(i)) then
			j = i
			digits_ = 1
			do while(j > 10)
				digits_ = digits_ + 1
				j = j / 10
			end do
			
			j = i
			k = 0
			do while(k <= (digits_ - 1))
				j = rotate(j,digits_)
				if(prime(j) .EQV. .false.) then
					allPrime = .false.
					EXIT
				end if
				k = k + 1
			end do
			
			if (allPrime) then
				solution = solution + 1
			end if
			allPrime = .true.
		end if
	end do

	call SYSTEM_CLOCK(time_finish)
	clock_finish = time_finish - time_start
	write (*,"(A10,I10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."

contains

	logical function prime(num)
		integer :: num, i
		do i = 2,INT(sqrt(real(num)))
			if(modulo(num,i) == 0) then
				prime = .false.
				return
			end if
		end do
		prime = .true.
		return
    end
	
	integer function rotate(r,d)
		integer :: r,d,i
		integer, dimension(d) :: digit
		
		i = 0
		do while(i < (d-1))
			digit(d - 1 - i) = modulo(r,10)
			r = r / 10
			i = i + 1
		end do
		digit(d) = r
		
		r = 0
		i = d
		do while(i > 0)
			r = r * 10 + digit(d - i + 1)
			i = i - 1
		end do
		
		rotate = r
		return
	end

end program Euler35
