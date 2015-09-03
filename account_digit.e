note
	description	: "Summary description for {ACCOUNT_DIGIT}."
	author		: ""
	date			: "02-09-2015"
	revision		: "0.1"

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
	local
		zero,one,two,three,four,five,six,seven,eight,nine:STRING
	do





		zero := " _ | ||_|"
		one := "  |  |  |"
		two := " _  _||_ "
		three := " _  _| _|"
		four := "|_|  |  |"
		five := " _ |_  _|"
		six := " _ |_ |_|"
		seven := " _   |  |"
		eight := " _ |_||_|"
		nine := " _ |_|  |"

		if(rep = zero)then
			value:=0
		else
			if(rep = one)then
				value:=1
			else
				if(rep = two)then
					value:=2
				else
					if(rep = three)then
						value:=3
					else
						if(rep = four)then
							value:=4
						else
							if(rep = five)then
								value:=5
							else
								if(rep = six)then
									value:=6
								else
									if(rep = seven)then
										value:=7
									else
										if(rep = eight)then
											value:=8
										else
											value:=9
										end
									end
								end
							end
						end
					end
				end
			end
		end

	end
feature {ANY} -- Status setting

	set_value (new_value: INTEGER)
			--Set 'value' with 'new_value'
		require
			new_value >= 0 and new_value <= 9
		do
			value := new_value
		end

	set_value_from_string_rep(new_value: STRING)
			-- Set value from a string passed as a parameter.
			-- The string parameter should have nine characters long and
			-- only underscore, pipe or space characters.
		do
				if(new_value=" _ | ||_|")then
					value:=0
				end
				if(new_value="  |  |  |")then
					value:=1
				end
				if(new_value=" _  _||_ ")then
					value:=2
				end
				if(new_value=" _  _| _|")then
					value:=3
				end
				if(new_value="|_|  |  |")then
					value:=4
				end
				if(new_value=" _ |_  _|")then
					value:=5
				end
				if(new_value=" _ |_ |_|")then
					value:=6
				end
				if(new_value=" _   |  |")then
					value:=7
				end
				if(new_value=" _ |_||_|")then
					value:=8
				end
				if(new_value=" _ |_|  |")then
					value:=9
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
