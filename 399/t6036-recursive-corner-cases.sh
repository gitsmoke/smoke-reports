Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6036-recursive-corner-cases/.git/
expecting success: 
	ten="0 1 2 3 4 5 6 7 8 9" &&
	for i in $ten
	do
		echo line $i in a sample file
	done >one &&
	for i in $ten
	do
		echo line $i in another sample file
	done >two &&
	git add one two &&
	test_tick && git commit -m initial &&

	git branch L1 &&
	git checkout -b R1 &&
	git mv one three &&
	test_tick && git commit -m R1 &&

	git checkout L1 &&
	git mv two three &&
	test_tick && git commit -m L1 &&

	git checkout L1^0 &&
	test_tick && git merge -s ours R1 &&
	git tag L2 &&

	git checkout R1^0 &&
	test_tick && git merge -s ours L1 &&
	git tag R2
[master (root-commit) 4871052] initial
 Author: A U Thor <author@example.com>
 2 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 one
 create mode 100644 two
[R1 6592516] R1
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename one => three (100%)
[L1 bd99445] L1
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename two => three (100%)
Merge made by ours.
Merge made by ours.

ok 1 - setup basic criss-cross + rename with no modifications

expecting success: 
	git reset --hard &&
	git checkout L2^0 &&

	test_must_fail git merge -s recursive R2^0 &&

	test 5 = $(git ls-files -s | wc -l) &&
	test 3 = $(git ls-files -u | wc -l) &&
	test 0 = $(git ls-files -o | wc -l) &&

	test $(git rev-parse :0:one) = $(git rev-parse L2:one) &&
	test $(git rev-parse :0:two) = $(git rev-parse R2:two) &&
	test $(git rev-parse :2:three) = $(git rev-parse L2:three) &&
	test $(git rev-parse :3:three) = $(git rev-parse R2:three) &&

	cp two merged &&
	>empty &&
	test_must_fail git merge-file \
		-L "Temporary merge branch 2" \
		-L "" \
		-L "Temporary merge branch 1" \
		merged empty one &&
	test $(git rev-parse :1:three) = $(git hash-object merged)
HEAD is now at 01e4222 Merge branch 'L1' into HEAD
Merging:
d46c613 Merge branch 'R1' into HEAD
virtual R2^0
found 2 common ancestor(s):
6592516 R1
bd99445 L1
  Merging:
  6592516 R1
  bd99445 L1
  found 1 common ancestor(s):
  4871052 initial
  CONFLICT (rename/add): Rename one->three in Temporary merge branch 1. three added in Temporary merge branch 2
  Adding merged three
  CONFLICT (rename/add): Rename two->three in Temporary merge branch 2. three added in Temporary merge branch 1
  Adding merged three
Auto-merging three
CONFLICT (content): Merge conflict in three
Automatic merge failed; fix conflicts and then commit the result.

ok 2 - merge simple rename+criss-cross with no modifications

expecting success: 
	git rm -rf . &&
	git clean -fdqx &&
	rm -rf .git &&
	git init &&

	ten="0 1 2 3 4 5 6 7 8 9"
	for i in $ten
	do
		echo line $i in a sample file
	done >one &&
	for i in $ten
	do
		echo line $i in another sample file
	done >two &&
	git add one two &&
	test_tick && git commit -m initial &&

	git branch L1 &&
	git checkout -b R1 &&
	git mv one three &&
	echo more >>two &&
	git add two &&
	test_tick && git commit -m R1 &&

	git checkout L1 &&
	git mv two three &&
	test_tick && git commit -m L1 &&

	git checkout L1^0 &&
	test_tick && git merge -s ours R1 &&
	git tag L2 &&

	git checkout R1^0 &&
	test_tick && git merge -s ours L1 &&
	git tag R2

three: needs merge
rm 'one'
rm 'three'
rm 'three'
rm 'three'
rm 'two'
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6036-recursive-corner-cases/.git/
[master (root-commit) a49a3c8] initial
 Author: A U Thor <author@example.com>
 2 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 one
 create mode 100644 two
[R1 6cf23b5] R1
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 0 deletions(-)
 rename one => three (100%)
[L1 d6ff089] L1
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename two => three (100%)
Merge made by ours.
Merge made by ours.

ok 3 - setup criss-cross + rename merges with basic modification

expecting success: 
	git reset --hard &&
	git checkout L2^0 &&

	test_must_fail git merge -s recursive R2^0 &&

	test 5 = $(git ls-files -s | wc -l) &&
	test 3 = $(git ls-files -u | wc -l) &&
	test 0 = $(git ls-files -o | wc -l) &&

	test $(git rev-parse :0:one) = $(git rev-parse L2:one) &&
	test $(git rev-parse :0:two) = $(git rev-parse R2:two) &&
	test $(git rev-parse :2:three) = $(git rev-parse L2:three) &&
	test $(git rev-parse :3:three) = $(git rev-parse R2:three) &&

	head -n 10 two >merged &&
	cp one merge-me &&
	>empty &&
	test_must_fail git merge-file \
		-L "Temporary merge branch 2" \
		-L "" \
		-L "Temporary merge branch 1" \
		merged empty merge-me &&
	test $(git rev-parse :1:three) = $(git hash-object merged)

HEAD is now at 7f8967e Merge branch 'L1' into HEAD
Merging:
71d3a95 Merge branch 'R1' into HEAD
virtual R2^0
found 2 common ancestor(s):
6cf23b5 R1
d6ff089 L1
  Merging:
  6cf23b5 R1
  d6ff089 L1
  found 1 common ancestor(s):
  a49a3c8 initial
  CONFLICT (rename/add): Rename one->three in Temporary merge branch 1. three added in Temporary merge branch 2
  Adding merged three
  CONFLICT (rename/add): Rename two->three in Temporary merge branch 2. three added in Temporary merge branch 1
  Adding merged three
Auto-merging three
CONFLICT (content): Merge conflict in three
Automatic merge failed; fix conflicts and then commit the result.

ok 4 - merge criss-cross + rename merges with basic modification

expecting success: 
	git rm -rf . &&
	git clean -fdqx &&
	rm -rf .git &&
	git init &&

	printf "0
1
2
3
4
5
6
7
8
9
" >a &&
	git add a &&
	test_tick && git commit -m A &&

	git branch B &&
	git checkout -b C &&
	echo 10 >>a &&
	echo "other content" >>new_a &&
	git add a new_a &&
	test_tick && git commit -m C &&

	git checkout B &&
	git mv a new_a &&
	test_tick && git commit -m B &&

	git checkout B^0 &&
	test_must_fail git merge C &&
	git clean -f &&
	test_tick && git commit -m D &&
	git tag D &&

	git checkout C^0 &&
	test_must_fail git merge B &&
	rm new_a~HEAD new_a &&
	printf "Incorrectly merged content" >>new_a &&
	git add -u &&
	test_tick && git commit -m E &&
	git tag E
three: needs merge
rm 'one'
rm 'three'
rm 'three'
rm 'three'
rm 'two'
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6036-recursive-corner-cases/.git/
[master (root-commit) f139e5c] A
 Author: A U Thor <author@example.com>
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 a
[C cdf0ddb] C
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 new_a
[B c866f72] B
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename a => new_a (100%)
Merging:
c866f72 B
virtual C
found 1 common ancestor(s):
f139e5c A
CONFLICT (rename/add): Rename a->new_a in HEAD. new_a added in C
Adding as new_a~C instead
Auto-merging new_a
Automatic merge failed; fix conflicts and then commit the result.
Removing new_a~C
[detached HEAD 1871ea4] D
 Author: A U Thor <author@example.com>
Merging:
cdf0ddb C
virtual B
found 1 common ancestor(s):
f139e5c A
CONFLICT (rename/add): Rename a->new_a in B. new_a added in HEAD
Adding as new_a~HEAD instead
Skipped new_a (merged same as existing)
Automatic merge failed; fix conflicts and then commit the result.
[detached HEAD 9e06e45] E
 Author: A U Thor <author@example.com>

ok 5 - setup differently handled merges of rename/add conflict

expecting success: 
	git reset --hard &&
	git checkout D^0 &&

	git merge -s recursive E^0 && {
		echo "BAD: should have conflicted"
		test "Incorrectly merged content" = "$(cat new_a)" &&
			echo "BAD: Silently accepted wrong content"
		return 1
	}

	test 3 = $(git ls-files -s | wc -l) &&
	test 3 = $(git ls-files -u | wc -l) &&
	test 0 = $(git ls-files -o | wc -l) &&

	test $(git rev-parse :2:new_a) = $(git rev-parse D:new_a) &&
	test $(git rev-parse :3:new_a) = $(git rev-parse E:new_a) &&

	git cat-file -p B:new_a >>merged &&
	git cat-file -p C:new_a >>merge-me &&
	>empty &&
	test_must_fail git merge-file \
		-L "Temporary merge branch 2" \
		-L "" \
		-L "Temporary merge branch 1" \
		merged empty merge-me &&
	test $(git rev-parse :1:new_a) = $(git hash-object merged)

HEAD is now at 9e06e45 E
Merging:
1871ea4 D
virtual E^0
found 2 common ancestor(s):
cdf0ddb C
c866f72 B
  Merging:
  cdf0ddb C
  c866f72 B
  found 1 common ancestor(s):
  f139e5c A
  CONFLICT (rename/add): Rename a->new_a in Temporary merge branch 2. new_a added in Temporary merge branch 1
  Adding merged new_a
Auto-merging new_a
CONFLICT (content): Merge conflict in new_a
Automatic merge failed; fix conflicts and then commit the result.
ok 6 - git detects differently handled merges conflict

# passed all 6 test(s)
1..6
