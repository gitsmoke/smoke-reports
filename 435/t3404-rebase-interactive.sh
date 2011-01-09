Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3404-rebase-interactive/.git/
expecting success: 
	test_commit A file1 &&
	test_commit B file1 &&
	test_commit C file2 &&
	test_commit D file1 &&
	test_commit E file3 &&
	git checkout -b branch1 A &&
	test_commit F file4 &&
	test_commit G file1 &&
	test_commit H file5 &&
	git checkout -b branch2 F &&
	test_commit I file6 &&
	git checkout -b conflict-branch A &&
	test_commit one conflict &&
	test_commit two conflict &&
	test_commit three conflict &&
	test_commit four conflict &&
	git checkout -b no-conflict-branch A &&
	test_commit J fileJ &&
	test_commit K fileK &&
	test_commit L fileL &&
	test_commit M fileM &&
	git checkout -b no-ff-branch A &&
	test_commit N fileN &&
	test_commit O fileO &&
	test_commit P fileP
[master (root-commit) 6e62bf8] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1
[master 313fe96] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master d0f65f2] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2
[master 0547e3f] D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 8f99a4f] E
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file3
[branch1 cfefd94] F
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file4
[branch1 83751a6] G
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[branch1 4373208] H
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file5
[branch2 615be62] I
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file6
[conflict-branch b895952] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 conflict
[conflict-branch 766a798] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[conflict-branch 1eadf03] three
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[conflict-branch f91a2b3] four
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[no-conflict-branch 808874f] J
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileJ
[no-conflict-branch 265b89e] K
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileK
[no-conflict-branch 6b0f5e6] L
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileL
[no-conflict-branch 3389558] M
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileM
[no-ff-branch 53b4423] N
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileN
[no-ff-branch cc47714] O
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileO
[no-ff-branch faef1a5] P
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileP

ok 1 - setup
expecting success: 
	git checkout master &&
	(
	FAKE_LINES="1 exec_>touch-one
		2 exec_>touch-two exec_false exec_>touch-three
		3 4 exec_>\"touch-file__name_with_spaces\";_>touch-after-semicolon 5" &&
	export FAKE_LINES &&
	test_must_fail git rebase -i A
	) &&
	test_path_is_file touch-one &&
	test_path_is_file touch-two &&
	test_path_is_missing touch-three " (should have stopped before)" &&
	test_cmp_rev C HEAD &&
	git rebase --continue &&
	test_path_is_file touch-three &&
	test_path_is_file "touch-file  name with spaces" &&
	test_path_is_file touch-after-semicolon &&
	test_cmp_rev master HEAD &&
	rm -f touch-*
rebase -i script before editing:
pick 313fe96 B
pick d0f65f2 C
pick 0547e3f D
pick 8f99a4f E
rebase -i script after editing:
pick 313fe96 B
exec >touch-one
pick d0f65f2 C
exec >touch-two
exec false
exec >touch-three
pick 0547e3f D
pick 8f99a4f E
exec >"touch-file  name with spaces"; >touch-after-semicolon
Rebasing (2/9)Executing: >touch-one
Rebasing (3/9)Rebasing (4/9)Executing: >touch-two
Rebasing (5/9)Executing: false
Rebasing (6/9)Executing: >touch-three
Rebasing (7/9)Rebasing (8/9)Rebasing (9/9)Executing: >"touch-file  name with spaces"; >touch-after-semicolon
ok 2 - rebase -i with the exec command
expecting success: 
	git checkout master &&
	mkdir subdir && (cd subdir &&
	FAKE_LINES="1 exec_>touch-subdir" \
		git rebase -i HEAD^
	) &&
	test_path_is_file touch-subdir &&
	rm -fr subdir
rebase -i script before editing:
pick 8f99a4f E
rebase -i script after editing:
pick 8f99a4f E
exec >touch-subdir
Rebasing (2/2)Executing: >touch-subdir
ok 3 - rebase -i with the exec command runs from tree root
expecting success: 
	git checkout master &&
	(
	FAKE_LINES="exec_echo_foo_>file1 1" &&
	export FAKE_LINES &&
	test_must_fail git rebase -i HEAD^
	) &&
	test_cmp_rev master^ HEAD &&
	git reset --hard &&
	git rebase --continue
rebase -i script before editing:
pick 8f99a4f E
rebase -i script after editing:
exec echo foo >file1
pick 8f99a4f E
Rebasing (1/2)Executing: echo foo >file1
HEAD is now at 0547e3f D
Rebasing (2/2)
ok 4 - rebase -i with the exec command checks tree cleanness

expecting success: 
	git checkout branch2 &&
	git rebase -i F &&
	test "$(git symbolic-ref -q HEAD)" = "refs/heads/branch2" &&
	test $(git rev-parse I) = $(git rev-parse HEAD)
Rebasing (1/1)
ok 5 - no changes are a nop
expecting success: 
	git checkout -b dead-end &&
	git rm file6 &&
	git commit -m "stop here" &&
	git rebase -i F branch2 &&
	test "$(git symbolic-ref -q HEAD)" = "refs/heads/branch2" &&
	test $(git rev-parse I) = $(git rev-parse branch2) &&
	test $(git rev-parse I) = $(git rev-parse HEAD)
rm 'file6'
[dead-end f814f58] stop here
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 file6
Rebasing (1/1)
ok 6 - test the [branch] option

expecting success: 
	git checkout -b test-onto branch2 &&
	git rebase -i --onto branch1 F &&
	test "$(git symbolic-ref -q HEAD)" = "refs/heads/test-onto" &&
	test $(git rev-parse HEAD^) = $(git rev-parse branch1) &&
	test $(git rev-parse I) = $(git rev-parse branch2)
Rebasing (1/1)
ok 7 - test --onto <branch>
expecting success: 
	git checkout branch1 &&
	git tag original-branch1 &&
	git rebase -i branch2 &&
	test file6 = $(git diff --name-only original-branch1) &&
	test "$(git symbolic-ref -q HEAD)" = "refs/heads/branch1" &&
	test $(git rev-parse I) = $(git rev-parse branch2) &&
	test $(git rev-parse I) = $(git rev-parse HEAD~2)
Rebasing (1/2)Rebasing (2/2)
ok 8 - rebase on top of a non-conflicting commit
expecting success: 
	test $(git rev-parse branch1@{1}) = $(git rev-parse original-branch1)
ok 9 - reflog for the branch shows state before rebase
expecting success: 
	FAKE_LINES="2 1" git rebase -i HEAD~2 &&
	test H = $(git cat-file commit HEAD^ | sed -ne \$p) &&
	test G = $(git cat-file commit HEAD | sed -ne \$p)
rebase -i script before editing:
pick ae8f65e G
pick f5f5249 H

rebase -i script after editing:
pick f5f5249 H
pick ae8f65e G
Rebasing (1/2)Rebasing (2/2)
ok 10 - exchange two commits
expecting success: 
	git tag new-branch1 &&
	test_must_fail git rebase -i master &&
	test "$(git rev-parse HEAD~3)" = "$(git rev-parse master)" &&
	test_cmp expect .git/rebase-merge/patch &&
	test_cmp expect2 file1 &&
	test "$(git diff --name-status |
		sed -n -e "/^U/s/^U[^a-z]*//p")" = file1 &&
	test 4 = $(grep -v "^#" < .git/rebase-merge/done | wc -l) &&
	test 0 = $(grep -c "^[^#]" < .git/rebase-merge/git-rebase-todo)
Rebasing (1/4)Rebasing (2/4)Rebasing (3/4)Rebasing (4/4)error: could not apply 5d18e54... G
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' and run 'git rebase --continue'
Auto-merging file1
CONFLICT (content): Merge conflict in file1

ok 11 - stop on conflicting pick

expecting success: 
	git rebase --abort &&
	test $(git rev-parse new-branch1) = $(git rev-parse HEAD) &&
	test "$(git symbolic-ref -q HEAD)" = "refs/heads/branch1" &&
	test_path_is_missing .git/rebase-merge


ok 12 - abort

expecting success: 
	git rm --cached file1 &&
	git commit -m "remove file in base" &&
	test_must_fail git rebase -i master > output 2>&1 &&
	grep "The following untracked working tree files would be overwritten by checkout:" \
		output &&
	grep "file1" output &&
	test_path_is_missing .git/rebase-merge &&
	git reset --hard HEAD^

rm 'file1'
[branch1 2dd5570] remove file in base
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 file1
error: The following untracked working tree files would be overwritten by checkout:
	file1
HEAD is now at 5d18e54 G

ok 13 - abort with error when new base cannot be checked out

expecting success: 
	echo A > file7 &&
	git add file7 &&
	test_tick &&
	GIT_AUTHOR_NAME="Twerp Snog" git commit -m "different author" &&
	git tag twerp &&
	git rebase -i --onto master HEAD^ &&
	git show HEAD | grep "^Author: Twerp Snog"

[branch1 2596307] different author
 Author: Twerp Snog <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file7
Rebasing (1/1)Author: Twerp Snog <author@example.com>

ok 14 - retain authorship

expecting success: 
	git reset --hard twerp &&
	echo B > file7 &&
	test_tick &&
	GIT_AUTHOR_NAME="Nitfol" git commit -m "nitfol" file7 &&
	echo "******************************" &&
	FAKE_LINES="1 squash 2" EXPECT_HEADER_COUNT=2 \
		git rebase -i --onto master HEAD~2 &&
	test B = $(cat file7) &&
	test $(git rev-parse HEAD^) = $(git rev-parse master)
HEAD is now at 2596307 different author
[branch1 b66532d] nitfol
 Author: Nitfol <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
******************************
rebase -i script before editing:
pick 2596307 different author
pick b66532d nitfol

rebase -i script after editing:
pick 2596307 different author
squash b66532d nitfol
Rebasing (1/2)Rebasing (2/2)[detached HEAD 92841b7] different author
 Author: Twerp Snog <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file7

ok 15 - squash

expecting success: 
	git show HEAD | grep "^Author: Twerp Snog"

Author: Twerp Snog <author@example.com>

ok 16 - retain authorship when squashing

expecting success: 
	HEAD=$(git rev-parse HEAD) &&
	git rebase -i -p HEAD^ &&
	git update-index --refresh &&
	git diff-files --quiet &&
	git diff-index --quiet --cached HEAD -- &&
	test $HEAD = $(git rev-parse HEAD)
Rebasing (1/1)
ok 17 - -p handles "no changes" gracefully
checking known breakage: 
	FAKE_LINES="2 1" git rebase -i -p HEAD~2 &&
	test H = $(git cat-file commit HEAD^ | sed -ne \$p) &&
	test G = $(git cat-file commit HEAD | sed -ne \$p)
rebase -i script before editing:
pick 8f99a4f E
pick 92841b7 different author
rebase -i script after editing:
pick 92841b7 different author
pick 8f99a4f E
Rebasing (1/2)Rebasing (2/2)
not ok 18 - exchange two commits with -p # TODO known breakage

expecting success: 
	git checkout -b to-be-preserved master^ &&
	: > unrelated-file &&
	git add unrelated-file &&
	test_tick &&
	git commit -m "unrelated" &&
	git checkout -b another-branch master &&
	echo B > file1 &&
	test_tick &&
	git commit -m J file1 &&
	test_tick &&
	git merge to-be-preserved &&
	echo C > file1 &&
	test_tick &&
	git commit -m K file1 &&
	echo D > file1 &&
	test_tick &&
	git commit -m L1 file1 &&
	git checkout HEAD^ &&
	echo 1 > unrelated-file &&
	test_tick &&
	git commit -m L2 unrelated-file &&
	test_tick &&
	git merge another-branch &&
	echo E > file1 &&
	test_tick &&
	git commit -m M file1 &&
	git checkout -b to-be-rebased &&
	test_tick &&
	git rebase -i -p --onto branch1 master &&
	git update-index --refresh &&
	git diff-files --quiet &&
	git diff-index --quiet --cached HEAD -- &&
	test $(git rev-parse HEAD~6) = $(git rev-parse branch1) &&
	test $(git rev-parse HEAD~4^2) = $(git rev-parse to-be-preserved) &&
	test $(git rev-parse HEAD^^2^) = $(git rev-parse HEAD^^^) &&
	test $(git show HEAD~5:file1) = B &&
	test $(git show HEAD~3:file1) = C &&
	test $(git show HEAD:file1) = E &&
	test $(git show HEAD:unrelated-file) = 1

[to-be-preserved d5c01b6] unrelated
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 unrelated-file
[another-branch a9a73c1] J
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Merging:
a9a73c1 J
virtual to-be-preserved
found 1 common ancestor(s):
0547e3f D
Merge made by recursive.
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 unrelated-file
[another-branch 03b537d] K
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[another-branch 3ea8fda] L1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[detached HEAD a41631e] L2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Merging:
a41631e L2
virtual another-branch
found 1 common ancestor(s):
03b537d K
Merge made by recursive.
 file1 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
[detached HEAD 1289f52] M
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (1/7)Rebasing (2/7)Rebasing (3/7)Rebasing (4/7)Rebasing (5/7)Rebasing (6/7)Rebasing (7/7)
ok 19 - preserve merges with -p

expecting success: 
	FAKE_LINES="1 edit 2 3 4" git rebase -i -p HEAD~3 &&
	echo 2 > unrelated-file &&
	test_tick &&
	git commit -m L2-modified --amend unrelated-file &&
	git rebase --continue &&
	git update-index --refresh &&
	git diff-files --quiet &&
	git diff-index --quiet --cached HEAD -- &&
	test $(git show HEAD:unrelated-file) = 2

rebase -i script before editing:
pick a41631e L2
pick 9b82a6b Merge branch 'another-branch' into HEAD
pick 1289f52 M

rebase -i script after editing:
pick a41631e L2
edit 9b82a6b Merge branch 'another-branch' into HEAD
pick 1289f52 M
Rebasing (1/3)Rebasing (2/3)[detached HEAD 0009164] L2-modified
 Author: A U Thor <author@example.com>
Rebasing (3/3)
ok 20 - edit ancestor with -p

expecting success: 
	test_tick &&
	test_must_fail git rebase -i --onto new-branch1 HEAD^ &&
	echo resolved > file1 &&
	git add file1 &&
	FAKE_COMMIT_MESSAGE="chouette!" git rebase --continue &&
	test $(git rev-parse HEAD^) = $(git rev-parse new-branch1) &&
	git show HEAD | grep chouette

Rebasing (1/1)error: could not apply de7b892... M
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' and run 'git rebase --continue'
Auto-merging file1
CONFLICT (content): Merge conflict in file1
[detached HEAD 338a701] chouette!
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (1/1)    chouette!

ok 21 - --continue tries to commit

expecting success: 
	git reset --hard HEAD@{1} &&
	test_tick &&
	test_must_fail git rebase -v -i --onto new-branch1 HEAD^ &&
	echo resolved > file1 &&
	git add file1 &&
	git rebase --continue > output &&
	grep "^ file1 |    2 +-$" output

HEAD is now at 5d18e54 G
Rebasing (1/1)
5d18e5414f663da21d1363c271f2d684aeda7b5b
# Not currently on any branch.
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	actual.rev
#	expect
#	expect.rev
#	expect2
#	fake-editor.sh
#	output
#	touch-subdir
nothing added to commit but untracked files present (use "git add" to track)
 file1 |    2 +-

ok 22 - verbose flag is heeded, even after --continue

expecting success: 
	base=$(git rev-parse HEAD~4) &&
	FAKE_COMMIT_AMEND="ONCE" FAKE_LINES="1 squash 2 squash 3 squash 4" \
		EXPECT_HEADER_COUNT=4 \
		git rebase -i $base &&
	test $base = $(git rev-parse HEAD^) &&
	test 1 = $(git show | grep ONCE | wc -l)
rebase -i script before editing:
pick 615be62 I
pick 0626e8d H
pick 5d18e54 G
pick 24afa51 G
rebase -i script after editing:
pick 615be62 I
squash 0626e8d H
squash 5d18e54 G
squash 24afa51 G
Rebasing (2/4)Rebasing (3/4)Rebasing (4/4)[detached HEAD 6a140ca] I
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 1 deletions(-)
 create mode 100644 file5
 create mode 100644 file6

ok 23 - multi-squash only fires up editor once

expecting success: 
	git checkout -b multi-fixup E &&
	base=$(git rev-parse HEAD~4) &&
	FAKE_COMMIT_AMEND="NEVER" FAKE_LINES="1 fixup 2 fixup 3 fixup 4" \
		git rebase -i $base &&
	test $base = $(git rev-parse HEAD^) &&
	test 0 = $(git show | grep NEVER | wc -l) &&
	git checkout to-be-rebased &&
	git branch -D multi-fixup

rebase -i script before editing:
pick 313fe96 B
pick d0f65f2 C
pick 0547e3f D
pick 8f99a4f E

rebase -i script after editing:
pick 313fe96 B
fixup d0f65f2 C
fixup 0547e3f D
fixup 8f99a4f E
Rebasing (2/4)Rebasing (3/4)Rebasing (4/4)[detached HEAD d5bfe99] B
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 1 deletions(-)
 create mode 100644 file2
 create mode 100644 file3
Deleted branch multi-fixup (was d5bfe99).

ok 24 - multi-fixup does not fire up editor
expecting success: 
	git checkout -b conflict-fixup conflict-branch &&
	base=$(git rev-parse HEAD~4) &&
	(
		FAKE_LINES="1 fixup 3 fixup 4" &&
		export FAKE_LINES &&
		test_must_fail git rebase -i $base
	) &&
	echo three > conflict &&
	git add conflict &&
	FAKE_COMMIT_AMEND="ONCE" EXPECT_HEADER_COUNT=2 \
		git rebase --continue &&
	test $base = $(git rev-parse HEAD^) &&
	test 1 = $(git show | grep ONCE | wc -l) &&
	git checkout to-be-rebased &&
	git branch -D conflict-fixup
rebase -i script before editing:
pick b895952 one
pick 766a798 two
pick 1eadf03 three
pick f91a2b3 four

rebase -i script after editing:
pick b895952 one
fixup 1eadf03 three
fixup f91a2b3 four
Rebasing (2/3)error: could not apply 1eadf03... three
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' and run 'git rebase --continue'
Auto-merging conflict
CONFLICT (content): Merge conflict in conflict
[detached HEAD 664f99b] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 conflict
Rebasing (3/3)[detached HEAD 3fcdd94] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 conflict
Deleted branch conflict-fixup (was 3fcdd94).

ok 25 - commit message used after conflict

expecting success: 
	git checkout -b conflict-squash conflict-branch &&
	base=$(git rev-parse HEAD~4) &&
	(
		FAKE_LINES="1 fixup 3 squash 4" &&
		export FAKE_LINES &&
		test_must_fail git rebase -i $base
	) &&
	echo three > conflict &&
	git add conflict &&
	FAKE_COMMIT_AMEND="TWICE" EXPECT_HEADER_COUNT=2 \
		git rebase --continue &&
	test $base = $(git rev-parse HEAD^) &&
	test 2 = $(git show | grep TWICE | wc -l) &&
	git checkout to-be-rebased &&
	git branch -D conflict-squash

rebase -i script before editing:
pick b895952 one
pick 766a798 two
pick 1eadf03 three
pick f91a2b3 four

rebase -i script after editing:
pick b895952 one
fixup 1eadf03 three
squash f91a2b3 four
Rebasing (2/3)error: could not apply 1eadf03... three
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' and run 'git rebase --continue'
Auto-merging conflict
CONFLICT (content): Merge conflict in conflict
[detached HEAD e169bcc] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 conflict
Rebasing (3/3)[detached HEAD dc13e91] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 conflict
Deleted branch conflict-squash (was dc13e91).

ok 26 - commit message retained after conflict

expecting success: 
	git checkout -b squash-fixup E &&
	base=$(git rev-parse HEAD~4) &&
	FAKE_COMMIT_AMEND="ONCE" FAKE_LINES="1 fixup 2 squash 3 fixup 4" \
		EXPECT_HEADER_COUNT=4 \
		git rebase -i $base &&
	git cat-file commit HEAD | sed -e 1,/^\$/d > actual-squash-fixup &&
	test_cmp expect-squash-fixup actual-squash-fixup &&
	git checkout to-be-rebased &&
	git branch -D squash-fixup
rebase -i script before editing:
pick 313fe96 B
pick d0f65f2 C
pick 0547e3f D
pick 8f99a4f E

rebase -i script after editing:
pick 313fe96 B
fixup d0f65f2 C
squash 0547e3f D
fixup 8f99a4f E
Rebasing (2/4)Rebasing (3/4)Rebasing (4/4)[detached HEAD db81eb6] B
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 1 deletions(-)
 create mode 100644 file2
 create mode 100644 file3
Deleted branch squash-fixup (was db81eb6).

ok 27 - squash and fixup generate correct log messages

expecting success: 
	git checkout -b skip-comments E &&
	base=$(git rev-parse HEAD~4) &&
	FAKE_COMMIT_AMEND="ONCE" FAKE_LINES="# 1 # squash 2 # squash 3 # squash 4 #" \
		EXPECT_HEADER_COUNT=4 \
		git rebase -i $base &&
	test $base = $(git rev-parse HEAD^) &&
	test 1 = $(git show | grep ONCE | wc -l) &&
	git checkout to-be-rebased &&
	git branch -D skip-comments

rebase -i script before editing:
pick 313fe96 B
pick d0f65f2 C
pick 0547e3f D
pick 8f99a4f E

rebase -i script after editing:
# comment
pick 313fe96 B
# comment
squash d0f65f2 C
# comment
squash 0547e3f D
# comment
squash 8f99a4f E
# comment
Rebasing (2/4)Rebasing (3/4)Rebasing (4/4)[detached HEAD 97b27d8] B
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 1 deletions(-)
 create mode 100644 file2
 create mode 100644 file3
Deleted branch skip-comments (was 97b27d8).

ok 28 - squash ignores comments

expecting success: 
	git checkout -b skip-blank-lines E &&
	base=$(git rev-parse HEAD~4) &&
	FAKE_COMMIT_AMEND="ONCE" FAKE_LINES="> 1 > squash 2 > squash 3 > squash 4 >" \
		EXPECT_HEADER_COUNT=4 \
		git rebase -i $base &&
	test $base = $(git rev-parse HEAD^) &&
	test 1 = $(git show | grep ONCE | wc -l) &&
	git checkout to-be-rebased &&
	git branch -D skip-blank-lines
rebase -i script before editing:
pick 313fe96 B
pick d0f65f2 C
pick 0547e3f D
pick 8f99a4f E

rebase -i script after editing:

pick 313fe96 B

squash d0f65f2 C

squash 0547e3f D

squash 8f99a4f E
Rebasing (2/4)Rebasing (3/4)Rebasing (4/4)[detached HEAD 97b27d8] B
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 1 deletions(-)
 create mode 100644 file2
 create mode 100644 file3
Deleted branch skip-blank-lines (was 97b27d8).

ok 29 - squash ignores blank lines

expecting success: 
	git checkout -b squash-works no-conflict-branch &&
	one=$(git rev-parse HEAD~3) &&
	FAKE_LINES="1 squash 3 2" EXPECT_HEADER_COUNT=2 \
		git rebase -i HEAD~3 &&
	test $one = $(git rev-parse HEAD~2)
rebase -i script before editing:
pick 265b89e K
pick 6b0f5e6 L
pick 3389558 M
rebase -i script after editing:
pick 265b89e K
squash 3389558 M
pick 6b0f5e6 L
Rebasing (2/3)[detached HEAD 6a76a44] K
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileK
 create mode 100644 fileM
Rebasing (3/3)
ok 30 - squash works as expected

expecting success: 
	git checkout -b interrupted-squash conflict-branch &&
	one=$(git rev-parse HEAD~3) &&
	(
		FAKE_LINES="1 squash 3 2" &&
		export FAKE_LINES &&
		test_must_fail git rebase -i HEAD~3
	) &&
	(echo one; echo two; echo four) > conflict &&
	git add conflict &&
	test_must_fail git rebase --continue &&
	echo resolved > conflict &&
	git add conflict &&
	git rebase --continue &&
	test $one = $(git rev-parse HEAD~2)

rebase -i script before editing:
pick 766a798 two
pick 1eadf03 three
pick f91a2b3 four
rebase -i script after editing:
pick 766a798 two
squash f91a2b3 four
pick 1eadf03 three
Rebasing (2/3)error: could not apply f91a2b3... four
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' and run 'git rebase --continue'
Auto-merging conflict
CONFLICT (content): Merge conflict in conflict
[detached HEAD 82f592b] two
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
Rebasing (3/3)error: could not apply 1eadf03... three
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' and run 'git rebase --continue'
Auto-merging conflict
CONFLICT (content): Merge conflict in conflict
[detached HEAD d5f0b37] three
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 3 deletions(-)
Rebasing (3/3)
ok 31 - interrupted squash works as expected

expecting success: 
	git checkout -b interrupted-squash2 conflict-branch &&
	one=$(git rev-parse HEAD~3) &&
	(
		FAKE_LINES="3 squash 1 2" &&
		export FAKE_LINES &&
		test_must_fail git rebase -i HEAD~3
	) &&
	(echo one; echo four) > conflict &&
	git add conflict &&
	test_must_fail git rebase --continue &&
	(echo one; echo two; echo four) > conflict &&
	git add conflict &&
	test_must_fail git rebase --continue &&
	echo resolved > conflict &&
	git add conflict &&
	git rebase --continue &&
	test $one = $(git rev-parse HEAD~2)
rebase -i script before editing:
pick 766a798 two
pick 1eadf03 three
pick f91a2b3 four
rebase -i script after editing:
pick f91a2b3 four
squash 766a798 two
pick 1eadf03 three
Rebasing (1/3)error: could not apply f91a2b3... four
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' and run 'git rebase --continue'
Auto-merging conflict
CONFLICT (content): Merge conflict in conflict
[detached HEAD 24cb541] four
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Rebasing (2/3)error: could not apply 766a798... two
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' and run 'git rebase --continue'
Auto-merging conflict
CONFLICT (content): Merge conflict in conflict
[detached HEAD fd1e6f3] four
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
Rebasing (3/3)error: could not apply 1eadf03... three
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' and run 'git rebase --continue'
Auto-merging conflict
CONFLICT (content): Merge conflict in conflict
[detached HEAD 9cc5563] three
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 3 deletions(-)
Rebasing (3/3)
ok 32 - interrupted squash works as expected (case 2)
expecting success: 
	HEAD=$(git rev-parse HEAD) &&
	git checkout -b has-cherry-picked HEAD^ &&
	echo unrelated > file7 &&
	git add file7 &&
	test_tick &&
	git commit -m "unrelated change" &&
	git cherry-pick $HEAD &&
	EXPECT_COUNT=1 git rebase -i $HEAD &&
	test $HEAD = $(git rev-parse HEAD^)
[has-cherry-picked 6347786] unrelated change
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file7
[has-cherry-picked 35fffa9] three
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 3 deletions(-)
Rebasing (1/1)
ok 33 - ignore patch if in upstream

expecting success: 
	parent=$(git rev-parse HEAD^) &&
	test_tick &&
	FAKE_LINES="edit 1" git rebase -i HEAD^ &&
	echo edited > file7 &&
	git add file7 &&
	FAKE_COMMIT_MESSAGE="chouette!" git rebase --continue &&
	test edited = $(git show HEAD:file7) &&
	git show HEAD | grep chouette &&
	test $parent = $(git rev-parse HEAD^)
rebase -i script before editing:
pick 639d3c3 unrelated change
rebase -i script after editing:
edit 639d3c3 unrelated change
Rebasing (1/1)[detached HEAD 4d72f65] chouette!
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file7
Rebasing (1/1)    chouette!
ok 34 - --continue tries to commit, even for "edit"
expecting success: 
	old=$(git rev-parse HEAD) &&
	test_tick &&
	FAKE_LINES="edit 1" git rebase -i HEAD^ &&
	echo "edited again" > file7 &&
	git add file7 &&
	(
		FAKE_COMMIT_MESSAGE=" " &&
		export FAKE_COMMIT_MESSAGE &&
		test_must_fail git rebase --continue
	) &&
	test $old = $(git rev-parse HEAD) &&
	git rebase --abort
rebase -i script before editing:
pick 4d72f65 chouette!

rebase -i script after editing:
edit 4d72f65 chouette!
Rebasing (1/1)
ok 35 - aborted --continue does not squash commits after "edit"
expecting success: 
	test_tick &&
	FAKE_LINES="edit 1" git rebase -i HEAD^ &&
	echo "edited again" > file7 &&
	git add file7 &&
	FAKE_COMMIT_MESSAGE="edited file7 again" git commit &&
	echo "and again" > file7 &&
	git add file7 &&
	test_tick &&
	(
		FAKE_COMMIT_MESSAGE="and again" &&
		export FAKE_COMMIT_MESSAGE &&
		test_must_fail git rebase --continue
	) &&
	git rebase --abort
rebase -i script before editing:
pick 4d72f65 chouette!

rebase -i script after editing:
edit 4d72f65 chouette!
Rebasing (1/1)[detached HEAD c3f95ca] edited file7 again
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 36 - auto-amend only edited commits after "edit"

expecting success: 
	grandparent=$(git rev-parse HEAD~2) &&
	git checkout $(git rev-parse HEAD) &&
	test_tick &&
	FAKE_LINES="2 1" git rebase -i HEAD~2 &&
	test $grandparent = $(git rev-parse HEAD~2)
rebase -i script before editing:
pick 9cc5563 three
pick 4d72f65 chouette!

rebase -i script after editing:
pick 4d72f65 chouette!
pick 9cc5563 three
Rebasing (1/2)Rebasing (2/2)
ok 37 - rebase a detached HEAD

expecting success: 

	mkdir -p .git/hooks &&
	PRE_COMMIT=.git/hooks/pre-commit &&
	echo "#!/bin/sh" > $PRE_COMMIT &&
	echo "test -z \"\$(git diff --cached --check)\"" >> $PRE_COMMIT &&
	chmod a+x $PRE_COMMIT &&
	echo "monde! " >> file1 &&
	test_tick &&
	test_must_fail git commit -m doesnt-verify file1 &&
	git commit -m doesnt-verify --no-verify file1 &&
	test_tick &&
	FAKE_LINES=2 git rebase -i HEAD~2
[detached HEAD 0d9c519] doesnt-verify
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
rebase -i script before editing:
pick 279c1d3 three
pick 0d9c519 doesnt-verify

rebase -i script after editing:
pick 0d9c519 doesnt-verify
Rebasing (1/1)
ok 38 - rebase a commit violating pre-commit

expecting success: 

	rm -fr .git/hooks &&
	git reset --hard &&
	git checkout -b branch3 A &&

	(
		GIT_AUTHOR_NAME="Squashed Away" &&
		export GIT_AUTHOR_NAME &&
		>HEAD &&
		git add HEAD &&
		git commit -m "Add head" &&
		>BODY &&
		git add BODY &&
		git commit -m "Add body"
	) &&

	FAKE_LINES="1 squash 2" git rebase -i to-be-rebased &&
	test "$(git show -s --pretty=format:%an)" = "Squashed Away"


HEAD is now at 9cae55a doesnt-verify
[branch3 c231295] Add head
 Author: Squashed Away <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 HEAD
[branch3 94c1a4d] Add body
 Author: Squashed Away <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 BODY
rebase -i script before editing:
pick c231295 Add head
pick 94c1a4d Add body
rebase -i script after editing:
pick c231295 Add head
squash 94c1a4d Add body
Rebasing (1/2)Rebasing (2/2)[detached HEAD c868ee1] Add head
 Author: Squashed Away <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 BODY
 create mode 100644 HEAD

ok 39 - rebase with a file named HEAD in worktree

expecting success: 

	git checkout -b branch4 HEAD &&
	GIT_EDITOR=: git commit --amend \
		--author="Somebody else <somebody@else.com>" &&
	test $(git rev-parse branch3) != $(git rev-parse branch4) &&
	git rebase -i branch3 &&
	test $(git rev-parse branch3) = $(git rev-parse branch4)
[branch4 5892fa2] Add head
 Author: Somebody else <somebody@else.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 BODY
 create mode 100644 HEAD
Rebasing (1/1)
ok 40 - do "noop" when there is nothing to cherry-pick
expecting success: 
	git checkout A &&
	mkdir sub &&
	(
		cd sub && git init && >elif &&
		git add elif && git commit -m "submodule initial"
	) &&
	echo 1 >file1 &&
	git add file1 sub &&
	test_tick &&
	git commit -m "One" &&
	echo 2 >file1 &&
	test_tick &&
	git commit -a -m "Two" &&
	(
		cd sub && echo 3 >elif &&
		git commit -a -m "submodule second"
	) &&
	test_tick &&
	git commit -a -m "Three changes submodule"
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3404-rebase-interactive/sub/.git/
[master (root-commit) 12a1715] submodule initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 elif
[detached HEAD e2ef0a0] One
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 1 deletions(-)
 create mode 160000 sub
[detached HEAD 08b5ec9] Two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master c48704f] submodule second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[detached HEAD 6228dac] Three changes submodule
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 41 - submodule rebase setup
expecting success: 
	FAKE_LINES="1 squash 2 3" git rebase -i A
rebase -i script before editing:
pick e2ef0a0 One
pick 08b5ec9 Two
pick 6228dac Three changes submodule
rebase -i script after editing:
pick e2ef0a0 One
squash 08b5ec9 Two
pick 6228dac Three changes submodule
Rebasing (2/3)[detached HEAD a4966fe] One
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 1 deletions(-)
 create mode 160000 sub
Rebasing (3/3)
ok 42 - submodule rebase -i
expecting success: 
	git checkout master &&
	test-chmtime =123456789 file3 &&
	git update-index --refresh &&
	HEAD=$(git rev-parse HEAD) &&
	git rebase -i HEAD~4 &&
	test $HEAD = $(git rev-parse HEAD) &&
	MTIME=$(test-chmtime -v +0 file3 | sed s/[^0-9].*$//) &&
	test 123456789 = $MTIME
Rebasing (4/4)
ok 43 - avoid unnecessary reset
expecting success: 
	git checkout -b reword-branch master &&
	FAKE_LINES="1 2 3 reword 4" FAKE_COMMIT_MESSAGE="E changed" git rebase -i A &&
	git show HEAD | grep "E changed" &&
	test $(git rev-parse master) != $(git rev-parse HEAD) &&
	test $(git rev-parse master^) = $(git rev-parse HEAD^) &&
	FAKE_LINES="1 2 reword 3 4" FAKE_COMMIT_MESSAGE="D changed" git rebase -i A &&
	git show HEAD^ | grep "D changed" &&
	FAKE_LINES="reword 1 2 3 4" FAKE_COMMIT_MESSAGE="B changed" git rebase -i A &&
	git show HEAD~3 | grep "B changed" &&
	FAKE_LINES="1 reword 2 3 4" FAKE_COMMIT_MESSAGE="C changed" git rebase -i A &&
	git show HEAD~2 | grep "C changed"
rebase -i script before editing:
pick 313fe96 B
pick d0f65f2 C
pick 0547e3f D
pick 8f99a4f E
rebase -i script after editing:
pick 313fe96 B
pick d0f65f2 C
pick 0547e3f D
reword 8f99a4f E
Rebasing (4/4)[detached HEAD 84856ab] E changed
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file3
    E changed
rebase -i script before editing:
pick 313fe96 B
pick d0f65f2 C
pick 0547e3f D
pick 84856ab E changed
rebase -i script after editing:
pick 313fe96 B
pick d0f65f2 C
reword 0547e3f D
pick 84856ab E changed
Rebasing (3/4)[detached HEAD 428dea0] D changed
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (4/4)    D changed
rebase -i script before editing:
pick 313fe96 B
pick d0f65f2 C
pick 428dea0 D changed
pick 95e0fef E changed
rebase -i script after editing:
reword 313fe96 B
pick d0f65f2 C
pick 428dea0 D changed
pick 95e0fef E changed
Rebasing (1/4)[detached HEAD 8f7170c] B changed
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/4)Rebasing (3/4)Rebasing (4/4)    B changed
rebase -i script before editing:
pick 8f7170c B changed
pick c117770 C
pick 246e4da D changed
pick 4bb8d73 E changed
rebase -i script after editing:
pick 8f7170c B changed
reword c117770 C
pick 246e4da D changed
pick 4bb8d73 E changed
Rebasing (2/4)[detached HEAD b007611] C changed
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2
Rebasing (3/4)Rebasing (4/4)    C changed

ok 44 - reword
expecting success: 
	git config notes.rewrite.rebase true &&
	git config notes.rewriteRef "refs/notes/*" &&
	test_commit n1 &&
	test_commit n2 &&
	test_commit n3 &&
	git notes add -m"a note" n3 &&
	git rebase --onto n1 n2 &&
	test "a note" = "$(git notes show HEAD)"
[reword-branch 8f63dc3] n1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 n1.t
[reword-branch 4f9c955] n2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 n2.t
[reword-branch 1fd0f70] n3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 n3.t
First, rewinding head to replay your work on top of it...
Applying: n3

ok 45 - rebase -i can copy notes

expecting success: 
	git reset --hard n3 &&
	git notes add -m"an earlier note" n2 &&
	GIT_NOTES_REWRITE_MODE=concatenate FAKE_LINES="1 fixup 2" git rebase -i n1 &&
	git notes show > output &&
	test_cmp expect output

HEAD is now at 1fd0f70 n3
rebase -i script before editing:
pick 4f9c955 n2
pick 1fd0f70 n3
rebase -i script after editing:
pick 4f9c955 n2
fixup 1fd0f70 n3
Rebasing (2/2)[detached HEAD 3d9084f] n2
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 n2.t
 create mode 100644 n3.t
ok 46 - rebase -i can copy notes over a fixup

expecting success: 
	git symbolic-ref HEAD &&
	grandparent=$(git rev-parse HEAD~2) &&
	test_tick &&
	FAKE_LINES="2 1" git rebase -i HEAD~2 HEAD^0 &&
	test $grandparent = $(git rev-parse HEAD~2) &&
	test_must_fail git symbolic-ref HEAD
refs/heads/reword-branch
rebase -i script before editing:
pick 8f63dc3 n1
pick 3d9084f n2
rebase -i script after editing:
pick 3d9084f n2
pick 8f63dc3 n1
Rebasing (1/2)Rebasing (2/2)
ok 47 - rebase while detaching HEAD
expecting success: 
	git checkout no-ff-branch &&
	git tag original-no-ff-branch &&
	git rebase -i --no-ff A &&
	touch empty &&
	for p in 0 1 2
	do
		test ! $(git rev-parse HEAD~$p) = $(git rev-parse original-no-ff-branch~$p) &&
		git diff HEAD~$p original-no-ff-branch~$p > out &&
		test_cmp empty out
	done &&
	test $(git rev-parse HEAD~3) = $(git rev-parse original-no-ff-branch~3) &&
	git diff HEAD~3 original-no-ff-branch~3 > out &&
	test_cmp empty out
Rebasing (1/3)Rebasing (2/3)Rebasing (3/3)
ok 48 - always cherry-pick with --no-ff
expecting success: 
	git checkout -b funny A &&
	echo >>file1 &&
	test_tick &&
	git commit -a -m "end with slash\" &&
	echo >>file1 &&
	test_tick &&
	git commit -a -m "something ( ) that looks like octal" &&
	echo >>file1 &&
	test_tick &&
	git commit -a -m "something (
) that looks like a newline" &&
	echo >>file1 &&
	test_tick &&
	git commit -a -m "another commit"
[funny f6fec15] end with slash\
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[funny 4f2ade4] something (\000) that looks like octal
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[funny f95dfbf] something (\n) that looks like a newline
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[funny 0e82af6] another commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 49 - set up commits with funny messages
expecting success: 
	git rev-list A..funny >expect &&
	test_tick &&
	FAKE_LINES="1 2 3 4" git rebase -i A &&
	git rev-list A.. >actual &&
	test_cmp expect actual
rebase -i script before editing:
pick f6fec15 end with slash\
pick 4f2ade4 something (\000) that looks like octal
pick f95dfbf something (\n) that looks like a newline
pick 0e82af6 another commit
rebase -i script after editing:
pick f6fec15 end with slash\
pick 4f2ade4 something (\000) that looks like octal
pick f95dfbf something (\n) that looks like a newline
pick 0e82af6 another commit
Rebasing (4/4)
ok 50 - rebase-i history with funny messages

# still have 1 known breakage(s)
# passed all remaining 49 test(s)
1..50
