ok 1 - .git/objects should be empty after git init in an empty repo.
ok 2 - .git/objects should have 3 subdirectories.
ok 3 - success is reported like this
not ok 4 - pretend we have a known breakage # TODO known breakage
ok 5 - pretend we have fixed a known breakage # TODO known breakage
ok 6 - test runs if prerequisite is satisfied
ok 7 # skip unmet prerequisite causes test to be skipped
ok 8 - tests clean up after themselves
ok 9 - tests clean up even after a failure
ok 10 - failure to clean up causes the test to fail
ok 11 - git update-index without --add should fail adding.
ok 12 - git update-index with --add should succeed.
ok 13 - writing tree out with git write-tree
ok 14 - validate object ID of a known tree.
ok 15 - git update-index without --remove should fail removing.
ok 16 - git update-index with --remove should be able to remove.
ok 17 - git write-tree should be able to write an empty tree.
ok 18 - validate object ID of a known tree.
ok 19 - adding various types of objects with git update-index --add.
ok 20 - showing stage with git ls-files --stage
ok 21 - validate git ls-files output for a known tree.
ok 22 - writing tree out with git write-tree.
ok 23 - validate object ID for a known tree.
ok 24 - showing tree with git ls-tree
ok 25 - git ls-tree output for a known tree.
ok 26 - showing tree with git ls-tree -r
ok 27 - git ls-tree -r output for a known tree.
ok 28 - showing tree with git ls-tree -r -t
ok 29 - git ls-tree -r output for a known tree.
ok 30 - writing partial tree out with git write-tree --prefix.
ok 31 - validate object ID for a known tree.
ok 32 - writing partial tree out with git write-tree --prefix.
ok 33 - validate object ID for a known tree.
ok 34 - put invalid objects into the index.
ok 35 - writing this tree without --missing-ok.
ok 36 - writing this tree with --missing-ok.
ok 37 - git read-tree followed by write-tree should be idempotent.
ok 38 - validate git diff-files output for a know cache/work tree state.
ok 39 - git update-index --refresh should succeed.
ok 40 - no diff after checkout and git update-index --refresh.
ok 41 - git commit-tree records the correct tree in a commit.
ok 42 - git commit-tree records the correct parent in a commit.
ok 43 - git commit-tree omits duplicated parent in a commit.
ok 44 - update-index D/F conflict
ok 45 - absolute path works as expected
ok 46 - very long name in the index handled sanely
# fixed 1 known breakage(s)
# still have 1 known breakage(s)
# passed all remaining 45 test(s)
1..46
