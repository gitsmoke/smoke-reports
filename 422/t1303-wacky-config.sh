Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1303-wacky-config/.git/
expecting success: 
	setup &&
	git config section.key bar &&
	check section.key bar

ok 1 - modify same key
expecting success: 
	setup &&
	git config section.other bar &&
	check section.key foo &&
	check section.other bar

ok 2 - add key in same section
expecting success: 
	setup &&
	git config section2.key bar &&
	check section.key foo &&
	check section2.key bar

ok 3 - add key in different section
expecting success: 
	git config "$SECTION" bar &&
	check "$SECTION" bar

ok 4 - make sure git config escapes section names properly
expecting success: 
	setup &&
	git config section.key "$LONG_VALUE" &&
	check section.key "fatal: bad config file line 2 in .git/config"

ok 5 - do not crash on special long config line
# passed all 5 test(s)
1..5
