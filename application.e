note
	description : "eiffel-bank-ocr application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application. Application read a path from the command line,
			-- corresponding to the file containing the account numbers,
			-- and prints out each account number followed by OK or ERR, according to
			-- whether it's a valid account number or not, on standard output.
		local
			accounts: PLAIN_TEXT_FILE
			line: STRING
			account: ACCOUNT_NUMBER
		do
			--| Add your code here
			create accounts.make_open_read ("accounts.txt")
			create line.make_empty
			accounts.read_line
			line.append (accounts.last_string)
			accounts.read_line
			line.append (accounts.last_string)
			accounts.read_line
			line.append (accounts.last_string)
			create account.make
			account.set_account_number_from_string_rep (line)
			if (account.is_valid_account_number) then
				print (account.as_integer.out + " OK%N")
			else
				print (account.as_integer.out + " ERR%N")
			end


		end

end
