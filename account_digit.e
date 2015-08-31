note
	description: "Summary description for {ACCOUNT_DIGIT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ACCOUNT_DIGIT

inherit
	ANY
		redefine
			out
		end

create
	make, make_from_string_rep

feature {ANY} -- Initialization

	make
	do
		value := 0
	end

	-- Class Creator
	-- Take as parameter a digit codified as a STRING and
	-- assign its corresponding value to the 'value' feature.
	-- 'rep' has mandatorily 9 chars long & is composed
	-- exclusively by the chars '|',' ' and '_'.
	make_from_string_rep (rep: STRING)
	do

	end

feature {ANY} -- Status setting

	set_value (new_value: INTEGER)--method used to change value to "value"
	do
		value := new_value-- set new_value for value
	end

	set_value_from_string_rep(new_value: STRING)
	do

	end

	out: STRING

feature {ANY} -- Status report

	value: INTEGER


invariant
  --this invariant controls if the digit are between 0 and 9
	value>=0 and value<=9

end
