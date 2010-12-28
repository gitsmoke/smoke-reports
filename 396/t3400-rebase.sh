Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3400-rebase/.git/
expecting success: 
	git config core.logAllRefUpdates true &&
	echo First >A &&
	git update-index --add A &&
	git commit -m "Add A." &&
	git checkout -b force-3way &&
	echo Dummy >Y &&
	git update-index --add Y &&
	git commit -m "Add Y." &&
	git checkout -b filemove &&
	git reset --soft master &&
	mkdir D &&
	git mv A D/A &&
	git commit -m "Move A." &&
	git checkout -b my-topic-branch master &&
	echo Second >B &&
	git update-index --add B &&
	git commit -m "Add B." &&
	git checkout -f master &&
	echo Third >>A &&
	git update-index A &&
	git commit -m "Modify A." &&
	git checkout -b side my-topic-branch &&
	echo Side >>C &&
	git add C &&
	git commit -m "Add C" &&
	git checkout -b nonlinear my-topic-branch &&
	echo Edit >>B &&
	git add B &&
	git commit -m "Modify B" &&
	git merge side &&
	git checkout -b upstream-merged-nonlinear &&
	git merge master &&
	git checkout -f my-topic-branch &&
	git tag topic

[master (root-commit) e59f063] Add A.
 Author: author@name <bogus@email@address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A
[force-3way ea1ab99] Add Y.
 Author: author@name <bogus@email@address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 Y
[filemove cdb2021] Move A.
 Author: author@name <bogus@email@address>
 2 files changed, 1 insertions(+), 0 deletions(-)
 rename A => D/A (100%)
 create mode 100644 Y
[my-topic-branch c1a4c5e] Add B.
 Author: author@name <bogus@email@address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B
[master 551691f] Modify A.
 Author: author@name <bogus@email@address>
 1 files changed, 1 insertions(+), 0 deletions(-)
[side 6772d0a] Add C
 Author: author@name <bogus@email@address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C
[nonlinear c853b48] Modify B
 Author: author@name <bogus@email@address>
 1 files changed, 1 insertions(+), 0 deletions(-)
Merging:
c853b48 Modify B
virtual side
found 1 common ancestor(s):
c1a4c5e Add B.
Merge made by recursive.
 C |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C
Merging:
e408a4d Merge branch 'side' into nonlinear
virtual master
found 1 common ancestor(s):
e59f063 Add A.
Merge made by recursive.
 A |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
ok 1 - prepare repository with topic branches
expecting success: 
	echo dirty >>A &&
	test_must_fail git rebase master
ok 2 - rebase on dirty worktree

expecting success: 
	git add A &&
	test_must_fail git rebase master
ok 3 - rebase on dirty cache
expecting success: 
	git reset --hard HEAD &&
	git rebase master
HEAD is now at c1a4c5e Add B.
First, rewinding head to replay your work on top of it...
Applying: Add B.
ok 4 - rebase against master
expecting success: 
	git rebase master >out &&
	grep "Current branch my-topic-branch is up to date" out
Current branch my-topic-branch is up to date.
ok 5 - rebase against master twice
expecting success: 
	git rebase --force-rebase master >out &&
	grep "Current branch my-topic-branch is up to date, rebase forced" out
Current branch my-topic-branch is up to date, rebase forced.
ok 6 - rebase against master twice with --force
expecting success: 
	git checkout my-topic-branch^ &&
	git rebase master my-topic-branch >out &&
	grep "Current branch my-topic-branch is up to date" out
Current branch my-topic-branch is up to date.
ok 7 - rebase against master twice from another branch
expecting success: 
	git checkout my-topic-branch^ &&
	git rebase my-topic-branch >out &&
	grep "Fast-forwarded HEAD to my-topic-branch" out
Fast-forwarded HEAD to my-topic-branch.

ok 8 - rebase fast-forward to master

expecting success: 
	! (git log | grep "Author:" | grep "<>")

ok 9 - the rebase operation should not have destroyed author information

expecting success: 
	git log -1 |
	grep 'Author: author@name <bogus@email@address>'
Author: author@name <bogus@email@address>

ok 10 - the rebase operation should not have destroyed author information (2)

expecting success: 
	test $(git rev-parse HEAD@{1}) != $(git rev-parse my-topic-branch@{1})

ok 11 - HEAD was detached during rebase

expecting success: 
	git reset --hard topic &&
	git merge master &&
	git rebase master &&
	! (git show | grep "^Merge:")
HEAD is now at c1a4c5e Add B.
Merging:
c1a4c5e Add B.
virtual master
found 1 common ancestor(s):
e59f063 Add A.
Merge made by recursive.
 A |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
First, rewinding head to replay your work on top of it...
Applying: Add B.
ok 12 - rebase after merge master

expecting success: 
	git checkout nonlinear &&
	test 4 = $(git rev-list master.. | wc -l) &&
	git rebase master &&
	test 3 = $(git rev-list master.. | wc -l)
First, rewinding head to replay your work on top of it...
Applying: Add B.
Applying: Add C
Applying: Modify B
ok 13 - rebase of history with merges is linearized
expecting success: 
	git checkout upstream-merged-nonlinear &&
	test 5 = $(git rev-list master.. | wc -l) &&
	git rebase master &&
	test 3 = $(git rev-list master.. | wc -l)
First, rewinding head to replay your work on top of it...
Applying: Add B.
Applying: Add C
Applying: Modify B

ok 14 - rebase of history with merges after upstream merge is linearized

expecting success: 
	git checkout master &&
	echo 1 >X &&
	git add X &&
	test_tick &&
	git commit -m prepare &&
	git checkout -b modechange HEAD^ &&
	echo 1 >X &&
	git add X &&
	test_chmod +x A &&
	test_tick &&
	git commit -m modechange &&
	GIT_TRACE=1 git rebase master
[master a5b6dc3] prepare
 Author: author@name <bogus@email@address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 X
[modechange 2e7db62] modechange
 Author: author@name <bogus@email@address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 A
 create mode 100644 X
First, rewinding head to replay your work on top of it...
Applying: modechange
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with modechange
Merging:
a5b6dc3 prepare
virtual modechange
found 1 common ancestor(s):
virtual 20d8b2c6c42a40f913517c72113d9d08e124064a
ok 15 - rebase a single mode change

expecting success: 
	git config diff.renames copies &&
	test_when_finished "git config --unset diff.renames" &&
	git checkout filemove &&
	GIT_TRACE=1 git rebase force-3way
First, rewinding head to replay your work on top of it...
Applying: Move A.
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with Move A.
Merging:
ea1ab99 Add Y.
virtual Move A.
found 1 common ancestor(s):
virtual 26395c6fe842cd8894b5dde87a6fb53cccfabc06
Skipped D/A (merged same as existing)
ok 16 - rebase is not broken by diff.renames

expecting success: 
	test_might_fail git rebase --abort &&
	git reset --hard &&
	git checkout modechange
HEAD is now at d122068 Move A.

ok 17 - setup: recover

expecting success: 
	>B &&
	test_must_fail git rebase topic 2>output.err >output.out &&
	grep "The following untracked working tree files would be overwritten by checkout:" output.err &&
	grep B output.err
error: The following untracked working tree files would be overwritten by checkout:
	B

ok 18 - Show verbose error when HEAD could not be detached

expecting success: 
	git checkout -b usage topic &&
	test_must_fail git rebase 2>error1 &&
	grep "[Uu]sage" error1 &&
	test_must_fail git rebase --abort 2>error2 &&
	grep "No rebase in progress" error2 &&
	test_must_fail git rebase --onto master 2>error3 &&
	grep "[Uu]sage" error3 &&
	! grep "can.t shift" error3
Usage: git rebase [--interactive | -i] [-v] [--force-rebase | -f] [--no-ff] [--onto <newbase>] (<upstream>|--root) [<branch>] [--quiet | -q]
No rebase in progress?
Usage: git rebase [--interactive | -i] [-v] [--force-rebase | -f] [--no-ff] [--onto <newbase>] (<upstream>|--root) [<branch>] [--quiet | -q]
ok 19 - dump usage when upstream arg is missing
expecting success: 
	git checkout -b quiet topic &&
	git rebase -q master >output.out 2>&1 &&
	test ! -s output.out
ok 20 - rebase -q is quiet

expecting success: 
	(
		echo "One"
		echo "TwoQ"
		echo "Three"
		echo "FQur"
		echo "Five"
	) | q_to_cr >CR &&
	git add CR &&
	test_tick &&
	git commit -a -m "A file with a line with CR" &&
	git tag file-with-cr &&
	git checkout HEAD^0 &&
	git rebase --onto HEAD^^ HEAD^ &&
	git diff --exit-code file-with-cr:CR HEAD:CR
[quiet cb8f83a] A file with a line with CR
 Author: author@name <bogus@email@address>
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 CR
First, rewinding head to replay your work on top of it...
Applying: A file with a line with CR

ok 21 - Rebase a commit that sprinkles CRs in

expecting success: 
	git config notes.rewrite.rebase true &&
	git config notes.rewriteRef "refs/notes/*" &&
	test_commit n1 &&
	test_commit n2 &&
	test_commit n3 &&
	git notes add -m"a note" n3 &&
	git rebase --onto n1 n2 &&
	test "a note" = "$(git notes show HEAD)"

[detached HEAD 60aecab] n1
 Author: author@name <bogus@email@address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 n1.t
[detached HEAD 93ffef9] n2
 Author: author@name <bogus@email@address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 n2.t
[detached HEAD 44453d5] n3
 Author: author@name <bogus@email@address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 n3.t
First, rewinding head to replay your work on top of it...
Applying: n3

ok 22 - rebase can copy notes

expecting success: 
	git reset --hard n3 &&
	git rebase -m --onto n1 n2 &&
	test "a note" = "$(git notes show HEAD)"

HEAD is now at 44453d5 n3
First, rewinding head to replay your work on top of it...
Merging n1 with HEAD~0
Merging:
60aecab n1
44453d5 n3
found 1 common ancestor(s):
93ffef9 n2
[detached HEAD df6442c] n3
 Author: author@name <bogus@email@address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 n3.t
Committed: 0001 n3
All done.

ok 23 - rebase -m can copy notes

# passed all 23 test(s)
1..23
