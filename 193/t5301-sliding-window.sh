ok 1 - setup
ok 2 - verify-pack -v, defaults
ok 3 - verify-pack -v, packedGitWindowSize == 1 page
ok 4 - verify-pack -v, packedGit{WindowSize,Limit} == 1 page
ok 5 - repack -a -d, packedGit{WindowSize,Limit} == 1 page
ok 6 - verify-pack -v, defaults
# passed all 6 test(s)
1..6
