ok 1 - setup
ok 2 - rev-parse --glob=refs/heads/subspace/*
ok 3 - rev-parse --glob=heads/subspace/*
ok 4 - rev-parse --glob=refs/heads/subspace/
ok 5 - rev-parse --glob=heads/subspace/
ok 6 - rev-parse --glob=heads/subspace
ok 7 - rev-parse --branches=subspace/*
ok 8 - rev-parse --branches=subspace/
ok 9 - rev-parse --branches=subspace
ok 10 - rev-parse --glob=heads/subspace/* --glob=heads/other/*
ok 11 - rev-parse --glob=heads/someref/* master
ok 12 - rev-parse --glob=heads/*
ok 13 - rev-parse --tags=foo
ok 14 - rev-parse --remotes=foo
ok 15 - rev-list --glob=refs/heads/subspace/*
ok 16 - rev-list --glob=heads/subspace/*
ok 17 - rev-list --glob=refs/heads/subspace/
ok 18 - rev-list --glob=heads/subspace/
ok 19 - rev-list --glob=heads/subspace
ok 20 - rev-list --branches=subspace/*
ok 21 - rev-list --branches=subspace/
ok 22 - rev-list --branches=subspace
ok 23 - rev-list --branches
ok 24 - rev-list --glob=heads/someref/* master
ok 25 - rev-list --glob=heads/subspace/* --glob=heads/other/*
ok 26 - rev-list --glob=heads/*
ok 27 - rev-list --tags=foo
ok 28 - rev-list --tags
ok 29 - rev-list --remotes=foo
# passed all 29 test(s)
1..29
