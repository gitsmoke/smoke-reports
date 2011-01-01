Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6026-merge-attr/.git/
expecting success: 

	for f in text binary union
	do
		echo Initial >$f && git add $f || break
	done &&
	test_tick &&
	git commit -m Initial &&

	git branch side &&
	for f in text binary union
	do
		echo Master >>$f && git add $f || break
	done &&
	test_tick &&
	git commit -m Master &&

	git checkout side &&
	for f in text binary union
	do
		echo Side >>$f && git add $f || break
	done &&
	test_tick &&
	git commit -m Side &&

	git tag anchor
[master (root-commit) 5f96ff8] Initial
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 binary
 create mode 100644 text
 create mode 100644 union
[master 5054610] Master
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 0 deletions(-)
[side 03d8861] Side
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 

	{
		echo "binary -merge"
		echo "union merge=union"
	} >.gitattributes &&

	if git merge master
	then
		echo Gaah, should have conflicted
		false
	else
		echo Ok, conflicted.
	fi

Merging:
03d8861 Side
virtual master
found 1 common ancestor(s):
5f96ff8 Initial
Auto-merging binary
CONFLICT (content): Merge conflict in binary
Auto-merging text
CONFLICT (content): Merge conflict in text
Auto-merging union
Automatic merge failed; fix conflicts and then commit the result.
Ok, conflicted.

ok 2 - merge

expecting success: 

	git ls-files -u | grep binary &&
	git ls-files -u | grep text &&
	! (git ls-files -u | grep union)


100644 a77fa514de2720c72c1a861de098595959a2c97a 1	binary
100644 fb25c069fdd4d47c6cf8d3a457b8f620064cba41 2	binary
100644 8950d9fdcf2dc4071be500e078831dbcfca693e1 3	binary
100644 a77fa514de2720c72c1a861de098595959a2c97a 1	text
100644 fb25c069fdd4d47c6cf8d3a457b8f620064cba41 2	text
100644 8950d9fdcf2dc4071be500e078831dbcfca693e1 3	text

ok 3 - check merge result in index

expecting success: 

	git cat-file -p HEAD:binary >binary-orig &&
	grep "<<<<<<<" text &&
	cmp binary-orig binary &&
	! grep "<<<<<<<" union &&
	grep Master union &&
	grep Side union


<<<<<<< HEAD
Master
Side

ok 4 - check merge result in working tree

expecting success: 
	echo text conflict-marker-size=32 >>.gitattributes &&
	git checkout -m text &&
	sed -ne "/^\([<=>]\)\1\1\1*/{
		s/ .*$//
		p
	}" >actual text &&
	grep ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" actual &&
	grep "================================" actual &&
	grep "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<" actual
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
================================
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

ok 5 - retry the merge with longer context

expecting success: 

	echo "* merge=union" >.gitattributes &&
	echo "text merge=custom" >>.gitattributes &&

	git reset --hard anchor &&
	git config --replace-all \
	merge.custom.driver "./custom-merge %O %A %B 0" &&
	git config --replace-all \
	merge.custom.name "custom merge driver for testing" &&

	git merge master &&

	cmp binary union &&
	sed -e 1,3d text >check-1 &&
	o=$(git unpack-file master^:text) &&
	a=$(git unpack-file side^:text) &&
	b=$(git unpack-file master:text) &&
	sh -c "./custom-merge $o $a $b 0" &&
	sed -e 1,3d $a >check-2 &&
	cmp check-1 check-2 &&
	rm -f $o $a $b
HEAD is now at 03d8861 Side
Merging:
03d8861 Side
virtual master
found 1 common ancestor(s):
5f96ff8 Initial
Auto-merging binary
Auto-merging text
Auto-merging union
Merge made by recursive.
 binary |    1 +
 text   |    9 +++++++++
 union  |    1 +
 3 files changed, 11 insertions(+), 0 deletions(-)

ok 6 - custom merge backend

expecting success: 

	git reset --hard anchor &&
	git config --replace-all \
	merge.custom.driver "./custom-merge %O %A %B 1" &&
	git config --replace-all \
	merge.custom.name "custom merge driver for testing" &&

	if git merge master
	then
		echo "Eh? should have conflicted"
		false
	else
		echo "Ok, conflicted"
	fi &&

	cmp binary union &&
	sed -e 1,3d text >check-1 &&
	o=$(git unpack-file master^:text) &&
	a=$(git unpack-file anchor:text) &&
	b=$(git unpack-file master:text) &&
	sh -c "./custom-merge $o $a $b 0" &&
	sed -e 1,3d $a >check-2 &&
	cmp check-1 check-2 &&
	rm -f $o $a $b

HEAD is now at 03d8861 Side
Merging:
03d8861 Side
virtual master
found 1 common ancestor(s):
5f96ff8 Initial
Auto-merging binary
Auto-merging text
CONFLICT (content): Merge conflict in text
Auto-merging union
Automatic merge failed; fix conflicts and then commit the result.
Ok, conflicted

ok 7 - custom merge backend

expecting success: 
	test_create_repo repo1 &&
	test_create_repo repo2 &&
	test_tick &&
	(
		cd repo1 &&
		>a &&
		git add a &&
		git commit -m initial
	) &&
	test_tick &&
	(
		cd repo2 &&
		git commit --allow-empty -m initial
	) &&
	test_tick &&
	(
		cd repo1 &&
		git pull ../repo2 master
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6026-merge-attr/repo1/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6026-merge-attr/repo2/.git/
[master (root-commit) 94ef07c] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a
[master (root-commit) de45b2c] initial
 Author: A U Thor <author@example.com>
Merging:
94ef07c initial
virtual de45b2cb2b3688a6b4f2efd536594a5028ea60ae
found 0 common ancestor(s):
Already up-to-date!
Merge made by recursive.

ok 8 - up-to-date merge without common ancestor

# passed all 8 test(s)
1..8
