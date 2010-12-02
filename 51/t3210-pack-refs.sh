ok 1 - prepare a trivial repository
ok 2 - see if git show-ref works as expected
ok 3 - see if a branch still exists when packed
ok 4 - git branch c/d should barf if branch c exists
ok 5 - see if a branch still exists after git pack-refs --prune
ok 6 - see if git pack-refs --prune remove ref files
not ok - 7 see if git pack-refs --prune removes empty dirs
#	
#	     git branch r/s/t &&
#	     git pack-refs --all --prune &&
#	     ! test -e .git/refs/heads/r
#	
ok 8 - git branch g should work when git branch g/h has been deleted
ok 9 - git branch i/j/k should barf if branch i exists
ok 10 - test git branch k after branch k/l/m and k/lm have been deleted
ok 11 - test git branch n after some branch deletion and pruning
ok 12 - see if up-to-date packed refs are preserved
ok 13 - pack, prune and repack
# failed 1 among 13 test(s)
1..13
