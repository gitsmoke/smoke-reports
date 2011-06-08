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
ok 13 - commit message from template with whitespace issue
ok 14 - using alternate GIT_INDEX_FILE (1)
ok 15 - using alternate GIT_INDEX_FILE (2)
ok 16 - --signoff
ok 17 - commit message from file (1)
ok 18 - commit message from file (2)
ok 19 - commit message from stdin
ok 20 - commit -F overrides -t
ok 21 - Commit without message is allowed with --allow-empty-message
ok 22 - Commit without message is no-no without --allow-empty-message
ok 23 - Commit a message with --allow-empty-message
ok 24 - commit --fixup provides correct one-line commit message
ok 25 - commit --squash works with -F
ok 26 - commit --squash works with -m
ok 27 - commit --squash works with -C
ok 28 - commit --squash works with -c
ok 29 - commit --squash works with -C for same commit
ok 30 - commit --squash works with -c for same commit
ok 31 - commit --squash works with editor
ok 32 - invalid message options when using --fixup
# passed all 32 test(s)
1..32
