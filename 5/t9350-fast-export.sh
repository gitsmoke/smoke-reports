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
ok 20 - set-up a few more tags for tag export tests
ok 21 - tree_tag
ok 22 - tree_tag-obj
ok 23 - tag-obj_tag
ok 24 - tag-obj_tag-obj
not ok - 25 directory becomes symlink
#	
#		git init dirtosymlink &&
#		git init result &&
#		(
#			cd dirtosymlink &&
#			mkdir foo &&
#			mkdir bar &&
#			echo hello > foo/world &&
#			echo hello > bar/world &&
#			git add foo/world bar/world &&
#			git commit -q -mone &&
#			git rm -r foo &&
#			ln -s bar foo &&
#			git add foo &&
#			git commit -q -mtwo
#		) &&
#		(
#			cd dirtosymlink &&
#			git fast-export master -- foo |
#			(cd ../result && git fast-import --quiet)
#		) &&
#		(cd result && git show master:foo)
#	
# still have 1 known breakage(s)
# failed 1 among remaining 24 test(s)
1..25
