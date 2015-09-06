note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	ACCOUNT_DIGIT_TESTS

inherit
	EQA_TEST_SET

feature -- Test routines

	test_account_digit_set_get
			-- New test routine
		note
			testing:  "covers/{ACCOUNT_DIGIT}.set_value", "covers/{ACCOUNT_DIGIT}.value"
		local
			d: ACCOUNT_DIGIT
		do
			create d.make
			d.set_value (2)
			assert ("value of d is 2", d.value = 2)
		end

	test_account_digit_make_sets_zero
			-- Value of digit after default creation should be zero
		note
			testing:  "covers/{ACCOUNT_DIGIT}.make", "covers/{ACCOUNT_DIGIT}.value"
		local
			d: ACCOUNT_DIGIT
		do
			create d.make
			assert ("value of d is 0", d.value = 0)
		end

	test_account_digit_make_from_string_rep
			-- Value of digit should be the same as the respective representation
		note
			testing:  "covers/{ACCOUNT_DIGIT}.make_from_string_rep", "covers/{ACCOUNT_DIGIT}.value"
		local
			d: ACCOUNT_DIGIT
		do
			create d.make_from_string_rep(" _ |_  _|")
			assert ("value of d is 5", d.value = 5)
		end

	test_out
		-- Test for routine out that performs the correct representation of a number
		note
			testing:  "covers/{ACCOUNT_DIGIT}.out"
		local
			d: ACCOUNT_DIGIT
			str : STRING
		do
			 create d.make
			 d.set_value(1)
			 str := "  |  |  |"
			 assert ("Representation of 1 using pipes and underscores", d.out = str)
		end
end


