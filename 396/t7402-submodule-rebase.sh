Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7402-submodule-rebase/.git/
expecting success: 

	echo file > file &&
	git add file &&
	test_tick &&
	git commit -m initial &&
	git clone . submodule &&
	git add submodule &&
	test_tick &&
	git commit -m submodule &&
	echo second line >> file &&
	(cd submodule && git pull) &&
	test_tick &&
	git commit -m file-and-submodule -a
[master (root-commit) ffefb50] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
Cloning into submodule...
done.
[master 9bd10db] submodule
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 160000 submodule
Updating ffefb50..9bd10db
Fast-forward
 submodule |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 160000 submodule
[master 041f541] file-and-submodule
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 

	(cd submodule &&
	 echo 3rd line >> file &&
	 test_tick &&
	 git commit -m fork -a) &&
	echo unrelated >> file2 &&
	git add file2 &&
	test_tick &&
	git commit -m unrelated file2 &&
	echo other line >> file &&
	test_tick &&
	git commit -m update file &&
	CURRENT=$(cd submodule && git rev-parse HEAD) &&
	EXPECTED=$(git rev-parse HEAD~2:submodule) &&
	GIT_TRACE=1 git rebase --onto HEAD~2 HEAD^ &&
	STORED=$(git rev-parse HEAD:submodule) &&
	test $EXPECTED = $STORED &&
	test $CURRENT = $(cd submodule && git rev-parse HEAD)
[master eb5e1a6] fork
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master b5e9d7b] unrelated
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2
[master a65f80c] update
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
First, rewinding head to replay your work on top of it...
Applying: update

ok 2 - rebase with a dirty submodule

expecting success: 

	test submodule = $(git diff --name-only) &&
	HEAD=$(git rev-parse HEAD) &&
	GIT_EDITOR="\"$(pwd)/fake-editor.sh\"" EDITOR_TEXT="pick $HEAD" \
		git rebase -i HEAD^ &&
	test submodule = $(git diff --name-only)
pick 81a011672801a6d53f73688ebde4d518274102e6
Rebasing (1/1)
ok 3 - interactive rebase with a dirty submodule

expecting success: 

	echo yet another line >> file &&
	test_tick &&
	git commit -m next file &&
	echo rewrite > file &&
	test_tick &&
	git commit -m rewrite file &&
	echo dirty > file &&
	test_must_fail git rebase --onto HEAD~2 HEAD^
[master 260764e] next
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 63179b5] rewrite
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 4 deletions(-)

ok 4 - rebase with dirty file and submodule fails

expecting success: 

	echo new > file &&
	CURRENT=$(cd submodule && git rev-parse HEAD) &&
	git stash &&
	test new != $(cat file) &&
	test submodule = $(git diff --name-only) &&
	test $CURRENT = $(cd submodule && git rev-parse HEAD) &&
	git stash apply &&
	test new = $(cat file) &&
	test $CURRENT = $(cd submodule && git rev-parse HEAD)
Saved working directory and index state WIP on master: 63179b5 rewrite
HEAD is now at 63179b5 rewrite
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 8b045485d7af7da389e60eb467551e426da98c59
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   file
#	modified:   submodule (new commits)
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	fake-editor.sh
no changes added to commit (use "git add" and/or "git commit -a")

ok 5 - stash with a dirty submodule

# passed all 5 test(s)
1..5
