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

end


