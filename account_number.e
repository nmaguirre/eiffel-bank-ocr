note
	description	: "Summary description for {ACCOUNT_NUMBER}."
	author		: ""
	date			: "02-09-2015"
	revision		: "0.1"

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
			-- Allocate array number; set index interval to
			-- 1 .. 9; set all values to default (void).
		do
			create number.make_filled(void,1,9)
		end

feature

	out: STRING
			--This routine return a number using pipes and underscores
		local
			index:INTEGER -- Line index
			row:INTEGER -- Current line number
			NumberCheck:ACCOUNT_DIGIT -- Current number
			Printer:STRING -- Used to save a string
		do
			from
				row:=1
			until
				row>3
			loop
				from
					index:=1
				until
					index>9
				loop
					NumberCheck:=number.item (index)
					if(NumberCheck.value=0) then
						if(row=1) then
							Printer.append (" _ ")
						else
							if(row=2)then
								Printer.append ("| |")
							else
								if(row=3)then
									Printer.append ("|_|")
								end
							end
						end
					end
					if(NumberCheck.value=1)then
						if(row=1) then
							Printer.append ("  |")
						else
							if(row=2)then
								Printer.append ("  |")
							else
								if(row=3)then
									Printer.append ("  |")
								end
							end
						end
					end
					if(NumberCheck.value=2)then
						if(row=1) then
							Printer.append (" _ ")
						else
							if(row=2)then
								Printer.append (" _|")
							else
								if(row=3)then
									Printer.append ("|_ ")
								end
							end
						end
					end
					if(NumberCheck.value=3)then
						if(row=1) then
							Printer.append (" _ ")
						else
							if(row=2)then
								Printer.append (" _|")
							else
								if(row=3)then
									Printer.append (" _|")
								end
							end
						end
					end
					if(NumberCheck.value=4)then
						if(row=1) then
							Printer.append ("|_|")
						else
							if(row=2)then
								Printer.append ("  |")
							else
								if(row=3)then
									Printer.append ("  |")
								end
							end
						end
					end
					if(NumberCheck.value=5)then
						if(row=1) then
							Printer.append (" _ ")
						else
							if(row=2)then
								Printer.append ("|_ ")
							else
								if(row=3)then
									Printer.append (" _|")
								end
							end
						end
					end
					if(NumberCheck.value=6)then
						if(row=1) then
							Printer.append (" _ ")
						else
							if(row=2)then
								Printer.append ("|_ ")
							else
								if(row=3)then
									Printer.append ("|_|")
								end
							end
						end
					end
					if(NumberCheck.value=7)then
						if(row=1) then
							Printer.append (" _ ")
						else
							if(row=2)then
								Printer.append ("  |")
							else
								if(row=3)then
									Printer.append ("  |")
								end
							end
						end
					end
					if(NumberCheck.value=8)then
						if(row=1) then
							Printer.append (" _ ")
						else
							if(row=2)then
								Printer.append ("|_|")
							else
								if(row=3)then
									Printer.append ("|_|")
								end
							end
						end
					end
					if(NumberCheck.value=9)then
						if(row=1) then
							Printer.append (" _ ")
						else
							if(row=2)then
								Printer.append ("|_|")
							else
								if(row=3)then
									Printer.append("  |")
								end
							end
						end
					end
					index:=index+1
				end
				Printer.append ("%N")
				row:=row+1
			end
			Result:=Printer
		end

	set_account_number_from_string_rep(account_number: STRING)
			-- this rutine set account number from a string representation
			-- assuming that account_number is a concatenation of strings representation of account digits
		require
			account_number /= Void
			account_number.count = 81
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
		require
			other_account_number_valid : other_account_number >= 100000000 and other_account_number <= 999999999

		local
			aux,i,divider,next: INTEGER
			number_account_digit : ACCOUNT_DIGIT
		do
			next:= other_account_number
			from
				divider:= 100000000
				i:= 1
			invariant
				(1<=i) and (i<=9)
			variant
				9-i
			until
				i>9
			loop
				aux:= next//divider
				next:= next - (aux*divider)
				create number_account_digit.make
				number_account_digit.set_value(aux)
				number[i]:= number_account_digit
				i:= i+1
				divider:= divider//10
			end
		ensure
			as_integer = other_account_number
		end


	set_digit(pos: INTEGER; digit: ACCOUNT_DIGIT)
			--this routine put "digit" in position "pos"
		require
			valid_position: (pos>=1 and pos<10)
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
			check_sum: INTEGER
			aux: INTEGER
		do
			check_sum:= 0
			aux:= 100000000
			from
				i:=1
			until
				i<number.count
			loop
				check_sum:= check_sum + (number.at(i).value * aux)
				i:= i+1
				aux:= aux // 10
			end
		Result:= ((check_sum \\ 11) = 0)
		end

	as_integer : INTEGER
			--this routine produces an integer representation from the array of account digits
		local
			sum : INTEGER
			unit : INTEGER
			i :INTEGER
		do
			sum:=0
			unit:=100000000
			from i:=1 until i>9 loop
				sum:=sum+(number[i].value*unit)
				unit:=unit//10
				i:=i+1
			end
			Result:=sum
		end


feature {ACCOUNT_NUMBER_TESTS}

	number: ARRAY [ACCOUNT_DIGIT]

invariant
	number.count = 9

end
