ok 1 - .git/objects should be empty after git init in an empty repo.
ok 2 - .git/objects should have 3 subdirectories.
ok 3 - success is reported like this
not ok 4 - pretend we have a known breakage # TODO known breakage
ok 5 - pretend we have fixed a known breakage (run in sub test-lib)
ok 6 - test runs if prerequisite is satisfied
ok 7 # skip unmet prerequisite causes test to be skipped (missing DONTHAVEIT of DONTHAVEIT)
ok 8 - test runs if prerequisites are satisfied
ok 9 # skip unmet prerequisites causes test to be skipped (missing DONTHAVEIT of HAVEIT,DONTHAVEIT)
ok 10 # skip unmet prerequisites causes test to be skipped (missing DONTHAVEIT of DONTHAVEIT,HAVEIT)
ok 11 - tests clean up after themselves
ok 12 - tests clean up even after a failure
ok 13 - failure to clean up causes the test to fail
ok 14 - git update-index without --add should fail adding.
ok 15 - git update-index with --add should succeed.
ok 16 - writing tree out with git write-tree
ok 17 - validate object ID of a known tree.
ok 18 - git update-index without --remove should fail removing.
ok 19 - git update-index with --remove should be able to remove.
ok 20 - git write-tree should be able to write an empty tree.
ok 21 - validate object ID of a known tree.
ok 22 - adding various types of objects with git update-index --add.
ok 23 - showing stage with git ls-files --stage
ok 24 - validate git ls-files output for a known tree.
ok 25 - writing tree out with git write-tree.
ok 26 - validate object ID for a known tree.
ok 27 - showing tree with git ls-tree
ok 28 - git ls-tree output for a known tree.
ok 29 - showing tree with git ls-tree -r
ok 30 - git ls-tree -r output for a known tree.
ok 31 - showing tree with git ls-tree -r -t
ok 32 - git ls-tree -r output for a known tree.
ok 33 - writing partial tree out with git write-tree --prefix.
ok 34 - validate object ID for a known tree.
ok 35 - writing partial tree out with git write-tree --prefix.
ok 36 - validate object ID for a known tree.
ok 37 - put invalid objects into the index.
ok 38 - writing this tree without --missing-ok.
ok 39 - writing this tree with --missing-ok.
ok 40 - git read-tree followed by write-tree should be idempotent.
ok 41 - validate git diff-files output for a know cache/work tree state.
ok 42 - git update-index --refresh should succeed.
ok 43 - no diff after checkout and git update-index --refresh.
ok 44 - git commit-tree records the correct tree in a commit.
ok 45 - git commit-tree records the correct parent in a commit.
ok 46 - git commit-tree omits duplicated parent in a commit.
ok 47 - update-index D/F conflict
ok 48 - absolute path works as expected
ok 49 - very long name in the index handled sanely
# still have 1 known breakage(s)
# passed all remaining 48 test(s)
1..49
