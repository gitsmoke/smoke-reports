ok 1 - setup
ok 2 - prune stale packs
ok 3 - prune --expire
not ok - 4 gc: implicit prune --expire
#	
#	
#		add_blob &&
#		test-chmtime =-$((2*$week-30)) $BLOB_FILE &&
#		git gc &&
#		test $((1 + $before)) = $(git count-objects | sed "s/ .*//") &&
#		test -f $BLOB_FILE &&
#		test-chmtime =-$((2*$week+1)) $BLOB_FILE &&
#		git gc &&
#		test $before = $(git count-objects | sed "s/ .*//") &&
#		! test -f $BLOB_FILE
#	
#	
ok 5 - gc: refuse to start with invalid gc.pruneExpire
ok 6 - gc: start with ok gc.pruneExpire
ok 7 - prune: prune nonsense parameters
ok 8 - prune: prune unreachable heads
ok 9 - prune: do not prune heads listed as an argument
ok 10 - gc --no-prune
not ok - 11 gc respects gc.pruneExpire
#	
#	
#		git config gc.pruneExpire 5002.days.ago &&
#		git gc &&
#		test -f $BLOB_FILE &&
#		git config gc.pruneExpire 5000.days.ago &&
#		git gc &&
#		test ! -f $BLOB_FILE
#	
#	
not ok - 12 gc --prune=<date>
#	
#	
#		add_blob &&
#		test-chmtime =-$((5001*$day)) $BLOB_FILE &&
#		git gc --prune=5002.days.ago &&
#		test -f $BLOB_FILE &&
#		git gc --prune=5000.days.ago &&
#		test ! -f $BLOB_FILE
#	
#	
not ok - 13 gc --prune=never
#	
#	
#		add_blob &&
#		git gc --prune=never &&
#		test -f $BLOB_FILE &&
#		git gc --prune=now &&
#		test ! -f $BLOB_FILE
#	
#	
not ok - 14 gc respects gc.pruneExpire=never
#	
#	
#		git config gc.pruneExpire never &&
#		add_blob &&
#		git gc &&
#		test -f $BLOB_FILE &&
#		git config gc.pruneExpire now &&
#		git gc &&
#		test ! -f $BLOB_FILE
#	
#	
not ok - 15 prune --expire=never
#	
#	
#		add_blob &&
#		git prune --expire=never &&
#		test -f $BLOB_FILE &&
#		git prune &&
#		test ! -f $BLOB_FILE
#	
#	
not ok - 16 gc: prune old objects after local clone
#	
#		add_blob &&
#		test-chmtime =-$((2*$week+1)) $BLOB_FILE &&
#		git clone --no-hardlinks . aclone &&
#		(
#			cd aclone &&
#			test 1 = $(git count-objects | sed "s/ .*//") &&
#			test -f $BLOB_FILE &&
#			git gc --prune &&
#			test 0 = $(git count-objects | sed "s/ .*//") &&
#			! test -f $BLOB_FILE
#		)
#	
# failed 7 among 16 test(s)
1..16
