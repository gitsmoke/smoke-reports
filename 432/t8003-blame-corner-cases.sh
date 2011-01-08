Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t8003-blame-corner-cases/.git/
expecting success: 

	echo A A A A A >one &&
	echo B B B B B >two &&
	echo C C C C C >tres &&
	echo ABC >mouse &&
	for i in 1 2 3 4 5 6 7 8 9
	do
		echo $i
	done >nine_lines &&
	for i in 1 2 3 4 5 6 7 8 9 a
	do
		echo $i
	done >ten_lines &&
	git add one two tres mouse nine_lines ten_lines &&
	test_tick &&
	GIT_AUTHOR_NAME=Initial git commit -m Initial &&

	cat one >uno &&
	mv two dos &&
	cat one >>tres &&
	echo DEF >>mouse
	git add uno dos tres mouse &&
	test_tick &&
	GIT_AUTHOR_NAME=Second git commit -a -m Second &&

	echo GHIJK >>mouse &&
	git add mouse &&
	test_tick &&
	GIT_AUTHOR_NAME=Third git commit -m Third &&

	cat mouse >cow &&
	git add cow &&
	test_tick &&
	GIT_AUTHOR_NAME=Fourth git commit -m Fourth &&

	{
		echo ABC
		echo DEF
		echo XXXX
		echo GHIJK
	} >cow &&
	git add cow &&
	test_tick &&
	GIT_AUTHOR_NAME=Fifth git commit -m Fifth
[master (root-commit) a7d6c31] Initial
 Author: Initial <author@example.com>
 6 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 mouse
 create mode 100644 nine_lines
 create mode 100644 one
 create mode 100644 ten_lines
 create mode 100644 tres
 create mode 100644 two
[master 480ef79] Second
 Author: Second <author@example.com>
 4 files changed, 3 insertions(+), 0 deletions(-)
 rename two => dos (100%)
 create mode 100644 uno
[master 74385ca] Third
 Author: Third <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 5b22ca3] Fourth
 Author: Fourth <author@example.com>
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 cow
[master 018e313] Fifth
 Author: Fifth <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 

	git blame uno | grep Second
480ef79e (Second 2005-04-07 15:14:13 -0700 1) A A A A A

ok 2 - straight copy without -C

expecting success: 

	git blame dos | grep Initial
^a7d6c31 two (Initial 2005-04-07 15:13:13 -0700 1) B B B B B

ok 3 - straight move without -C

expecting success: 

	git blame -C1 uno | grep Second


480ef79e (Second 2005-04-07 15:14:13 -0700 1) A A A A A

ok 4 - straight copy with -C

expecting success: 

	git blame -C1 dos | grep Initial


^a7d6c31 two (Initial 2005-04-07 15:13:13 -0700 1) B B B B B

ok 5 - straight move with -C

expecting success: 

	git blame -C -C1 uno | grep Initial


^a7d6c31 one (Initial 2005-04-07 15:13:13 -0700 1) A A A A A

ok 6 - straight copy with -C -C

expecting success: 

	git blame -C -C1 dos | grep Initial


^a7d6c31 two (Initial 2005-04-07 15:13:13 -0700 1) B B B B B

ok 7 - straight move with -C -C

expecting success: 

	git blame -L2 tres | grep Second


480ef79e (Second 2005-04-07 15:14:13 -0700 2) A A A A A

ok 8 - append without -C

expecting success: 

	git blame -L2 -C1 tres | grep Second


480ef79e (Second 2005-04-07 15:14:13 -0700 2) A A A A A

ok 9 - append with -C

expecting success: 

	git blame -L2 -C -C1 tres | grep Second


480ef79e (Second 2005-04-07 15:14:13 -0700 2) A A A A A

ok 10 - append with -C -C

expecting success: 

	git blame -L2 -C -C -C1 tres | grep Initial


^a7d6c31 one (Initial 2005-04-07 15:13:13 -0700 2) A A A A A

ok 11 - append with -C -C -C

expecting success: 

	git blame -f -C -C1 HEAD^ -- cow | sed -e "$pick_fc" >current &&
	{
		echo mouse-Initial
		echo mouse-Second
		echo mouse-Third
	} >expected &&
	test_cmp expected current

ok 12 - blame wholesale copy

expecting success: 

	git blame -f -C -C1 HEAD -- cow | sed -e "$pick_fc" >current &&
	{
		echo mouse-Initial
		echo mouse-Second
		echo cow-Fifth
		echo mouse-Third
	} >expected &&
	test_cmp expected current



ok 13 - blame wholesale copy and more

expecting success: 
	mkdir path &&
	echo A A A A A >path/file &&
	echo B B B B B >path/elif &&
	git add path &&
	test_tick &&
	git commit -m "path was a directory" &&
	rm -fr path &&
	echo A A A A A >path &&
	git add path &&
	test_tick &&
	git commit -m "path is a regular file" &&
	git blame HEAD^.. -- path

[master 0aef879] path was a directory
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 path/elif
 create mode 100644 path/file
[master 846e53e] path is a regular file
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 1 deletions(-)
 rename path/file => path (100%)
 delete mode 100644 path/elif
^0aef879 path/file (A U Thor 2005-04-07 15:18:13 -0700 1) A A A A A

ok 14 - blame path that used to be a directory

expecting success: 
  TREE=`git rev-parse HEAD:`
  cat >badcommit <<EOF
tree $TREE
author <noname> 1234567890 +0000
committer David Reiss <dreiss@facebook.com> 1234567890 +0000

some message
EOF
  COMMIT=`git hash-object -t commit -w badcommit`
  git --no-pager blame $COMMIT -- uno >/dev/null


ok 15 - blame to a commit with no author name

expecting success: 
	test_must_fail git blame -L5 tres 2>errors &&
	grep "has only 2 lines" errors

fatal: file tres has only 2 lines

ok 16 - blame -L with invalid start

expecting success: 
	test_must_fail git blame -L1,5 tres 2>errors &&
	grep "has only 2 lines" errors

fatal: file tres has only 2 lines

ok 17 - blame -L with invalid end

expecting success: 
	git blame nine_lines >actual &&
	test $(grep -c "  " actual) = 0

ok 18 - indent of line numbers, nine lines

expecting success: 
	git blame ten_lines >actual &&
	test $(grep -c "  " actual) = 9


ok 19 - indent of line numbers, ten lines

# passed all 19 test(s)
1..19
