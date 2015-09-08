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

	rep_zero:STRING = " _ | ||_|"	--representation of the number 0 using pipes and underscores
	rep_one:STRING = "     |  |"	--representation of the number 1 using pipes and underscores
	rep_two:STRING = " _  _||_ "	--representation of the number 2 using pipes and underscores
	rep_three:STRING = " _  _| _|"	--representation of the number 3 using pipes and underscores
	rep_four:STRING = "|_|  |  |"	--representation of the number 4 using pipes and underscores
	rep_five:STRING = " _ |_  _|"	--representation of the number 5 using pipes and underscores
	rep_six:STRING = " _ |_ |_|"	--representation of the number 6 using pipes and underscores
	rep_seven:STRING = " _   |  |"	--representation of the number 7 using pipes and underscores
	rep_eight:STRING = " _ |_||_|"	--representation of the number 8 using pipes and underscores
	rep_nine:STRING = " _ |_|  |"	--representation of the number 8 using pipes and underscores

	make
			--default constructor
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
     		valid_rep : is_a_valid_string_rep(rep)
		do

			if(rep.is_equal(rep_zero))then
				value:=0
			else
				if(rep.is_equal(rep_one))then
					value:=1
				else
					if(rep.is_equal(rep_two))then
						value:=2
					else
						if(rep.is_equal(rep_three))then
							value:=3
						else
							if(rep.is_equal(rep_four))then
								value:=4
							else
								if(rep.is_equal(rep_five))then
									value:=5
								else
									if(rep.is_equal(rep_six))then
										value:=6
									else
										if(rep.is_equal(rep_seven))then
											value:=7
										else
											if(rep.is_equal(rep_eight))then
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


	is_a_valid_string_rep (rep: STRING) : BOOLEAN
			-- The routine takes a string as a parameter and returns a boolean.
			-- If the string is equal to the representation of any of the nine
			-- digits, returns true, otherwise returns false
    	local
      		is_zero,is_one,is_two,is_three,is_four,is_five,is_six,is_seven,is_eight,is_nine : BOOLEAN
    	do
      		is_zero := rep.is_equal(rep_zero)
			is_one := rep.is_equal(rep_one)
			is_two := rep.is_equal(rep_two)
			is_three := rep.is_equal(rep_three)
      		is_four := rep.is_equal(rep_four)
			is_five := rep.is_equal(rep_five)
			is_six := rep.is_equal(rep_six)
      		is_seven := rep.is_equal(rep_seven)
			is_eight := rep.is_equal(rep_eight)
			is_nine := rep.is_equal(rep_nine)
		Result := is_one or is_two or is_three or is_four or is_five or is_six or is_seven or is_eight or is_nine
    	end


	set_value (new_value: INTEGER)
			--Set 'value' with 'new_value'
		require
			new_value >= 0 and new_value <= 9
		do
			value := new_value
		ensure
			value = new_value
		end

	set_value_from_string_rep(new_value: STRING)
			-- Set value from a string passed as a parameter.
			-- The string parameter should have nine characters long and
			-- only underscore, pipe or space characters.
		require
			valid_strig: new_value.count = 9 and is_a_valid_string_rep(new_value)
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


	out: STRING
			-- The method is used to get a string representing the value of the number
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
