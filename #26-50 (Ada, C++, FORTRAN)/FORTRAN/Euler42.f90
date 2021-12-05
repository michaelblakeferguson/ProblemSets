!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler42 ~ Coded triangle numbers
! 
! Problem Statement:
! 
! The nth term of the sequence of triangle numbers is given by,
! t_n = 1/2*n(n+1); so the first ten triangle numbers are:
! 
!		1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
! 
! By converting each letter in a word to a number corresponding to
! its alphabetical position and adding these values we form a word
! value. For example, the word value for SKY is 19 + 11 + 25 = 55
! = t_10. If the word value is a triangle number then we shall call
! the word a triangle word.
! 
! Using words.txt, a 16K text file containing nearly two-thousand
! common English words, how many are triangle words?
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Loads words.txt into a vector and iterates checking for chars that
! are alphanumeric. When the start of a word is found, the length is
! determined, a value is calculated for it, it is checked for
! triangularity. If it passes, solution is incremented.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler42

    implicit none
	integer :: time_start, time_finish, clock_finish, solution
	
    character(len=:), allocatable :: words
    integer                       :: file_unit, n, rc, i, j, k, length, value_, c1, c2, c3

    open (access  = 'stream', action  = 'read', file    = 'words.txt', &
          form    = 'unformatted', iostat  = rc, newunit = file_unit)	  
    if (rc /= 0) stop 'Error opening words.txt'

    inquire (file_unit, size=n)
    allocate (character(len=n) :: words)

    read (file_unit, iostat=rc) words
    close (file_unit)

	call SYSTEM_CLOCK(time_start)

	i = 0
	j = 0
	length = 0
	value_ = 0
    do while (i .LT. LEN(words))
	
		!find starting alphanumeric char of word
		c1 = IACHAR(words(i+1:i+1))
		if (c1 .GE. 65 .AND. c1 .LE. 90) then
		
			!determine length of word
			j = 0
			c2 = 65
			do while (c2 .GE. 65 .AND. c2 .LE. 90)
				c2 = IACHAR(words(i+j+1:i+j+1))
				length = length + 1
				j = j + 1
			end do
			
			!calculate value of word
			value_ = 0
			do k = i,(i+j-2)
				c3 = IACHAR(words(k+1:k+1))
				value_ = value_ + c3 - 64
			end do
			
			!determine if word is triangular
			if (isTriangular(value_)) then
				solution = solution + 1
			end if
			
			i = i + j - 1
			
		end if
		
		i = i + 1
		length = 0
		value_ = 0
		
	end do
	
	call SYSTEM_CLOCK(time_finish)
	clock_finish = time_finish - time_start
	write (*,"(A10,I10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."
	
contains

	logical function isTriangular(val_)
		integer, intent(in) :: val_
		
		if((val_ == 1) .or. (val_ == 3) .or. (val_ == 6) .or. (val_ == 10) .or. &
		   (val_ == 15) .or. (val_ == 21) .or. (val_ == 28) .or. (val_ == 36) .or. &
		   (val_ == 45) .or. (val_ == 55) .or. (val_ == 66) .or. (val_ == 78) .or. &
		   (val_ == 91) .or. (val_ == 105) .or. (val_ == 120) .or. (val_ == 136) .or. &
		   (val_ == 153) .or. (val_ == 171)) then
				isTriangular = .true.
				return
		end if
		isTriangular = .false.
		return	
	end
	
end program Euler42
