Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6120-describe/.git/
expecting success: 

	test_tick &&
	echo one >file && git add file && git commit -m initial &&
	one=$(git rev-parse HEAD) &&

	git describe --always HEAD &&

	test_tick &&
	echo two >file && git add file && git commit -m second &&
	two=$(git rev-parse HEAD) &&

	test_tick &&
	echo three >file && git add file && git commit -m third &&

	test_tick &&
	echo A >file && git add file && git commit -m A &&
	test_tick &&
	git tag -a -m A A &&

	test_tick &&
	echo c >file && git add file && git commit -m c &&
	test_tick &&
	git tag c &&

	git reset --hard $two &&
	test_tick &&
	echo B >side && git add side && git commit -m B &&
	test_tick &&
	git tag -a -m B B &&

	test_tick &&
	git merge -m Merged c &&
	merged=$(git rev-parse HEAD) &&

	git reset --hard $two &&
	test_tick &&
	echo D >another && git add another && git commit -m D &&
	test_tick &&
	git tag -a -m D D &&
	test_tick &&
	git tag -a -m R R &&

	test_tick &&
	echo DD >another && git commit -a -m another &&

	test_tick &&
	git tag e &&

	test_tick &&
	echo DDD >another && git commit -a -m "yet another" &&

	test_tick &&
	git merge -m Merged $merged &&

	test_tick &&
	echo X >file && echo X >side && git add file side &&
	git commit -m x
[master (root-commit) 50b0198] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
50b0198
[master 612fe8f] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master c48449d] third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 4185ee1] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 2ad5867] c
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at 612fe8f second
[master 3acd34f] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 side
Merging:
3acd34f B
virtual c
found 1 common ancestor(s):
612fe8f second
Merge made by recursive.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at 612fe8f second
[master 84aba8f] D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 another
[master f459448] another
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master a4198f8] yet another
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Merging:
a4198f8 yet another
virtual 7cac7e2f60e76f6f6a9eaf950c5e927f3115672f
found 1 common ancestor(s):
612fe8f second
Merge made by recursive.
 file |    2 +-
 side |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)
 create mode 100644 side
[master a3aae96] x
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 2 deletions(-)

ok 1 - setup

expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 2 - describe HEAD

expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 3 - describe HEAD^

expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 4 - describe HEAD^^

expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 5 - describe HEAD^^2
expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 6 - describe HEAD^^2^
expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 7 - describe HEAD^^^
expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 8 - describe --tags HEAD

expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 9 - describe --tags HEAD^

expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 10 - describe --tags HEAD^^
expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 11 - describe --tags HEAD^^2
expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 12 - describe --tags HEAD^^2^

expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 13 - describe --tags HEAD^^^

expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 14 - describe --all HEAD

expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 15 - describe --all HEAD^

expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 16 - describe --all HEAD^^^

expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 17 - describe --long HEAD^^2^

expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 18 - describe --long HEAD^^2

expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 19 - describe --all A^0

expecting success: 
	test_cmp err.expect err.actual


ok 20 - no warning was displayed for A

expecting success: 
	mv .git/refs/tags/A .git/refs/tags/Q


ok 21 - rename tag A to Q locally

warning: tag 'A' is really 'Q' here
expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 22 - describe HEAD

expecting success: 
	test_cmp err.expect err.actual


ok 23 - warning was displayed for Q

expecting success: 
	mv .git/refs/tags/Q .git/refs/tags/A


ok 24 - rename tag Q back to A

expecting success: git pack-refs

ok 25 - pack tag refs

expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 26 - describe HEAD

expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 27 - describe --dirty

expecting success: 
	echo >>file


ok 28 - set-up dirty work tree

expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 29 - describe --dirty
expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 30 - describe --dirty=.mod

expecting success: 
	test_must_fail git describe --dirty HEAD


ok 31 - describe --dirty HEAD

expecting success: 
	git tag -a -m test-annotated test-annotated &&
	echo >>file &&
	test_tick &&
	git commit -a -m "one more" &&
	git tag test1-lightweight &&
	echo >>file &&
	test_tick &&
	git commit -a -m "yet another" &&
	git tag test2-lightweight &&
	echo >>file &&
	test_tick &&
	git commit -a -m "even more"


[master bf36909] one more
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
[master eb002ce] yet another
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master ca3eb51] even more
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 32 - set-up matching pattern tests
expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 33 - describe --match=test-*
expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 34 - describe --tags --match=test1-*
expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 35 - describe --tags --match=test2-*
expecting success: 
	test $S = 0 &&
	case "$R" in
	$expect)	echo happy ;;
	*)	echo "Oops - $R is not $expect";
		false ;;
	esac
	
happy

ok 36 - describe --long --tags --match=test2-* HEAD^

# passed all 36 test(s)
1..36
