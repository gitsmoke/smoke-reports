ok 1 - setup
ok 2 - fetch without wildcard
ok 3 - fetch with wildcard
ok 4 - fetch with insteadOf
ok 5 - fetch with pushInsteadOf (should not rewrite)
ok 6 - push without wildcard
ok 7 - push with wildcard
ok 8 - push with insteadOf
ok 9 - push with pushInsteadOf
ok 10 - push with pushInsteadOf and explicit pushurl (pushInsteadOf should not rewrite)
ok 11 - push with matching heads
ok 12 - push with matching heads on the command line
ok 13 - failed (non-fast-forward) push with matching heads
ok 14 - push --force with matching heads
ok 15 - push with matching heads and forced update
ok 16 - push with no ambiguity (1)
ok 17 - push with no ambiguity (2)
ok 18 - push with colon-less refspec, no ambiguity
ok 19 - push with weak ambiguity (1)
ok 20 - push with weak ambiguity (2)
ok 21 - push with ambiguity
ok 22 - push with colon-less refspec (1)
ok 23 - push with colon-less refspec (2)
ok 24 - push with colon-less refspec (3)
ok 25 - push with colon-less refspec (4)
ok 26 - push head with non-existant, incomplete dest
ok 27 - push tag with non-existant, incomplete dest
ok 28 - push sha1 with non-existant, incomplete dest
ok 29 - push ref expression with non-existant, incomplete dest
ok 30 - push with HEAD
ok 31 - push with HEAD nonexisting at remote
ok 32 - push with +HEAD
ok 33 - push HEAD with non-existant, incomplete dest
ok 34 - push with config remote.*.push = HEAD
ok 35 - push with config remote.*.pushurl
ok 36 - push with dry-run
ok 37 - push updates local refs
ok 38 - push updates up-to-date local refs
ok 39 - push preserves up-to-date packed refs
ok 40 - push does not update local refs on failure
ok 41 - allow deleting an invalid remote ref
ok 42 - allow deleting a ref using --delete
ok 43 - allow deleting a tag using --delete
ok 44 - push --delete without args aborts
ok 45 - push --delete refuses src:dest refspecs
ok 46 - warn on push to HEAD of non-bare repository
ok 47 - deny push to HEAD of non-bare repository
ok 48 - allow push to HEAD of bare repository (bare)
ok 49 - allow push to HEAD of non-bare repository (config)
ok 50 - fetch with branches
ok 51 - fetch with branches containing #
ok 52 - push with branches
ok 53 - push with branches containing #
ok 54 - push into aliased refs (consistent)
ok 55 - push into aliased refs (inconsistent)
ok 56 - push --porcelain
ok 57 - push --porcelain bad url
ok 58 - push --porcelain rejected
ok 59 - push --porcelain --dry-run rejected
# passed all 59 test(s)
1..59
