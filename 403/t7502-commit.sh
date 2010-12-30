Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7502-commit/.git/
expecting success: 

	echo new >file1 &&
	git add file1 &&
	check_summary_oneline "root-commit" "initial" &&

	echo change >>file1 &&
	git add file1 &&
	check_summary_oneline "" "a change"

ok 1 - output summary format

expecting success: 

	check_summary_oneline "" "empty" "--allow-empty"

ok 2 - output summary format for commit with an empty diff

expecting success: 

	git checkout -b recursive-base &&
	test_commit base file1 &&

	git checkout -b recursive-a recursive-base &&
	test_commit commit-a file1 &&

	git checkout -b recursive-b recursive-base &&
	test_commit commit-b file1 &&

	# conflict
	git checkout recursive-a &&
	test_must_fail git merge recursive-b &&
	# resolve the conflict
	echo commit-a > file1 &&
	git add file1 &&
	check_summary_oneline "" "Merge"
[recursive-base e6f945f] base
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 2 deletions(-)
[recursive-a 9300328] commit-a
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[recursive-b 2f9e083] commit-b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Merging:
9300328 commit-a
virtual recursive-b
found 1 common ancestor(s):
e6f945f base
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.

ok 3 - output summary format for merges

expecting success: 

	output_tests_cleanup &&

	echo doing partial >"commit is" &&
	mkdir not &&
	echo very much encouraged but we should >not/forbid &&
	git add "commit is" not &&
	echo update added "commit is" file >"commit is" &&
	echo also update another >not/forbid &&
	test_tick &&
	git commit -a -m "initial with -a" &&

	git cat-file blob HEAD:"commit is" >current.1 &&
	git cat-file blob HEAD:not/forbid >current.2 &&

	cmp current.1 "commit is" &&
	cmp current.2 not/forbid
rm 'file1'
[master 34ca441] cleanup
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 2 deletions(-)
 delete mode 100644 file1
[master 8a2203d] initial with -a
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 commit is
 create mode 100644 not/forbid

ok 4 - the basics

expecting success: 

	echo another >"commit is" &&
	echo another >not/forbid &&
	test_tick &&
	git commit -m "partial commit to handle a file" "commit is" &&

	changed=$(git diff-tree --name-only HEAD^ HEAD) &&
	test "$changed" = "commit is"
[master 3302250] partial commit to handle a file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 5 - partial
expecting success: 

	test_tick &&
	git commit -m "partial commit to subdirectory" not &&

	changed=$(git diff-tree -r --name-only HEAD^ HEAD) &&
	test "$changed" = "not/forbid"
[master 742b3a6] partial commit to subdirectory
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 6 - partial modification in a subdirectory
expecting success: 

	git rm not/forbid &&
	git commit -m "partial commit to remove not/forbid" not &&

	changed=$(git diff-tree -r --name-only HEAD^ HEAD) &&
	test "$changed" = "not/forbid" &&
	remain=$(git ls-tree -r --name-only HEAD) &&
	test "$remain" = "commit is"
rm 'not/forbid'
[master 09fd303] partial commit to remove not/forbid
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 not/forbid

ok 7 - partial removal

expecting success: 

	>positive &&
	git add positive &&
	git commit -s -m "thank you" &&
	actual=$(git cat-file commit HEAD | sed -ne "s/Signed-off-by: //p") &&
	expected=$(git var GIT_COMMITTER_IDENT | sed -e "s/>.*/>/") &&
	test "z$actual" = "z$expected"
[master cc1232b] thank you
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 positive

ok 8 - sign off
expecting success: 

	>negative &&
	git add negative &&
	git commit -m "one" -m "two" -m "three" &&
	actual=$(git cat-file commit HEAD | sed -e "1,/^\$/d") &&
	expected=$(echo one; echo; echo two; echo; echo three) &&
	test "z$actual" = "z$expected"
[master 19f335d] one
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 negative

ok 9 - multiple -m

expecting success: 

	echo minus >negative &&
	git add negative &&
	git status -v | sed -ne "/^diff --git /p" >actual &&
	echo "diff --git a/negative b/negative" >expect &&
	test_cmp expect actual



ok 10 - verbose

expecting success: 

	git config color.diff always &&
	git status -v >actual &&
	grep "\[1mdiff --git" actual &&
	git config --unset color.diff

[1mdiff --git a/negative b/negative[m

ok 11 - verbose respects diff config

expecting success: 

	echo >>negative &&
	{ echo;echo "# text";echo; } >expect &&
	git commit --cleanup=verbatim -t expect -a &&
	git cat-file -p HEAD |sed -e "1,/^\$/d" |head -n 3 >actual &&
	test_cmp expect actual


[master 3f844f8] # text
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)

ok 12 - cleanup commit messages (verbatim,-t)

expecting success: 

	echo >>negative &&
	git commit --cleanup=verbatim -F expect -a &&
	git cat-file -p HEAD |sed -e "1,/^\$/d">actual &&
	test_cmp expect actual
[master b0c28f9] # text
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 13 - cleanup commit messages (verbatim,-F)
expecting success: 

	echo >>negative &&
	git commit --cleanup=verbatim -m "$(cat expect)" -a &&
	git cat-file -p HEAD |sed -e "1,/^\$/d">actual &&
	test_cmp expect actual
[master 03ea1a9] # text
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 14 - cleanup commit messages (verbatim,-m)
expecting success: 

	echo >>negative &&
	{ echo;echo "# text";echo; } >text &&
	echo "# text" >expect &&
	git commit --cleanup=whitespace -F text -a &&
	git cat-file -p HEAD |sed -e "1,/^\$/d">actual &&
	test_cmp expect actual
[master 6e1f070] # text
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 15 - cleanup commit messages (whitespace,-F)
expecting success: 

	echo >>negative &&
	{ echo;echo "# text";echo sample;echo; } >text &&
	echo sample >expect &&
	git commit --cleanup=strip -F text -a &&
	git cat-file -p HEAD |sed -e "1,/^\$/d">actual &&
	test_cmp expect actual
[master b39c4bd] sample
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 16 - cleanup commit messages (strip,-F)
expecting success: 

	echo >>negative &&
	{ echo;echo sample;echo; } >text &&
	git commit -e -F text -a &&
	head -n 4 .git/COMMIT_EDITMSG >actual &&
	test_cmp expect actual
[master 3845419] sample
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 17 - cleanup commit messages (strip,-F,-e)
expecting success: 

	echo >>negative &&
	git commit -e -m "sample"
	head -n 7 .git/COMMIT_EDITMSG >actual &&
	test_cmp expect actual
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   negative
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	act
#	actual
#	current.1
#	current.2
#	exp
#	expect
#	text
no changes added to commit (use "git add" and/or "git commit -a")

ok 18 - author different from committer
expecting success: 

	echo >>negative &&
	(
		sane_unset GIT_COMMITTER_EMAIL &&
		sane_unset GIT_COMMITTER_NAME &&
		# must fail because there is no change
		test_must_fail git commit -e -m "sample"
	) &&
	head -n 8 .git/COMMIT_EDITMSG |	\
	sed "s/^# Committer: .*/# Committer:/" >actual &&
	test_cmp expect actual
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   negative
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	act
#	actual
#	current.1
#	current.2
#	exp
#	expect
#	text
no changes added to commit (use "git add" and/or "git commit -a")

ok 19 - committer is automatic
expecting success: 

	git clean -f &&
	echo f >g &&
	git add g &&
	git commit -m "add g" &&
	git branch second &&
	echo master >g &&
	echo g >h &&
	git add g h &&
	git commit -m "modify g and add h" &&
	git checkout second &&
	echo second >g &&
	git add g &&
	git commit -m second &&
	# Must fail due to conflict
	test_must_fail git cherry-pick -n master &&
	echo "editor not started" >.git/result &&
	(
		GIT_EDITOR="$(pwd)/.git/FAKE_EDITOR" &&
		export GIT_EDITOR &&
		test_must_fail git commit
	) &&
	test "$(cat .git/result)" = "editor not started"
Removing act
Removing actual
Removing current.1
Removing current.2
Removing exp
Removing expect
Removing text
[master af147f4] add g
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 g
[master 39bb116] modify g and add h
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 1 deletions(-)
 create mode 100644 h
M	negative
[second b70e801] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Auto-merging g
CONFLICT (content): Merge conflict in g
U	g
ok 20 - do not fire editor in the presence of conflicts
expecting success: 
	echo >>negative &&
	! "$SHELL_PATH" -c '
	  echo kill -TERM $$ >> .git/FAKE_EDITOR
	  GIT_EDITOR=.git/FAKE_EDITOR
	  export GIT_EDITOR
	  exec git commit -a' &&
	test ! -f .git/index.lock

ok 21 - a SIGTERM should break locks
expecting success: 

	git rev-parse second master >expect &&
	test_must_fail git merge second master &&
	git checkout master g &&
	EDITOR=: git commit -a &&
	git cat-file commit HEAD | sed -n -e "s/^parent //p" -e "/^$/q" >actual &&
	test_cmp expect actual
Already up-to-date with second
Trying simple merge with master
Simple merge did not work, trying automatic merge.
Auto-merging g
ERROR: content conflict in g
Automatic merge failed; fix conflicts and then commit the result.
[second 0bf3055] Merge branches 'second' and 'master' into second
 Author: A U Thor <author@example.com>

ok 22 - Hand committing of a redundant merge removes dups

expecting success: 

	git reset --hard &&
	git commit -s -m "hello: kitty" --allow-empty &&
	git cat-file commit HEAD | sed -e "1,/^$/d" >actual &&
	test $(wc -l <actual) = 3


HEAD is now at 0bf3055 Merge branches 'second' and 'master' into second
[second f6abd11] hello: kitty
 Author: A U Thor <author@example.com>

ok 23 - A single-liner subject with a token plus colon is not a footer

expecting success: 
		clear_config commit.status &&
		try_commit "" &&
		grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at f6abd11 hello: kitty
[second b3b9d7f] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
# Changes to be committed:

ok 24 - commit

expecting success: 
		clear_config commit.status &&
		try_commit "" &&
		grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at b3b9d7f message
[second fb1698a] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
# Changes to be committed:

ok 25 - commit

expecting success: 
		clear_config commit.status &&
		try_commit --status &&
		grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at fb1698a message
[second 6db4586] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
# Changes to be committed:

ok 26 - commit --status

expecting success: 
		clear_config commit.status &&
		try_commit --no-status &&
		! grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at 6db4586 message
[second 41d14ab] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 27 - commit --no-status

expecting success: 
		clear_config commit.status &&
		git config commit.status yes &&
		try_commit "" &&
		grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at 41d14ab message
[second e25ee72] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
# Changes to be committed:

ok 28 - commit with commit.status = yes

expecting success: 
		clear_config commit.status &&
		git config commit.status no &&
		try_commit "" &&
		! grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at e25ee72 message
[second d35df05] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 29 - commit with commit.status = no
expecting success: 
		clear_config commit.status &&
		git config commit.status yes &&
		try_commit --status &&
		grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at d35df05 message
[second 0d5ddbd] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
# Changes to be committed:

ok 30 - commit --status with commit.status = yes

expecting success: 
		clear_config commit.status &&
		git config commit.status yes &&
		try_commit --no-status &&
		! grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at 0d5ddbd message
[second 9e56607] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 31 - commit --no-status with commit.status = yes

expecting success: 
		clear_config commit.status &&
		git config commit.status no &&
		try_commit --status &&
		grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at 9e56607 message
[second 181a626] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
# Changes to be committed:

ok 32 - commit --status with commit.status = no

expecting success: 
		clear_config commit.status &&
		git config commit.status no &&
		try_commit --no-status &&
		! grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at 181a626 message
[second fe12854] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 33 - commit --no-status with commit.status = no

expecting success: 
		clear_config commit.status &&
		try_commit "" &&
		grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at fe12854 message
[second 2da1f2f] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
## Custom template
# Changes to be committed:

ok 34 - commit

expecting success: 
		clear_config commit.status &&
		try_commit "" &&
		grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at 2da1f2f message
[second 4b49a76] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
## Custom template
# Changes to be committed:

ok 35 - commit

expecting success: 
		clear_config commit.status &&
		try_commit --status &&
		grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at 4b49a76 message
[second 2c04d77] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
## Custom template
# Changes to be committed:

ok 36 - commit --status
expecting success: 
		clear_config commit.status &&
		try_commit --no-status &&
		! grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at 2c04d77 message
[second d67ceaf] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
## Custom template
ok 37 - commit --no-status

expecting success: 
		clear_config commit.status &&
		git config commit.status yes &&
		try_commit "" &&
		grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at d67ceaf message
[second d42990e] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
## Custom template
# Changes to be committed:
ok 38 - commit with commit.status = yes
expecting success: 
		clear_config commit.status &&
		git config commit.status no &&
		try_commit "" &&
		! grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at d42990e message
[second 74f600b] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
## Custom template
ok 39 - commit with commit.status = no
expecting success: 
		clear_config commit.status &&
		git config commit.status yes &&
		try_commit --status &&
		grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at 74f600b message
[second 0e428b5] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
## Custom template
# Changes to be committed:
ok 40 - commit --status with commit.status = yes
expecting success: 
		clear_config commit.status &&
		git config commit.status yes &&
		try_commit --no-status &&
		! grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at 0e428b5 message
[second ef2192a] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
## Custom template
ok 41 - commit --no-status with commit.status = yes
expecting success: 
		clear_config commit.status &&
		git config commit.status no &&
		try_commit --status &&
		grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at ef2192a message
[second 5b12bf8] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
## Custom template
# Changes to be committed:

ok 42 - commit --status with commit.status = no

expecting success: 
		clear_config commit.status &&
		git config commit.status no &&
		try_commit --no-status &&
		! grep "^# Changes to be committed:" .git/COMMIT_EDITMSG
	
HEAD is now at 5b12bf8 message
[second bde2c31] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
## Custom template
ok 43 - commit --no-status with commit.status = no

# passed all 43 test(s)
1..43
