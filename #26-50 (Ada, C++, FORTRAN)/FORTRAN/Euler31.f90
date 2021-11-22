!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler31 ~ Coin sums
! 
! Problem Statement:
! 
! In the United Kingdom the currency is made up of pound and pence.
! There are eight coins in general circulation:
! 
!      1p, 2p, 5p, 10p, 20p, 50p, $1, $2 (200p).
! 
! It is possible to make $2 in the following way:
! 
!      1x$1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p
! 
! How many different ways can $2 be made using any number of coins?
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Calls the countcoins() function with initial value of 200.
! The function then begins to test values of the coins array
! checking to see if they can be removed from the total to get
! zero indicating they evenly add up to 200. By recursively
! calling itself the function finds all possible iterations of the
! coins from a topdown approach.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler31

	implicit none
	integer :: time_start, time_finish, clock_finish, solution

	call SYSTEM_CLOCK(time_start)

	solution = countcoins(200,1)

	call SYSTEM_CLOCK(time_finish)
	clock_finish = time_finish - time_start
	write (*,"(A10,I10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."

contains

	recursive function countcoins(total,coin) result(sum_)
		integer, dimension(8) :: coins = (/200, 100, 50, 20, 10, 5, 2, 1/)
		integer, intent(in) :: total, coin
		integer :: sum_, i
		sum_ = 0
		if (coin == 8) then
			sum_ = 1
			return
		end if
		do i = coin,8
			if ((total - coins(i)) == 0) then
				sum_ = sum_ + 1
			end if
			if ((total - coins(i)) > 0) then
				sum_ = sum_ + countcoins((total-coins(i)), i)
			end if
		end do
		return
	end

end program Euler31
