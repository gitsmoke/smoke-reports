Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4116-apply-reverse/.git/
expecting success: 

	for i in a b c d e f g h i j k l m n; do echo $i; done >file1 &&
	perl -pe "y/ijk/\000\001\002/" <file1 >file2 &&

	git add file1 file2 &&
	git commit -m initial &&
	git tag initial &&

	for i in a b c g h i J K L m o n p q; do echo $i; done >file1 &&
	perl -pe "y/mon/\000\001\002/" <file1 >file2 &&

	git commit -a -m second &&
	git tag second &&

	git diff --binary initial second >patch
[master (root-commit) 2e0afaf] initial
 Author: A U Thor <author@example.com>
 2 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
[master 896c0c2] second
 Author: A U Thor <author@example.com>
 2 files changed, 6 insertions(+), 6 deletions(-)

ok 1 - setup

expecting success: 

	T0=`git rev-parse "second^{tree}"` &&
	git reset --hard initial &&
	git apply --index --binary patch &&
	T1=`git write-tree` &&
	test "$T0" = "$T1"
HEAD is now at 2e0afaf initial

ok 2 - apply in forward

expecting success: 

	git reset --hard second &&
	git apply --reverse --binary --index patch &&
	git diff >diff &&
	test_cmp /dev/null diff
HEAD is now at 896c0c2 second

ok 3 - apply in reverse

expecting success: 

	git tar-tree initial initial | $TAR xf - &&
	(
		cd initial && git init && git add .
	) &&

	git tar-tree second second | $TAR xf - &&
	(
		cd second && git init && git add .
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4116-apply-reverse/initial/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4116-apply-reverse/second/.git/

ok 4 - setup separate repository lacking postimage

expecting success: 

	T0=`git rev-parse "second^{tree}"` &&
	(
		cd initial &&
		git apply --index --binary ../patch &&
		T1=`git write-tree` &&
		test "$T0" = "$T1"
	)

ok 5 - apply in forward without postimage

expecting success: 

	T0=`git rev-parse "initial^{tree}"` &&
	(
		cd second &&
		git apply --index --binary --reverse ../patch &&
		T1=`git write-tree` &&
		test "$T0" = "$T1"
	)

ok 6 - apply in reverse without postimage

expecting success: 
	sed "s/a/a /" < file1 > file1.new &&
	mv file1.new file1 &&
	git diff | git apply --reverse --whitespace=error


ok 7 - reversing a whitespace introduction

# passed all 7 test(s)
1..7
