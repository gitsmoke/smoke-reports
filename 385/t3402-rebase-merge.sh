Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3402-rebase-merge/.git/
expecting success: 
	git add original &&
	git commit -m"initial" &&
	git branch side &&
	echo "11 $T" >>original &&
	git commit -a -m"master updates a bit." &&

	echo "12 $T" >>original &&
	git commit -a -m"master updates a bit more." &&

	git checkout side &&
	(echo "0 $T" ; cat original) >renamed &&
	git add renamed &&
	git update-index --force-remove original &&
	git commit -a -m"side renames and edits." &&

	tr "[a-z]" "[A-Z]" <original >newfile &&
	git add newfile &&
	git commit -a -m"side edits further." &&

	tr "[a-m]" "[A-M]" <original >newfile &&
	rm -f original &&
	git commit -a -m"side edits once again." &&

	git branch test-rebase side &&
	git branch test-rebase-pick side &&
	git branch test-reference-pick side &&
	git checkout -b test-merge side
[master (root-commit) aa0cfd2] initial
 Author: A U Thor <author@example.com>
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 original
[master bdb7e04] master updates a bit.
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
[master 9bc55ff] master updates a bit more.
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
[side f46bc6f] side renames and edits.
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
 rename original => renamed (90%)
[side 1091258] side edits further.
 Author: A U Thor <author@example.com>
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 newfile
[side 121084d] side edits once again.
 Author: A U Thor <author@example.com>
 1 files changed, 20 insertions(+), 20 deletions(-)
 rewrite newfile (100%)
ok 1 - setup
expecting success: 
	git merge -s recursive "reference merge" HEAD master
Merging:
121084d side edits once again.
virtual master
found 1 common ancestor(s):
aa0cfd2 initial
Auto-merging renamed
Merge made by recursive.
 renamed |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

ok 2 - reference merge
expecting success: 
	git checkout test-rebase &&
	GIT_TRACE=1 git rebase --merge master
First, rewinding head to replay your work on top of it...
Merging master with HEAD~2
Merging:
9bc55ff master updates a bit more.
f46bc6f side renames and edits.
found 1 common ancestor(s):
aa0cfd2 initial
Auto-merging renamed
[detached HEAD cafecf0] side renames and edits.
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
 rename original => renamed (92%)
Committed: 0001 side renames and edits.
Merging master with HEAD~1
Merging:
cafecf0 side renames and edits.
1091258 side edits further.
found 1 common ancestor(s):
f46bc6f side renames and edits.
[detached HEAD fe19083] side edits further.
 Author: A U Thor <author@example.com>
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 newfile
Committed: 0002 side edits further.
Merging master with HEAD~0
Merging:
fe19083 side edits further.
121084d side edits once again.
found 1 common ancestor(s):
1091258 side edits further.
[detached HEAD aec69b6] side edits once again.
 Author: A U Thor <author@example.com>
 1 files changed, 20 insertions(+), 20 deletions(-)
 rewrite newfile (100%)
Committed: 0003 side edits once again.
All done.
ok 3 - rebase
expecting success: 
	test $PRE_REBASE = $(git rev-parse test-rebase@{1})

ok 4 - test-rebase@{1} is pre rebase
expecting success: 
	git diff-tree -r test-rebase test-merge >difference &&
	if test -s difference
	then
		cat difference
		(exit 1)
	else
		echo happy
	fi
happy

ok 5 - merge and rebase should match

expecting success: 
	git reset --hard master &&
	git rebase --merge side

HEAD is now at 9bc55ff master updates a bit more.
First, rewinding head to replay your work on top of it...
Merging side with HEAD~1
Merging:
121084d side edits once again.
bdb7e04 master updates a bit.
found 1 common ancestor(s):
aa0cfd2 initial
Auto-merging renamed
[detached HEAD cc53d3e] master updates a bit.
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
Committed: 0001 master updates a bit.
Merging side with HEAD~0
Merging:
cc53d3e master updates a bit.
9bc55ff master updates a bit more.
found 1 common ancestor(s):
bdb7e04 master updates a bit.
Auto-merging renamed
[detached HEAD 3c2cec8] master updates a bit more.
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
Committed: 0002 master updates a bit more.
All done.
ok 6 - rebase the other way
expecting success: 
	git checkout -b conflicting master~2 &&
	echo "AB $T" >> original &&
	git commit -mconflicting original &&
	git rebase -Xtheirs master &&
	grep AB original &&
	! grep 11 original
[conflicting 2c1276b] conflicting
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
First, rewinding head to replay your work on top of it...
Merging master with HEAD~0
Merging:
9bc55ff master updates a bit more.
2c1276b conflicting
found 1 common ancestor(s):
aa0cfd2 initial
Auto-merging original
[detached HEAD 553facb] conflicting
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 3 deletions(-)
Committed: 0001 conflicting
All done.
AB A quick brown fox

ok 7 - rebase -Xtheirs

expecting success: 
	git diff-tree -r test-rebase test-merge >difference &&
	if test -s difference
	then
		cat difference
		(exit 1)
	else
		echo happy
	fi

happy

ok 8 - merge and rebase should match

expecting success: 
	git reset --hard side &&
	git rebase --merge --onto master side^^ &&
	mb=$(git merge-base master HEAD) &&
	if test "$mb" = "$(git rev-parse master)"
	then
		echo happy
	else
		git show-branch
		(exit 1)
	fi &&
	f=$(git diff-tree --name-only HEAD^ HEAD) &&
	g=$(git diff-tree --name-only HEAD^^ HEAD^) &&
	case "$f,$g" in
	newfile,newfile)
		echo happy ;;
	*)
		echo "$f"
		echo "$g"
		(exit 1)
	esac

HEAD is now at 121084d side edits once again.
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
9bc55ff master updates a bit more.
1091258 side edits further.
found 1 common ancestor(s):
f46bc6f side renames and edits.
Skipped original (merged same as existing)
[detached HEAD 454bdcc] side edits further.
 Author: A U Thor <author@example.com>
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 newfile
Committed: 0001 side edits further.
Merging master with HEAD~0
Merging:
454bdcc side edits further.
121084d side edits once again.
found 1 common ancestor(s):
1091258 side edits further.
Skipped original (merged same as existing)
[detached HEAD 59ea655] side edits once again.
 Author: A U Thor <author@example.com>
 1 files changed, 20 insertions(+), 20 deletions(-)
 rewrite newfile (100%)
Committed: 0002 side edits once again.
All done.
happy
happy
ok 9 - picking rebase
expecting success: 
	test_when_finished "rm -fr test-bin funny.was.run" &&
	mkdir test-bin &&
	cat >test-bin/git-merge-funny <<-EOF &&
	#!$SHELL_PATH
	case "\$1" in --opt) ;; *) exit 2 ;; esac
	shift &&
	>funny.was.run &&
	exec git merge-recursive "\$@"
	EOF
	chmod +x test-bin/git-merge-funny &&
	git reset --hard &&
	git checkout -b test-funny master^ &&
	test_commit funny &&
	(
		PATH=./test-bin:$PATH
		git rebase -s funny -Xopt master
	) &&
	test -f funny.was.run
HEAD is now at 59ea655 side edits once again.
[test-funny 9bc5d42] funny
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 funny.t
First, rewinding head to replay your work on top of it...
Merging master with HEAD~0
Merging:
9bc55ff master updates a bit more.
9bc5d42 funny
found 1 common ancestor(s):
bdb7e04 master updates a bit.
[detached HEAD f7600af] funny
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 funny.t
Committed: 0001 funny
All done.

ok 10 - rebase -s funny -Xopt

# passed all 10 test(s)
1..10
