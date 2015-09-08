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

	make_from_string(top: STRING; mid:STRING; bot:STRING)
			-- Class Creator
			-- Take a account number divided in three string wich each one represents
			-- a diferent line from the account number string representation.
		local
			res: STRING
			i,j,k: INTEGER
		do
			create res.make_empty
			from
				i := 1
			until
				i > 27
			loop
				j := i + 2
				res.append (top.substring(i,j))
				res.append (mid.substring(i,j))
				res.append (bot.substring(i,j))
				i := i + 3
			end
			set_account_number_from_string_rep(res)
		end

feature

	out: STRING
			--This routine return a number using pipes and underscores
		local
			index:INTEGER -- Line index
			row:INTEGER -- Current line number
			Printer:STRING -- Used to save a string
		do
			printer:=""
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
					if(row=1) then
						Printer.append (number[index].out.substring(1,3))
					end
					if(row=2)then
						Printer.append (number[index].out.substring(4,6))
					end
					if(row=3)then
						Printer.append (number[index].out.substring(7,9))
					end
					index:=index+1
				end
				row:=row+1
				Printer.append ("%N")
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
