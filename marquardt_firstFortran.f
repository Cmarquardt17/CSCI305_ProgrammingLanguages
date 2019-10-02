	! Christian Marquardt
	! CSCI305 Lab1 FORTRAN
	! 01-23-2019
	! Overview: This program gives change back from 1-99 (US Currency)

	program firstFortran
	implicit none
	integer :: value, quarter, dime, nickel, penny     !Integers that will be used to conduct the change
	
	!This is for the current date and time that is stated right user input
	character(len=8) :: DateINFO !ccyymmdd
	character(len=4) :: Year, Month*2, Day*2
	character(len=10) :: TimeINFO, PrettyTime*12 !hhmmss.sss
	character(len=2) :: Hour, Minute, Second*6
	
	CALL DATE_AND_TIME(DateINFO, TIMEINFO)		

	!These lines state the criteria for each variable
	Year = DateINFO(1:4)
	Month = DateINFO(5:8)
	Day = DateINFO(7:8)
	
	Hour = TimeINFO(1:2)
	Minute = TimeINFO(3:4)
	
	!This is where we write and format it, we use "A" because they are characters
	WRITE(*,*) "Here is the current date and time"
	Write(*,"(A, A2, A)", advance = "no") " ", Month, "-"
	WRITE(*,"(A2, A)", advance = "no") Day, "-"
	WRITE(*,"(A4, A)", advance = "no") Year, ","
	WRITE(*,"(A2, A)", advance = "no") Hour, ":"
	WRITE(*,"(A2)") Minute

	!This is the value that we will need to breakdown and get change back until value =0
	READ(*,*) value
	
	!A nested for loop is created to ensure that we are within...
	! the parameters of 1-99 as stated in criteria
	if (value > 0 .AND. value < 100) then

		!This block of code calls the function totalCoins for each coin value...
		! and returns the amount of the coin 
		!After we return the coin we want to change the actual variable value...
		! so we can get the correct number for later coins
		quarter = totalCoins(25, value)
		value = value - (quarter*25)
		dime = totalCoins(10, value)
		value = value - (dime*10)
		nickel = totalCoins(5, value)
		value = value - (nickel*5)
		penny = totalCoins(1, value)
		value = value - (penny*1)
		
		!All of these if statements will print if there is atleast 1 coin of that value
		!Using non-advancing writing and formatting makes everything stay on one line
		if (quarter > 0) then
			write(*,"(I1)",advance="no") quarter
			write(*,"(A9)",advance="no") " Quarter "
		end if
	
		if (dime > 0) then
			write(*,"(I1)",advance="no") dime
			write(*,"(A6)",advance="no") " Dime "
		end if
	
		if (nickel > 0) then
			write(*,"(I1)", advance="no") nickel 
		write(*,"(A8)",advance="no") " Nickel "
		end if

		if (penny > 0) then
		write(*,"(I1)", advance ="no") penny
		write(*,"(A7)") " Penny "
		end if
	
	!This is the main if statement to tell the user that they have put in an incorrect input
	else
		WRITE(*,*) "Incorrect input please run the program and try again"
	end if
	
	!Here is an internal function that take the coin value and the current user input value
	!This will return the amount of coins for the best case scenario
	!I wanted to create another method that updated the value but I ran into too many errors with little time
	!I also wanted to avoid using global variables within this internal function
	CONTAINS
		Integer function totalCoins(coinVal, totalVal)
		implicit none
		integer, intent(in) :: coinVal, totalVal
		integer :: coin
		coin = totalVal/coinVal
		totalCoins = coin
		End function totalCoins

	!End of the program
	end program firstFortran
