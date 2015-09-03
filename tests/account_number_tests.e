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

	tes_set_account_number
		-- New test routine
		note
			testing:  "covers/{ACCOUNT_NUMBER}.set_account_number"
		local
			account_number: ACCOUNT_NUMBER
			number1: ARRAY [ACCOUNT_DIGIT]
			number2: ARRAY [ACCOUNT_DIGIT]
		do
			create account_number.make
			account_number.set_account_number(123456789)
			number1 :=account_number.get_set_account_number
			account_number.set_account_number(254313579)
			number2 :=account_number.get_set_account_number
			assert ("number1 and number2 are different", number1 /= number2)
		end

	test_account_number_set_account_number_from_string_rep
			-- Test consist of creating a new ACCOUNT_NUMBER object, then use
			-- the routine set_account_number_from_string_rep to assign to it
			-- a specific value previously constructed on a STRING, for last it
			-- checks that the generated number is in fact the wanted one by using
			-- the routine 'out'  to get a STRING representation of it.
		note
			testing:  "covers/{ACCOUNT_NUMBER}.set_account_number_from_string_rep"
		local
			account_number: ACCOUNT_NUMBER
			rep: STRING
		do
			create account_number.make
			rep:= " _  _||_  _ |_  _||_|  |  | _  _| _|  |  |  | _  _| _| _ |_  _| _   |  | _ |_|  |"
			account_number.set_account_number_from_string_rep(rep)
			assert("The Account Number is 254313579","254313579" = account_number.out)
		end
end


