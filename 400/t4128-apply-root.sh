Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4128-apply-root/.git/
expecting success: 

	mkdir -p some/sub/dir &&
	echo Hello > some/sub/dir/file &&
	git add some/sub/dir/file &&
	git commit -m initial &&
	git tag initial
[master (root-commit) b6be9de] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 some/sub/dir/file

ok 1 - setup

expecting success: 

	git apply --directory=some/sub -p3 --index patch &&
	test Bello = $(git show :some/sub/dir/file) &&
	test Bello = $(cat some/sub/dir/file)

ok 2 - apply --directory -p (1)

expecting success: 

	git reset --hard initial &&
	git apply --directory=some/sub/ -p3 --index patch &&
	test Bello = $(git show :some/sub/dir/file) &&
	test Bello = $(cat some/sub/dir/file)
HEAD is now at b6be9de initial
ok 3 - apply --directory -p (2) 
expecting success: 
	git reset --hard initial &&
	git apply --directory=some/sub/dir/ --index patch &&
	test content = $(git show :some/sub/dir/newfile) &&
	test content = $(cat some/sub/dir/newfile)
HEAD is now at b6be9de initial
ok 4 - apply --directory (new file)
expecting success: 
	git reset --hard initial &&
	git apply -p2 --directory=some/sub/dir/ --index patch &&
	test content = $(git show :some/sub/dir/newfile2) &&
	test content = $(cat some/sub/dir/newfile2)
HEAD is now at b6be9de initial
ok 5 - apply --directory -p (new file)
expecting success: 
	git reset --hard initial &&
	echo content >some/sub/dir/delfile &&
	git add some/sub/dir/delfile &&
	git apply --directory=some/sub/dir/ --index patch &&
	! (git ls-files | grep delfile)
HEAD is now at b6be9de initial

ok 6 - apply --directory (delete file)

expecting success: 
	git reset --hard initial &&
	git apply --directory=some/sub/dir/ --index patch &&
	test content = $(git show :some/sub/dir/quotefile) &&
	test content = $(cat some/sub/dir/quotefile)
HEAD is now at b6be9de initial

ok 7 - apply --directory (quoted filename)

# passed all 7 test(s)
1..7
