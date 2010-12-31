Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5304-prune/.git/
expecting success: 

	: > file &&
	git add file &&
	test_tick &&
	git commit -m initial &&
	git gc


[master (root-commit) 1bd44cb] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - setup

expecting success: 

	orig_pack=$(echo .git/objects/pack/*.pack) &&
	: > .git/objects/tmp_1.pack &&
	: > .git/objects/tmp_2.pack &&
	test-chmtime =-86501 .git/objects/tmp_1.pack &&
	git prune --expire 1.day &&
	test -f $orig_pack &&
	test -f .git/objects/tmp_2.pack &&
	! test -f .git/objects/tmp_1.pack


Removing stale temporary file .git/objects/tmp_1.pack

ok 2 - prune stale packs

expecting success: 

	add_blob &&
	git prune --expire=1.hour.ago &&
	test $((1 + $before)) = $(git count-objects | sed "s/ .*//") &&
	test -f $BLOB_FILE &&
	test-chmtime =-86500 $BLOB_FILE &&
	git prune --expire 1.day &&
	test $before = $(git count-objects | sed "s/ .*//") &&
	! test -f $BLOB_FILE



ok 3 - prune --expire

expecting success: 

	add_blob &&
	test-chmtime =-$((2*$week-30)) $BLOB_FILE &&
	git gc &&
	test $((1 + $before)) = $(git count-objects | sed "s/ .*//") &&
	test -f $BLOB_FILE &&
	test-chmtime =-$((2*$week+1)) $BLOB_FILE &&
	git gc &&
	test $before = $(git count-objects | sed "s/ .*//") &&
	! test -f $BLOB_FILE

ok 4 - gc: implicit prune --expire

expecting success: 

	git config gc.pruneExpire invalid &&
	test_must_fail git gc



ok 5 - gc: refuse to start with invalid gc.pruneExpire

expecting success: 

	git config gc.pruneExpire 2.days.ago &&
	git gc

ok 6 - gc: start with ok gc.pruneExpire

expecting success: 

	test_must_fail git prune garbage &&
	test_must_fail git prune --- &&
	test_must_fail git prune --no-such-option



ok 7 - prune: prune nonsense parameters

expecting success: 

	git config core.logAllRefUpdates false &&
	mv .git/logs .git/logs.old &&
	: > file2 &&
	git add file2 &&
	git commit -m temporary &&
	tmp_head=$(git rev-list -1 HEAD) &&
	git reset HEAD^ &&
	git prune &&
	test_must_fail git reset $tmp_head --


[master bfcb208] temporary
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file2
Removing stale temporary file .git/objects/tmp_2.pack

ok 8 - prune: prune unreachable heads

expecting success: 

	: > file2 &&
	git add file2 &&
	git commit -m temporary &&
	tmp_head=$(git rev-list -1 HEAD) &&
	git reset HEAD^ &&
	git prune -- $tmp_head &&
	git reset $tmp_head --


[master bfcb208] temporary
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file2

ok 9 - prune: do not prune heads listed as an argument

expecting success: 

	add_blob &&
	test-chmtime =-$((5001*$day)) $BLOB_FILE &&
	git config gc.pruneExpire 2.days.ago &&
	git gc --no-prune &&
	test 1 = $(git count-objects | sed "s/ .*//") &&
	test -f $BLOB_FILE
ok 10 - gc --no-prune

expecting success: 

	git config gc.pruneExpire 5002.days.ago &&
	git gc &&
	test -f $BLOB_FILE &&
	git config gc.pruneExpire 5000.days.ago &&
	git gc &&
	test ! -f $BLOB_FILE

ok 11 - gc respects gc.pruneExpire

expecting success: 

	add_blob &&
	test-chmtime =-$((5001*$day)) $BLOB_FILE &&
	git gc --prune=5002.days.ago &&
	test -f $BLOB_FILE &&
	git gc --prune=5000.days.ago &&
	test ! -f $BLOB_FILE

ok 12 - gc --prune=<date>

expecting success: 

	add_blob &&
	git gc --prune=never &&
	test -f $BLOB_FILE &&
	git gc --prune=now &&
	test ! -f $BLOB_FILE

ok 13 - gc --prune=never

expecting success: 

	git config gc.pruneExpire never &&
	add_blob &&
	git gc &&
	test -f $BLOB_FILE &&
	git config gc.pruneExpire now &&
	git gc &&
	test ! -f $BLOB_FILE

ok 14 - gc respects gc.pruneExpire=never

expecting success: 

	add_blob &&
	git prune --expire=never &&
	test -f $BLOB_FILE &&
	git prune &&
	test ! -f $BLOB_FILE

ok 15 - prune --expire=never

expecting success: 
	add_blob &&
	test-chmtime =-$((2*$week+1)) $BLOB_FILE &&
	git clone --no-hardlinks . aclone &&
	(
		cd aclone &&
		test 1 = $(git count-objects | sed "s/ .*//") &&
		test -f $BLOB_FILE &&
		git gc --prune &&
		test 0 = $(git count-objects | sed "s/ .*//") &&
		! test -f $BLOB_FILE
	)

Cloning into aclone...
done.

ok 16 - gc: prune old objects after local clone

# passed all 16 test(s)
1..16
