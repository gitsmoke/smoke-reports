ok 1 - setup
ok 2 - rev-parse --glob=refs/heads/subspace/*
ok 3 - rev-parse --glob=heads/subspace/*
ok 4 - rev-parse --glob=refs/heads/subspace/
ok 5 - rev-parse --glob=heads/subspace/
ok 6 - rev-parse --glob=heads/subspace
not ok 7 - rev-parse accepts --glob as detached option # TODO known breakage
not ok 8 - rev-parse is not confused by option-like glob # TODO known breakage
ok 9 - rev-parse --branches=subspace/*
ok 10 - rev-parse --branches=subspace/
ok 11 - rev-parse --branches=subspace
ok 12 - rev-parse --glob=heads/subspace/* --glob=heads/other/*
ok 13 - rev-parse --glob=heads/someref/* master
ok 14 - rev-parse --glob=heads/*
ok 15 - rev-parse --tags=foo
ok 16 - rev-parse --remotes=foo
ok 17 - rev-list --glob=refs/heads/subspace/*
ok 18 - rev-list --glob refs/heads/subspace/*
ok 19 - rev-list not confused by option-like --glob arg
ok 20 - rev-list --glob=heads/subspace/*
ok 21 - rev-list --glob=refs/heads/subspace/
ok 22 - rev-list --glob=heads/subspace/
ok 23 - rev-list --glob=heads/subspace
ok 24 - rev-list --branches=subspace/*
ok 25 - rev-list --branches=subspace/
ok 26 - rev-list --branches=subspace
ok 27 - rev-list --branches
ok 28 - rev-list --glob=heads/someref/* master
ok 29 - rev-list --glob=heads/subspace/* --glob=heads/other/*
ok 30 - rev-list --glob=heads/*
ok 31 - rev-list --tags=foo
ok 32 - rev-list --tags
ok 33 - rev-list --remotes=foo
ok 34 - shortlog accepts --glob/--tags/--remotes
not ok 35 - shortlog accepts --glob as detached option # TODO known breakage
not ok 36 - shortlog --glob is not confused by option-like argument # TODO known breakage
# still have 4 known breakage(s)
# passed all remaining 32 test(s)
1..36
