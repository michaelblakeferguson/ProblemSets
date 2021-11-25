!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler33 ~ Digit cancelling fractions
! 
! Problem Statement:
! 
! The fraction 49/98 is a curious fraction, as an inexperienced
! mathematician in attempting to simplify it may incorrectly
! believe that 49/98 = 4/8, which is correct, is obtained by
! cancelling the 9s.
!
! We shall consider fractions like, 30/50 = 3/5, to be trivial
! examples.
!
! There are exactly four non-trivial examples of this type of
! fraction, less than one in value, and containing two digits
! in the numerator and denominator.
!
! If the product of these four fractions is given in its lowest
! common terms, find the value of the denominator.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Two for loops iterate through the possible values for the 2-digit
! numerator and denominator. The digits are then extracted and
! compared to check for equality. The decimal form is then found
! for the digits that aren't cancelled and checked for equality
! to q. The last step is to calculate the product and reduce the
! denominator.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler33

	implicit none
	integer :: time_start, time_finish, clock_finish, solution
	integer :: a, b, c, d, i, j, numer = 1, denom = 1
	real :: q,z

	call SYSTEM_CLOCK(time_start)

	do i = 11,100
	
		do j = i+1,100
			
			a = modulo((i/10),10)
			b = modulo(i,10)
			c = modulo((j/10),10)
			d = modulo(j,10)
			
			q = real(i)/real(j)
			if (q < 1) then
				if (b /= 0 .and. d /= 0) then
					if (a == c) then
						if(abs(real(b)/real(d) - q) < epsilon(q)) then
							numer = numer * i
							denom = denom * j
						end if
					else if (a == d) then
						if(abs(real(b)/real(c) - q) < epsilon(q)) then
							numer = numer * i
							denom = denom * j
						end if
					end if
					if (b == c) then
						if(abs(real(a)/real(d) - q) < epsilon(q)) then
							numer = numer * i
							denom = denom * j
						end if
					else if (b == d) then
						if(abs(real(a)/real(c) - q) < epsilon(q)) then
							numer = numer * i
							denom = denom * j
						end if
					end if
				end if
			end if
		end do
	end do

	solution = denom / numer

	call SYSTEM_CLOCK(time_finish)
	clock_finish = time_finish - time_start
	write (*,"(A10,I10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."

end program Euler33
