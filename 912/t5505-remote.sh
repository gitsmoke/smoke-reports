ok 1 - setup
ok 2 - remote information for the origin
ok 3 - add another remote
ok 4 - remote forces tracking branches
ok 5 - remove remote
ok 6 - remove remote
ok 7 - remove remote protects local branches
ok 8 - show
ok 9 - show -n
ok 10 - prune
ok 11 - set-head --delete
ok 12 - set-head --auto
ok 13 - set-head --auto fails w/multiple HEADs
ok 14 - set-head explicit
ok 15 - prune --dry-run
ok 16 - add --mirror && prune
ok 17 - add --mirror=fetch
ok 18 - fetch mirrors act as mirrors during fetch
ok 19 - fetch mirrors can prune
ok 20 - fetch mirrors do not act as mirrors during push
ok 21 - add fetch mirror with specific branches
ok 22 - fetch mirror respects specific branches
ok 23 - add --mirror=push
ok 24 - push mirrors act as mirrors during push
ok 25 - push mirrors do not act as mirrors during fetch
ok 26 - push mirrors do not allow you to specify refs
ok 27 - add alt && prune
ok 28 - add with reachable tags (default)
ok 29 - add --tags
ok 30 - add --no-tags
ok 31 - reject --no-no-tags
ok 32 - update
ok 33 - update with arguments
ok 34 - update --prune
ok 35 - update default
ok 36 - update default (overridden, with funny whitespace)
ok 37 - update (with remotes.default defined)
ok 38 - "remote show" does not show symbolic refs
ok 39 - reject adding remote with an invalid name
ok 40 - rename a remote
ok 41 - migrate a remote from named file in $GIT_DIR/remotes
ok 42 - migrate a remote from named file in $GIT_DIR/branches
ok 43 - remote prune to cause a dangling symref
ok 44 - show empty remote
ok 45 - remote set-branches requires a remote
ok 46 - remote set-branches
ok 47 - remote set-branches with --mirror
ok 48 - new remote
ok 49 - remote set-url bar
ok 50 - remote set-url baz bar
ok 51 - remote set-url zot bar
ok 52 - remote set-url --push zot baz
ok 53 - remote set-url --push zot
ok 54 - remote set-url --push qux zot
ok 55 - remote set-url --push foo qu+x
ok 56 - remote set-url --push --add aaa
ok 57 - remote set-url --push bar aaa
ok 58 - remote set-url --push --delete bar
ok 59 - remote set-url --push --delete foo
ok 60 - remote set-url --add bbb
ok 61 - remote set-url --delete .*
ok 62 - remote set-url --delete bbb
ok 63 - remote set-url --delete baz
ok 64 - remote set-url --add ccc
ok 65 - remote set-url --delete baz
# passed all 65 test(s)
1..65
