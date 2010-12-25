Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0040-parse-options/.git/
expecting success: 
	test_must_fail test-parse-options -h > output 2> output.err &&
	test ! -s output.err &&
	test_cmp expect output

ok 1 - test help
expecting success: 
	test-parse-options -s123 -b -i 1729 -b -vv -n -F my.file \
	> output 2> output.err &&
	test_cmp expect output &&
	test ! -s output.err

ok 2 - short options
expecting success: 
	test-parse-options --boolean --integer 1729 --boolean --string2=321 \
		--verbose --verbose --no-dry-run --abbrev=10 --file fi.le\
		> output 2> output.err &&
	test ! -s output.err &&
	test_cmp expect output

ok 3 - long options

expecting success: 
	test-parse-options -s;
	test $? = 129 &&
	test-parse-options --string;
	test $? = 129 &&
	test-parse-options --file;
	test $? = 129
ok 4 - missing required value
expecting success: 
	test-parse-options a1 --string 123 b1 --boolean -j 13 -- --boolean \
		> output 2> output.err &&
	test ! -s output.err &&
	test_cmp expect output

ok 5 - intermingled arguments
expecting success: 
	test-parse-options --int 2 --boolean --no-bo > output 2> output.err &&
	test ! -s output.err &&
	test_cmp expect output

ok 6 - unambiguously abbreviated option
expecting success: 
	test-parse-options --int=2 > output 2> output.err &&
	test ! -s output.err &&
	test_cmp expect output

ok 7 - unambiguously abbreviated option with "="

expecting success: 
	test-parse-options --strin 123;
	test $? = 129

ok 8 - ambiguously abbreviated option
expecting success: 
	test-parse-options --st 123 > output 2> output.err &&
	test ! -s output.err &&
	test_cmp expect output

ok 9 - non ambiguous option (after two options it abbreviates)
expecting success: 
	test_must_fail test-parse-options -boolean > output 2> output.err &&
	test ! -s output &&
	test_cmp typo.err output.err

ok 10 - detect possible typos
expecting success: 
	test-parse-options --quux > output 2> output.err &&
        test ! -s output.err &&
        test_cmp expect output

ok 11 - keep some options as arguments

expecting success: 
	test-parse-options -t "1970-01-01 00:00:01 +0000" --default-string \
		foo -q > output 2> output.err &&
	test ! -s output.err &&
	test_cmp expect output


ok 12 - OPT_DATE() and OPT_SET_PTR() work

expecting success: 
	test-parse-options --length=four -b -4 > output 2> output.err &&
	test ! -s output.err &&
	test_cmp expect output


ok 13 - OPT_CALLBACK() and OPT_BIT() work

expecting success: 
	test_must_fail test-parse-options --no-length > output 2> output.err &&
	test_cmp expect output &&
	test_cmp expect.err output.err

ok 14 - OPT_CALLBACK() and callback errors work

expecting success: 
	test-parse-options --set23 -bbbbb --no-or4 > output 2> output.err &&
	test ! -s output.err &&
	test_cmp expect output

ok 15 - OPT_BIT() and OPT_SET_INT() work

expecting success: 
	test-parse-options --set23 -bbbbb --neg-or4 > output 2> output.err &&
	test ! -s output.err &&
	test_cmp expect output

ok 16 - OPT_NEGBIT() and OPT_SET_INT() work
expecting success: 
	test-parse-options -bb --or4 > output 2> output.err &&
	test ! -s output.err &&
	test_cmp expect output

ok 17 - OPT_BIT() works

expecting success: 
	test-parse-options -bb --no-neg-or4 > output 2> output.err &&
	test ! -s output.err &&
	test_cmp expect output

ok 18 - OPT_NEGBIT() works

expecting success: 
	test-parse-options + + + + + + > output 2> output.err &&
	test ! -s output.err &&
	test_cmp expect output

ok 19 - OPT_BOOLEAN() with PARSE_OPT_NODASH works
expecting success: 
	test-parse-options -12345 > output 2> output.err &&
	test ! -s output.err &&
	test_cmp expect output

ok 20 - OPT_NUMBER_CALLBACK() works
expecting success: 
	test-parse-options --no-ambig >output 2>output.err &&
	test ! -s output.err &&
	test_cmp expect output

ok 21 - negation of OPT_NONEG flags is not ambiguous
# passed all 21 test(s)
1..21
