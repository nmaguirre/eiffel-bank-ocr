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

	make_from_string_rep (rep: STRING)
			-- Class Creator
			-- Take as parameter a digit codified as a STRING and
			-- assign its corresponding value to the 'value' feature.
			-- 'rep' has mandatorily 9 chars long & is composed
			-- exclusively by the chars '|',' ' and '_'.
		require
			rep.count=9
	do

	end

feature {ANY} -- Status setting

	set_value (new_value: INTEGER)
	--Change the value of the account digit
	require
		new_value >= 0 and new_value <= 9
	do
		value := new_value
	end

	set_value_from_string_rep(new_value: STRING)
			-- Set value from a string passed as a parameter.
			-- The string parameter should have nine characters long and
			-- only underscore, pipe or space characters.
		local
			character:STRING
			Res:STRING
			i:INTEGER
		do
				character.append (new_value.head (9))
				if(character=" _ | ||_|")then
					Res.append("0")
				end
				if(character="  |  |  |")then
					Res.append("1")
				end
				if(character=" _  _||_ ")then
					Res.append("2")
				end
				if(character=" _  _| _|")then
					Res.append("3")
				end
				if(character="|_|  |  |")then
					Res.append("4")
				end
				if(character=" _ |_  _|")then
					Res.append("5")
				end
				if(character=" _ |_ |_|")then
					Res.append("6")
				end
				if(character=" _   |  |")then
					Res.append("7")
				end
				if(character=" _ |_||_|")then
					Res.append("8")
				end
				if(character=" _ |_|  |")then
					Res.append("9")
				end
		end

	-- The method is used to get a string representing the value of the number
	out: STRING
	local
		value_string:STRING -- Used to temporarily save a string depending the value of the number
	do
		inspect
			value
		when 0 then
			value_string:=" _ | ||_|"
		when 1 then
			value_string:="  |  |  |"
		when 2 then
			value_string:=" _  _||_ "
		when 3 then
			value_string:=" _  _| _|"
		when 4 then
			value_string:="|_|  |  |"
		when 5 then
			value_string:=" _ |_  _|"
		when 6 then
			value_string:=" _ |_ |_|"
		when 7 then
			value_string:=" _   |  |"
		when 8 then
			value_string:=" _ |_||_|"
		when 9 then
			value_string:=" _ |_|  |"
		else
			value_string:="value error"
		end
		result:=value_string -- Returns the string
	end

feature {ANY} -- Status report

	value: INTEGER


invariant

	value>=0 and value<=9
			--the value must be a digit, then it must be between 0 and 9
end
