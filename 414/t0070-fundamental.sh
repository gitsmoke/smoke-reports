Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0070-fundamental/.git/
expecting success: 
	test-ctype

ok 1 - character classes (isspace, isalpha etc.)
expecting success: 
	test_must_fail test-mktemp doesnotexist/testXXXXXX 2>err &&
	grep "doesnotexist/test" err
fatal: Unable to create temporary file '/Users/trast/git-smoke/t/trash directory.t0070-fundamental/doesnotexist/testpmE7ju': No such file or directory

ok 2 - mktemp to nonexistent directory prints filename

expecting success: 
	mkdir cannotwrite &&
	chmod -w cannotwrite &&
	test_when_finished "chmod +w cannotwrite" &&
	test_must_fail test-mktemp cannotwrite/testXXXXXX 2>err &&
	grep "cannotwrite/test" err
fatal: Unable to create temporary file '/Users/trast/git-smoke/t/trash directory.t0070-fundamental/cannotwrite/testdIzShV': Permission denied
ok 3 - mktemp to unwritable directory prints filename
# passed all 3 test(s)
1..3
