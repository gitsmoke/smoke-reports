Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1400-update-ref/.git/
expecting success: 

	for name in A B C D E F
	do
		test_tick &&
		T=$(git write-tree) &&
		sha1=$(echo $name | git commit-tree $T) &&
		eval $name=$sha1
	done

ok 1 - setup

expecting success: git update-ref refs/heads/master 102939797ab91a4f201d131418d2c9d919dcdd2c &&
	 test 102939797ab91a4f201d131418d2c9d919dcdd2c = $(cat .git/refs/heads/master)

ok 2 - create refs/heads/master

expecting success: git update-ref refs/heads/master 56d5c1374e8028a1e122ab046ab7b98165342dc4 102939797ab91a4f201d131418d2c9d919dcdd2c &&
	 test 56d5c1374e8028a1e122ab046ab7b98165342dc4 = $(cat .git/refs/heads/master)

ok 3 - create refs/heads/master

expecting success: 
	test_must_fail git update-ref -d $m $A &&
	test $B = "$(cat .git/$m)"
ok 4 - fail to delete refs/heads/master with stale ref
expecting success: 
	git update-ref -d $m $B &&
	! test -f .git/$m

ok 5 - delete refs/heads/master

expecting success: 
	git update-ref refs/heads/master 102939797ab91a4f201d131418d2c9d919dcdd2c &&
	test 102939797ab91a4f201d131418d2c9d919dcdd2c = $(cat .git/refs/heads/master) &&
	git update-ref -d refs/heads/master &&
	! test -f .git/refs/heads/master

ok 6 - delete refs/heads/master without oldvalue verification
expecting success: touch .git/refs/heads/gu &&
	 test_must_fail git update-ref refs/heads/gu/fixes 102939797ab91a4f201d131418d2c9d919dcdd2c >out 2>err

ok 7 - fail to create refs/heads/gu/fixes
expecting success: git update-ref HEAD 102939797ab91a4f201d131418d2c9d919dcdd2c &&
	 test 102939797ab91a4f201d131418d2c9d919dcdd2c = $(cat .git/refs/heads/master)

ok 8 - create refs/heads/master (by HEAD)

expecting success: git update-ref HEAD 56d5c1374e8028a1e122ab046ab7b98165342dc4 102939797ab91a4f201d131418d2c9d919dcdd2c &&
	 test 56d5c1374e8028a1e122ab046ab7b98165342dc4 = $(cat .git/refs/heads/master)

ok 9 - create refs/heads/master (by HEAD)

expecting success: 
	test_must_fail git update-ref -d HEAD $A &&
	test $B = $(cat .git/$m)
ok 10 - fail to delete refs/heads/master (by HEAD) with stale ref
expecting success: 
	git update-ref -d HEAD $B &&
	! test -f .git/$m

ok 11 - delete refs/heads/master (by HEAD)
expecting success: 
	git update-ref --no-deref -d HEAD &&
	! test -f .git/HEAD

ok 12 - delete symref without dereference
expecting success: 
	echo foo >foo.c &&
	git add foo.c &&
	git commit -m foo &&
	git pack-refs --all &&
	git update-ref --no-deref -d HEAD &&
	! test -f .git/HEAD
[master (root-commit) 40d5b0c] foo
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo.c

ok 13 - delete symref without dereference when the referred ref is packed
expecting success: 
	test_must_fail git update-ref HEAD 102939797ab91a4f201d131418d2c9d919dcdd2c 56d5c1374e8028a1e122ab046ab7b98165342dc4
ok 14 - (not) create HEAD with old sha1
expecting success: 
	! test -f .git/refs/heads/master

ok 15 - (not) prior created .git/refs/heads/master
expecting success: git update-ref HEAD 102939797ab91a4f201d131418d2c9d919dcdd2c
ok 16 - create HEAD
expecting success: 
	test_must_fail git update-ref HEAD 56d5c1374e8028a1e122ab046ab7b98165342dc4 0000000000000000000000000000000000000000
ok 17 - (not) change HEAD with wrong SHA1
expecting success: 
	! test 56d5c1374e8028a1e122ab046ab7b98165342dc4 = $(cat .git/refs/heads/master)

ok 18 - (not) changed .git/refs/heads/master
expecting success: GIT_COMMITTER_DATE="2005-05-26 23:30" \
	 git update-ref HEAD 102939797ab91a4f201d131418d2c9d919dcdd2c -m "Initial Creation" &&
	 test 102939797ab91a4f201d131418d2c9d919dcdd2c = $(cat .git/refs/heads/master)

ok 19 - create refs/heads/master (logged by touch)

expecting success: GIT_COMMITTER_DATE="2005-05-26 23:31" \
	 git update-ref HEAD 56d5c1374e8028a1e122ab046ab7b98165342dc4 102939797ab91a4f201d131418d2c9d919dcdd2c -m "Switch" &&
	 test 56d5c1374e8028a1e122ab046ab7b98165342dc4 = $(cat .git/refs/heads/master)

ok 20 - update refs/heads/master (logged by touch)

expecting success: GIT_COMMITTER_DATE="2005-05-26 23:41" \
	 git update-ref HEAD 102939797ab91a4f201d131418d2c9d919dcdd2c &&
	 test 102939797ab91a4f201d131418d2c9d919dcdd2c = $(cat .git/refs/heads/master)

ok 21 - set refs/heads/master (logged by touch)
expecting success: test_cmp expect .git/logs/refs/heads/master
ok 22 - verifying refs/heads/master's log
expecting success: git config core.logAllRefUpdates true &&
	 test true = $(git config --bool --get core.logAllRefUpdates)

ok 23 - enable core.logAllRefUpdates
expecting success: GIT_COMMITTER_DATE="2005-05-26 23:32" \
	 git update-ref HEAD 102939797ab91a4f201d131418d2c9d919dcdd2c -m "Initial Creation" &&
	 test 102939797ab91a4f201d131418d2c9d919dcdd2c = $(cat .git/refs/heads/master)

ok 24 - create refs/heads/master (logged by config)
expecting success: GIT_COMMITTER_DATE="2005-05-26 23:33" \
	 git update-ref HEAD 56d5c1374e8028a1e122ab046ab7b98165342dc4 102939797ab91a4f201d131418d2c9d919dcdd2c -m "Switch" &&
	 test 56d5c1374e8028a1e122ab046ab7b98165342dc4 = $(cat .git/refs/heads/master)

ok 25 - update refs/heads/master (logged by config)

expecting success: GIT_COMMITTER_DATE="2005-05-26 23:43" \
	 git update-ref HEAD 102939797ab91a4f201d131418d2c9d919dcdd2c &&
	 test 102939797ab91a4f201d131418d2c9d919dcdd2c = $(cat .git/refs/heads/master)

ok 26 - set refs/heads/master (logged by config)

expecting success: test_cmp expect .git/logs/$m

ok 27 - verifying refs/heads/master's log
expecting success: rm -f o e &&
	 git rev-parse --verify "master@{May 25 2005}" >o 2>e &&
	 test 3cceb89b690679aecbe1db39079f99221f1aaaa6 = $(cat o) &&
	 test "warning: Log for 'master' only goes back to $ed." = "$(cat e)"

ok 28 - Query "master@{May 25 2005}" (before history)
expecting success: rm -f o e &&
	 git rev-parse --verify master@{2005-05-25} >o 2>e &&
	 test 3cceb89b690679aecbe1db39079f99221f1aaaa6 = $(cat o) &&
	 echo test "warning: Log for 'master' only goes back to $ed." = "$(cat e)"
test warning: Log for 'master' only goes back to Thu, 26 May 2005 18:32:00 -0500. = warning: Log for 'master' only goes back to Thu, 26 May 2005 18:32:00 -0500.

ok 29 - Query master@{2005-05-25} (before history)

expecting success: rm -f o e &&
	 git rev-parse --verify "master@{May 26 2005 23:31:59}" >o 2>e &&
	 test 3cceb89b690679aecbe1db39079f99221f1aaaa6 = $(cat o) &&
	 test "warning: Log for 'master' only goes back to $ed." = "$(cat e)"

ok 30 - Query "master@{May 26 2005 23:31:59}" (1 second before history)

expecting success: rm -f o e &&
	 git rev-parse --verify "master@{May 26 2005 23:32:00}" >o 2>e &&
	 test 3cceb89b690679aecbe1db39079f99221f1aaaa6 = $(cat o) &&
	 test "" = "$(cat e)"

ok 31 - Query "master@{May 26 2005 23:32:00}" (exactly history start)

expecting success: rm -f o e &&
	 git rev-parse --verify "master@{May 26 2005 23:32:30}" >o 2>e &&
	 test 102939797ab91a4f201d131418d2c9d919dcdd2c = $(cat o) &&
	 test "" = "$(cat e)"

ok 32 - Query "master@{May 26 2005 23:32:30}" (first non-creation change)

expecting success: rm -f o e &&
	 git rev-parse --verify "master@{2005-05-26 23:33:01}" >o 2>e &&
	 test 56d5c1374e8028a1e122ab046ab7b98165342dc4 = $(cat o) &&
	 test "warning: Log .git/logs/refs/heads/master has gap after Thu, 26 May 2005 18:33:00 -0500." = "$(cat e)"

ok 33 - Query "master@{2005-05-26 23:33:01}" (middle of history with gap)

expecting success: rm -f o e &&
	 git rev-parse --verify "master@{2005-05-26 23:38:00}" >o 2>e &&
	 test 0000000000000000000000000000000000000000 = $(cat o) &&
	 test "" = "$(cat e)"

ok 34 - Query "master@{2005-05-26 23:38:00}" (middle of history)

expecting success: rm -f o e &&
	 git rev-parse --verify "master@{2005-05-26 23:43:00}" >o 2>e &&
	 test a6166d2809963b1da1148e6922729c21214390c8 = $(cat o) &&
	 test "" = "$(cat e)"

ok 35 - Query "master@{2005-05-26 23:43:00}" (exact end of history)

expecting success: rm -f o e &&
	 git rev-parse --verify "master@{2005-05-28}" >o 2>e &&
	 test 26caa67a0d551891a2ecec76098a9f8e705ab059 = $(cat o) &&
	 test "warning: Log .git/logs/refs/heads/master unexpectedly ended on Thu, 26 May 2005 18:43:00 -0500." = "$(cat e)"

ok 36 - Query "master@{2005-05-28}" (past end of history)

expecting success: echo TEST >F &&
     git add F &&
	 GIT_AUTHOR_DATE="2005-05-26 23:30" \
	 GIT_COMMITTER_DATE="2005-05-26 23:30" git commit -m add -a &&
	 h_TEST=$(git rev-parse --verify HEAD) &&
	 echo The other day this did not work. >M &&
	 echo And then Bob told me how to fix it. >>M &&
	 echo OTHER >F &&
	 GIT_AUTHOR_DATE="2005-05-26 23:41" \
	 GIT_COMMITTER_DATE="2005-05-26 23:41" git commit -F M -a &&
	 h_OTHER=$(git rev-parse --verify HEAD) &&
	 GIT_AUTHOR_DATE="2005-05-26 23:44" \
	 GIT_COMMITTER_DATE="2005-05-26 23:44" git commit --amend &&
	 h_FIXED=$(git rev-parse --verify HEAD) &&
	 echo Merged initial commit and a later commit. >M &&
	 echo $h_TEST >.git/MERGE_HEAD &&
	 GIT_AUTHOR_DATE="2005-05-26 23:45" \
	 GIT_COMMITTER_DATE="2005-05-26 23:45" git commit -F M &&
	 h_MERGED=$(git rev-parse --verify HEAD) &&
	 rm -f M
[master (root-commit) 0c23f5f] add
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 F
 create mode 100644 foo.c
[master d3968db] The other day this did not work. And then Bob told me how to fix it.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master e66de33] The other day this did not work. And then Bob told me how to fix it.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 29d1ccd] Merged initial commit and a later commit.
 Author: A U Thor <author@example.com>

ok 37 - creating initial files
expecting success: test_cmp expect .git/logs/refs/heads/master
ok 38 - git commit logged updates
expecting success: test OTHER = $(git cat-file blob master:F)
ok 39 - git cat-file blob master:F (expect OTHER)
expecting success: test TEST = $(git cat-file blob "master@{2005-05-26 23:30}:F")
ok 40 - git cat-file blob master@{2005-05-26 23:30}:F (expect TEST)
expecting success: test OTHER = $(git cat-file blob "master@{2005-05-26 23:42}:F")
ok 41 - git cat-file blob master@{2005-05-26 23:42}:F (expect OTHER)
# passed all 41 test(s)
1..41
