Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0100-previous/.git/
expecting success: 
	test_commit A &&
	git checkout -b junk &&
	git checkout - &&
	test "$(git symbolic-ref HEAD)" = refs/heads/master &&
	git branch -d @{-1} &&
	test_must_fail git rev-parse --verify refs/heads/junk
[master (root-commit) 0ddfaf1] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A.t
Deleted branch junk (was 0ddfaf1).
ok 1 - branch -d @{-1}
expecting success: 
	git reflog expire --expire=now &&
	git checkout -b junk2 &&
	git checkout - &&
	test "$(git symbolic-ref HEAD)" = refs/heads/master &&
	test_must_fail git branch -d @{-12} &&
	git rev-parse --verify refs/heads/master
0ddfaf193ff13d6ab39b7cbd9eed645e3ee2f050
ok 2 - branch -d @{-12} when there is not enough switches yet

expecting success: 
	git checkout A &&
	test_commit B &&
	git checkout A &&
	test_commit C &&
	git branch -f master B &&
	git branch -f other &&
	git checkout other &&
	git checkout master &&
	git merge @{-1} &&
	git cat-file commit HEAD | grep "Merge branch 'other'"
[detached HEAD d9df450] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B.t
[detached HEAD 5dee784] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C.t
Merging:
d9df450 B
virtual @{-1}
found 1 common ancestor(s):
0ddfaf1 A
Merge made by recursive.
 C.t |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C.t
Merge branch 'other'
ok 3 - merge @{-1}
expecting success: 
	git reflog expire --expire=now &&
	git checkout -f master &&
	git reset --hard B &&
	git branch -f other C &&
	git checkout other &&
	git checkout master &&
	test_must_fail git merge @{-12}
HEAD is now at d9df450 B
ok 4 - merge @{-1} when there is not enough switches yet

# passed all 4 test(s)
1..4
