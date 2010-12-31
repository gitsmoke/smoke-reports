Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t8006-blame-textconv/.git/
expecting success: 
	echo "bin: test 1" >one.bin &&
	echo "bin: test number 2" >two.bin &&
	if test_have_prereq SYMLINKS; then
		ln -s one.bin symlink.bin
	fi &&
	git add . &&
	GIT_AUTHOR_NAME=Number1 git commit -a -m First --date="2010-01-01 18:00:00" &&
	echo "bin: test 1 version 2" >one.bin &&
	echo "bin: test number 2 version 2" >>two.bin &&
	if test_have_prereq SYMLINKS; then
		ln -sf two.bin symlink.bin
	fi &&
	GIT_AUTHOR_NAME=Number2 git commit -a -m Second --date="2010-01-01 20:00:00"
[master (root-commit) 95f9759] First
 Author: Number1 <author@example.com>
 4 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100755 helper
 create mode 100644 one.bin
 create mode 120000 symlink.bin
 create mode 100644 two.bin
[master ce72c8a] Second
 Author: Number2 <author@example.com>
 3 files changed, 3 insertions(+), 2 deletions(-)

ok 1 - setup 
expecting success: 
	git blame one.bin >blame &&
	find_blame Number2 <blame >result &&
	test_cmp expected result

ok 2 - no filter specified
expecting success: 
	echo "*.bin diff=test" >.gitattributes &&
	git config diff.test.textconv ./helper &&
	git config diff.test.cachetextconv false

ok 3 - setup textconv filters

expecting success: 
	git blame --no-textconv one.bin >blame &&
	find_blame <blame> result &&
	test_cmp expected result

ok 4 - blame with --no-textconv
expecting success: 
	git blame one.bin >blame &&
	find_blame  <blame >result &&
	test_cmp expected result

ok 5 - basic blame on last commit
expecting success: 
	git blame --textconv two.bin >blame &&
	find_blame <blame >result &&
	test_cmp expected result

ok 6 - blame --textconv going through revisions
expecting success: 
	git config diff.test.cachetextconv true

ok 7 - setup +cachetextconv
expecting success: 
	git blame --textconv two.bin >blame &&
	find_blame <blame >result &&
	test_cmp expected result &&
	git blame --textconv one.bin >blame &&
	find_blame  <blame >result &&
	test_cmp expected_one result

ok 8 - blame --textconv works with textconvcache

expecting success: 
	git config diff.test.cachetextconv false

ok 9 - setup -cachetextconv

expecting success: 
	echo "bin: test number 2 version 3" >>two.bin &&
	GIT_AUTHOR_NAME=Number3 git commit -a -m Third --date="2010-01-01 22:00:00"
[master 32c880f] Third
 Author: Number3 <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 10 - make a new commit
expecting success: 
	git blame HEAD^ two.bin >blame &&
	find_blame <blame >result &&
	test_cmp expected result

ok 11 - blame from previous revision
expecting success: 
	git blame --no-textconv symlink.bin >blame &&
	find_blame <blame >result &&
	test_cmp expected result

ok 12 - blame with --no-textconv (on symlink)
expecting success: 
	git blame --textconv symlink.bin >blame &&
	find_blame <blame >result &&
	test_cmp expected result

ok 13 - blame --textconv (on symlink)
expecting success: 
	cat >three.bin <<\EOF &&
bin: test number 2
bin: test number 2 version 2
bin: test number 2 version 3
bin: test number 3
EOF
	git add three.bin &&
	GIT_AUTHOR_NAME=Number4 git commit -a -m Fourth --date="2010-01-01 23:00:00"
[master 4369024] Fourth
 Author: Number4 <author@example.com>
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 three.bin

ok 14 - make another new commit

expecting success: 
	git blame -C -C three.bin >blame &&
	find_blame <blame >result &&
	cat >expected <<\EOF &&
(Number1 2010-01-01 18:00:00 +0000 1) converted: test number 2
(Number2 2010-01-01 20:00:00 +0000 2) converted: test number 2 version 2
(Number3 2010-01-01 22:00:00 +0000 3) converted: test number 2 version 3
(Number4 2010-01-01 23:00:00 +0000 4) converted: test number 3
EOF
	test_cmp expected result

ok 15 - blame on last commit (-C -C, symlink)

# passed all 15 test(s)
1..15
