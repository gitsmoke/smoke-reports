ok 1 - setup a submodule tree
ok 2 - submodule update detaching the HEAD 
ok 3 - submodule update does not fetch already present commits
ok 4 - submodule update should fail due to local changes
ok 5 - submodule update should throw away changes with --force 
ok 6 - submodule update --rebase staying on master
ok 7 - submodule update --merge staying on master
ok 8 - submodule update - rebase in .git/config
ok 9 - submodule update - checkout in .git/config but --rebase given
ok 10 - submodule update - merge in .git/config
ok 11 - submodule update - checkout in .git/config but --merge given
ok 12 - submodule update - checkout in .git/config
ok 13 - submodule init picks up rebase
ok 14 - submodule init picks up merge
ok 15 - submodule update --merge  - ignores --merge  for new submodules
ok 16 - submodule update --rebase - ignores --rebase for new submodules
ok 17 - submodule update ignores update=merge config for new submodules
ok 18 - submodule update ignores update=rebase config for new submodules
# passed all 18 test(s)
1..18
