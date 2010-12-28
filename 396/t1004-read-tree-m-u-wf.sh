Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1004-read-tree-m-u-wf/.git/
expecting success: 

	mkdir subdir &&
	echo >file1 file one &&
	echo >file2 file two &&
	echo >subdir/file1 file one in subdirectory &&
	echo >subdir/file2 file two in subdirectory &&
	git update-index --add file1 file2 subdir/file1 subdir/file2 &&
	git commit -m initial &&

	git branch side &&
	git tag -f branch-point &&

	echo file2 is not tracked on the master anymore &&
	rm -f file2 subdir/file2 &&
	git update-index --remove file2 subdir/file2 &&
	git commit -a -m "master removes file2 and subdir/file2"
[master (root-commit) adeef94] initial
 Author: A U Thor <author@example.com>
 4 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
 create mode 100644 subdir/file1
 create mode 100644 subdir/file2
Updated tag 'branch-point' (was 0000000)
file2 is not tracked on the master anymore
[master 315c661] master removes file2 and subdir/file2
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 2 deletions(-)
 delete mode 100644 file2
 delete mode 100644 subdir/file2

ok 1 - two-way setup
expecting success: 

	echo >file2 master creates untracked file2 &&
	echo >subdir/file2 master creates untracked subdir/file2 &&
	if err=`git read-tree -m -u master side 2>&1`
	then
		echo should have complained
		false
	else
		echo "happy to see $err"
	fi
happy to see error: Untracked working tree file 'file2' would be overwritten by merge.

ok 2 - two-way not clobbering

expecting success: 

	if err=`git read-tree -m --exclude-per-directory=.gitignore master side 2>&1`
	then
		echo should have complained
		false
	else
		echo "happy to see $err"
	fi
happy to see fatal: --exclude-per-directory is meaningless unless -u

ok 3 - two-way with incorrect --exclude-per-directory (1)

expecting success: 

	if err=`git read-tree -m -u --exclude-per-directory=foo --exclude-per-directory=.gitignore master side 2>&1`
	then
		echo should have complained
		false
	else
		echo "happy to see $err"
	fi
happy to see fatal: more than one --exclude-per-directory given.

ok 4 - two-way with incorrect --exclude-per-directory (2)

expecting success: 

	git read-tree -m -u --exclude-per-directory=.gitignore master side

ok 5 - two-way clobbering a ignored file
expecting success: 

	rm -f file2 subdir/file2 &&
	git checkout side &&
	echo >file3 file three &&
	echo >subdir/file3 file three &&
	git update-index --add file3 subdir/file3 &&
	git commit -a -m "side adds file3 and removes file2" &&

	git checkout master &&
	echo >file2 file two is untracked on the master side &&
	echo >subdir/file2 file two is untracked on the master side &&

	git read-tree -m -u branch-point master side
D	file2
D	subdir/file2
[side d46dfab] side adds file3 and removes file2
 Author: A U Thor <author@example.com>
 4 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 100644 file2
 create mode 100644 file3
 delete mode 100644 subdir/file2
 create mode 100644 subdir/file3
ok 6 - three-way not complaining on an untracked path in both
expecting success: 

	git reset --hard &&
	rm -f file2 subdir/file2 file3 subdir/file3 &&
	git checkout master &&
	echo >file3 file three created in master, untracked &&
	echo >subdir/file3 file three created in master, untracked &&
	if err=`git read-tree -m -u branch-point master side 2>&1`
	then
		echo should have complained
		false
	else
		echo "happy to see $err"
	fi
HEAD is now at 315c661 master removes file2 and subdir/file2
happy to see error: Untracked working tree file 'file3' would be overwritten by merge.

ok 7 - three-way not clobbering a working tree file
expecting success: 

	git reset --hard &&
	rm -f file2 subdir/file2 file3 subdir/file3 &&
	git checkout master &&
	echo >file3 file three created in master, untracked &&
	echo >subdir/file3 file three created in master, untracked &&

	git read-tree -m -u --exclude-per-directory=.gitignore branch-point master side
HEAD is now at 315c661 master removes file2 and subdir/file2
ok 8 - three-way not complaining on an untracked file

expecting success: 

	git reset --hard &&
	git checkout -b side-a branch-point &&
	echo >>file1 "new line to be kept in the merge result" &&
	git commit -a -m "side-a changes file1" &&
	git checkout -b side-b branch-point &&
	echo >>file2 "new line to be kept in the merge result" &&
	git commit -a -m "side-b changes file2" &&
	git checkout side-a
HEAD is now at 315c661 master removes file2 and subdir/file2
[side-a e011307] side-a changes file1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[side-b 4ad8471] side-b changes file2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 9 - 3-way not overwriting local changes (setup)

expecting success: 

	# At this point, file1 from side-a should be kept as side-b
	# did not touch it.

	git reset --hard &&

	echo >>file1 "local changes" &&
	git read-tree -m -u branch-point side-a side-b &&
	grep "new line to be kept" file1 &&
	grep "local changes" file1
HEAD is now at e011307 side-a changes file1
new line to be kept in the merge result
local changes
ok 10 - 3-way not overwriting local changes (our side)
expecting success: 

	# At this point, file2 from side-b should be taken as side-a
	# did not touch it.

	git reset --hard &&

	echo >>file2 "local changes" &&
	test_must_fail git read-tree -m -u branch-point side-a side-b &&
	! grep "new line to be kept" file2 &&
	grep "local changes" file2
HEAD is now at e011307 side-a changes file1
local changes
ok 11 - 3-way not overwriting local changes (their side)
expecting success: 

	git reset --hard &&
	git checkout -b sym-b side-b &&
	mkdir -p a &&
	>a/b &&
	git add a/b &&
	git commit -m "side adds a/b" &&

	rm -fr a &&
	git checkout -b sym-a side-a &&
	mkdir -p a &&
	ln -s ../b a/b &&
	git add a/b &&
	git commit -m "we add a/b" &&

	git read-tree -m -u sym-a sym-a sym-b
HEAD is now at e011307 side-a changes file1
[sym-b 36000ee] side adds a/b
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a/b
[sym-a 73a2335] we add a/b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 120000 a/b

ok 12 - funny symlink in work tree

expecting success: 

	rm -fr a b &&
	git reset --hard &&

	git checkout sym-a &&
	chmod a-w a &&
	test_must_fail git read-tree -m -u sym-a sym-a sym-b


HEAD is now at 73a2335 we add a/b
ok 13 - funny symlink in work tree, un-unlink-able
expecting success: 

	git reset --hard &&

	git checkout side-a &&
	rm -f subdir/file2 &&
	mkdir subdir/file2 &&
	echo qfwfq >subdir/file2/another &&
	git add subdir/file2/another &&
	test_tick &&
	git commit -m "side-a changes file2 to directory"
HEAD is now at 73a2335 we add a/b
[side-a 21ea9df] side-a changes file2 to directory
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 1 deletions(-)
 delete mode 100644 subdir/file2
 create mode 100644 subdir/file2/another

ok 14 - D/F setup

expecting success: 

	git checkout side-b &&
	git read-tree -m -u branch-point side-b side-a &&
	git ls-files -u >actual &&
	(
		a=$(git rev-parse branch-point:subdir/file2)
		b=$(git rev-parse side-a:subdir/file2/another)
		echo "100644 $a 1	subdir/file2"
		echo "100644 $a 2	subdir/file2"
		echo "100644 $b 3	subdir/file2/another"
	) >expect &&
	test_cmp actual expect
ok 15 - D/F

expecting success: 

	git reset --hard &&
	git checkout side-b &&
	git merge-resolve branch-point -- side-b side-a
HEAD is now at 4ad8471 side-b changes file2
Trying simple merge.
Simple merge failed, trying Automatic merge.
Adding subdir/file2/another

ok 16 - D/F resolve

expecting success: 

	git reset --hard &&
	git checkout side-b &&
	git merge-recursive branch-point -- side-b side-a
HEAD is now at 4ad8471 side-b changes file2
Merging side-b with side-a
Merging:
4ad8471 side-b changes file2
21ea9df side-a changes file2 to directory
found 1 common ancestor(s):
adeef94 initial
Removing subdir/file2 to make room for subdirectory; may re-add later.
Removing subdir/file2
Adding subdir/file2/another

ok 17 - D/F recursive

# passed all 17 test(s)
1..17
