note
	description: "Summary description for {ACCOUNT_NUMBER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ACCOUNT_NUMBER

inherit
	ANY
		redefine
			out
		end

create
	make

feature -- Initialization

	make
			-- Class Creator
			-- Initializes number array setting all values to default.
		do
			create number.make(1,9)
		end

feature

	out: STRING
	do

	end

	set_account_number_from_string_rep(account_number: STRING)
	do

	end

	set_account_number(other_account_number: INTEGER)
			-- this rutine change the number for other_account_number
	do

	end


	set_digit(pos: INTEGER; digit: ACCOUNT_DIGIT)
		--this routine put "digit" in position "pos"
	require
		valid_position: (pos>=0 and pos<9)
		valid_digit: digit /= Void
	do
		number[pos]:=digit
	ensure
		number[pos] = digit
	end


	is_valid_account_number: BOOLEAN
			--This routine check if account number is a valid number
		do
		end

feature {NONE}

	number: ARRAY [ACCOUNT_DIGIT]

invariant
	number.count = 9

end
