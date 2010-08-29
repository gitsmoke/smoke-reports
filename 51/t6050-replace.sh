ok 1 - set up buggy branch
ok 2 - replace the author
ok 3 - test --no-replace-objects option
ok 4 - test GIT_NO_REPLACE_OBJECTS env variable
ok 5 - tag replaced commit
ok 6 - "git fsck" works
ok 7 - repack, clone and fetch work
ok 8 - "git replace" listing and deleting
ok 9 - "git replace" replacing
ok 10 - create parallel branch without the bug
ok 11 - push to cloned repo
ok 12 - push branch with replacement
ok 13 - fetch branch with replacement
ok 14 - bisect and replacements
not ok - 15 index-pack and replacements
#	
#		git --no-replace-objects rev-list --objects HEAD |
#		git --no-replace-objects pack-objects test- &&
#		git index-pack test-*.pack
#	
# failed 1 among 15 test(s)
1..15
