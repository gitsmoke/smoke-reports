Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4023-diff-rename-typechange/.git/
expecting success: 

	rm -f foo bar &&
	cat "$TEST_DIRECTORY"/../COPYING >foo &&
	ln -s linklink bar &&
	git add foo bar &&
	git commit -a -m Initial &&
	git tag one &&

	rm -f foo bar &&
	cat "$TEST_DIRECTORY"/../COPYING >bar &&
	ln -s linklink foo &&
	git add foo bar &&
	git commit -a -m Second &&
	git tag two &&

	rm -f foo bar &&
	cat "$TEST_DIRECTORY"/../COPYING >foo &&
	git add foo &&
	git commit -a -m Third &&
	git tag three &&

	mv foo bar &&
	ln -s linklink foo &&
	git add foo bar &&
	git commit -a -m Fourth &&
	git tag four &&

	# This is purely for sanity check

	rm -f foo bar &&
	cat "$TEST_DIRECTORY"/../COPYING >foo &&
	cat "$TEST_DIRECTORY"/../Makefile >bar &&
	git add foo bar &&
	git commit -a -m Fifth &&
	git tag five &&

	rm -f foo bar &&
	cat "$TEST_DIRECTORY"/../Makefile >foo &&
	cat "$TEST_DIRECTORY"/../COPYING >bar &&
	git add foo bar &&
	git commit -a -m Sixth &&
	git tag six
[master (root-commit) 6bee245] Initial
 Author: A U Thor <author@example.com>
 2 files changed, 361 insertions(+), 0 deletions(-)
 create mode 120000 bar
 create mode 100644 foo
[master 03a946a] Second
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename foo => bar (100%)
 rename bar => foo (100%)
[master c8bb80b] Third
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename bar => foo (100%)
[master d365f25] Fourth
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 360 deletions(-)
 rename foo => bar (100%)
 rewrite foo (100%)
 mode change 100644 => 120000
[master 1df209b] Fifth
 Author: A U Thor <author@example.com>
 2 files changed, 2584 insertions(+), 360 deletions(-)
 rewrite bar (98%)
 rename bar => foo (100%)
[master 4e9258e] Sixth
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename foo => bar (100%)
 rename bar => foo (100%)

ok 1 - setup
expecting success: 

	git diff-tree five six -r --name-status -B -M | sort >actual &&
	{
		echo "R100	foo	bar"
		echo "R100	bar	foo"
	} | sort >expect &&
	test_cmp expect actual

ok 2 - cross renames to be detected for regular files

expecting success: 

	git diff-tree one two -r --name-status -B -M | sort >actual &&
	{
		echo "R100	foo	bar"
		echo "R100	bar	foo"
	} | sort >expect &&
	test_cmp expect actual

ok 3 - cross renames to be detected for typechange

expecting success: 

	git diff-tree three four -r --name-status -B -M | sort >actual &&
	{
		echo "R100	foo	bar"
		echo "T100	foo"
	} | sort >expect &&
	test_cmp expect actual

ok 4 - moves and renames

# passed all 4 test(s)
1..4
