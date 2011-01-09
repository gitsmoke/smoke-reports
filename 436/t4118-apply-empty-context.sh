Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4118-apply-empty-context/.git/
expecting success: 
	{
		echo; echo;
		echo A; echo B; echo C;
		echo;
	} >file1 &&
	cat file1 >file1.orig &&
	{
		cat file1 &&
		echo Q | tr -d "\012"
	} >file2 &&
	cat file2 >file2.orig &&
	git add file1 file2 &&
	sed -e "/^B/d" <file1.orig >file1 &&
	cat file1 > file2 &&
	echo Q | tr -d "\012" >>file2 &&
	cat file1 >file1.mods &&
	cat file2 >file2.mods &&
	git diff |
	sed -e "s/^ \$//" >diff.output

ok 1 - setup

expecting success: 

	git apply --numstat diff.output >actual &&
	{
		echo "0	1	file1" &&
		echo "0	1	file2"
	} >expect &&
	test_cmp expect actual

ok 2 - apply --numstat

expecting success: 

	cat file1.orig >file1 &&
	cat file2.orig >file2 &&
	git update-index file1 file2 &&
	git apply --index diff.output &&
	test_cmp file1.mods file1 &&
	test_cmp file2.mods file2


ok 3 - apply --apply

# passed all 3 test(s)
1..3
