ok 1 - setup
ok 2 - ls-remote --tags .git
ok 3 - ls-remote .git
ok 4 - ls-remote --tags self
ok 5 - ls-remote self
ok 6 - dies when no remote specified and no default remotes found
ok 7 - use "origin" when no remote specified
ok 8 - suppress "From <url>" with -q
ok 9 - use branch.<name>.remote if possible
ok 10 - confuses pattern as remote when no remote specified
# passed all 10 test(s)
1..10
