Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7201-co/.git/
expecting success: 

	fill x y z > same &&
	fill 1 2 3 4 5 6 7 8 >one &&
	fill a b c d e >two &&
	git add same one two &&
	git commit -m "Initial A one, A two" &&

	git checkout -b renamer &&
	rm -f one &&
	fill 1 3 4 5 6 7 8 >uno &&
	git add uno &&
	fill a b c d e f >two &&
	git commit -a -m "Renamer R one->uno, M two" &&

	git checkout -b side master &&
	fill 1 2 3 4 5 6 7 >one &&
	fill A B C D E >three &&
	rm -f two &&
	git update-index --add --remove one two three &&
	git commit -m "Side M one, D two, A three" &&

	git checkout -b simple master &&
	rm -f one &&
	fill a c e > two &&
	git commit -a -m "Simple D one, M two" &&

	git checkout master
[master (root-commit) 7329388] Initial A one, A two
 Author: A U Thor <author@example.com>
 3 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 one
 create mode 100644 same
 create mode 100644 two
[renamer 0420b41] Renamer R one->uno, M two
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename one => uno (87%)
[side ab76817] Side M one, D two, A three
 Author: A U Thor <author@example.com>
 3 files changed, 5 insertions(+), 6 deletions(-)
 create mode 100644 three
 delete mode 100644 two
[simple 022ff9d] Simple D one, M two
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 10 deletions(-)
 delete mode 100644 one

ok 1 - setup

expecting success: 

	git checkout -b delete-me master &&
	rm .git/refs/heads/delete-me &&
	test refs/heads/delete-me = "$(git symbolic-ref HEAD)" &&
	git checkout master &&
	test refs/heads/master = "$(git symbolic-ref HEAD)"


ok 2 - checkout from non-existing branch

expecting success: 

	fill 0 1 2 3 4 5 6 7 8 >one &&
	if git checkout side
	then
		echo Not happy
		false
	else
		echo "happy - failed correctly"
	fi


Aborting
happy - failed correctly

ok 3 - checkout with dirty tree without -m

expecting success: 

	git checkout -f master &&
	fill 0 1 2 3 4 5 6 7 8 >same &&
	cp same kept
	git checkout side >messages &&
	test_cmp same kept
	(cat > messages.expect <<EOF
M	same
EOF
) &&
	touch messages.expect &&
	test_cmp messages.expect messages


ok 4 - checkout with unrelated dirty tree without -m

expecting success: 

	git checkout -f master &&
	git clean -f &&

	fill 0 1 2 3 4 5 6 7 8 >one &&
	git checkout -m side > messages &&

	test "$(git symbolic-ref HEAD)" = "refs/heads/side" &&

	(cat >expect.messages <<EOF
M	one
EOF
) &&
	test_cmp expect.messages messages &&

	fill "M	one" "A	three" "D	two" >expect.master &&
	git diff --name-status master >current.master &&
	test_cmp expect.master current.master &&

	fill "M	one" >expect.side &&
	git diff --name-status side >current.side &&
	test_cmp expect.side current.side &&

	: >expect.index &&
	git diff --cached >current.index &&
	test_cmp expect.index current.index

Removing kept
Removing messages
Removing messages.expect

ok 5 - checkout -m with dirty tree

expecting success: 

	git checkout -f master && git clean -f &&

	fill 1 2 3 4 5 7 8 >one &&
	if git checkout renamer
	then
		echo Not happy
		false
	else
		echo "happy - failed correctly"
	fi &&

	git checkout -m renamer &&
	fill 1 3 4 5 7 8 >expect &&
	test_cmp expect uno &&
	! test -f one &&
	git diff --cached >current &&
	! test -s current


Removing current.index
Removing current.master
Removing current.side
Removing expect.index
Removing expect.master
Removing expect.messages
Removing expect.side
Removing messages
Aborting
happy - failed correctly
M	uno

ok 6 - checkout -m with dirty tree, renamed

expecting success: 

	git checkout -f master && git clean -f &&

	fill 1 T 3 4 5 6 S 8 >one &&
	if git checkout renamer
	then
		echo Not happy
		false
	else
		echo "happy - failed correctly"
	fi &&

	git checkout -m renamer &&

	git diff master:one :3:uno |
	sed -e "1,/^@@/d" -e "/^ /d" -e "s/^-/d/" -e "s/^+/a/" >current &&
	fill d2 aT d7 aS >expect &&
	test_cmp current expect &&
	git diff --cached two >current &&
	! test -s current

Removing current
Removing expect
Aborting
happy - failed correctly
M	uno

ok 7 - checkout -m with merge conflict

expecting success: 

	git checkout -f master && git clean -f &&

	fill b d > two &&
	git checkout -m simple &&

	git ls-files >current &&
	fill same two two two >expect &&
	test_cmp current expect &&

	cat <<-EOF >expect &&
	<<<<<<< simple
	a
	c
	e
	=======
	b
	d
	>>>>>>> local
	EOF
	test_cmp two expect

Removing current
Removing expect
M	two

ok 8 - format of merge conflict from checkout -m

expecting success: 

	git checkout -f master && git reset --hard && git clean -f &&

	fill b d > two &&
	git checkout --merge --conflict=diff3 simple &&

	cat <<-EOF >expect &&
	<<<<<<< simple
	a
	c
	e
	||||||| master
	a
	b
	c
	d
	e
	=======
	b
	d
	>>>>>>> local
	EOF
	test_cmp two expect

HEAD is now at 7329388 Initial A one, A two
Removing current
Removing expect
M	two

ok 9 - checkout --merge --conflict=diff3 <branch>

expecting success: 

	git config advice.detachedHead false &&
	git checkout -f renamer && git clean -f &&
	git checkout renamer^ 2>messages &&
	grep "HEAD is now at 7329388" messages &&
	test 1 -eq $(wc -l <messages) &&
	H=$(git rev-parse --verify HEAD) &&
	M=$(git show-ref -s --verify refs/heads/master) &&
	test "z$H" = "z$M" &&
	if git symbolic-ref HEAD >/dev/null 2>&1
	then
		echo "OOPS, HEAD is still symbolic???"
		false
	else
		: happy
	fi

Removing expect
HEAD is now at 7329388... Initial A one, A two

ok 10 - checkout to detach HEAD (with advice declined)

expecting success: 
	git config advice.detachedHead true &&
	git checkout -f renamer && git clean -f &&
	git checkout renamer^ 2>messages &&
	grep "HEAD is now at 7329388" messages &&
	test 1 -lt $(wc -l <messages) &&
	H=$(git rev-parse --verify HEAD) &&
	M=$(git show-ref -s --verify refs/heads/master) &&
	test "z$H" = "z$M" &&
	if git symbolic-ref HEAD >/dev/null 2>&1
	then
		echo "OOPS, HEAD is still symbolic???"
		false
	else
		: happy
	fi

Removing messages
HEAD is now at 7329388... Initial A one, A two

ok 11 - checkout to detach HEAD

expecting success: 

	git checkout -f master && git clean -f &&
	git checkout renamer^ &&
	H=$(git rev-parse --verify HEAD) &&
	M=$(git show-ref -s --verify refs/heads/master) &&
	test "z$H" = "z$M" &&
	if git symbolic-ref HEAD >/dev/null 2>&1
	then
		echo "OOPS, HEAD is still symbolic???"
		false
	else
		: happy
	fi

Removing messages

ok 12 - checkout to detach HEAD with branchname^

expecting success: 

	git checkout -f master && git clean -f &&
	git checkout ":/Initial" &&
	H=$(git rev-parse --verify HEAD) &&
	M=$(git show-ref -s --verify refs/heads/master) &&
	test "z$H" = "z$M" &&
	if git symbolic-ref HEAD >/dev/null 2>&1
	then
		echo "OOPS, HEAD is still symbolic???"
		false
	else
		: happy
	fi


ok 13 - checkout to detach HEAD with :/message

expecting success: 

	git checkout -f master && git clean -f &&
	git checkout HEAD^0 &&
	H=$(git rev-parse --verify HEAD) &&
	M=$(git show-ref -s --verify refs/heads/master) &&
	test "z$H" = "z$M" &&
	if git symbolic-ref HEAD >/dev/null 2>&1
	then
		echo "OOPS, HEAD is still symbolic???"
		false
	else
		: happy
	fi


ok 14 - checkout to detach HEAD with HEAD^0

expecting success: 

	git tag both side &&
	git branch both master &&
	git reset --hard &&
	git checkout master &&

	git checkout both &&
	H=$(git rev-parse --verify HEAD) &&
	M=$(git show-ref -s --verify refs/heads/master) &&
	test "z$H" = "z$M" &&
	name=$(git symbolic-ref HEAD 2>/dev/null) &&
	test "z$name" = zrefs/heads/both


HEAD is now at 7329388 Initial A one, A two

ok 15 - checkout with ambiguous tag/branch names

expecting success: 

	git reset --hard &&
	git checkout master &&

	git tag frotz side &&
	git branch frotz master &&
	git reset --hard &&
	git checkout master &&

	git checkout tags/frotz &&
	H=$(git rev-parse --verify HEAD) &&
	S=$(git show-ref -s --verify refs/heads/side) &&
	test "z$H" = "z$S" &&
	if name=$(git symbolic-ref HEAD 2>/dev/null)
	then
		echo "Bad -- should have detached"
		false
	else
		: happy
	fi


HEAD is now at 7329388 Initial A one, A two
HEAD is now at 7329388 Initial A one, A two

ok 16 - checkout with ambiguous tag/branch names

expecting success: 

	git reset --hard &&
	git checkout master &&

	mkdir subs &&
	(
		cd subs &&
		git checkout side
	) &&
	! test -f subs/one &&
	rm -fr subs


HEAD is now at ab76817 Side M one, D two, A three

ok 17 - switch branches while in subdirectory

expecting success: 

	git reset --hard &&
	git checkout side &&
	mkdir subs &&
	>subs/bero &&
	git add subs/bero &&
	git commit -m "add subs/bero" &&

	git checkout master &&
	mkdir -p subs &&
	(
		cd subs &&
		git checkout side -- bero
	) &&
	test -f subs/bero
HEAD is now at ab76817 Side M one, D two, A three
[side bb04aa0] add subs/bero
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 subs/bero

ok 18 - checkout specific path while in subdirectory

expecting success: 
    git config branch.autosetupmerge false &&
    git checkout master &&
    git checkout --track -b track1 &&
    test "$(git config branch.track1.remote)" &&
    test "$(git config branch.track1.merge)"
A	subs/bero
A	subs/bero
Branch track1 set up to track local branch master.

ok 19 - checkout w/--track sets up tracking

expecting success: 
    git config branch.autosetupmerge always &&
    git checkout master &&
    git checkout -b track2 &&
    test "$(git config branch.track2.remote)" &&
    test "$(git config branch.track2.merge)"
    git config branch.autosetupmerge false
A	subs/bero
A	subs/bero
Branch track2 set up to track local branch master.

ok 20 - checkout w/autosetupmerge=always sets up tracking

expecting success: 
    git checkout master^0 &&
    test_must_fail git symbolic-ref HEAD &&
    test_must_fail git checkout --track -b track &&
    test_must_fail git rev-parse --verify track &&
    test_must_fail git symbolic-ref HEAD &&
    test "z$(git rev-parse master^0)" = "z$(git rev-parse HEAD)"

A	subs/bero
A	subs/bero

ok 21 - checkout w/--track from non-branch HEAD fails

expecting success: 
    git checkout master &&
    git config --bool core.prefersymlinkrefs yes &&
    git checkout side &&
    git checkout master &&
    it=$(git symbolic-ref HEAD) &&
    test "z$it" = zrefs/heads/master &&
    here=$(git rev-parse --verify refs/heads/master) &&
    git checkout side^ &&
    test "z$(git rev-parse --verify refs/heads/master)" = "z$here"

A	subs/bero

ok 22 - detach a symbolic link HEAD

expecting success: 
    git update-ref refs/remotes/origin/koala/bear renamer &&
    git update-ref refs/new/koala/bear renamer &&

    git checkout --track origin/koala/bear &&
    test "refs/heads/koala/bear" = "$(git symbolic-ref HEAD)" &&
    test "$(git rev-parse HEAD)" = "$(git rev-parse renamer)" &&

    git checkout master && git branch -D koala/bear &&

    git checkout --track refs/remotes/origin/koala/bear &&
    test "refs/heads/koala/bear" = "$(git symbolic-ref HEAD)" &&
    test "$(git rev-parse HEAD)" = "$(git rev-parse renamer)" &&

    git checkout master && git branch -D koala/bear &&

    git checkout --track remotes/origin/koala/bear &&
    test "refs/heads/koala/bear" = "$(git symbolic-ref HEAD)" &&
    test "$(git rev-parse HEAD)" = "$(git rev-parse renamer)" &&

    git checkout master && git branch -D koala/bear &&

    git checkout --track refs/new/koala/bear &&
    test "refs/heads/koala/bear" = "$(git symbolic-ref HEAD)" &&
    test "$(git rev-parse HEAD)" = "$(git rev-parse renamer)"

Branch koala/bear set up to track local ref refs/remotes/origin/koala/bear.
Deleted branch koala/bear (was 0420b41).
Branch koala/bear set up to track local ref refs/remotes/origin/koala/bear.
Deleted branch koala/bear (was 0420b41).
Branch koala/bear set up to track local ref refs/remotes/origin/koala/bear.
Deleted branch koala/bear (was 0420b41).
Branch koala/bear set up to track local ref refs/new/koala/bear.

ok 23 - checkout with --track fakes a sensible -b <name>

expecting success: 
    test_must_fail git checkout --track renamer

ok 24 - checkout with --track, but without -b, fails with too short tracked name

expecting success: 
	setup_conflicting_index &&
	echo "none of the above" >sample &&
	cat sample >fild &&
	cat sample >file &&
	cat sample >filf &&
	test_must_fail git checkout fild file filf &&
	test_cmp sample fild &&
	test_cmp sample filf &&
	test_cmp sample file


ok 25 - checkout an unmerged path should fail

expecting success: 
	setup_conflicting_index &&
	echo "none of the above" >sample &&
	echo ourside >expect &&
	cat sample >fild &&
	cat sample >file &&
	cat sample >filf &&
	git checkout -f fild file filf &&
	test_cmp expect fild &&
	test_cmp expect filf &&
	test_cmp sample file


ok 26 - checkout with an unmerged path can be ignored

expecting success: 
	setup_conflicting_index &&
	echo "none of the above" >sample &&
	echo ourside >expect &&
	cat sample >fild &&
	cat sample >file &&
	cat sample >filf &&
	git checkout --ours . &&
	test_cmp expect fild &&
	test_cmp expect filf &&
	test_cmp expect file &&
	git checkout --theirs file &&
	test ztheirside = "z$(cat file)"


ok 27 - checkout unmerged stage

expecting success: 
	setup_conflicting_index &&
	echo "none of the above" >sample &&
	echo ourside >expect &&
	cat sample >fild &&
	cat sample >file &&
	cat sample >filf &&
	git checkout -m -- fild file filf &&
	(
		echo "<<<<<<< ours"
		echo ourside
		echo "======="
		echo theirside
		echo ">>>>>>> theirs"
	) >merged &&
	test_cmp expect fild &&
	test_cmp expect filf &&
	test_cmp merged file


ok 28 - checkout with --merge

expecting success: 
	git config merge.conflictstyle diff3 &&
	setup_conflicting_index &&
	echo "none of the above" >sample &&
	echo ourside >expect &&
	cat sample >fild &&
	cat sample >file &&
	cat sample >filf &&
	git checkout -m -- fild file filf &&
	(
		echo "<<<<<<< ours"
		echo ourside
		echo "||||||| base"
		echo original
		echo "======="
		echo theirside
		echo ">>>>>>> theirs"
	) >merged &&
	test_cmp expect fild &&
	test_cmp expect filf &&
	test_cmp merged file

ok 29 - checkout with --merge, in diff3 -m style

expecting success: 
	git config merge.conflictstyle diff3 &&
	setup_conflicting_index &&
	echo "none of the above" >sample &&
	echo ourside >expect &&
	cat sample >fild &&
	cat sample >file &&
	cat sample >filf &&
	git checkout --conflict=merge -- fild file filf &&
	(
		echo "<<<<<<< ours"
		echo ourside
		echo "======="
		echo theirside
		echo ">>>>>>> theirs"
	) >merged &&
	test_cmp expect fild &&
	test_cmp expect filf &&
	test_cmp merged file


ok 30 - checkout --conflict=merge, overriding config

expecting success: 
	git config --unset merge.conflictstyle
	setup_conflicting_index &&
	echo "none of the above" >sample &&
	echo ourside >expect &&
	cat sample >fild &&
	cat sample >file &&
	cat sample >filf &&
	git checkout --conflict=diff3 -- fild file filf &&
	(
		echo "<<<<<<< ours"
		echo ourside
		echo "||||||| base"
		echo original
		echo "======="
		echo theirside
		echo ">>>>>>> theirs"
	) >merged &&
	test_cmp expect fild &&
	test_cmp expect filf &&
	test_cmp merged file
ok 31 - checkout --conflict=diff3
expecting success: 
	git reset --hard master &&
	git symbolic-ref HEAD refs/heads/master &&
	test_must_fail git checkout -b renamer side^ &&
	test $(git symbolic-ref HEAD) = refs/heads/master &&
	git diff --exit-code &&
	git diff --cached --exit-code
HEAD is now at 7329388 Initial A one, A two
ok 32 - failing checkout -b should not break working tree

expecting success: 
	git reset --hard master &&
	git checkout master^0 &&
	echo modified >one &&
	test_must_fail git checkout renamer 2>error.log &&
	! grep "^Previous HEAD" error.log
HEAD is now at 7329388 Initial A one, A two
Aborting

ok 33 - switch out of non-branch

expecting success: 
	git reset --hard &&

	git config merge.filfre.driver "./filfre.sh %O %A %B" &&
	git config merge.filfre.name "Feel-free merge driver" &&
	git config merge.filfre.recursive binary &&
	echo "arm merge=filfre" >.gitattributes &&

	git checkout -b left &&
	echo neutral >arm &&
	git add arm .gitattributes &&
	test_tick &&
	git commit -m neutral &&
	git branch right &&

	echo left >arm &&
	test_tick &&
	git commit -a -m left &&
	git checkout right &&

	echo right >arm &&
	test_tick &&
	git commit -a -m right &&

	test_must_fail git merge left &&
	(
		for t in filfre-common left right
		do
			grep $t arm || exit 1
		done
		exit 0
	) &&

	mv arm expect &&
	git checkout -m arm &&
	test_cmp expect arm
HEAD is now at 7329388 Initial A one, A two
[left b257dc6] neutral
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 .gitattributes
 create mode 100644 arm
[left 2459c9d] left
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[right 6b476b9] right
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Merging:
6b476b9 right
virtual left
found 1 common ancestor(s):
b257dc6 neutral
Auto-merging arm
CONFLICT (content): Merge conflict in arm
Automatic merge failed; fix conflicts and then commit the result.
||||||| filfre-common
left
right

ok 34 - custom merge driver with checkout -m

# passed all 34 test(s)
1..34
