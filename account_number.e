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
			-- Initializes number array setting all values to default.
		do
			create number.make(1,9)
		end

feature

	out: STRING
		local
			indice:INTEGER
			linea:INTEGER
			NumberCheck:ACCOUNT_DIGIT
			Printer:STRING
		do
			from
				linea:=1
			until
				linea>3
			loop
				from
					indice:=1
				until
					indice>9
				loop
					NumberCheck:=number.item (indice)
					if(NumberCheck.value=0) then
						if(linea=1) then
							Printer.append (" _ ")
						else
							if(linea=2)then
								Printer.append ("| |")
							else
								if(linea=3)then
									Printer.append ("|_|")
								end --end if3
							end -- end if2
						end --end if1
					end --end ifnumero
					if(NumberCheck.value=1)then
						if(linea=1) then
							Printer.append ("  |")
						else
							if(linea=2)then
								Printer.append ("  |")
							else
								if(linea=3)then
									Printer.append ("  |")
								end --end if3
							end -- end if2
						end --end if1
					end --end ifnumero
					if(NumberCheck.value=2)then
						if(linea=1) then
							Printer.append (" _ ")
						else
							if(linea=2)then
								Printer.append (" _|")
							else
								if(linea=3)then
									Printer.append ("|_ ")
								end
							end
						end
					end
					if(NumberCheck.value=3)then
						if(linea=1) then
							Printer.append (" _ ")
						else
							if(linea=2)then
								Printer.append (" _|")
							else
								if(linea=3)then
									Printer.append (" _|")
								end
							end
						end
					end
					if(NumberCheck.value=4)then
						if(linea=1) then
							Printer.append ("|_|")
						else
							if(linea=2)then
								Printer.append ("  |")
							else
								if(linea=3)then
									Printer.append ("  |")
								end
							end
						end
					end
					if(NumberCheck.value=5)then
						if(linea=1) then
							Printer.append (" _ ")
						else
							if(linea=2)then
								Printer.append ("|_ ")
							else
								if(linea=3)then
									Printer.append (" _|")
								end
							end
						end
					end
					if(NumberCheck.value=6)then
						if(linea=1) then
							Printer.append (" _ ")
						else
							if(linea=2)then
								Printer.append ("|_ ")
							else
								if(linea=3)then
									Printer.append ("|_|")
								end
							end
						end
					end
					if(NumberCheck.value=7)then
						if(linea=1) then
							Printer.append (" _ ")
						else
							if(linea=2)then
								Printer.append ("  |")
							else
								if(linea=3)then
									Printer.append ("  |")
								end
							end
						end
					end
					if(NumberCheck.value=8)then
						if(linea=1) then
							Printer.append (" _ ")
						else
							if(linea=2)then
								Printer.append ("|_|")
							else
								if(linea=3)then
									Printer.append ("|_|")
								end
							end
						end
					end
					if(NumberCheck.value=9)then
						if(linea=1) then
							Printer.append (" _ ")
						else
							if(linea=2)then
								Printer.append ("|_|")
							else
								if(linea=3)then
									Printer.append("  |")
								end
							end
						end
					end
					indice:=indice+1
				end
				Printer.append ("%N")
				linea:=linea+1
			end
			Result:=Printer
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
		local
			aux,i,divider,next: INTEGER
			number_account_digit : ACCOUNT_DIGIT
		do
			create number_account_digit.make
			next:= other_account_number
			from
				divider:= 100000000
				i:= 0
			until
				i>9
			loop
				aux:= next//divider
				next:= next - (aux*divider)
				number_account_digit.set_value(aux)
				number[i]:= number_account_digit
				i:= i+1
				divider:= divider//10
			end
		ensure
			number = other_account_number
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

feature -- Access	

	get_set_account_number: ARRAY [ACCOUNT_DIGIT]
		do
			Result := number
		end
feature {NONE}

	number: ARRAY [ACCOUNT_DIGIT]

invariant
	number.count = 9

end
