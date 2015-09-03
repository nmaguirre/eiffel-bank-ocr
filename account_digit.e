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
	local
		zero,one,two,three,four,five,six,seven,eight,nine:STRING
	do

		zero := " _ | ||_|"	--representation of the number 0 using pipes and underscores
		one := "  |  |  |"	--representation of the number 1 using pipes and underscores
		two := " _  _||_ "	--representation of the number 2 using pipes and underscores
		three := " _  _| _|"	--representation of the number 3 using pipes and underscores
		four := "|_|  |  |"	--representation of the number 4 using pipes and underscores
		five := " _ |_  _|"	--representation of the number 5 using pipes and underscores
		six := " _ |_ |_|"	--representation of the number 6 using pipes and underscores
		seven := " _   |  |"	--representation of the number 7 using pipes and underscores
		eight := " _ |_||_|"	--representation of the number 8 using pipes and underscores
		nine := " _ |_|  |"	--representation of the number 8 using pipes and underscores

		if(rep.is_equal(zero))then
			value:=0
		else
			if(rep.is_equal(one))then
				value:=1
			else
				if(rep.is_equal(two))then
					value:=2
				else
					if(rep.is_equal(three))then
						value:=3
					else
						if(rep.is_equal(four))then
							value:=4
						else
							if(rep.is_equal(five))then
								value:=5
							else
								if(rep.is_equal(six))then
									value:=6
								else
									if(rep.is_equal(seven))then
										value:=7
									else
										if(rep.is_equal(eight))then
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
    do
      result :=(rep.is_equal(" _ | ||_|") or rep.is_equal("  |  |  |") or rep.is_equal(" _  _||_ ") or rep.is_equal(" _  _| _|") or rep.is_equal("|_|  |  |") or rep.is_equal(" _ |_  _|") or rep.is_equal(" _ |_ |_|" or rep.is_equal(" _   |  |") or rep.is_equal(" _ |_||_|") or rep.is_equal(" _ |_|  |"))
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
			ensure
				value = new_value
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
