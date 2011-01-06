Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1502-rev-parse-parseopt/.git/
expecting success: 
	test_expect_code 129 git rev-parse --parseopt -- -h > output < optionspec &&
	test_cmp expect output
ok 1 - test --parseopt help output
expecting success: 
	git rev-parse --parseopt -- --foo --bar=ham arg < optionspec > output &&
	test_cmp expect output

ok 2 - test --parseopt
expecting success: 
	git rev-parse --parseopt -- --foo arg --bar=ham < optionspec > output &&
	test_cmp expect output

ok 3 - test --parseopt with mixed options and arguments
expecting success: 
	git rev-parse --parseopt -- --foo -- arg --bar=ham < optionspec > output &&
	test_cmp expect output

ok 4 - test --parseopt with --
expecting success: 
	git rev-parse --parseopt --stop-at-non-option -- --foo arg --bar=ham < optionspec > output &&
	test_cmp expect output

ok 5 - test --parseopt --stop-at-non-option
expecting success: 
	git rev-parse --parseopt --keep-dashdash -- --foo -- arg --bar=ham < optionspec > output &&
	test_cmp expect output

ok 6 - test --parseopt --keep-dashdash

expecting success: 
	git rev-parse --parseopt --keep-dashdash --stop-at-non-option -- --foo -- arg --spam=ham <optionspec >output &&
	test_cmp expect output


ok 7 - test --parseopt --keep-dashdash --stop-at-non-option with --

expecting success: 
	git rev-parse --parseopt --keep-dashdash --stop-at-non-option -- --foo arg --spam=ham <optionspec >output &&
	test_cmp expect output

ok 8 - test --parseopt --keep-dashdash --stop-at-non-option without --

# passed all 8 test(s)
1..8
