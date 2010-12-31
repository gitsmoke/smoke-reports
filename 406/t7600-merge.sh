Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7600-merge/.git/
expecting success: 
	printf "%s
" 1 2 3 4 5 6 7 8 9 >file &&
	printf "%s
" "1 X" 2 3 4 5 6 7 8 9 >file.1 &&
	printf "%s
" 1 2 3 4 "5 X" 6 7 8 9 >file.5 &&
	printf "%s
" 1 2 3 4 5 6 7 8 "9 X" >file.9 &&
	printf "%s
" "1 X" 2 3 4 5 6 7 8 9 >result.1 &&
	printf "%s
" "1 X" 2 3 4 "5 X" 6 7 8 9 >result.1-5 &&
	printf "%s
" "1 X" 2 3 4 "5 X" 6 7 8 "9 X" >result.1-5-9 &&

	create_merge_msgs() {
		echo "Merge commit 'c2'" >msg.1-5 &&
		echo "Merge commit 'c2'; commit 'c3'" >msg.1-5-9 &&
		{
			echo "Squashed commit of the following:" &&
			echo &&
			git log --no-merges ^HEAD c1
		} >squash.1 &&
		{
			echo "Squashed commit of the following:" &&
			echo &&
			git log --no-merges ^HEAD c2
		} >squash.1-5 &&
		{
			echo "Squashed commit of the following:" &&
			echo &&
			git log --no-merges ^HEAD c2 c3
		} >squash.1-5-9 &&
		echo >msg.nolog &&
		{
			echo "* commit 'c3':" &&
			echo "  commit 3" &&
			echo
		} >msg.log
	} &&

	verify_merge() {
		test_cmp "$2" "$1" &&
		git update-index --refresh &&
		git diff --exit-code &&
		if test -n "$3"
		then
			git show -s --pretty=format:%s HEAD >msg.act &&
			test_cmp "$3" msg.act
		fi
	} &&

	verify_head() {
		echo "$1" >head.expected &&
		git rev-parse HEAD >head.actual &&
		test_cmp head.expected head.actual
	} &&

	verify_parents() {
		printf "%s
" "$@" >parents.expected &&
		>parents.actual &&
		i=1 &&
		while test $i -le $#
		do
			git rev-parse HEAD^$i >>parents.actual &&
			i=$(expr $i + 1) ||
			return 1
		done &&
		test_cmp parents.expected parents.actual
	} &&

	verify_mergeheads() {
		printf "%s
" "$@" >mergehead.expected &&
		test_cmp mergehead.expected .git/MERGE_HEAD
	} &&

	verify_no_mergehead() {
		! test -e .git/MERGE_HEAD
	}


ok 1 - set up test data and helpers

expecting success: 
	git add file &&
	test_tick &&
	git commit -m "commit 0" &&
	git tag c0 &&
	c0=$(git rev-parse HEAD) &&
	cp file.1 file &&
	git add file &&
	test_tick &&
	git commit -m "commit 1" &&
	git tag c1 &&
	c1=$(git rev-parse HEAD) &&
	git reset --hard "$c0" &&
	cp file.5 file &&
	git add file &&
	test_tick &&
	git commit -m "commit 2" &&
	git tag c2 &&
	c2=$(git rev-parse HEAD) &&
	git reset --hard "$c0" &&
	cp file.9 file &&
	git add file &&
	test_tick &&
	git commit -m "commit 3" &&
	git tag c3 &&
	c3=$(git rev-parse HEAD)
	git reset --hard "$c0" &&
	create_merge_msgs
[master (root-commit) 88012a2] commit 0
 Author: A U Thor <author@example.com>
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 file
[master c4c4222] commit 1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at 88012a2 commit 0
[master ac59201] commit 2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at 88012a2 commit 0
[master 7504643] commit 3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at 88012a2 commit 0
ok 2 - setup
expecting success: 
	test_must_fail git merge -$ c1 &&
	test_must_fail git merge --no-such c1 &&
	test_must_fail git merge -s foobar c1 &&
	test_must_fail git merge -s=foobar c1 &&
	test_must_fail git merge -m &&
	test_must_fail git merge
ok 3 - test option parsing

expecting success: 
	mkdir broken &&
	(
		cd broken &&
		git init &&
		>.git/index &&
		test_expect_code 129 git merge -h 2>usage
	) &&
	grep "[Uu]sage: git merge" broken/usage
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7600-merge/broken/.git/
usage: git merge [options] <remote>...
ok 4 - merge -h with invalid index
expecting success: 
	test_must_fail git merge -s index c1
ok 5 - reject non-strategy with a git-merge-foo name
expecting success: 
	echo "OBJID HEAD@{0}: merge c1: Fast-forward" >reflog.expected &&

	git reset --hard c0 &&
	git merge c1 &&
	verify_merge file result.1 &&
	verify_head "$c1" &&

	git reflog -1 >reflog.actual &&
	sed "s/$_x05[0-9a-f]*/OBJID/g" reflog.actual >reflog.fuzzy &&
	test_cmp reflog.expected reflog.fuzzy
HEAD is now at 88012a2 commit 0
Updating 88012a2..c4c4222
Fast-forward
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 6 - merge c0 with c1
expecting success: 
	git reset --hard c0 &&
	git merge --ff-only c1 &&
	git merge --ff-only HEAD c0 c1 &&
	verify_merge file result.1 &&
	verify_head "$c1"
HEAD is now at 88012a2 commit 0
Updating 88012a2..c4c4222
Fast-forward
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
Already up-to-date. Yeeah!
ok 7 - merge c0 with c1 with --ff-only
expecting success: 
	git checkout -f master &&
	test_might_fail git branch -D kid &&

	echo "OBJID HEAD@{0}: initial pull" >reflog.expected &&

	git checkout --orphan kid &&
	test_when_finished "git checkout -f master" &&
	git rm -fr . &&
	test_tick &&
	git merge --ff-only c1 &&
	verify_merge file result.1 &&
	verify_head "$c1" &&

	git reflog -1 >reflog.actual &&
	sed "s/$_x05[0-9a-f][0-9a-f]/OBJID/g" reflog.actual >reflog.fuzzy &&
	test_cmp reflog.expected reflog.fuzzy
rm 'file'
ok 8 - merge from unborn branch

expecting success: 
	git reset --hard c1 &&
	test_tick &&
	git merge c2 &&
	verify_merge file result.1-5 msg.1-5 &&
	verify_parents $c1 $c2
HEAD is now at c4c4222 commit 1
Merging:
c4c4222 commit 1
virtual c2
found 1 common ancestor(s):
88012a2 commit 0
Auto-merging file
Merge made by recursive.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 9 - merge c1 with c2
expecting success: 
	git reset --hard c1 &&
	test_tick &&
	git merge c2 c3 &&
	verify_merge file result.1-5-9 msg.1-5-9 &&
	verify_parents $c1 $c2 $c3
HEAD is now at c4c4222 commit 1
Trying simple merge with c2
Simple merge did not work, trying automatic merge.
Auto-merging file
Trying simple merge with c3
Simple merge did not work, trying automatic merge.
Auto-merging file
Merge made by octopus.
 file |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

ok 10 - merge c1 with c2 and c3
expecting success: 
	git reset --hard c1 &&
	test_tick &&
	test_must_fail git merge --ff-only c2 &&
	test_must_fail git merge --ff-only c3 &&
	test_must_fail git merge --ff-only c2 c3
HEAD is now at c4c4222 commit 1
ok 11 - failing merges with --ff-only

expecting success: 
	git reset --hard c0 &&
	git merge --no-commit c1 &&
	verify_merge file result.1 &&
	verify_head $c1
HEAD is now at 88012a2 commit 0
Updating 88012a2..c4c4222
Fast-forward
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 12 - merge c0 with c1 (no-commit)
expecting success: 
	git reset --hard c1 &&
	git merge --no-commit c2 &&
	verify_merge file result.1-5 &&
	verify_head $c1 &&
	verify_mergeheads $c2
HEAD is now at c4c4222 commit 1
Merging:
c4c4222 commit 1
virtual c2
found 1 common ancestor(s):
88012a2 commit 0
Auto-merging file
ok 13 - merge c1 with c2 (no-commit)

expecting success: 
	git reset --hard c1 &&
	git merge --no-commit c2 c3 &&
	verify_merge file result.1-5-9 &&
	verify_head $c1 &&
	verify_mergeheads $c2 $c3
HEAD is now at c4c4222 commit 1
Trying simple merge with c2
Simple merge did not work, trying automatic merge.
Auto-merging file
Trying simple merge with c3
Simple merge did not work, trying automatic merge.
Auto-merging file
ok 14 - merge c1 with c2 and c3 (no-commit)

expecting success: 
	git reset --hard c0 &&
	git merge --squash c1 &&
	verify_merge file result.1 &&
	verify_head $c0 &&
	verify_no_mergehead &&
	test_cmp squash.1 .git/SQUASH_MSG
HEAD is now at 88012a2 commit 0
Updating 88012a2..c4c4222
Fast-forward
Squash commit -- not updating HEAD
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 15 - merge c0 with c1 (squash)
expecting success: 
	git reset --hard c0 &&
	git merge --squash --ff-only c1 &&
	verify_merge file result.1 &&
	verify_head $c0 &&
	verify_no_mergehead &&
	test_cmp squash.1 .git/SQUASH_MSG
HEAD is now at 88012a2 commit 0
Updating 88012a2..c4c4222
Fast-forward
Squash commit -- not updating HEAD
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 16 - merge c0 with c1 (squash, ff-only)
expecting success: 
	git reset --hard c1 &&
	git merge --squash c2 &&
	verify_merge file result.1-5 &&
	verify_head $c1 &&
	verify_no_mergehead &&
	test_cmp squash.1-5 .git/SQUASH_MSG
HEAD is now at c4c4222 commit 1
Merging:
c4c4222 commit 1
virtual c2
found 1 common ancestor(s):
88012a2 commit 0
Auto-merging file
Squash commit -- not updating HEAD

ok 17 - merge c1 with c2 (squash)

expecting success: 
	git reset --hard c1 &&
	test_must_fail git merge --squash --ff-only c2

HEAD is now at c4c4222 commit 1
ok 18 - unsuccesful merge of c1 with c2 (squash, ff-only)
expecting success: 
	git reset --hard c1 &&
	git merge --squash c2 c3 &&
	verify_merge file result.1-5-9 &&
	verify_head $c1 &&
	verify_no_mergehead &&
	test_cmp squash.1-5-9 .git/SQUASH_MSG
HEAD is now at c4c4222 commit 1
Trying simple merge with c2
Simple merge did not work, trying automatic merge.
Auto-merging file
Trying simple merge with c3
Simple merge did not work, trying automatic merge.
Auto-merging file
Squash commit -- not updating HEAD
ok 19 - merge c1 with c2 and c3 (squash)

expecting success: 
	git reset --hard c1 &&
	git config branch.master.mergeoptions "--no-commit" &&
	git merge c2 &&
	verify_merge file result.1-5 &&
	verify_head $c1 &&
	verify_mergeheads $c2
HEAD is now at c4c4222 commit 1
Merging:
c4c4222 commit 1
virtual c2
found 1 common ancestor(s):
88012a2 commit 0
Auto-merging file
ok 20 - merge c1 with c2 (no-commit in config)

expecting success: 
	git reset --hard c1 &&
	git config branch.master.mergeoptions "--squash" &&
	git merge c2 &&
	verify_merge file result.1-5 &&
	verify_head $c1 &&
	verify_no_mergehead &&
	test_cmp squash.1-5 .git/SQUASH_MSG
HEAD is now at c4c4222 commit 1
Merging:
c4c4222 commit 1
virtual c2
found 1 common ancestor(s):
88012a2 commit 0
Auto-merging file
Squash commit -- not updating HEAD
ok 21 - merge c1 with c2 (squash in config)

expecting success: 
	git reset --hard c1 &&
	git config branch.master.mergeoptions "-n" &&
	test_tick &&
	git merge --summary c2 >diffstat.txt &&
	verify_merge file result.1-5 msg.1-5 &&
	verify_parents $c1 $c2 &&
	if ! grep "^ file |  *2 +-$" diffstat.txt
	then
		echo "[OOPS] diffstat was not generated with --summary"
		false
	fi
HEAD is now at c4c4222 commit 1
 file |    2 +-

ok 22 - override config option -n with --summary

expecting success: 
	git reset --hard c1 &&
	git config branch.master.mergeoptions "-n" &&
	test_tick &&
	git merge --stat c2 >diffstat.txt &&
	verify_merge file result.1-5 msg.1-5 &&
	verify_parents $c1 $c2 &&
	if ! grep "^ file |  *2 +-$" diffstat.txt
	then
		echo "[OOPS] diffstat was not generated with --stat"
		false
	fi
HEAD is now at c4c4222 commit 1
 file |    2 +-
ok 23 - override config option -n with --stat
expecting success: 
	git reset --hard c1 &&
	git config branch.master.mergeoptions "--stat" &&
	test_tick &&
	git merge -n c2 >diffstat.txt &&
	verify_merge file result.1-5 msg.1-5 &&
	verify_parents $c1 $c2 &&
	if grep "^ file |  *2 +-$" diffstat.txt
	then
		echo "[OOPS] diffstat was generated"
		false
	fi
HEAD is now at c4c4222 commit 1
ok 24 - override config option --stat
expecting success: 
	git reset --hard c1 &&
	git config branch.master.mergeoptions "--no-commit" &&
	test_tick &&
	git merge --commit c2 &&
	verify_merge file result.1-5 msg.1-5 &&
	verify_parents $c1 $c2
HEAD is now at c4c4222 commit 1
Merging:
c4c4222 commit 1
virtual c2
found 1 common ancestor(s):
88012a2 commit 0
Auto-merging file
Merge made by recursive.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 25 - merge c1 with c2 (override --no-commit)
expecting success: 
	git reset --hard c1 &&
	git config branch.master.mergeoptions "--squash" &&
	test_tick &&
	git merge --no-squash c2 &&
	verify_merge file result.1-5 msg.1-5 &&
	verify_parents $c1 $c2
HEAD is now at c4c4222 commit 1
Merging:
c4c4222 commit 1
virtual c2
found 1 common ancestor(s):
88012a2 commit 0
Auto-merging file
Merge made by recursive.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 26 - merge c1 with c2 (override --squash)
expecting success: 
	git reset --hard c0 &&
	git config branch.master.mergeoptions "" &&
	test_tick &&
	git merge --no-ff c1 &&
	verify_merge file result.1 &&
	verify_parents $c0 $c1
HEAD is now at 88012a2 commit 0
Merging:
88012a2 commit 0
virtual c1
found 1 common ancestor(s):
88012a2 commit 0
Merge made by recursive.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 27 - merge c0 with c1 (no-ff)
expecting success: 
	test_must_fail git merge --squash --no-ff c1 &&
	test_must_fail git merge --no-ff --squash c1
ok 28 - combining --squash and --no-ff is refused

expecting success: 
	test_must_fail git merge --ff-only --no-ff c1 &&
	test_must_fail git merge --no-ff --ff-only c1
ok 29 - combining --ff-only and --no-ff is refused
expecting success: 
	git reset --hard c0 &&
	git config branch.master.mergeoptions "--no-ff" &&
	git merge --ff c1 &&
	verify_merge file result.1 &&
	verify_head $c1
HEAD is now at 88012a2 commit 0
Updating 88012a2..c4c4222
Fast-forward
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 30 - merge c0 with c1 (ff overrides no-ff)
expecting success: 
	git reset --hard c0 &&
	git merge --no-log c2 &&
	git show -s --pretty=format:%b HEAD >msg.act &&
	test_cmp msg.nolog msg.act &&

	git merge --log c3 &&
	git show -s --pretty=format:%b HEAD >msg.act &&
	test_cmp msg.log msg.act &&

	git reset --hard HEAD^ &&
	git config merge.log yes &&
	git merge c3 &&
	git show -s --pretty=format:%b HEAD >msg.act &&
	test_cmp msg.log msg.act
HEAD is now at 88012a2 commit 0
Merging:
88012a2 commit 0
virtual c2
found 1 common ancestor(s):
88012a2 commit 0
Merge made by recursive.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
Merging:
85d0ef8 Merge commit 'c2'
virtual c3
found 1 common ancestor(s):
88012a2 commit 0
Auto-merging file
Merge made by recursive.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at 85d0ef8 Merge commit 'c2'
Merging:
85d0ef8 Merge commit 'c2'
virtual c3
found 1 common ancestor(s):
88012a2 commit 0
Auto-merging file
Merge made by recursive.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 31 - merge log message

expecting success: 
       git reset --hard c1 &&
       git config branch.master.mergeoptions "" &&
       test_tick &&
       git merge c0 c2 c0 c1 &&
       verify_merge file result.1-5 &&
       verify_parents $c1 $c2
HEAD is now at c4c4222 commit 1
Already up-to-date with c0
Trying simple merge with c2
Simple merge did not work, trying automatic merge.
Auto-merging file
Already up-to-date with c0
Already up-to-date with c1
Merge made by octopus.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 32 - merge c1 with c0, c2, c0, and c1

expecting success: 
       git reset --hard c1 &&
       git config branch.master.mergeoptions "" &&
       test_tick &&
       git merge c0 c2 c0 c1 &&
       verify_merge file result.1-5 &&
       verify_parents $c1 $c2

HEAD is now at c4c4222 commit 1
Already up-to-date with c0
Trying simple merge with c2
Simple merge did not work, trying automatic merge.
Auto-merging file
Already up-to-date with c0
Already up-to-date with c1
Merge made by octopus.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 33 - merge c1 with c0, c2, c0, and c1

expecting success: 
       git reset --hard c1 &&
       git config branch.master.mergeoptions "" &&
       test_tick &&
       git merge c1 c2 &&
       verify_merge file result.1-5 &&
       verify_parents $c1 $c2

HEAD is now at c4c4222 commit 1
Already up-to-date with c1
Trying simple merge with c2
Simple merge did not work, trying automatic merge.
Auto-merging file
Merge made by octopus.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 34 - merge c1 with c1 and c2

expecting success: 
       git reset --hard c0 &&
       mv file file1 &&
       cat file1 >file &&
       rm -f file1 &&
       git merge c2

HEAD is now at 88012a2 commit 0
Updating 88012a2..ac59201
Fast-forward
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 35 - merge fast-forward in a dirty tree
expecting success: 
	git reset --hard c0 &&
	git merge --no-ff -s resolve c1 >out &&
	grep "Wonderful." out &&
	verify_parents $c0 $c1
HEAD is now at 88012a2 commit 0
Wonderful.

ok 36 - in-index merge

expecting success: 
	git reset --hard c1 &&
	cp file file.n && mv -f file.n file &&
	git merge c3

HEAD is now at c4c4222 commit 1
Merging:
c4c4222 commit 1
virtual c3
found 1 common ancestor(s):
88012a2 commit 0
Auto-merging file
Merge made by recursive.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 37 - refresh the index before merging
expecting success: 
	git reset --hard c3 &&
	echo c4 >c4.c &&
	git add c4.c &&
	git commit -m c4 &&
	git tag c4 &&
	echo c5 >c5.c &&
	git add c5.c &&
	git commit -m c5 &&
	git tag c5 &&
	git reset --hard c3 &&
	echo c6 >c6.c &&
	git add c6.c &&
	git commit -m c6 &&
	git tag c6 &&
	git branch -f c5-branch c5 &&
	git merge c5-branch~1 &&
	git show -s --pretty=format:%s HEAD >actual.branch &&
	git reset --keep HEAD^ &&
	git merge c5~1 &&
	git show -s --pretty=format:%s HEAD >actual.tag &&
	test_cmp expected.branch actual.branch &&
	test_cmp expected.tag actual.tag

HEAD is now at 7504643 commit 3
[master 9e475d8] c4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c4.c
[master 5da4c55] c5
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c5.c
HEAD is now at 7504643 commit 3
[master 57d0d81] c6
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c6.c
Merging:
57d0d81 c6
virtual c5-branch~1
found 1 common ancestor(s):
7504643 commit 3
Merge made by recursive.
 c4.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c4.c
Merging:
57d0d81 c6
virtual c5~1
found 1 common ancestor(s):
7504643 commit 3
Merge made by recursive.
 c4.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c4.c

ok 38 - merge early part of c2

expecting success: 
	git reset --hard c0 &&
	git merge --no-ff --no-commit c1 &&
	EDITOR=: git commit &&
	verify_parents $c0 $c1
HEAD is now at 88012a2 commit 0
Merging:
88012a2 commit 0
virtual c1
found 1 common ancestor(s):
88012a2 commit 0
[master 1cc8a34] Merge commit 'c1'
 Author: A U Thor <author@example.com>

ok 39 - merge --no-ff --no-commit && commit

expecting success: 
	EDITOR=: git commit --amend &&
	verify_parents $c0 $c1

[master 1cc8a34] Merge commit 'c1'
 Author: A U Thor <author@example.com>

ok 40 - amending no-ff merge commit

# passed all 40 test(s)
1..40
