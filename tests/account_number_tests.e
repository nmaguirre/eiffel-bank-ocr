note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	ACCOUNT_NUMBER_TESTS

inherit
	EQA_TEST_SET

feature -- Test routines

	test_account_number_make
			-- New test routine
		note
			testing:  "covers/{ACCOUNT_NUMBER}.make"
		local
			account_number: ACCOUNT_NUMBER
		do
			create account_number.make
			-- assert ("not_implemented", False)
		end

end


