ok 1 - setup
ok 2 - auto fixup (option)
not ok - 3 auto fixup (config)
#	
#		git config rebase.autosquash true &&
#		test_auto_fixup final-fixup-config-true &&
#		test_must_fail test_auto_fixup fixup-config-true-no --no-autosquash &&
#		git config rebase.autosquash false &&
#		test_must_fail test_auto_fixup final-fixup-config-false
#	
ok 4 - auto squash (option)
not ok - 5 auto squash (config)
#	
#		git config rebase.autosquash true &&
#		test_auto_squash final-squash-config-true &&
#		test_must_fail test_auto_squash squash-config-true-no --no-autosquash &&
#		git config rebase.autosquash false &&
#		test_must_fail test_auto_squash final-squash-config-false
#	
ok 6 - misspelled auto squash
# failed 2 among 6 test(s)
1..6
