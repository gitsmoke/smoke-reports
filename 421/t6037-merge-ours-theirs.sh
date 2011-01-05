Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6037-merge-ours-theirs/.git/
expecting success: 
	for i in 1 2 3 4 5 6 7 8 9
	do
		echo "$i"
	done >file &&
	git add file &&
	cp file elif &&
	git commit -m initial &&

	sed -e "s/1/one/" -e "s/9/nine/" >file <elif &&
	git commit -a -m ours &&

	git checkout -b side HEAD^ &&

	sed -e "s/9/nueve/" >file <elif &&
	git commit -a -m theirs &&

	git checkout master^0
[master (root-commit) a181cef] initial
 Author: A U Thor <author@example.com>
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 00d640d] ours
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 2 deletions(-)
[side 769a3b3] theirs
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
	git reset --hard master &&
	test_must_fail git merge -s recursive side &&
	grep nine file &&
	grep nueve file &&
	! grep 9 file &&
	grep one file &&
	! grep 1 file

HEAD is now at 00d640d ours
Merging:
00d640d ours
virtual side
found 1 common ancestor(s):
a181cef initial
Auto-merging file
CONFLICT (content): Merge conflict in file
Automatic merge failed; fix conflicts and then commit the result.
nine
nueve
one

ok 2 - plain recursive - should conflict

expecting success: 
	git reset --hard master &&
	git merge -s recursive -Xtheirs side &&
	! grep nine file &&
	grep nueve file &&
	! grep 9 file &&
	grep one file &&
	! grep 1 file

HEAD is now at 00d640d ours
Merging:
00d640d ours
virtual side
found 1 common ancestor(s):
a181cef initial
Auto-merging file
Merge made by recursive.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
nueve
one

ok 3 - recursive favouring theirs

expecting success: 
	git reset --hard master &&
	git merge -s recursive -X ours side &&
	grep nine file &&
	! grep nueve file &&
	! grep 9 file &&
	grep one file &&
	! grep 1 file

HEAD is now at 00d640d ours
Merging:
00d640d ours
virtual side
found 1 common ancestor(s):
a181cef initial
Skipped file (merged same as existing)
Merge made by recursive.
nine
one

ok 4 - recursive favouring ours

expecting success: 
	git reset --hard master && git pull -s recursive -Xours . side &&
	git reset --hard master && git pull -s recursive -X ours . side &&
	git reset --hard master && git pull -s recursive -Xtheirs . side &&
	git reset --hard master && git pull -s recursive -X theirs . side &&
	git reset --hard master && test_must_fail git pull -s recursive -X bork . side

HEAD is now at 00d640d ours
Merging:
00d640d ours
virtual 769a3b3ce47414beadb8106b5b419d8cb9ef3851
found 1 common ancestor(s):
a181cef initial
Skipped file (merged same as existing)
Merge made by recursive.
HEAD is now at 00d640d ours
Merging:
00d640d ours
virtual 769a3b3ce47414beadb8106b5b419d8cb9ef3851
found 1 common ancestor(s):
a181cef initial
Skipped file (merged same as existing)
Merge made by recursive.
HEAD is now at 00d640d ours
Merging:
00d640d ours
virtual 769a3b3ce47414beadb8106b5b419d8cb9ef3851
found 1 common ancestor(s):
a181cef initial
Auto-merging file
Merge made by recursive.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at 00d640d ours
Merging:
00d640d ours
virtual 769a3b3ce47414beadb8106b5b419d8cb9ef3851
found 1 common ancestor(s):
a181cef initial
Auto-merging file
Merge made by recursive.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at 00d640d ours

ok 5 - pull with -X

# passed all 5 test(s)
1..5
