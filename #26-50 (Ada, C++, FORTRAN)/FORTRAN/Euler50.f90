!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler50 ~ Consecutive prime sum
! 
! Problem Statement:
! 
! The prime 41, can be written as the sum of six consecutive primes:
! 
!		41 = 2 + 3 + 5 + 7 + 11 + 13
! 
! This is the longest sum of consecutive primes that adds to a
! prime below one-hundred.
!
! The longest sum of consecutive primes below one-thousand that adds
! to a prime, contains 21 terms, and is equal to 953.
!
! Which prime, below one-million, can be written as the sum of the
! most consecutive primes?
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Iterates upwards checking for primality and adding to sum. Once
! the sum becomes greater than 1 million the loop ends. This problem
! is straightforward, with one caveat: the consecutive primes do not
! need to start at 2. By increasing the starting prime from 2 to 3,
! we get a different result, and as it turns out, the greatest sum
! is reached by starting at 7.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler50
	
	implicit none
	integer :: time_start, time_finish, clock_finish, solution = 0
	integer :: i = 7, sum_ = 0
	call SYSTEM_CLOCK(time_start)
	
	do while(sum_ <= 1000000)
		if (prime(i)) then
			sum_ = sum_ + i
			if (prime(sum_)) then
				if (sum_ > solution) then
					solution = sum_
				end if
			end if
		end if
		i = i + 1
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

end program Euler50
