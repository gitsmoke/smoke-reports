Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4001-diff-rename/.git/
expecting success: git update-index --add path0

ok 1 - update-index --add a file.

expecting success: tree=$(git write-tree) && echo $tree
1b20f13cbc54b85aaafd1cf0e2e74bb6c6dd01ea

ok 2 - write that tree.

expecting success: git update-index --add --remove path0 path1

ok 3 - renamed and edited the file.

expecting success: git diff-index -p -M $tree >current

ok 4 - git diff-index -p -M after rename and editing.

expecting success: compare_diff_patch current expected

ok 5 - validate the output.

expecting success: 
	cp path1 another-path &&
	git add another-path &&
	git commit -m 1 &&
	git rm path1 &&
	mkdir subdir &&
	git mv another-path subdir/path1 &&
	git status | grep "renamed: .*path1 -> subdir/path1"
[master (root-commit) 8a871e6] 1
 Author: A U Thor <author@example.com>
 2 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 another-path
 create mode 100644 path1
rm 'path1'
#	renamed:    path1 -> subdir/path1

ok 6 - favour same basenames over different ones

expecting success: 
	git show HEAD:path1 | sed "s/15/16/" > subdir/path1 &&
	git status | grep "renamed: .*path1 -> subdir/path1"
#	renamed:    path1 -> subdir/path1

ok 7 - favour same basenames even with minor differences

# passed all 7 test(s)
1..7
