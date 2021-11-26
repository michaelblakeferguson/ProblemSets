!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler36 ~ Double-base palindromes
! 
! Problem Statement:
! 
! The decimal number, 585 = 10010010012 (binary), is palindromic in
! both bases.
! 
! Find the sum of all numbers, less than one million, which are
! palindromic in base 10 and base 2.
! 
! (Please note that the palindromic number, in either base, may not
! include leading zeros.)
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Converts the integer in base 10 to a string and checks if it is
! a palindrome. Then converts the integer to base 2 and repeats the
! process. If it passes both palindrome checks the integer value is
! added to the solution.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler36
	
	implicit none
	integer :: time_start, time_finish, clock_finish, solution = 0, i
	character(10) :: s1
	character(32) :: s1B
	call SYSTEM_CLOCK(time_start)
	
	do i = 1,1000000
		write (s1,'(I0)') i
		if (palindrome(s1)) then
			write(s1B,'(B0)') i
			if (palindromeB(s1B)) then
				solution = solution + i
			end if
		end if
	end do

	call SYSTEM_CLOCK(time_finish)
	clock_finish = time_finish - time_start
	write (*,"(A10,I10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."

contains

	logical function palindrome(s1)
		character(10) :: s1
		character(:), allocatable :: str
		character :: a,b
		integer :: i
		
		str = trim(s1)
		do i = 0,(len(str)/2)
			
			a = str((i+1):(i+1))
			b = str((len(str)-i):(len(str)-i))
			if (a /= b) then
				palindrome = .false.
				return
			end if
		end do
		palindrome = .true.
		return
	end
	
	logical function palindromeB(s1B)
		character(32) :: s1B
		character(:), allocatable :: str
		character :: a,b
		integer :: i
		
		str = trim(s1B)
		do i = 0,(len(str)/2)
			
			a = str((i+1):(i+1))
			b = str((len(str)-i):(len(str)-i))
			if (a /= b) then
				palindromeB = .false.
				return
			end if
		end do
		palindromeB = .true.
		return
	end

end program Euler36
