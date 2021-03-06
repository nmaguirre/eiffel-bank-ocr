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
			-- sum = (1*1)+(2*10)+(3*100)+...+(9*100000000)
			-- else should be false
		note
			testing:  "covers/{ACCOUNT_NUMBER}.is_valid_account_number"
		local
			account_number: ACCOUNT_NUMBER
			res: BOOLEAN
		do

			create account_number.make

			account_number.set_account_number(152713359)
			res := account_number.is_valid_account_number
			assert ("value of res is false", res = False)

			account_number.set_account_number(123456789)
			res := account_number.is_valid_account_number
			assert ("value of res is true", res = True)


		end

	test_set_account_number
		-- New test routine
		note
			testing:  "covers/{ACCOUNT_NUMBER}.set_account_number"
		local
			account_number: ACCOUNT_NUMBER
		do
			create account_number.make
			account_number.set_account_number(123456789)
			assert ("set_account_number_correct", account_number.as_integer = 123456789)
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
			reps : ACCOUNT_DIGIT
			rep: STRING
		do
			create account_number.make
			create reps.make
			create rep.make_empty
			rep:= reps.rep_two+reps.rep_five+reps.rep_four+reps.rep_three+reps.rep_one+reps.rep_three+reps.rep_five+reps.rep_seven+reps.rep_nine
			account_number.set_account_number_from_string_rep(rep)
			assert("The Account Number is 254313579",254313579 = account_number.as_integer)
		end

	test_account_number_set_digit
			-- This routine test that a digit is set properly in the correct position in
			-- an account number
		note
			testing:  "covers/{ACCOUNT_NUMBER}.set_digit"
		local
			account_number: ACCOUNT_NUMBER
			account_digit: ACCOUNT_DIGIT
		do
			create account_number.make
			create account_digit.make
			account_digit.set_value (5)
			account_number.set_digit (1, account_digit)
			assert ("Should have a 5 in position 0", account_number.number[1].value = 5)
		end


	test_out
			-- tests that the out routine, producing a textual representation
			-- of the account number using pipes, underscores and
			-- blanks, works correctly.

		note
			testing:  "covers/{ACCOUNT_NUMBER}.out"
		local
			account_number: ACCOUNT_NUMBER
			s : STRING
		do
			create account_number.make
			account_number.set_account_number(123456789)
			s := "    _  _     _  _  _  _  _ %N  | _| _||_||_ |_   ||_||_|%N  ||_  _|  | _||_|  ||_| _|%N"
			assert ("Expects representation of 123456789 using pipes and underscores", account_number.out.is_equal (s))

		end


end
