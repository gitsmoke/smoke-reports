Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3412-rebase-root/.git/
expecting success: 
	test_commit 1 A &&
	test_commit 2 A &&
	git symbolic-ref HEAD refs/heads/other &&
	rm .git/index &&
	test_commit 3 B &&
	test_commit 1b A 1 &&
	test_commit 4 B

[master (root-commit) c746ea0] 1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A
[master 46611ad] 2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[other (root-commit) 2c64091] 3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B
[other 1c4476a] 1b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A
[other 41e7797] 4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - prepare repository

expecting success: 
	test_must_fail git rebase --root


ok 2 - rebase --root expects --onto

expecting success: 
	mkdir -p .git/hooks &&
	cat >.git/hooks/pre-rebase <<EOF &&
#!$SHELL_PATH
echo "\$1,\$2" >.git/PRE-REBASE-INPUT
EOF
	chmod +x .git/hooks/pre-rebase


ok 3 - setup pre-rebase hook

expecting success: 
	git checkout -b work &&
	git rebase --root --onto master &&
	git log --pretty=tformat:"%s" > rebased &&
	test_cmp expect rebased

First, rewinding head to replay your work on top of it...
Applying: 3
Applying: 4

ok 4 - rebase --root --onto <newbase>

expecting success: 
	test "z$(cat .git/PRE-REBASE-INPUT)" = z--root,


ok 5 - pre-rebase got correct input (1)

expecting success: 
	git branch work2 other &&
	git rebase --root --onto master work2 &&
	git log --pretty=tformat:"%s" > rebased2 &&
	test_cmp expect rebased2
First, rewinding head to replay your work on top of it...
Applying: 3
Applying: 4

ok 6 - rebase --root --onto <newbase> <branch>

expecting success: 
	test "z$(cat .git/PRE-REBASE-INPUT)" = z--root,work2


ok 7 - pre-rebase got correct input (2)

expecting success: 
	git checkout -b work3 other &&
	git rebase -i --root --onto master &&
	git log --pretty=tformat:"%s" > rebased3 &&
	test_cmp expect rebased3
Rebasing (1/2)Rebasing (2/2)
ok 8 - rebase -i --root --onto <newbase>

expecting success: 
	test "z$(cat .git/PRE-REBASE-INPUT)" = z--root,

ok 9 - pre-rebase got correct input (3)

expecting success: 
	git branch work4 other &&
	git rebase -i --root --onto master work4 &&
	git log --pretty=tformat:"%s" > rebased4 &&
	test_cmp expect rebased4

Rebasing (1/2)Rebasing (2/2)
ok 10 - rebase -i --root --onto <newbase> <branch>

expecting success: 
	test "z$(cat .git/PRE-REBASE-INPUT)" = z--root,work4


ok 11 - pre-rebase got correct input (4)

expecting success: 
	git checkout -b work5 other &&
	git rebase -i -p --root --onto master &&
	git log --pretty=tformat:"%s" > rebased5 &&
	test_cmp expect rebased5

Rebasing (1/2)Rebasing (2/2)
ok 12 - rebase -i -p with linear history

expecting success: 
	test "z$(cat .git/PRE-REBASE-INPUT)" = z--root,


ok 13 - pre-rebase got correct input (5)

expecting success: 
	git checkout other^ &&
	git checkout -b side &&
	test_commit 5 C &&
	git checkout other &&
	git merge side

[side 0c9a4e9] 5
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C
Merging:
41e7797 4
virtual side
found 1 common ancestor(s):
1c4476a 1b
Merge made by recursive.
 C |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C

ok 14 - set up merge history

expecting success: 
	git checkout -b work6 other &&
	git rebase -i -p --root --onto master &&
	log_with_names work6 > rebased6 &&
	test_cmp expect-side rebased6
Rebasing (1/4)Rebasing (2/4)Rebasing (3/4)Rebasing (4/4)
ok 15 - rebase -i -p with merge

expecting success: 
	git symbolic-ref HEAD refs/heads/third &&
	rm .git/index &&
	rm A B C &&
	test_commit 6 D &&
	git checkout other &&
	git merge third
[third (root-commit) 00ac2af] 6
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 D
Merging:
ddb0186 Merge branch 'side' into other
virtual third
found 0 common ancestor(s):
Merge made by recursive.
 D |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 D

ok 16 - set up second root and merge

expecting success: 
	git checkout -b work7 other &&
	git rebase -i -p --root --onto master &&
	log_with_names work7 > rebased7 &&
	test_cmp expect-third rebased7
Rebasing (1/6)Rebasing (2/6)Rebasing (3/6)Rebasing (4/6)Rebasing (5/6)Rebasing (6/6)
ok 17 - rebase -i -p with two roots
expecting success: 
	mkdir -p .git/hooks &&
	cat >.git/hooks/pre-rebase <<EOF &&
#!$SHELL_PATH
false
EOF
	chmod +x .git/hooks/pre-rebase

ok 18 - setup pre-rebase hook that fails

expecting success: 
	git checkout -b stops1 other &&
	test_must_fail git rebase --root --onto master &&
	test "z$(git symbolic-ref HEAD)" = zrefs/heads/stops1 &&
	test 0 = $(git rev-list other...stops1 | wc -l)
ok 19 - pre-rebase hook stops rebase

expecting success: 
	git checkout -b stops2 other &&
	test_must_fail git rebase --root --onto master &&
	test "z$(git symbolic-ref HEAD)" = zrefs/heads/stops2 &&
	test 0 = $(git rev-list other...stops2 | wc -l)

ok 20 - pre-rebase hook stops rebase -i

expecting success: 
	rm -f .git/hooks/pre-rebase


ok 21 - remove pre-rebase hook

expecting success: 
	git checkout master &&
	echo conflict > B &&
	git add B &&
	git commit -m conflict

[master f80eebe] conflict
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B

ok 22 - set up a conflict

expecting success: 
	git checkout -b conflict1 other &&
	test_must_fail git rebase --root --onto master &&
	git ls-files -u | grep "B$"
First, rewinding head to replay your work on top of it...
Applying: 3
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with 3
Merging:
f80eebe conflict
virtual 3
found 1 common ancestor(s):
virtual 4b825dc642cb6eb9a060e54bf8d69288fbee4904
Auto-merging B
CONFLICT (add/add): Merge conflict in B
Failed to merge in the changes.
Patch failed at 0001 3

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".
100644 9b1719f5cf069568785080a0bbabbe7c377e22ae 2	B
100644 00750edc07d6415dcc07ae0351e9397b0222b7ba 3	B

ok 23 - rebase --root with conflict (first part)

expecting success: 
	echo 3 > B &&
	git add B


ok 24 - fix the conflict

expecting success: 
	git rebase --continue &&
	git log --pretty=tformat:"%s" > conflict1 &&
	test_cmp expect-conflict conflict1
Applying: 3
Applying: 4
Applying: 5
Applying: 6

ok 25 - rebase --root with conflict (second part)

expecting success: 
	git checkout -b conflict2 other &&
	test_must_fail git rebase -i --root --onto master &&
	git ls-files -u | grep "B$"
Rebasing (1/4)error: could not apply 2c64091... 3

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".

Auto-merging B
CONFLICT (add/add): Merge conflict in B
100644 9b1719f5cf069568785080a0bbabbe7c377e22ae 2	B
100644 00750edc07d6415dcc07ae0351e9397b0222b7ba 3	B

ok 26 - rebase -i --root with conflict (first part)

expecting success: 
	echo 3 > B &&
	git add B


ok 27 - fix the conflict

expecting success: 
	git rebase --continue &&
	git log --pretty=tformat:"%s" > conflict2 &&
	test_cmp expect-conflict conflict2

[detached HEAD 308ae33] 3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/4)Rebasing (3/4)Rebasing (4/4)
ok 28 - rebase -i --root with conflict (second part)
expecting success: 
	git checkout -b conflict3 other &&
	test_must_fail git rebase -i -p --root --onto master &&
	git ls-files -u | grep "B$"
Rebasing (1/6)error: could not apply 2c64091... 3

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".

Auto-merging B
CONFLICT (add/add): Merge conflict in B
100644 9b1719f5cf069568785080a0bbabbe7c377e22ae 2	B
100644 00750edc07d6415dcc07ae0351e9397b0222b7ba 3	B

ok 29 - rebase -i -p --root with conflict (first part)

expecting success: 
	echo 3 > B &&
	git add B


ok 30 - fix the conflict

expecting success: 
	git rebase --continue &&
	log_with_names conflict3 >out &&
	test_cmp expect-conflict-p out

[detached HEAD 308ae33] 3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/6)Rebasing (3/6)Rebasing (4/6)Rebasing (5/6)Rebasing (6/6)
ok 31 - rebase -i -p --root with conflict (second part)

# passed all 31 test(s)
1..31
