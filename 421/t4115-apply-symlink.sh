Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4115-apply-symlink/.git/
expecting success: 

	ln -s path1/path2/path3/path4/path5 link1 &&
	git add link? &&
	git commit -m initial &&

	git branch side &&

	rm -f link? &&

	ln -s htap6 link1 &&
	git update-index link? &&
	git commit -m second &&

	git diff-tree -p HEAD^ HEAD >patch  &&
	git apply --stat --summary patch
[master (root-commit) a47bc27] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 120000 link1
[master d3719ad] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
 link1 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup
expecting success: 

	git checkout side &&
	git apply patch &&
	git diff-files -p >patched &&
	test_cmp patch patched
ok 2 - apply symlink patch
expecting success: 

	git checkout -f side &&
	git apply --index patch &&
	git diff-index --cached -p HEAD >patched &&
	test_cmp patch patched
ok 3 - apply --index symlink patch
# passed all 3 test(s)
1..3
