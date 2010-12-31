Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3030-merge-recursive/.git/
expecting success: 

	echo hello >a &&
	o0=$(git hash-object a) &&
	cp a b &&
	cp a c &&
	mkdir d &&
	cp a d/e &&

	test_tick &&
	git add a b c d/e &&
	git commit -m initial &&
	c0=$(git rev-parse --verify HEAD) &&
	git branch side &&
	git branch df-1 &&
	git branch df-2 &&
	git branch df-3 &&
	git branch remove &&
	git branch submod &&
	git branch copy &&
	git branch rename &&
	if test_have_prereq SYMLINKS
	then
		git branch rename-ln
	fi &&

	echo hello >>a &&
	cp a d/e &&
	o1=$(git hash-object a) &&

	git add a d/e &&

	test_tick &&
	git commit -m "master modifies a and d/e" &&
	c1=$(git rev-parse --verify HEAD) &&
	( git ls-tree -r HEAD ; git ls-files -s ) >actual &&
	(
		echo "100644 blob $o1	a"
		echo "100644 blob $o0	b"
		echo "100644 blob $o0	c"
		echo "100644 blob $o1	d/e"
		echo "100644 $o1 0	a"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o1 0	d/e"
	) >expected &&
	test_cmp expected actual
[master (root-commit) 88eeecf] initial
 Author: A U Thor <author@example.com>
 4 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 a
 create mode 100644 b
 create mode 100644 c
 create mode 100644 d/e
[master b7f3e7f] master modifies a and d/e
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)

ok 1 - setup 1
expecting success: 

	rm -rf [abcd] &&
	git checkout side &&
	( git ls-tree -r HEAD ; git ls-files -s ) >actual &&
	(
		echo "100644 blob $o0	a"
		echo "100644 blob $o0	b"
		echo "100644 blob $o0	c"
		echo "100644 blob $o0	d/e"
		echo "100644 $o0 0	a"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o0 0	d/e"
	) >expected &&
	test_cmp expected actual &&

	echo goodbye >>a &&
	o2=$(git hash-object a) &&

	git add a &&

	test_tick &&
	git commit -m "side modifies a" &&
	c2=$(git rev-parse --verify HEAD) &&
	( git ls-tree -r HEAD ; git ls-files -s ) >actual &&
	(
		echo "100644 blob $o2	a"
		echo "100644 blob $o0	b"
		echo "100644 blob $o0	c"
		echo "100644 blob $o0	d/e"
		echo "100644 $o2 0	a"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o0 0	d/e"
	) >expected &&
	test_cmp expected actual
D	b
D	c
[side 4419332] side modifies a
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 2 - setup 2
expecting success: 

	rm -rf [abcd] &&
	git checkout df-1 &&
	( git ls-tree -r HEAD ; git ls-files -s ) >actual &&
	(
		echo "100644 blob $o0	a"
		echo "100644 blob $o0	b"
		echo "100644 blob $o0	c"
		echo "100644 blob $o0	d/e"
		echo "100644 $o0 0	a"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o0 0	d/e"
	) >expected &&
	test_cmp expected actual &&

	rm -f b && mkdir b && echo df-1 >b/c && git add b/c &&
	o3=$(git hash-object b/c) &&

	test_tick &&
	git commit -m "df-1 makes b/c" &&
	c3=$(git rev-parse --verify HEAD) &&
	( git ls-tree -r HEAD ; git ls-files -s ) >actual &&
	(
		echo "100644 blob $o0	a"
		echo "100644 blob $o3	b/c"
		echo "100644 blob $o0	c"
		echo "100644 blob $o0	d/e"
		echo "100644 $o0 0	a"
		echo "100644 $o3 0	b/c"
		echo "100644 $o0 0	c"
		echo "100644 $o0 0	d/e"
	) >expected &&
	test_cmp expected actual
D	b
D	c
D	d/e
[df-1 918ade1] df-1 makes b/c
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 1 deletions(-)
 delete mode 100644 b
 create mode 100644 b/c

ok 3 - setup 3
expecting success: 

	rm -rf [abcd] &&
	git checkout df-2 &&
	( git ls-tree -r HEAD ; git ls-files -s ) >actual &&
	(
		echo "100644 blob $o0	a"
		echo "100644 blob $o0	b"
		echo "100644 blob $o0	c"
		echo "100644 blob $o0	d/e"
		echo "100644 $o0 0	a"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o0 0	d/e"
	) >expected &&
	test_cmp expected actual &&

	rm -f a && mkdir a && echo df-2 >a/c && git add a/c &&
	o4=$(git hash-object a/c) &&

	test_tick &&
	git commit -m "df-2 makes a/c" &&
	c4=$(git rev-parse --verify HEAD) &&
	( git ls-tree -r HEAD ; git ls-files -s ) >actual &&
	(
		echo "100644 blob $o4	a/c"
		echo "100644 blob $o0	b"
		echo "100644 blob $o0	c"
		echo "100644 blob $o0	d/e"
		echo "100644 $o4 0	a/c"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o0 0	d/e"
	) >expected &&
	test_cmp expected actual
D	a
D	c
D	d/e
[df-2 833bf24] df-2 makes a/c
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 1 deletions(-)
 delete mode 100644 a
 create mode 100644 a/c

ok 4 - setup 4

expecting success: 

	rm -rf [abcd] &&
	git checkout remove &&
	( git ls-tree -r HEAD ; git ls-files -s ) >actual &&
	(
		echo "100644 blob $o0	a"
		echo "100644 blob $o0	b"
		echo "100644 blob $o0	c"
		echo "100644 blob $o0	d/e"
		echo "100644 $o0 0	a"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o0 0	d/e"
	) >expected &&
	test_cmp expected actual &&

	rm -f b &&
	echo remove-conflict >a &&

	git add a &&
	git rm b &&
	o5=$(git hash-object a) &&

	test_tick &&
	git commit -m "remove removes b and modifies a" &&
	c5=$(git rev-parse --verify HEAD) &&
	( git ls-tree -r HEAD ; git ls-files -s ) >actual &&
	(
		echo "100644 blob $o5	a"
		echo "100644 blob $o0	c"
		echo "100644 blob $o0	d/e"
		echo "100644 $o5 0	a"
		echo "100644 $o0 0	c"
		echo "100644 $o0 0	d/e"
	) >expected &&
	test_cmp expected actual
D	b
D	c
D	d/e
rm 'b'
[remove 968f3e1] remove removes b and modifies a
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 2 deletions(-)
 delete mode 100644 b

ok 5 - setup 5
expecting success: 

	rm -rf [abcd] &&
	git checkout df-3 &&
	( git ls-tree -r HEAD ; git ls-files -s ) >actual &&
	(
		echo "100644 blob $o0	a"
		echo "100644 blob $o0	b"
		echo "100644 blob $o0	c"
		echo "100644 blob $o0	d/e"
		echo "100644 $o0 0	a"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o0 0	d/e"
	) >expected &&
	test_cmp expected actual &&

	rm -fr d && echo df-3 >d && git add d &&
	o6=$(git hash-object d) &&

	test_tick &&
	git commit -m "df-3 makes d" &&
	c6=$(git rev-parse --verify HEAD) &&
	( git ls-tree -r HEAD ; git ls-files -s ) >actual &&
	(
		echo "100644 blob $o0	a"
		echo "100644 blob $o0	b"
		echo "100644 blob $o0	c"
		echo "100644 blob $o6	d"
		echo "100644 $o0 0	a"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o6 0	d"
	) >expected &&
	test_cmp expected actual
D	c
D	d/e
[df-3 9d284b3] df-3 makes d
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 1 deletions(-)
 create mode 100644 d
 delete mode 100644 d/e

ok 6 - setup 6

expecting success: 

	git checkout submod &&
	git rm d/e &&
	test_tick &&
	git commit -m "remove d/e" &&
	git update-index --add --cacheinfo 160000 $c1 d &&
	test_tick &&
	git commit -m "make d/ a submodule"
D	c
rm 'd/e'
[submod a09e90e] remove d/e
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 d/e
[submod 8c3440b] make d/ a submodule
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 160000 d

ok 7 - setup 7
expecting success: 
	git checkout rename &&
	git mv a e &&
	git add e &&
	test_tick &&
	git commit -m "rename a->e" &&
	if test_have_prereq SYMLINKS
	then
		git checkout rename-ln &&
		git mv a e &&
		ln -s e a &&
		git add a e &&
		test_tick &&
		git commit -m "rename a->e, symlink a->e"
	fi
D	c
[rename 5dd9bd8] rename a->e
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename a => e (100%)
D	c
[rename-ln 7e1ee82] rename a->e, symlink a->e
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 1 deletions(-)
 rewrite a (100%)
 mode change 100644 => 120000
 rename a => e (100%)

ok 8 - setup 8

expecting success: 
	git checkout copy &&
	cp a e &&
	git add e &&
	test_tick &&
	git commit -m "copy a->e"

D	c
[copy a40ced5] copy a->e
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 e

ok 9 - setup 9

expecting success: 

	rm -fr [abcd] &&
	git checkout -f "$c2" &&

	git merge-recursive "$c0" -- "$c2" "$c1"
	status=$?
	case "$status" in
	1)
		: happy
		;;
	*)
		echo >&2 "why status $status!!!"
		false
		;;
	esac
Merging 441933296d498d45ed4c5cbe9135259386a2e2b2 with b7f3e7f677ef7001dcb4b810583c9259a210141d
Merging:
4419332 side modifies a
b7f3e7f master modifies a and d/e
found 1 common ancestor(s):
88eeecf initial
Auto-merging a
CONFLICT (content): Merge conflict in a

ok 10 - merge-recursive simple
expecting success: 

	git ls-files -s >actual &&
	(
		echo "100644 $o0 1	a"
		echo "100644 $o2 2	a"
		echo "100644 $o1 3	a"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o1 0	d/e"
	) >expected &&
	test_cmp expected actual
ok 11 - merge-recursive result

expecting success: 

	rm -fr [abcd] &&
	git checkout -f "$c1" &&

	test_must_fail git merge "$c5" &&
	test_must_fail git merge "$c5" 2> out &&
	grep "not possible because you have unmerged files" out &&
	git add -u &&
	test_must_fail git merge "$c5" 2> out &&
	grep "You have not concluded your merge" out &&
	rm -f .git/MERGE_HEAD &&
	test_must_fail git merge "$c5" 2> out &&
	grep "Your local changes to the following files would be overwritten by merge:" out
Merging:
b7f3e7f master modifies a and d/e
virtual 968f3e182d39cc5676d733434b2b1fcade6d5fdb
found 1 common ancestor(s):
88eeecf initial
Auto-merging a
CONFLICT (content): Merge conflict in a
Removing b
Automatic merge failed; fix conflicts and then commit the result.
fatal: 'merge' is not possible because you have unmerged files.
fatal: You have not concluded your merge (MERGE_HEAD exists).
Merging:
b7f3e7f master modifies a and d/e
virtual 968f3e182d39cc5676d733434b2b1fcade6d5fdb
found 1 common ancestor(s):
88eeecf initial
Aborting
error: Your local changes to the following files would be overwritten by merge:

ok 12 - fail if the index has unresolved entries

expecting success: 

	rm -fr [abcd] &&
	git checkout -f "$c1" &&

	git merge-recursive "$c0" -- "$c1" "$c5"
	status=$?
	case "$status" in
	1)
		: happy
		;;
	*)
		echo >&2 "why status $status!!!"
		false
		;;
	esac

Merging b7f3e7f677ef7001dcb4b810583c9259a210141d with 968f3e182d39cc5676d733434b2b1fcade6d5fdb
Merging:
b7f3e7f master modifies a and d/e
968f3e1 remove removes b and modifies a
found 1 common ancestor(s):
88eeecf initial
Auto-merging a
CONFLICT (content): Merge conflict in a
Removing b

ok 13 - merge-recursive remove conflict

expecting success: 

	git ls-files -s >actual &&
	(
		echo "100644 $o0 1	a"
		echo "100644 $o1 2	a"
		echo "100644 $o5 3	a"
		echo "100644 $o0 0	c"
		echo "100644 $o1 0	d/e"
	) >expected &&
	test_cmp expected actual

ok 14 - merge-recursive remove conflict

expecting success: 
	rm -fr [abcd] &&
	git reset --hard &&
	git checkout -f "$c1" &&

	git merge-recursive "$c0" -- "$c1" "$c3"

HEAD is now at b7f3e7f master modifies a and d/e
Merging b7f3e7f677ef7001dcb4b810583c9259a210141d with 918ade1d06dd1c0da47b644356c64b1b2122e705
Merging:
b7f3e7f master modifies a and d/e
918ade1 df-1 makes b/c
found 1 common ancestor(s):
88eeecf initial
Removing b to make room for subdirectory; may re-add later.
Removing b
Adding b/c

ok 15 - merge-recursive d/f simple

expecting success: 

	git ls-files -s >actual &&
	(
		echo "100644 $o1 0	a"
		echo "100644 $o3 0	b/c"
		echo "100644 $o0 0	c"
		echo "100644 $o1 0	d/e"
	) >expected &&
	test_cmp expected actual



ok 16 - merge-recursive result
expecting success: 

	rm -fr [abcd] &&
	git reset --hard &&
	git checkout -f "$c1" &&

	git merge-recursive "$c0" -- "$c1" "$c4"
	status=$?
	case "$status" in
	1)
		: happy
		;;
	*)
		echo >&2 "why status $status!!!"
		false
		;;
	esac
HEAD is now at b7f3e7f master modifies a and d/e
Merging b7f3e7f677ef7001dcb4b810583c9259a210141d with 833bf240c9e2636a0e5eb3dd8f735d2a92181f22
Merging:
b7f3e7f master modifies a and d/e
833bf24 df-2 makes a/c
found 1 common ancestor(s):
88eeecf initial
Removing a to make room for subdirectory; may re-add later.
Adding a/c
CONFLICT (delete/modify): a deleted in 833bf240c9e2636a0e5eb3dd8f735d2a92181f22 and modified in b7f3e7f677ef7001dcb4b810583c9259a210141d. Version b7f3e7f677ef7001dcb4b810583c9259a210141d of a left in tree at a~b7f3e7f677ef7001dcb4b810583c9259a210141d.

ok 17 - merge-recursive d/f conflict

expecting success: 

	git ls-files -s >actual &&
	(
		echo "100644 $o0 1	a"
		echo "100644 $o1 2	a"
		echo "100644 $o4 0	a/c"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o1 0	d/e"
	) >expected &&
	test_cmp expected actual

ok 18 - merge-recursive d/f conflict result

expecting success: 

	rm -fr [abcd] &&
	git reset --hard &&
	git checkout -f "$c4" &&

	git merge-recursive "$c0" -- "$c4" "$c1"
	status=$?
	case "$status" in
	1)
		: happy
		;;
	*)
		echo >&2 "why status $status!!!"
		false
		;;
	esac
HEAD is now at b7f3e7f master modifies a and d/e
Merging 833bf240c9e2636a0e5eb3dd8f735d2a92181f22 with b7f3e7f677ef7001dcb4b810583c9259a210141d
Merging:
833bf24 df-2 makes a/c
b7f3e7f master modifies a and d/e
found 1 common ancestor(s):
88eeecf initial
Adding a/c
CONFLICT (delete/modify): a deleted in 833bf240c9e2636a0e5eb3dd8f735d2a92181f22 and modified in b7f3e7f677ef7001dcb4b810583c9259a210141d. Version b7f3e7f677ef7001dcb4b810583c9259a210141d of a left in tree at a~b7f3e7f677ef7001dcb4b810583c9259a210141d_0.

ok 19 - merge-recursive d/f conflict the other way

expecting success: 

	git ls-files -s >actual &&
	(
		echo "100644 $o0 1	a"
		echo "100644 $o1 3	a"
		echo "100644 $o4 0	a/c"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o1 0	d/e"
	) >expected &&
	test_cmp expected actual

ok 20 - merge-recursive d/f conflict result the other way

expecting success: 

	rm -fr [abcd] &&
	git reset --hard &&
	git checkout -f "$c1" &&

	git merge-recursive "$c0" -- "$c1" "$c6"
	status=$?
	case "$status" in
	1)
		: happy
		;;
	*)
		echo >&2 "why status $status!!!"
		false
		;;
	esac
HEAD is now at 833bf24 df-2 makes a/c
Merging b7f3e7f677ef7001dcb4b810583c9259a210141d with 9d284b3a95aea72df4581977e913e55da89d5e3d
Merging:
b7f3e7f master modifies a and d/e
9d284b3 df-3 makes d
found 1 common ancestor(s):
88eeecf initial
CONFLICT (delete/modify): d/e deleted in 9d284b3a95aea72df4581977e913e55da89d5e3d and modified in b7f3e7f677ef7001dcb4b810583c9259a210141d. Version b7f3e7f677ef7001dcb4b810583c9259a210141d of d/e left in tree.
CONFLICT (directory/file): There is a directory with name d in b7f3e7f677ef7001dcb4b810583c9259a210141d. Adding d as d~9d284b3a95aea72df4581977e913e55da89d5e3d

ok 21 - merge-recursive d/f conflict

expecting success: 

	git ls-files -s >actual &&
	(
		echo "100644 $o1 0	a"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o6 3	d"
		echo "100644 $o0 1	d/e"
		echo "100644 $o1 2	d/e"
	) >expected &&
	test_cmp expected actual



ok 22 - merge-recursive d/f conflict result

expecting success: 

	rm -fr [abcd] &&
	git reset --hard &&
	git checkout -f "$c6" &&

	git merge-recursive "$c0" -- "$c6" "$c1"
	status=$?
	case "$status" in
	1)
		: happy
		;;
	*)
		echo >&2 "why status $status!!!"
		false
		;;
	esac
HEAD is now at b7f3e7f master modifies a and d/e
Merging 9d284b3a95aea72df4581977e913e55da89d5e3d with b7f3e7f677ef7001dcb4b810583c9259a210141d
Merging:
9d284b3 df-3 makes d
b7f3e7f master modifies a and d/e
found 1 common ancestor(s):
88eeecf initial
Removing d to make room for subdirectory; may re-add later.
CONFLICT (delete/modify): d/e deleted in 9d284b3a95aea72df4581977e913e55da89d5e3d and modified in b7f3e7f677ef7001dcb4b810583c9259a210141d. Version b7f3e7f677ef7001dcb4b810583c9259a210141d of d/e left in tree.
CONFLICT (file/directory): There is a directory with name d in b7f3e7f677ef7001dcb4b810583c9259a210141d. Adding d as d~9d284b3a95aea72df4581977e913e55da89d5e3d_0

ok 23 - merge-recursive d/f conflict

expecting success: 

	git ls-files -s >actual &&
	(
		echo "100644 $o1 0	a"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o6 2	d"
		echo "100644 $o0 1	d/e"
		echo "100644 $o1 3	d/e"
	) >expected &&
	test_cmp expected actual

ok 24 - merge-recursive d/f conflict result

expecting success: 

	git reset --hard "$c2" &&
	git read-tree -m "$c0" "$c2" "$c1"
HEAD is now at 4419332 side modifies a
ok 25 - reset and 3-way merge
expecting success: 

	git reset --hard master &&
	git read-tree --prefix=M/ master &&
	git ls-files -s >actual &&
	(
		echo "100644 $o1 0	M/a"
		echo "100644 $o0 0	M/b"
		echo "100644 $o0 0	M/c"
		echo "100644 $o1 0	M/d/e"
		echo "100644 $o1 0	a"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o1 0	d/e"
	) >expected &&
	test_cmp expected actual &&

	git read-tree --prefix=a1/ master &&
	git ls-files -s >actual &&
	(
		echo "100644 $o1 0	M/a"
		echo "100644 $o0 0	M/b"
		echo "100644 $o0 0	M/c"
		echo "100644 $o1 0	M/d/e"
		echo "100644 $o1 0	a"
		echo "100644 $o1 0	a1/a"
		echo "100644 $o0 0	a1/b"
		echo "100644 $o0 0	a1/c"
		echo "100644 $o1 0	a1/d/e"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o1 0	d/e"
	) >expected &&
	test_cmp expected actual &&

	git read-tree --prefix=z/ master &&
	git ls-files -s >actual &&
	(
		echo "100644 $o1 0	M/a"
		echo "100644 $o0 0	M/b"
		echo "100644 $o0 0	M/c"
		echo "100644 $o1 0	M/d/e"
		echo "100644 $o1 0	a"
		echo "100644 $o1 0	a1/a"
		echo "100644 $o0 0	a1/b"
		echo "100644 $o0 0	a1/c"
		echo "100644 $o1 0	a1/d/e"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o1 0	d/e"
		echo "100644 $o1 0	z/a"
		echo "100644 $o0 0	z/b"
		echo "100644 $o0 0	z/c"
		echo "100644 $o1 0	z/d/e"
	) >expected &&
	test_cmp expected actual
HEAD is now at b7f3e7f master modifies a and d/e
ok 26 - reset and bind merge
expecting success: 

	git reset --hard master &&
	git checkout -b rm &&
	git rm d/e &&
	git commit -mremoved-d/e &&
	git checkout master &&
	git merge -s recursive rm &&
	test_must_fail test -d d
HEAD is now at b7f3e7f master modifies a and d/e
rm 'd/e'
[rm df61676] removed-d/e
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 2 deletions(-)
 delete mode 100644 d/e
Updating b7f3e7f..df61676
Fast-forward
 d/e |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)
 delete mode 100644 d/e

ok 27 - merge removes empty directories

checking known breakage: 

	git checkout submod &&
	git merge remove
Merging:
8c3440b make d/ a submodule
virtual remove
found 1 common ancestor(s):
88eeecf initial
Removing b
CONFLICT (file/directory): There is a directory with name d in remove. Adding d as d~HEAD
Automatic merge failed; fix conflicts and then commit the result.

not ok 28 - merge-recursive simple w/submodule # TODO known breakage

checking known breakage: 

	git ls-files -s >actual &&
	(
		echo "100644 $o5 0	a"
		echo "100644 $o0 0	c"
		echo "160000 $c1 0	d"
	) >expected &&
	test_cmp expected actual

--- expected	2010-12-31 04:05:33.000000000 +0000
+++ actual	2010-12-31 04:05:33.000000000 +0000
@@ -1,3 +1,3 @@
 100644 9270c800bfe5f17f5e8972070a1910903eb00347 0	a
 100644 ce013625030ba8dba906f756967f9e9ca394464a 0	c
-160000 b7f3e7f677ef7001dcb4b810583c9259a210141d 0	d
+160000 b7f3e7f677ef7001dcb4b810583c9259a210141d 2	d

not ok 29 - merge-recursive simple w/submodule result # TODO known breakage

expecting success: 
	git checkout -f copy &&
	git merge rename &&
	( git ls-tree -r HEAD && git ls-files -s ) >actual &&
	(
		echo "100644 blob $o0	b"
		echo "100644 blob $o0	c"
		echo "100644 blob $o0	d/e"
		echo "100644 blob $o0	e"
		echo "100644 $o0 0	b"
		echo "100644 $o0 0	c"
		echo "100644 $o0 0	d/e"
		echo "100644 $o0 0	e"
	) >expected &&
	test_cmp expected actual
Merging:
a40ced5 copy a->e
virtual rename
found 1 common ancestor(s):
88eeecf initial
Merge made by recursive.
 a |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 a

ok 30 - merge-recursive copy vs. rename

expecting success: 

		git checkout -f rename &&
		git merge rename-ln &&
		( git ls-tree -r HEAD ; git ls-files -s ) >actual &&
		(
			echo "100644 blob $o0	b"
			echo "100644 blob $o0	c"
			echo "100644 blob $o0	d/e"
			echo "100644 blob $o0	e"
			echo "100644 $o0 0	b"
			echo "100644 $o0 0	c"
			echo "100644 $o0 0	d/e"
			echo "100644 $o0 0	e"
		) >expected &&
		test_cmp expected actual
	
Merging:
5dd9bd8 rename a->e
virtual rename-ln
found 1 common ancestor(s):
88eeecf initial
Merge made by recursive.

ok 31 - merge-recursive rename vs. rename/symlink

# still have 2 known breakage(s)
# passed all remaining 29 test(s)
1..31
