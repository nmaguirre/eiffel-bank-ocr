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

	test_account_number_is_valid_account_number
			-- Value of account_number should be true
			-- if the sum of the numbers multiplied by respective factors is multiple of 11
			-- for example: number account= "987654321"
			-- sum = (9*10)+(8*100)+(7*1000)+...+(1*1000000000)
			-- else should be false
		note
			testing:  "covers/{ACCOUNT_NUMBER}.is_valid_account_number"
		local
			account_number: ACCOUNT_NUMBER
			res: BOOLEAN
		do

			create account_number.make

			account_number.set_account_number(254313579)
			res := account_number.is_valid_account_number
			assert ("value of res is true", res = true)

			account_number.set_account_number(123456789)
			res := account_number.is_valid_account_number
			assert ("value of res is true", res = false)

		end

end


