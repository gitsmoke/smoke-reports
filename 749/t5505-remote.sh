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
ok 21 - add --mirror=push
ok 22 - push mirrors act as mirrors during push
ok 23 - push mirrors do not act as mirrors during fetch
ok 24 - add alt && prune
ok 25 - add with reachable tags (default)
ok 26 - add --tags
ok 27 - add --no-tags
ok 28 - reject --no-no-tags
ok 29 - update
ok 30 - update with arguments
ok 31 - update --prune
ok 32 - update default
ok 33 - update default (overridden, with funny whitespace)
ok 34 - update (with remotes.default defined)
ok 35 - "remote show" does not show symbolic refs
ok 36 - reject adding remote with an invalid name
ok 37 - rename a remote
ok 38 - migrate a remote from named file in $GIT_DIR/remotes
ok 39 - migrate a remote from named file in $GIT_DIR/branches
ok 40 - remote prune to cause a dangling symref
ok 41 - show empty remote
ok 42 - remote set-branches requires a remote
ok 43 - remote set-branches
ok 44 - remote set-branches with --mirror
ok 45 - new remote
ok 46 - remote set-url bar
ok 47 - remote set-url baz bar
ok 48 - remote set-url zot bar
ok 49 - remote set-url --push zot baz
ok 50 - remote set-url --push zot
ok 51 - remote set-url --push qux zot
ok 52 - remote set-url --push foo qu+x
ok 53 - remote set-url --push --add aaa
ok 54 - remote set-url --push bar aaa
ok 55 - remote set-url --push --delete bar
ok 56 - remote set-url --push --delete foo
ok 57 - remote set-url --add bbb
ok 58 - remote set-url --delete .*
ok 59 - remote set-url --delete bbb
ok 60 - remote set-url --delete baz
ok 61 - remote set-url --add ccc
ok 62 - remote set-url --delete baz
# passed all 62 test(s)
1..62
