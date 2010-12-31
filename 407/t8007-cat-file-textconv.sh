Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t8007-cat-file-textconv/.git/
expecting success: 
	echo "bin: test" >one.bin &&
	if test_have_prereq SYMLINKS; then
		ln -s one.bin symlink.bin
	fi &&
	git add . &&
	GIT_AUTHOR_NAME=Number1 git commit -a -m First --date="2010-01-01 18:00:00" &&
	echo "bin: test version 2" >one.bin &&
	GIT_AUTHOR_NAME=Number2 git commit -a -m Second --date="2010-01-01 20:00:00"
[master (root-commit) 2cd85c9] First
 Author: Number1 <author@example.com>
 3 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100755 helper
 create mode 100644 one.bin
 create mode 120000 symlink.bin
[master bba79c2] Second
 Author: Number2 <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup 
expecting success: 
	git cat-file --textconv :one.bin 2>result
	test_cmp expected result

ok 2 - no filter specified
expecting success: 
	echo "*.bin diff=test" >.gitattributes &&
	git config diff.test.textconv ./helper &&
	git config diff.test.cachetextconv false

ok 3 - setup textconv filters
expecting success: 
	git cat-file blob :one.bin >result &&
	test_cmp expected result

ok 4 - cat-file without --textconv
expecting success: 
	git cat-file -p HEAD^:one.bin >result &&
	test_cmp expected result

ok 5 - cat-file without --textconv on previous commit
expecting success: 
	git cat-file --textconv :one.bin >result &&
	test_cmp expected result

ok 6 - cat-file --textconv on last commit
expecting success: 
	git cat-file --textconv HEAD^:one.bin >result &&
	test_cmp expected result

ok 7 - cat-file --textconv on previous commit
expecting success: 
	git cat-file blob :symlink.bin >result &&
	printf "%s" "one.bin" >expected
	test_cmp expected result

ok 8 - cat-file without --textconv (symlink)
expecting success: 
	! git cat-file --textconv :symlink.bin 2>result &&
	cat >expected <<\EOF &&
fatal: git cat-file --textconv: unable to run textconv on :symlink.bin
EOF
	test_cmp expected result

ok 9 - cat-file --textconv on index (symlink)

expecting success: 
	! git cat-file --textconv HEAD:symlink.bin 2>result &&
	cat >expected <<EOF &&
fatal: git cat-file --textconv: unable to run textconv on HEAD:symlink.bin
EOF
	test_cmp expected result

ok 10 - cat-file --textconv on HEAD (symlink)

# passed all 10 test(s)
1..10
