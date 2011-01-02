Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7007-show/.git/
expecting success: 
	echo hello world >foo &&
	H=$(git hash-object -w foo) &&
	git tag -a foo-tag -m "Tags $H" $H &&
	HH=$(expr "$H" : "\(..\)") &&
	H38=$(expr "$H" : "..\(.*\)") &&
	rm -f .git/objects/$HH/$H38


ok 1 - setup

expecting success: 
	test_must_fail git --no-pager show foo-tag
tag foo-tag
Tagger: C O Mitter <committer@example.com>
Date:   Sun Jan 2 04:02:33 2011 +0000

Tags 3b18e512dba79e4c8300dd08aeb37f8e728b8dad

ok 2 - showing a tag that point at a missing object

# passed all 2 test(s)
1..2
