Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4012-diff-binary/.git/
expecting success: echo AIT >a && echo BIT >b && echo CIT >c && echo DIT >d &&
	 git update-index --add a b c d &&
	 echo git >a &&
	 cat "$TEST_DIRECTORY"/test4012.png >b &&
	 echo git >c &&
	 cat b b >d

ok 1 - prepare repository
expecting success: git diff | git apply --stat --summary >current &&
	 test_cmp expected current

ok 2 - diff without --binary
expecting success: git diff --binary | git apply --stat --summary >current &&
	 test_cmp expected current

ok 3 - diff with --binary
expecting success: git diff | sed -e s/-CIT/xCIT/ >broken &&
	 if git apply --stat --summary broken 2>detected
	 then
		echo unhappy - should have detected an error
		(exit 1)
	 else
		echo happy
	 fi &&
	 detected=`cat detected` &&
	 detected=`expr "$detected" : "fatal.*at line \([0-9]*\)\$"` &&
	 detected=`sed -ne "${detected}p" broken` &&
	 test "$detected" = xCIT
happy
ok 4 - apply detecting corrupt patch correctly
expecting success: git diff --binary | sed -e s/-CIT/xCIT/ >broken &&
	 if git apply --stat --summary broken 2>detected
	 then
		echo unhappy - should have detected an error
		(exit 1)
	 else
		echo happy
	 fi &&
	 detected=`cat detected` &&
	 detected=`expr "$detected" : "fatal.*at line \([0-9]*\)\$"` &&
	 detected=`sed -ne "${detected}p" broken` &&
	 test "$detected" = xCIT
happy

ok 5 - apply detecting corrupt patch correctly

expecting success: git commit -a -m initial
[master (root-commit) 6c49719] initial
 Author: A U Thor <author@example.com>
 4 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 a
 create mode 100644 b
 create mode 100644 c
 create mode 100644 d

ok 6 - initial commit

expecting success: echo AIT >a && mv b e && echo CIT >c && cat e >d &&
	 git update-index --add --remove a b c d e &&
	 tree0=`git write-tree` &&
	 git diff --cached --binary >current &&
	 git apply --stat --summary current
 a |    2 +-
 b |  Bin
 c |    2 +-
 d |  Bin
 e |  Bin
 5 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 100644 b
 create mode 100644 e

ok 7 - diff-index with --binary

expecting success: git reset --hard &&
	 git apply --binary --index <current &&
	 tree1=`git write-tree` &&
	 test "$tree1" = "$tree0"
HEAD is now at 6c49719 initial

ok 8 - apply binary patch

expecting success: 
	echo Q | q_to_nul >binary &&
	(: hide error code from diff, which just indicates differences
	 git diff --binary --no-index /dev/null binary >current ||
	 true
	) &&
	rm binary &&
	git apply --binary <current &&
	echo Q >expected &&
	nul_to_q <binary >actual &&
	test_cmp expected actual


ok 9 - diff --no-index with binary creation

# passed all 9 test(s)
1..9
