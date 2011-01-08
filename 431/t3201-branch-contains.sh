Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3201-branch-contains/.git/
expecting success: 

	>file &&
	git add file &&
	test_tick &&
	git commit -m initial &&
	git branch side &&

	echo 1 >file &&
	test_tick &&
	git commit -a -m "second on master" &&

	git checkout side &&
	echo 1 >file &&
	test_tick &&
	git commit -a -m "second on side" &&

	git merge master
[master (root-commit) 1bd44cb] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
[master c77a0a9] second on master
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[side 5a0fd8a] second on side
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Merging:
5a0fd8a second on side
virtual master
found 1 common ancestor(s):
1bd44cb initial
Merge made by recursive.

ok 1 - setup

expecting success: 

	git branch --contains=master >actual &&
	{
		echo "  master" && echo "* side"
	} >expect &&
	test_cmp expect actual

ok 2 - branch --contains=master

expecting success: 

	git branch --contains master >actual &&
	{
		echo "  master" && echo "* side"
	} >expect &&
	test_cmp expect actual

ok 3 - branch --contains master

expecting success: 

	git branch --contains=side >actual &&
	{
		echo "* side"
	} >expect &&
	test_cmp expect actual

ok 4 - branch --contains=side

expecting success: 

	git branch --merged >actual &&
	{
		echo "  master" &&
		echo "* side"
	} >expect &&
	test_cmp expect actual

ok 5 - side: branch --merged

expecting success: 

	git branch --no-merged >actual &&
	>expect &&
	test_cmp expect actual

ok 6 - side: branch --no-merged

expecting success: 

	git checkout master &&
	git branch --merged >actual &&
	{
		echo "* master"
	} >expect &&
	test_cmp expect actual



ok 7 - master: branch --merged

expecting success: 

	git branch --no-merged >actual &&
	{
		echo "  side"
	} >expect &&
	test_cmp expect actual

ok 8 - master: branch --no-merged

# passed all 8 test(s)
1..8
