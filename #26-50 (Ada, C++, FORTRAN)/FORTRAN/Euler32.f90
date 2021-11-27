!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler32 ~ Pandigital products
! 
! Problem Statement:
! 
! We shall say that an n-digit number is pandigital if it makes
! use of all the digits 1 to n exactly once; for example, the
! 5-digit number, 15234, is 1 through 5 pandigital.
!
! The product 7254 is unusual, as the identity, 39 × 186 = 7254,
! containing multiplicand, multiplier, and product is 1 through 9
! pandigital.
!
! Find the sum of all products whose multiplicand/multiplier/
! product identity can be written as a 1 through 9 pandigital.
!
! HINT: Some products can be obtained in more than one way so be
! sure to only include it once in your sum.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Figuring out the max limit to calculate values is the biggest
! hurdle in reducing the run time. By inspection, when churning
! out values without an upper limit we can tell that the factors
! begin to repeat in opposite order, e.g. 39 x 186 and 186 x 39
! give the same product 7254. It can also be seen that for integers
! 1-9 there are not factors of products greater than 50 and 2000,
! so those can serve as our upper limit. We just then need to make
! sure no repeats are added into the product vector and calculate
! the sum when finished.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler32
	
	implicit none
	integer :: time_start, time_finish, clock_finish, solution = 0
	integer :: i, a, b, c = 1, p = 1
	integer, dimension(10) :: products = 0
	character(10) :: Astr
	character(10) :: Bstr
	character(10) :: Cstr
	
	call SYSTEM_CLOCK(time_start)
	
	do a = 1,50
		do b = 1,2000
			c = a*b
			write(Astr,'(I0)') a
			write(Bstr,'(I0)') b
			write(Cstr,'(I0)') c
			if (pandigital(Astr,Bstr,Cstr)) then
				if (ANY(products==c)) then
					
				else
					products(p) = c
					p = p + 1
				end if
			end if 
		end do
	end do
	
	do i = 1,p
		solution = solution + products(i)
	end do
	
	call SYSTEM_CLOCK(time_finish)
	clock_finish = time_finish - time_start
	write (*,"(A10,I10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."

contains

	logical function pandigital(str1,str2,str3)
		character(10) :: str1
		character(10) :: str2
		character(10) :: str3
		character :: a,b
		integer :: i, zero, one, two, three, four, five, six, seven, eight, nine

		zero = 0
		one = 0
		two = 0
		three = 0
		four = 0
		five = 0
		six = 0
		seven = 0
		eight = 0
		nine = 0
		
		do i = 1,(LEN(str1))
			if(str1(i:i) == '0') then
				zero = zero + 1
			end if
			if(str1(i:i) == '1') then
				one = one + 1
			end if
			if(str1(i:i) == '2') then
				two = two + 1
			end if
			if(str1(i:i) == '3') then
				three = three + 1
			end if
			if(str1(i:i) == '4') then
				four = four + 1
			end if
			if(str1(i:i) == '5') then
				five = five + 1
			end if
			if(str1(i:i) == '6') then
				six = six + 1
			end if
			if(str1(i:i) == '7') then
				seven = seven + 1
			end if
			if(str1(i:i) == '8') then
				eight = eight + 1
			end if
			if(str1(i:i) == '9') then
				nine = nine + 1
			end if
		end do
		
		do i = 1,(LEN(str2))
			if(str2(i:i) == '0') then
				zero = zero + 1
			end if
			if(str2(i:i) == '1') then
				one = one + 1
			end if
			if(str2(i:i) == '2') then
				two = two + 1
			end if
			if(str2(i:i) == '3') then
				three = three + 1
			end if
			if(str2(i:i) == '4') then
				four = four + 1
			end if
			if(str2(i:i) == '5') then
				five = five + 1
			end if
			if(str2(i:i) == '6') then
				six = six + 1
			end if
			if(str2(i:i) == '7') then
				seven = seven + 1
			end if
			if(str2(i:i) == '8') then
				eight = eight + 1
			end if
			if(str2(i:i) == '9') then
				nine = nine + 1
			end if
		end do
		
		do i = 1,(LEN(str3))
			if(str3(i:i) == '0') then
				zero = zero + 1
			end if
			if(str3(i:i) == '1') then
				one = one + 1
			end if
			if(str3(i:i) == '2') then
				two = two + 1
			end if
			if(str3(i:i) == '3') then
				three = three + 1
			end if
			if(str3(i:i) == '4') then
				four = four + 1
			end if
			if(str3(i:i) == '5') then
				five = five + 1
			end if
			if(str3(i:i) == '6') then
				six = six + 1
			end if
			if(str3(i:i) == '7') then
				seven = seven + 1
			end if
			if(str3(i:i) == '8') then
				eight = eight + 1
			end if
			if(str3(i:i) == '9') then
				nine = nine + 1
			end if
		end do
		
		if((zero == 0) .and. (one == 1) .and. (two == 1) .and. (three == 1) .and. &
    	   (four == 1) .and. (five == 1) .and. (six == 1) .and. (seven == 1) .and. &
		   (eight == 1) .and. (nine == 1)) then
			pandigital = .true.
			return
		end if
		pandigital = .false.
		return
	end

end program Euler32
