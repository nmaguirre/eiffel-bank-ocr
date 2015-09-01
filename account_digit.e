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
	end

	make_from_string_rep (rep: STRING)
	do

	end

feature {ANY} -- Status setting

	set_value (new_value: INTEGER)
	do
		value := new_value
	end

	-- Set value from a string passed as a parameter
	-- The string parameter should have nine characters long and
	-- only underscore, pipe or space.
	set_value_from_string_rep(new_value: STRING)
	do

	end

	out: STRING

feature {ANY} -- Status report

	value: INTEGER


invariant
	value>=0 and value<=9

end
