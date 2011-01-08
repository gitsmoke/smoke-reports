Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t8004-blame-with-conflicts/.git/
expecting success: 
	# Create the old file
	echo "Old line" > file1 &&
	git add file1 &&
	git commit --author "Old Line <ol@localhost>" -m file1.a &&

	# Branch
	git checkout -b foo &&

	# Do an ugly move and change
	git rm file1 &&
	echo "New line ..."  > file2 &&
	echo "... and more" >> file2 &&
	git add file2 &&
	git commit --author "U Gly <ug@localhost>" -m ugly &&

	# Back to master and change something
	git checkout master &&
	echo "

bla" >> file1 &&
	git commit --author "Old Line <ol@localhost>" -a -m file1.b &&

	# Back to foo and merge master
	git checkout foo &&
	if git merge master; then
		echo needed conflict here
		exit 1
	else
		echo merge failed - resolving automatically
	fi &&
	echo "New line ...
... and more

bla
Even more" > file2 &&
	git rm file1 &&
	git commit --author "M Result <mr@localhost>" -a -m merged &&

	# Back to master and change file1 again
	git checkout master &&
	sed s/bla/foo/ <file1 >X &&
	rm file1 &&
	mv X file1 &&
	git commit --author "No Bla <nb@localhost>" -a -m replace &&

	# Try to merge into foo again
	git checkout foo &&
	if git merge master; then
		echo needed conflict here
		exit 1
	else
		echo merge failed - test is setup
	fi
[master (root-commit) 1b0c4f1] file1.a
 Author: Old Line <ol@localhost>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1
rm 'file1'
[foo ef5f808] ugly
 Author: U Gly <ug@localhost>
 2 files changed, 2 insertions(+), 1 deletions(-)
 delete mode 100644 file1
 create mode 100644 file2
[master a57a128] file1.b
 Author: Old Line <ol@localhost>
 1 files changed, 3 insertions(+), 0 deletions(-)
Merging:
ef5f808 ugly
virtual master
found 1 common ancestor(s):
1b0c4f1 file1.a
CONFLICT (delete/modify): file1 deleted in HEAD and modified in master. Version master of file1 left in tree.
Automatic merge failed; fix conflicts and then commit the result.
merge failed - resolving automatically
file1: needs merge
rm 'file1'
[foo cdf2fdc] merged
 Author: M Result <mr@localhost>
[master 61e76d6] replace
 Author: No Bla <nb@localhost>
 1 files changed, 1 insertions(+), 1 deletions(-)
Merging:
cdf2fdc merged
virtual master
found 1 common ancestor(s):
a57a128 file1.b
CONFLICT (delete/modify): file1 deleted in HEAD and modified in master. Version master of file1 left in tree.
Automatic merge failed; fix conflicts and then commit the result.
merge failed - test is setup

ok 1 - setup first case

expecting success: 
	git blame file2
ef5f8081 (U Gly    2011-01-08 04:03:00 +0000 1) New line ...
ef5f8081 (U Gly    2011-01-08 04:03:00 +0000 2) ... and more
cdf2fdce (M Result 2011-01-08 04:03:00 +0000 3) 
cdf2fdce (M Result 2011-01-08 04:03:00 +0000 4) bla
cdf2fdce (M Result 2011-01-08 04:03:00 +0000 5) Even more

ok 2 - blame runs on unconflicted file while other file has conflicts

expecting success: 
	git blame file1
00000000 (Not Committed Yet 2011-01-08 04:03:01 +0000 1) Old line
00000000 (Not Committed Yet 2011-01-08 04:03:01 +0000 2) 
00000000 (Not Committed Yet 2011-01-08 04:03:01 +0000 3) 
00000000 (Not Committed Yet 2011-01-08 04:03:01 +0000 4) foo

ok 3 - blame runs on conflicted file in stages 1,3

# passed all 3 test(s)
1..3
