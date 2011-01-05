Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6015-rev-list-show-all-parents/.git/
expecting success: 
	test_commit one foo.txt &&
	commit1=`git rev-list -1 HEAD` &&
	test_commit two bar.txt &&
	commit2=`git rev-list -1 HEAD` &&
	test_commit three foo.txt &&
	commit3=`git rev-list -1 HEAD`
	
[master (root-commit) 4b09c9e] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo.txt
[master bea58ca] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 bar.txt
[master 106a79f] three
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - set up --show-all --parents test

expecting success: 
	echo $commit3 $commit1 > expected &&
	echo $commit1 >> expected &&
	git rev-list --parents HEAD -- foo.txt > actual &&
	test_cmp expected actual
	

ok 2 - --parents rewrites TREESAME parents correctly

expecting success: 
	echo $commit3 $commit2 > expected &&
	echo $commit2 $commit1 >> expected &&
	echo $commit1 >> expected &&
	git rev-list --parents --show-all HEAD -- foo.txt > actual &&
	test_cmp expected actual
	

ok 3 - --parents --show-all does not rewrites TREESAME parents

# passed all 3 test(s)
1..3
