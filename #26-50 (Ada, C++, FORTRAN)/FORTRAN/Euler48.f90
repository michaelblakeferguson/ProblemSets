!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler48 ~ Self powers
! 
! Problem Statement:
! 
! The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
!
! Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ...
! + 1000^1000.
! 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Algorithm Explanation:
! 
! Trivial problem when using the FM library. Loop through 1 to 1000
! adding each rop output to sum, then extracting the final 10 digits.
!
! Compilation --> Compiled using Windows PowerShell
!		  gfortran Euler48.f90 -c -O3
!                 gfortran fmsave.o FM.o FMZM90.o Euler48.o -o Euler48
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Euler48
	USE FMZM
	
	implicit none
	integer :: time_start, time_finish, clock_finish
	character(10) :: solution
	
	TYPE(IM), SAVE :: ROP, SUM_, BIG_i
	CHARACTER(3500)  :: STR
	integer :: i
	
	call SYSTEM_CLOCK(time_start)
	
	SUM_ = 0
	do i = 1,1000
		BIG_i = TO_IM(i)
		ROP = BIG_i ** BIG_i
		SUM_ = SUM_ + ROP
	end do

	CALL IM_FORM('I3500',SUM_,STR)
    
	STR = trim(STR)
	solution = STR(LEN(STR)-9:LEN(STR))

	call SYSTEM_CLOCK(time_finish)
	clock_finish = time_finish - time_start
	write (*,"(A10,A10,//,A21,I5,A14)") "Solution: ",solution,"Program completed in ",clock_finish," milliseconds."

end program Euler48
