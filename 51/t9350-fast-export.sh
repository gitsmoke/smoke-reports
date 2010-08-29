ok 1 - setup
ok 2 - fast-export | fast-import
ok 3 - fast-export master~2..master
ok 4 - iso-8859-1
ok 5 - import/export-marks
ok 6 - set up faked signed tag
ok 7 - signed-tags=abort
ok 8 - signed-tags=verbatim
ok 9 - signed-tags=strip
ok 10 - setup submodule
ok 11 - submodule fast-export | fast-import
ok 12 - setup copies
ok 13 - fast-export -C -C | fast-import
ok 14 - fast-export | fast-import when master is tagged
ok 15 - cope with tagger-less tags
ok 16 - setup for limiting exports by PATH
ok 17 - dropping tag of filtered out object
ok 18 - rewriting tag of filtered out object
not ok 19 - no exact-ref revisions included # TODO known breakage
not ok - 20 path limiting with import-marks does not lose unmodified files
#	
#		git checkout -b simple marks~2 &&
#		git fast-export --export-marks=marks simple -- file > /dev/null &&
#		echo more content >> file &&
#		test_tick &&
#		git commit -mnext file &&
#		git fast-export --import-marks=marks simple -- file file0 | grep file0
#	
not ok - 21 full-tree re-shows unmodified files
#	
#		git checkout -f simple &&
#		test $(git fast-export --full-tree simple | grep -c file0) -eq 3
#	
ok 22 - set-up a few more tags for tag export tests
ok 23 - tree_tag
ok 24 - tree_tag-obj
ok 25 - tag-obj_tag
ok 26 - tag-obj_tag-obj
ok 27 # skip directory becomes symlink (missing SYMLINKS of SYMLINKS)
# still have 1 known breakage(s)
# failed 2 among remaining 26 test(s)
1..27
