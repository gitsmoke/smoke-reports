ok 1 - .git/objects should be empty after git init in an empty repo.
ok 2 - .git/objects should have 3 subdirectories.
ok 3 - success is reported like this
not ok 4 - pretend we have a known breakage # TODO known breakage
ok 5 - pretend we have fixed a known breakage # TODO known breakage
ok 6 - test runs if prerequisite is satisfied
ok 7 # skip unmet prerequisite causes test to be skipped (prereqs: DONTHAVEIT)
ok 8 - test runs if prerequisites are satisfied
ok 9 # skip unmet prerequisites causes test to be skipped (prereqs: HAVEIT,DONTHAVEIT)
ok 10 - tests clean up after themselves
ok 11 - tests clean up even after a failure
ok 12 - failure to clean up causes the test to fail
ok 13 - git update-index without --add should fail adding.
ok 14 - git update-index with --add should succeed.
ok 15 - writing tree out with git write-tree
ok 16 - validate object ID of a known tree.
ok 17 - git update-index without --remove should fail removing.
ok 18 - git update-index with --remove should be able to remove.
ok 19 - git write-tree should be able to write an empty tree.
ok 20 - validate object ID of a known tree.
ok 21 - adding various types of objects with git update-index --add.
ok 22 - showing stage with git ls-files --stage
ok 23 - validate git ls-files output for a known tree.
ok 24 - writing tree out with git write-tree.
ok 25 - validate object ID for a known tree.
ok 26 - showing tree with git ls-tree
ok 27 - git ls-tree output for a known tree.
ok 28 - showing tree with git ls-tree -r
ok 29 - git ls-tree -r output for a known tree.
ok 30 - showing tree with git ls-tree -r -t
ok 31 - git ls-tree -r output for a known tree.
ok 32 - writing partial tree out with git write-tree --prefix.
ok 33 - validate object ID for a known tree.
ok 34 - writing partial tree out with git write-tree --prefix.
ok 35 - validate object ID for a known tree.
ok 36 - put invalid objects into the index.
ok 37 - writing this tree without --missing-ok.
ok 38 - writing this tree with --missing-ok.
ok 39 - git read-tree followed by write-tree should be idempotent.
ok 40 - validate git diff-files output for a know cache/work tree state.
ok 41 - git update-index --refresh should succeed.
ok 42 - no diff after checkout and git update-index --refresh.
ok 43 - git commit-tree records the correct tree in a commit.
ok 44 - git commit-tree records the correct parent in a commit.
ok 45 - git commit-tree omits duplicated parent in a commit.
ok 46 - update-index D/F conflict
ok 47 - absolute path works as expected
ok 48 - very long name in the index handled sanely
# fixed 1 known breakage(s)
# still have 1 known breakage(s)
# passed all remaining 47 test(s)
1..48
