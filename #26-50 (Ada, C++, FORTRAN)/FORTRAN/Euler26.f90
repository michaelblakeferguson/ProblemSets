!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler 26 ~ Reciprocal cycles
!
! Problem Statement:
! 
! A unit fraction contains 1 in the numerator. The decimal
! representation of the unit fractions with denominators 2 to 10
! are given:
! 
! 	1/2  = 0.5
! 	1/3  = 0.(3)
! 	1/4  = 0.25
! 	1/5  = 0.2
! 	1/6  = 0.1(6)
! 	1/7  = 0.(142857)
! 	1/8  = 0.125
! 	1/9  = 0.(1)
! 	1/10 = 0.1
! 
! Where 0.1(6) means 0.166666..., and has a 1-digit recurring
! cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
! 
! Find the value of d < 1000 for which 1/d contains the longest
! recurring cycle in its decimal fraction part.
! 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! This question boils down to finding the highest full reptend
! prime < 1000. Long division is used to store the decimals
! for each unit fraction up to the nth - 1 digit, +10 additional
! digits to check for repetition. If the 10 digits being checked
! aren't found in the middle of the expansion and match the end,
! we know we have found a full reptend prime. And since the larger
! the denominator the larger the reptend, we only need to find the
! first full reptend starting from 1000 to know we have the largest
! full reptend prime.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler26

integer :: solution

integer :: p = 999
integer :: a, b, c, i

character (len=:), allocatable :: decimals
character (len = 10) :: front, middle, end
character :: d

do while (p > 1)
	a = 10
	b = p
	i = 0
	
	decimals = ""
	do while((a > 0) .and. (i < (b + 9))) !use long division to get decimal expansion
		
		if (b > a) then
			a = a * 10
			d = achar(0+48)
			decimals = decimals//d
		else
			c = a / b
			a = a - b * c
			a = a * 10
			d = achar(c+48)
			decimals = decimals//d
		end if
		i = i + 1
	end do
	
	if (a > 0) then !check if it is a a full reptend prime
		print *, i
		front = decimals(1:10)
		print *, front
		middle = decimals(10:p-11)
		print *, middle
		end = decimals(p-1:len(decimals))
		print *, end
		if(end == front) then
			solution = p
			EXIT
		end if
	end if
	
	p = p - 1
	print *
	print *
end do

print *, solution

end program Euler26
