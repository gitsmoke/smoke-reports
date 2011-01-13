ok 1 - Initialize test directory
ok 2 - add files with funny names
ok 3 - Pre-check that foo exists and is in index before git rm foo
ok 4 - Test that git rm foo succeeds
ok 5 - Test that git rm --cached foo succeeds if the index matches the file
ok 6 - Test that git rm --cached foo succeeds if the index matches the file
ok 7 - Test that git rm --cached foo fails if the index matches neither the file nor HEAD
ok 8 - Test that git rm --cached -f foo works in case where --cached only did not
ok 9 - Post-check that foo exists but is not in index after git rm foo
ok 10 - Pre-check that bar exists and is in index before "git rm bar"
ok 11 - Test that "git rm bar" succeeds
ok 12 - Post-check that bar does not exist and is not in index after "git rm -f bar"
ok 13 - Test that "git rm -- -q" succeeds (remove a file that looks like an option)
ok 14 - Test that "git rm -f" succeeds with embedded space, tab, or newline characters.
ok 15 # skip Test that "git rm -f" fails if its rm fails (missing SANITY)
ok 16 - When the rm in "git rm -f" fails, it should not remove the file from the index
ok 17 - Remove nonexistent file with --ignore-unmatch
ok 18 - "rm" command printed
ok 19 - "rm" command suppressed with --quiet
ok 20 - Re-add foo and baz
ok 21 - Modify foo -- rm should refuse
ok 22 - Modified foo -- rm -f should work
ok 23 - Re-add foo and baz for HEAD tests
ok 24 - foo is different in index from HEAD -- rm should refuse
ok 25 - but with -f it should work.
ok 26 - refuse to remove cached empty file with modifications
ok 27 - remove intent-to-add file without --force
ok 28 - Recursive test setup
ok 29 - Recursive without -r fails
ok 30 - Recursive with -r but dirty
ok 31 - Recursive with -r -f
ok 32 - Remove nonexistent file returns nonzero exit status
ok 33 - Call "rm" from outside the work tree
ok 34 - refresh index before checking if it is up-to-date
ok 35 - choking "git rm" should not let it die with cruft
ok 36 - rm removes subdirectories recursively
# passed all 36 test(s)
1..36
