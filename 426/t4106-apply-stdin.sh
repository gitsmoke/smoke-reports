Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4106-apply-stdin/.git/
expecting success: 
	echo hello >text &&
	git add text &&
	echo goodbye >text &&
	git diff >patch

ok 1 - setup

expecting success: 
	echo "1	1	text" >expect &&
	git apply --numstat - <patch >actual &&
	test_cmp expect actual


ok 2 - git apply --numstat - < patch

expecting success: 
	for i in 1 2; do echo "1	1	text"; done >expect &&
	git apply --numstat - < patch patch >actual &&
	test_cmp expect actual


ok 3 - git apply --numstat - < patch patch

# passed all 3 test(s)
1..3
