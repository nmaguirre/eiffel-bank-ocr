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
			-- this rutine set account number from a string representation
			-- assuming that account_number is a concatenation of strings representation of account digits
	local
		i, j, k: INTEGER
		account_digit : ACCOUNT_DIGIT
		string_digit : STRING
	do
		from
			i := 9
			j := account_number.count
			k := j-8
		until i<1 or k<1
		loop
			string_digit := account_number.substring(k, j)
			create account_digit.make_from_string_rep(string_digit)
			number.at(i) := account_digit
			i := i-1
			j := k-1
			k := k-9
		end

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
		local
			i: INTEGER
			is_valid: BOOLEAN
			check_sum: INTEGER
			aux: INTEGER
		do
			check_sum:= 0
			from
				i:=1
			until
				i>number.count
			loop
				aux:= 10 - i
				check_sum:= check_sum + (aux * number.at(i).value)
			end
		if ((check_sum \\ 11) = 0) then
			is_valid:= True
		else
			is_valid:= False
		end
		Result:= is_valid
		end

feature {NONE}

	number: ARRAY [ACCOUNT_DIGIT]

invariant
	number.count = 9

end
