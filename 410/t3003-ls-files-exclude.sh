Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3003-ls-files-exclude/.git/
expecting success: 
	echo content >file &&
	git add file &&
	git commit -m file &&
	echo modification >file
[master (root-commit) 91e36ab] file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - create repo with file
expecting success: 
	echo 'file' >expect &&
	git ls-files --exclude-standard --cached >output &&
	test_cmp expect output

ok 2 - ls-files output contains file (cached)

expecting success: 
	echo 'file' >expect &&
	git ls-files --exclude-standard --modified >output &&
	test_cmp expect output

ok 3 - ls-files output contains file (modified)

expecting success: 
	echo file >.gitignore


ok 4 - add file to gitignore

expecting success: 
	echo 'file' >expect &&
	git ls-files --exclude-standard --cached >output &&
	test_cmp expect output

ok 5 - ls-files output contains file (cached)

expecting success: 
	echo 'file' >expect &&
	git ls-files --exclude-standard --modified >output &&
	test_cmp expect output

ok 6 - ls-files output contains file (modified)

expecting success: 
	echo content >other-file &&
	git add other-file &&
	echo file >expect &&
	git ls-files -i --exclude-standard >output &&
	test_cmp expect output

ok 7 - ls-files -i lists only tracked-but-ignored files

# passed all 7 test(s)
1..7
