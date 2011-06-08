ok 1 - setup a submodule tree
ok 2 - test basic "submodule foreach" usage
ok 3 - setup nested submodules
ok 4 - use "submodule foreach" to checkout 2nd level submodule
ok 5 - use "foreach --recursive" to checkout all submodules
ok 6 - test messages from "foreach --recursive"
ok 7 - test "foreach --quiet --recursive"
ok 8 - use "update --recursive" to checkout all submodules
ok 9 - test "status --recursive"
ok 10 - ensure "status --cached --recursive" preserves the --cached flag
ok 11 - use "git clone --recursive" to checkout all submodules
ok 12 - test "update --recursive" with a flag with spaces
not ok - 13 use "update --recursive nested1" to checkout all submodules rooted in nested1
#	
#		git clone super clone6 &&
#		(
#			cd clone6 &&
#			test ! -d sub1/.git &&
#			test ! -d sub2/.git &&
#			test ! -d sub3/.git &&
#			test ! -d nested1/.git &&
#			git submodule update --init --recursive -- nested1 &&
#			test ! -d sub1/.git &&
#			test ! -d sub2/.git &&
#			test ! -d sub3/.git &&
#			test -d nested1/.git &&
#			test -d nested1/nested2/.git &&
#			test -d nested1/nested2/nested3/.git &&
#			test -d nested1/nested2/nested3/submodule/.git
#		)
#	
# failed 1 among 13 test(s)
1..13
