ok 1 - two-way setup
ok 2 - two-way not clobbering
ok 3 - two-way with incorrect --exclude-per-directory (1)
ok 4 - two-way with incorrect --exclude-per-directory (2)
ok 5 - two-way clobbering a ignored file
ok 6 - three-way not complaining on an untracked path in both
ok 7 - three-way not clobbering a working tree file
ok 8 - three-way not complaining on an untracked file
ok 9 - 3-way not overwriting local changes (setup)
ok 10 - 3-way not overwriting local changes (our side)
ok 11 - 3-way not overwriting local changes (their side)
ok 12 # skip funny symlink in work tree (missing SYMLINKS of SYMLINKS)
ok 13 # skip funny symlink in work tree, un-unlink-able (missing SANITY,SYMLINKS of SYMLINKS,SANITY)
ok 14 - D/F setup
not ok - 15 D/F
#	
#	
#		git checkout side-b &&
#		git read-tree -m -u branch-point side-b side-a &&
#		git ls-files -u >actual &&
#		(
#			a=$(git rev-parse branch-point:subdir/file2)
#			b=$(git rev-parse side-a:subdir/file2/another)
#			echo "100644 $a 1	subdir/file2"
#			echo "100644 $a 2	subdir/file2"
#			echo "100644 $b 3	subdir/file2/another"
#		) >expect &&
#		test_cmp actual expect
#	
#	
not ok - 16 D/F resolve
#	
#	
#		git reset --hard &&
#		git checkout side-b &&
#		git merge-resolve branch-point -- side-b side-a
#	
#	
not ok - 17 D/F recursive
#	
#	
#		git reset --hard &&
#		git checkout side-b &&
#		git merge-recursive branch-point -- side-b side-a
#	
#	
# failed 3 among 17 test(s)
1..17
