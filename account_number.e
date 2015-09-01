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
	do
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
	do
		number[pos]:=digit
	end


	is_valid_account_number: BOOLEAN
		do
		end

feature {NONE}

	number: ARRAY [ACCOUNT_DIGIT]

invariant
	number.count = 9

end
