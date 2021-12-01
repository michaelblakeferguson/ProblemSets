!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler37 ~ Truncatable primes
! 
! Problem Statement:
! 
! The number 3797 has an interesting property. Being prime itself,
! it is possible to continuously remove digits from left to right,
! and remain prime at each stage: 3797, 797, 97, and 7. Similarly
! we can work from right to left: 3797, 379, 37, and 3.
! 
! Find the sum of the only eleven primes that are both truncatable
! from left to right and right to left.
! 
! NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Iterates upwards checking if the number truncates from the left
! and right side while maintaining primality. Uses recursion to
! accept arbitrary length integers. When found the integers are
! added to the solution.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler37
	
	implicit none
	integer :: time_start, time_finish, clock_finish, solution = 0
	integer :: i = 10, primes = 0
	call SYSTEM_CLOCK(time_start)
	do while(primes < 11)
		if (truncatable_left(i)) then
			if(truncatable_right(i)) then
				primes = primes + 1
				solution = solution + i
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
	
	recursive function truncatable_left(num) result(r)
		implicit none
		integer, intent(in) :: num
		integer :: n
		character(10) :: s1
		character(:), allocatable :: str
		logical :: r
		n = num
		if (prime(num)) then
			write (s1,'(I0)') n
			str = trim(s1)
			if (LEN(str) > 2) then
				str = trim(str(2:LEN(str)))
			else
				str = str(2:2)
			end if
			read(str,*) n
		
			if (n > 10) then
				r = truncatable_left(n)
				return
			else
				if (prime(n)) then
					r = .true.
					return
				end if
			end if
		end if
		r = .false.
		return
	end
	
	recursive function truncatable_right(num) result(r)
		implicit none
		integer, intent(in) :: num
		integer :: n
		character(10) :: s1
		character(:), allocatable :: str
		logical :: r
		n = num
		if(prime(num)) then
			write(s1,'(I0)') n
			str = trim(s1)
			if (LEN(str) > 2) then
				str = str(1:LEN(str)-1)
			else
				str = trim(str(1:1))
			end if
			read(str,*) n
			if (n > 10) then
				r = truncatable_right(n)
				return
			else
				if (prime(n)) then
					r = .true.
					return
				end if
			end if
		end if
		r = .false.
		return
	end

end program Euler37
