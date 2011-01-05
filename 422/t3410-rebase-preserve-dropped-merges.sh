Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3410-rebase-preserve-dropped-merges/.git/
expecting success: 
	test_commit A file1 &&
	test_commit B file1 1 &&
	test_commit C file2 &&
	test_commit D file1 2 &&
	test_commit E file3 &&
	git checkout A &&
	test_commit F file4 &&
	test_commit G file1 3 &&
	test_commit H file5 &&
	git checkout F &&
	test_commit I file6
[master (root-commit) 6e62bf8] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1
[master 5c95b17] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 7be4cc1] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2
[master 3d13cae] D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 1fe5a44] E
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file3
[detached HEAD cfefd94] F
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file4
[detached HEAD 66ee775] G
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[detached HEAD 25e63b2] H
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file5
[detached HEAD 615be62] I
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file6

ok 1 - setup

expecting success: 
	git checkout H &&
	test_must_fail git merge E &&
	test_commit L file1 23 &&
	git checkout I &&
	test_commit G2 file1 3 &&
	test_must_fail git merge E &&
	test_commit J file1 23 &&
	test_commit K file7 file7 &&
	git rebase -i -p L &&
	test $(git rev-parse HEAD^^) = $(git rev-parse L) &&
	test "23" = "$(cat file1)" &&
	test "I" = "$(cat file6)" &&
	test "file7" = "$(cat file7)"

Merging:
25e63b2 H
virtual E
found 1 common ancestor(s):
6e62bf8 A
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.
[detached HEAD 70a312a] L
 Author: A U Thor <author@example.com>
[detached HEAD 93b50ed] G2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Merging:
93b50ed G2
virtual E
found 1 common ancestor(s):
6e62bf8 A
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.
[detached HEAD 6b192df] J
 Author: A U Thor <author@example.com>
[detached HEAD 273eec6] K
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file7
Rebasing (1/2)Rebasing (2/2)
ok 2 - skip same-resolution merges with -p

expecting success: 
	git checkout H &&
	test_must_fail git merge E &&
	test_commit L2 file1 23 &&
	git checkout I &&
	test_commit G3 file1 4 &&
	test_must_fail git merge E &&
	test_commit J2 file1 24 &&
	test_commit K2 file7 file7 &&
	test_must_fail git rebase -i -p L2 &&
	echo 234 > file1 &&
	git add file1 &&
	git rebase --continue &&
	test $(git rev-parse HEAD^^^) = $(git rev-parse L2) &&
	test "234" = "$(cat file1)" &&
	test "I" = "$(cat file6)" &&
	test "file7" = "$(cat file7)"

Merging:
25e63b2 H
virtual E
found 1 common ancestor(s):
6e62bf8 A
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.
[detached HEAD 4c4dd24] L2
 Author: A U Thor <author@example.com>
[detached HEAD 6e00aee] G3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Merging:
6e00aee G3
virtual E
found 1 common ancestor(s):
6e62bf8 A
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.
[detached HEAD 4917c92] J2
 Author: A U Thor <author@example.com>
[detached HEAD c670ef0] K2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file7
Rebasing (1/4)Rebasing (2/4)error: could not apply 6e00aee... G3
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' and run 'git rebase --continue'
Auto-merging file1
CONFLICT (content): Merge conflict in file1
[detached HEAD ff7174a] G3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (3/4)Rebasing (4/4)
ok 3 - keep different-resolution merges with -p

# passed all 3 test(s)
1..3
