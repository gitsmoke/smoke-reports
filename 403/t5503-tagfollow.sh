Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5503-tagfollow/.git/
expecting success: 
	test_tick &&
	echo ichi >file &&
	git add file &&
	git commit -m L &&
	L=$(git rev-parse --verify HEAD) &&

	(
		mkdir cloned &&
		cd cloned &&
		git init-db &&
		git remote add -f origin ..
	) &&

	test_tick &&
	echo A >file &&
	git add file &&
	git commit -m A &&
	A=$(git rev-parse --verify HEAD)

[master (root-commit) 6a9c5e4] L
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5503-tagfollow/cloned/.git/
Updating origin
[master c06aaaf] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
cat - <<EOF >expect
#S
want $A
#E
EOF

ok 2 - setup expect

expecting success: 
	rm -f $U &&
	(
		cd cloned &&
		GIT_DEBUG_SEND_PACK=3 git fetch 3>../$U &&
		test $A = $(git rev-parse --verify origin/master)
	) &&
	test -s $U &&
	cut -d" " -f1,2 $U >actual &&
	test_cmp expect actual
ok 3 - fetch A (new commit : 1 connection)
expecting success: 
	git tag -a -m tag1 tag1 $A &&
	T=$(git rev-parse --verify tag1) &&

	git checkout -b cat &&
	echo C >file &&
	git add file &&
	git commit -m C &&
	C=$(git rev-parse --verify HEAD) &&
	git checkout master
[cat f888ed6] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 4 - create tag T on A, create C on branch cat

expecting success: 
cat - <<EOF >expect
#S
want $C
want $T
#E
EOF

ok 5 - setup expect

expecting success: 
	rm -f $U &&
	(
		cd cloned &&
		GIT_DEBUG_SEND_PACK=3 git fetch 3>../$U &&
		test $C = $(git rev-parse --verify origin/cat) &&
		test $T = $(git rev-parse --verify tag1) &&
		test $A = $(git rev-parse --verify tag1^0)
	) &&
	test -s $U &&
	cut -d" " -f1,2 $U >actual &&
	test_cmp expect actual
ok 6 - fetch C, T (new branch, tag : 1 connection)

expecting success: 
	test_tick &&
	echo O >file &&
	git add file &&
	git commit -m O &&

	test_tick &&
	echo B >file &&
	git add file &&
	git commit -m B &&
	B=$(git rev-parse --verify HEAD) &&

	git tag -a -m tag2 tag2 $B &&
	S=$(git rev-parse --verify tag2)
[master 0129221] O
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 8e10cf4] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 7 - create commits O, B, tag S on B

expecting success: 
cat - <<EOF >expect
#S
want $B
want $S
#E
EOF

ok 8 - setup expect

expecting success: 
	rm -f $U &&
	(
		cd cloned &&
		GIT_DEBUG_SEND_PACK=3 git fetch 3>../$U &&
		test $B = $(git rev-parse --verify origin/master) &&
		test $B = $(git rev-parse --verify tag2^0) &&
		test $S = $(git rev-parse --verify tag2)
	) &&
	test -s $U &&
	cut -d" " -f1,2 $U >actual &&
	test_cmp expect actual
ok 9 - fetch B, S (commit and tag : 1 connection)
expecting success: 
cat - <<EOF >expect
#S
want $B
want $S
#E
EOF

ok 10 - setup expect

expecting success: 
	git branch -D cat
	rm -f $U
	(
		mkdir clone2 &&
		cd clone2 &&
		git init &&
		git remote add origin .. &&
		GIT_DEBUG_SEND_PACK=3 git fetch 3>../$U &&
		test $B = $(git rev-parse --verify origin/master) &&
		test $S = $(git rev-parse --verify tag2) &&
		test $B = $(git rev-parse --verify tag2^0) &&
		test $T = $(git rev-parse --verify tag1) &&
		test $A = $(git rev-parse --verify tag1^0)
	) &&
	test -s $U &&
	cut -d" " -f1,2 $U >actual &&
	test_cmp expect actual
Deleted branch cat (was f888ed6).
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5503-tagfollow/clone2/.git/
ok 11 - new clone fetch master and tags
# passed all 11 test(s)
1..11
