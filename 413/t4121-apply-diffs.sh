Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4121-apply-diffs/.git/
expecting success: git add file &&
	git commit -q -m 1 &&
	git checkout -b test &&
	mv file file.tmp &&
	echo 0 >file &&
	cat file.tmp >>file &&
	rm file.tmp &&
	git commit -a -q -m 2 &&
	echo 9 >>file &&
	git commit -a -q -m 3 &&
	git checkout master
ok 1 - setup

expecting success: ( git diff test~2 test~1; git diff test~1 test~0 )| git apply

ok 2 - check if contextually independent diffs for the same file apply
# passed all 2 test(s)
1..2
