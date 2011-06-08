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
ok 20 - path limiting with import-marks does not lose unmodified files
ok 21 - full-tree re-shows unmodified files
ok 22 - set-up a few more tags for tag export tests
ok 23 - tree_tag
ok 24 - tree_tag-obj
ok 25 - tag-obj_tag
ok 26 - tag-obj_tag-obj
ok 27 - directory becomes symlink
# still have 1 known breakage(s)
# passed all remaining 26 test(s)
1..27
