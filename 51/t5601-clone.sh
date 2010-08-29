ok 1 - setup
ok 2 - clone with excess parameters (1)
ok 3 - clone with excess parameters (2)
ok 4 - output from clone
ok 5 - clone does not keep pack
ok 6 - clone checks out files
ok 7 - clone respects GIT_WORK_TREE
ok 8 - clone creates intermediate directories
ok 9 - clone creates intermediate directories for bare repo
ok 10 - clone --mirror
ok 11 - clone --bare names the local repository <name>.git
ok 12 - clone --mirror does not repeat tags
ok 13 - clone to destination with trailing /
ok 14 - clone to destination with extra trailing /
ok 15 - clone to an existing empty directory
ok 16 - clone to an existing non-empty directory
ok 17 - clone to an existing path
ok 18 - clone a void
ok 19 - clone respects global branch.autosetuprebase
not ok - 20 respect url-encoding of file://
#	
#		git init x+y &&
#		git clone "file://$PWD/x+y" xy-url-1 &&
#		git clone "file://$PWD/x%2By" xy-url-2
#	
not ok - 21 do not query-string-decode + in URLs
#	
#		rm -rf x+y &&
#		git init "x y" &&
#		test_must_fail git clone "file://$PWD/x+y" xy-no-plus
#	
ok 22 - do not respect url-encoding of non-url path
# failed 2 among 22 test(s)
1..22
