Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4202-log/.git/
expecting success: 

	echo one >one &&
	git add one &&
	test_tick &&
	git commit -m initial &&

	echo ichi >one &&
	git add one &&
	test_tick &&
	git commit -m second &&

	git mv one ichi &&
	test_tick &&
	git commit -m third &&

	cp ichi ein &&
	git add ein &&
	test_tick &&
	git commit -m fourth &&

	mkdir a &&
	echo ni >a/two &&
	git add a/two &&
	test_tick &&
	git commit -m fifth  &&

	git rm a/two &&
	test_tick &&
	git commit -m sixth
[master (root-commit) 3a2fdcb] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 one
[master f7dab8e] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 2fbe8c0] third
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename one => ichi (100%)
[master 5d31159] fourth
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 ein
[master 394ef78] fifth
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 a/two
rm 'a/two'
[master 804a787] sixth
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 a/two

ok 1 - setup

expecting success: 

	git log --pretty="format:%s" > actual &&
	test_cmp expect actual


ok 2 - pretty

expecting success: 

	git log --pretty="tformat:%s" > actual &&
	test_cmp expect actual


ok 3 - pretty (tformat)

expecting success: 

	git log --pretty="%s" > actual &&
	test_cmp expect actual

ok 4 - pretty (shortcut)

expecting success: 

	git log --format="%s" > actual &&
	test_cmp expect actual


ok 5 - format

expecting success: 

	git log -2 --format="%w(12,1,2)This is the %s commit." > actual &&
	test_cmp expect actual


ok 6 - format %w(12,1,2)

expecting success: 

	git log -2 --format="%w(,1,2)This is%nthe %s%ncommit." > actual &&
	test_cmp expect actual


ok 7 - format %w(,1,2)
expecting success: 

	git log --oneline > actual &&
	test_cmp expect actual

ok 8 - oneline

expecting success: 

	git log --pretty="format:%s" --diff-filter=A HEAD > actual &&
	git log --pretty="format:%s" --diff-filter A HEAD > actual-separate &&
	printf "fifth
fourth
third
initial" > expect &&
	test_cmp expect actual &&
	test_cmp expect actual-separate

ok 9 - diff-filter=A

expecting success: 

	actual=$(git log --pretty="format:%s" --diff-filter=M HEAD) &&
	expect=$(echo second) &&
	test "$actual" = "$expect" || {
		echo Oops
		echo "Actual: $actual"
		false
	}

ok 10 - diff-filter=M

expecting success: 

	actual=$(git log --pretty="format:%s" --diff-filter=D HEAD) &&
	expect=$(echo sixth ; echo third) &&
	test "$actual" = "$expect" || {
		echo Oops
		echo "Actual: $actual"
		false
	}



ok 11 - diff-filter=D

expecting success: 

	actual=$(git log -M --pretty="format:%s" --diff-filter=R HEAD) &&
	expect=$(echo third) &&
	test "$actual" = "$expect" || {
		echo Oops
		echo "Actual: $actual"
		false
	}

ok 12 - diff-filter=R

expecting success: 

	actual=$(git log -C -C --pretty="format:%s" --diff-filter=C HEAD) &&
	expect=$(echo fourth) &&
	test "$actual" = "$expect" || {
		echo Oops
		echo "Actual: $actual"
		false
	}



ok 13 - diff-filter=C

expecting success: 

	actual=$(git log --follow --pretty="format:%s" ichi) &&
	expect=$(echo third ; echo second ; echo initial) &&
	test "$actual" = "$expect" || {
		echo Oops
		echo "Actual: $actual"
		false
	}



ok 14 - git log --follow

expecting success: 
	git log --no-walk --oneline 5d31159 804a787 394ef78 > actual &&
	test_cmp expect actual


ok 15 - git log --no-walk <commits> sorts by commit time

expecting success: 
	git show --oneline -s 5d31159 804a787 394ef78 > actual &&
	test_cmp expect actual


ok 16 - git show <commits> leaves list of commits as given

expecting success: 
	echo case >one &&
	test_tick &&
	git add one &&
	git commit -a -m Second

[master e9e4904] Second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 one

ok 17 - setup case sensitivity tests

expecting success: 
	echo second >expect &&
	git log -1 --pretty="tformat:%s" --grep=sec >actual &&
	test_cmp expect actual


ok 18 - log --grep

expecting success: 
	echo second >expect &&
	git log -1 --pretty="tformat:%s" --grep sec >actual &&
	test_cmp expect actual &&
	test_must_fail git log -1 --pretty="tformat:%s" --grep


ok 19 - log --grep option parsing

expecting success: 
	echo Second >expect &&
	git log -1 --pretty="tformat:%s" -i --grep=sec >actual &&
	test_cmp expect actual

ok 20 - log -i --grep

expecting success: 
	echo Second >expect &&
	git log -1 --pretty="tformat:%s" --grep=sec -i >actual &&
	test_cmp expect actual


ok 21 - log --grep -i

expecting success: 
	git log --graph --pretty=tformat:%s >actual &&
	test_cmp expect actual


ok 22 - simple log --graph

expecting success: 
	git checkout -b side HEAD~4 &&
	test_commit side-1 1 1 &&
	test_commit side-2 2 2 &&
	git checkout master &&
	git merge side
[side 4447a16] side-1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 1
[side 1666e54] side-2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 2
Merging:
e9e4904 Second
virtual side
found 1 common ancestor(s):
2fbe8c0 third
Merge made by recursive.
 1 |    1 +
 2 |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 1
 create mode 100644 2
ok 23 - set up merge history
expecting success: 
	git log --graph --date-order --pretty=tformat:%s |
		sed "s/ *\$//" >actual &&
	test_cmp expect actual

ok 24 - log --graph with merge
expecting success: 
	git log --graph --date-order --pretty=short |
		git name-rev --name-only --stdin |
		sed "s/Merge:.*/Merge: A B/;s/ *\$//" >actual &&
	test_cmp expect actual

ok 25 - log --graph with full output
expecting success: 
	git checkout -b tangle HEAD~6 &&
	test_commit tangle-a tangle-a a &&
	git merge master~3 &&
	git merge side~1 &&
	git checkout master &&
	git merge tangle &&
	git checkout -b reach &&
	test_commit reach &&
	git checkout master &&
	git checkout -b octopus-a &&
	test_commit octopus-a &&
	git checkout master &&
	git checkout -b octopus-b &&
	test_commit octopus-b &&
	git checkout master &&
	test_commit seventh &&
	git merge octopus-a octopus-b &&
	git merge reach
[tangle f6c510e] tangle-a
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 tangle-a
Merging:
f6c510e tangle-a
virtual master~3
found 1 common ancestor(s):
f7dab8e second
Skipped ichi (merged same as existing)
Merge made by recursive.
 a/two       |    1 +
 one => ein  |    0
 one => ichi |    0
 3 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 a/two
 copy one => ein (100%)
 rename one => ichi (100%)
Merging:
2dc6a29 Merge branch 'master' (early part) into tangle
virtual side~1
found 1 common ancestor(s):
2fbe8c0 third
Merge made by recursive.
 1 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 1
Merging:
e8dcb3b Merge branch 'side'
virtual tangle
found 2 common ancestor(s):
394ef78 fifth
4447a16 side-1
  Merging:
  394ef78 fifth
  4447a16 side-1
  found 1 common ancestor(s):
  2fbe8c0 third
Merge made by recursive.
 tangle-a |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 tangle-a
[reach 973a5f9] reach
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 reach.t
[octopus-a 5c3c15c] octopus-a
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 octopus-a.t
[octopus-b ef3da6e] octopus-b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 octopus-b.t
[master c379a04] seventh
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 seventh.t
Trying simple merge with octopus-a
Trying simple merge with octopus-b
Merge made by octopus.
 octopus-a.t |    1 +
 octopus-b.t |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 octopus-a.t
 create mode 100644 octopus-b.t
Merging:
efb3e03 Merge commit 'octopus-a'; commit 'octopus-b'
virtual reach
found 1 common ancestor(s):
5e75a13 Merge branch 'tangle'
Merge made by recursive.
 reach.t |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 reach.t

ok 26 - set up more tangled history
expecting success: 
	git log --graph --date-order --pretty=tformat:%s |
		sed "s/ *\$//" >actual &&
	test_cmp expect actual


ok 27 - log --graph with merge

expecting success: 
	test_might_fail git config --unset-all log.decorate &&

	git log --oneline >expect.none &&
	git log --oneline --decorate >expect.short &&
	git log --oneline --decorate=full >expect.full &&

	echo "[log] decorate" >>.git/config &&
	git log --oneline >actual &&
	test_cmp expect.short actual &&

	git config --unset-all log.decorate &&
	git config log.decorate true &&
	git log --oneline >actual &&
	test_cmp expect.short actual &&
	git log --oneline --decorate=full >actual &&
	test_cmp expect.full actual &&
	git log --oneline --decorate=no >actual &&
	test_cmp expect.none actual &&

	git config --unset-all log.decorate &&
	git config log.decorate no &&
	git log --oneline >actual &&
	test_cmp expect.none actual &&
	git log --oneline --decorate >actual &&
	test_cmp expect.short actual &&
	git log --oneline --decorate=full >actual &&
	test_cmp expect.full actual &&

	git config --unset-all log.decorate &&
	git config log.decorate 1 &&
	git log --oneline >actual &&
	test_cmp expect.short actual &&
	git log --oneline --decorate=full >actual &&
	test_cmp expect.full actual &&
	git log --oneline --decorate=no >actual &&
	test_cmp expect.none actual &&

	git config --unset-all log.decorate &&
	git config log.decorate short &&
	git log --oneline >actual &&
	test_cmp expect.short actual &&
	git log --oneline --no-decorate >actual &&
	test_cmp expect.none actual &&
	git log --oneline --decorate=full >actual &&
	test_cmp expect.full actual &&

	git config --unset-all log.decorate &&
	git config log.decorate full &&
	git log --oneline >actual &&
	test_cmp expect.full actual &&
	git log --oneline --no-decorate >actual &&
	test_cmp expect.none actual &&
	git log --oneline --decorate >actual &&
	test_cmp expect.short actual

ok 28 - log.decorate configuration

expecting success: 
	# This tests for a regression introduced in v1.7.2-rc0~103^2~2
	test_create_repo regression &&
	(
		cd regression &&
		test_commit needs-another-commit &&
		test_commit foo.bar &&
		git log -M --follow -p foo.bar.t &&
		git log -M --follow --stat foo.bar.t &&
		git log -M --follow --name-only foo.bar.t
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4202-log/regression/.git/
[master (root-commit) 2c943e6] needs-another-commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 needs-another-commit.t
[master 88a3158] foo.bar
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo.bar.t
commit 88a3158a223f4c9eff6009796d6f4a01db6f394c
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:28:13 2005 -0700

    foo.bar

diff --git a/foo.bar.t b/foo.bar.t
new file mode 100644
index 0000000..fbf8e96
--- /dev/null
+++ b/foo.bar.t
@@ -0,0 +1 @@
+foo.bar
commit 88a3158a223f4c9eff6009796d6f4a01db6f394c
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:28:13 2005 -0700

    foo.bar

 foo.bar.t |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
commit 88a3158a223f4c9eff6009796d6f4a01db6f394c
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:28:13 2005 -0700

    foo.bar

foo.bar.t

ok 29 - show added path under "--follow -M"

# passed all 29 test(s)
1..29
