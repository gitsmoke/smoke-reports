not ok - 1 test --parseopt help output
#	
#		git rev-parse --parseopt -- -h > output < optionspec
#		test_cmp expect output
#	
ok 2 - test --parseopt
ok 3 - test --parseopt with mixed options and arguments
ok 4 - test --parseopt with --
ok 5 - test --parseopt --stop-at-non-option
ok 6 - test --parseopt --keep-dashdash
ok 7 - test --parseopt --keep-dashdash --stop-at-non-option with --
not ok - 8 test --parseopt --keep-dashdash --stop-at-non-option without --
#	
#		git rev-parse --parseopt --keep-dashdash --stop-at-non-option -- --foo arg --spam=ham <optionspec >output &&
#		test_cmp expect output
#	
# failed 2 among 8 test(s)
1..8
