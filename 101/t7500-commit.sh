ok 1 - a basic commit in an empty tree should succeed
ok 2 - nonexistent template file should return error
ok 3 - nonexistent template file in config should return error
ok 4 - unedited template should not commit
ok 5 - unedited template with comments should not commit
ok 6 - a Signed-off-by line by itself should not commit
ok 7 - adding comments to a template should not commit
ok 8 - adding real content to a template should commit
ok 9 - -t option should be short for --template
ok 10 - config-specified template should commit
ok 11 - explicit commit message should override template
ok 12 - commit message from file should override template
ok 13 - using alternate GIT_INDEX_FILE (1)
ok 14 - using alternate GIT_INDEX_FILE (2)
ok 15 - --signoff
ok 16 - commit message from file (1)
ok 17 - commit message from file (2)
ok 18 - commit message from stdin
ok 19 - commit -F overrides -t
ok 20 - Commit without message is allowed with --allow-empty-message
ok 21 - Commit without message is no-no without --allow-empty-message
ok 22 - Commit a message with --allow-empty-message
# passed all 22 test(s)
1..22
