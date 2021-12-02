!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler49 ~ Prime permutations
! 
! Problem Statement:
! 
! The arithmetic sequence, 1487, 4817, 8147, in which each of the
! terms increases by 3330, is unusual in two ways: (i) each of the
! three terms are prime, and, (ii) each of the 4-digit numbers are
! permutations of one another.
! 
! There are no arithmetic sequences made up of three 1-, 2-, or
! 3-digit primes, exhibiting this property, but there is one other
! 4-digit increasing sequence.
! 
! What 12-digit number do you form by concatenating the three terms
! in this sequence?
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Iterates upwards looking for prime numbers, when found it checks
! to see if p + 3330 is a permutation & prime. Then it checks if
! p + 2*3330 is a permutation & prime. The integers are then
! cast to strings and appended to the solution.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler49
	
	implicit none
	integer :: time_start, time_finish, clock_finish
	integer :: i, j, k
	character(:), allocatable :: solution
	character(4) :: aStr
	character(5) :: bStr
	character(4) :: cStr
	
	call SYSTEM_CLOCK(time_start)

	solution = ""
	do i = 1488,9999
		if (prime(i)) then
			j = i + 3330
			write(aStr,'(I0)') i
			write(bStr,'(I0)') j
			if (isPermutation(aStr,bStr)) then
				if (prime(j)) then
					k = j + 3330
					write(cStr,'(I0)') k
					if (isPermutation(aStr,bStr)) then
						if (prime(k)) then
							solution = solution // trim(aStr)
							solution = solution // trim(bStr) 
							solution = solution // trim(cStr)
							EXIT
						end if
					end if
				end if
			end if
		end if
	end do

	call SYSTEM_CLOCK(time_finish)
	clock_finish = time_finish - time_start
	write (*,"(A10,A15,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."

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
	
	logical function isPermutation(a, b)
		character(4) :: a, b
		integer, dimension(10) :: aDigits
		integer, dimension(10) :: bDigits
		integer :: i
		
		aDigits =  (/0,0,0,0,0,0,0,0,0,0 /)
		bDigits = (/0,0,0,0,0,0,0,0,0,0 /)
		
		do i = 0,(LEN(a))
			if (a(i:i) == '0') then
				aDigits(1) = aDigits(1) + 1
			end if
			if (a(i:i) == '1') then
				aDigits(2) = aDigits(2) + 1
			end if
			if (a(i:i) == '2') then
				aDigits(3) = aDigits(3) + 1
			end if
			if (a(i:i) == '3') then
				aDigits(4) = aDigits(4) + 1
			end if
			if (a(i:i) == '4') then
				aDigits(5) = aDigits(5) + 1
			end if
			if (a(i:i) == '5') then
				aDigits(6) = aDigits(6) + 1
			end if
			if (a(i:i) == '6') then
				aDigits(7) = aDigits(7) + 1
			end if
			if (a(i:i) == '7') then
				aDigits(8) = aDigits(8) + 1
			end if
			if (a(i:i) == '8') then
				aDigits(9) = aDigits(9) + 1
			end if
			if (a(i:i) == '9') then
				aDigits(10) = aDigits(10) + 1
			end if
		end do
		
		do i = 0,(LEN(b))
			if (b(i:i) == '0') then
				bDigits(1) = bDigits(1) + 1
			end if
			if (b(i:i) == '1') then
				bDigits(2) = bDigits(2) + 1
			end if
			if (b(i:i) == '2') then
				bDigits(3) = bDigits(3) + 1
			end if
			if (b(i:i) == '3') then
				bDigits(4) = bDigits(4) + 1
			end if
			if (b(i:i) == '4') then
				bDigits(5) = bDigits(5) + 1
			end if
			if (b(i:i) == '5') then
				bDigits(6) = bDigits(6) + 1
			end if
			if (b(i:i) == '6') then
				bDigits(7) = bDigits(7) + 1
			end if
			if (b(i:i) == '7') then
				bDigits(8) = bDigits(8) + 1
			end if
			if (b(i:i) == '8') then
				bDigits(9) = bDigits(9) + 1
			end if
			if (b(i:i) == '9') then
				bDigits(10) = bDigits(10) + 1
			end if
		end do
	
		if (ALL(aDigits .eq. bDigits)) then
			isPermutation = .true.
			return
		end if
		
		isPermutation = .false.
		return
	end

end program Euler49
