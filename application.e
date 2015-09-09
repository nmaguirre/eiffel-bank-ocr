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
			top,mid,both: STRING
			account: ACCOUNT_NUMBER
			account_number_path : STRING
	do
			create account_number_path.make_empty
			io.read_line
			account_number_path := io.last_string
			create accounts.make_open_read (account_number_path)

			from accounts.read_line until accounts.end_of_file loop
				create top.make_from_string (accounts.last_string)
				accounts.read_line
				create mid.make_from_string(accounts.last_string)
				accounts.read_line
				create both.make_from_string(accounts.last_string)
				if (not accounts.end_of_file) then
					accounts.read_line
				end
				create account.make
				account.make_from_string(top,mid,both)
				if (account.is_valid_account_number) then
					print (account.as_integer.out + " OK%N")
				else
					print (account.as_integer.out + " ERR%N")
				end
			end

		end

end

