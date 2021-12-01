!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler41 ~ Pandigital prime
! 
! Problem Statement:
! 
! We shall say that an n-digit number is pandigital if it makes use
! of all the digits 1 to n exactly once. For example, 2143 is a
! 4-digit pandigital and is also prime.
! 
! What is the largest n-digit pandigital prime that exists?
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Searching from 2143 upwards for pandigital primes and printing to
! command line gives us the answer after ~40 seconds. Knowing the
! upper limit of 7 digits, we can then search from 7654321
! downwards to get the answer within milliseconds.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler41
	
	implicit none
	integer :: time_start, time_finish, clock_finish, solution = 0
	character(7) :: str1
	integer :: i
	
	call SYSTEM_CLOCK(time_start)

	do i = 7654321,2143,-1
		write(str1,'(I0)') i
		if (pandigital(trim(str1),LEN(trim(str1)))) then
			if (prime(i)) then
				solution = i
				EXIT
			end if
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

	logical function pandigital(str1,num)
		integer, intent(in) :: num
		character(7) :: str1
		character(:), allocatable :: str
		
		integer :: i, zero, one, two, three, four, five, six, seven
		zero = 0
		one = 0
		two = 0
		three = 0
		four = 0
		five = 0
		six = 0
		seven = 0
		
		str = trim(str1)
		do i = 1,(LEN(str))
			if(str(i:i) == '0') then
				zero = zero + 1
			else if (str(i:i) == "1") then
				one = one + 1
			else if (str(i:i) == "2") then
				two = two + 1
			else if (str(i:i) == "3") then
				three = three + 1
			else if (str(i:i) == "4") then
				four = four + 1
			else if (str(i:i) == "5") then
				five = five + 1
			else if (str(i:i) == "6") then
				six = six + 1
			else if (str(i:i) == "7") then
				seven = seven + 1
			end if
		end do
		
		if (num == 7) then
			if ((zero == 0) .and. (one == 1) .and. (two == 1) .and. (three == 1) .and. &
			    (four == 1) .and. (five == 1) .and. (six == 1) .and. (seven == 1)) then
				pandigital = .true.
				return
			end if
		end if
		if (num == 6) then
			if ((zero == 0) .and. (one == 1) .and. (two == 1) .and. (three == 1) .and. &
			    (four == 1) .and. (five == 1) .and. (six == 1)) then
				pandigital = .true.
				return
			end if
		end if
		if (num == 5) then
			if ((zero == 0) .and. (one == 1) .and. (two == 1) .and. &
				(three == 1) .and. (four == 1) .and. (five == 1)) then
				pandigital = .true.
				return
			end if
		end if
		if (num == 4) then
			if ((zero == 0) .and. (one == 1) .and. (two == 1) .and. &
				(three == 1) .and. (four == 1)) then
				pandigital = .true.
				return
			end if
		end if
		
		pandigital = .false.
		return
	end

end program Euler41
