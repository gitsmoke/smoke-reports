ok 1 - setup a submodule tree
ok 2 - test basic "submodule foreach" usage
ok 3 - setup nested submodules
ok 4 - use "submodule foreach" to checkout 2nd level submodule
ok 5 - use "foreach --recursive" to checkout all submodules
ok 6 - test messages from "foreach --recursive"
ok 7 - test "foreach --quiet --recursive"
ok 8 - use "update --recursive" to checkout all submodules
ok 9 - test "status --recursive"
not ok - 10 ensure "status --cached --recursive" preserves the --cached flag
#	
#		(
#			cd clone3 &&
#			(
#				cd nested1 &&
#				test_commit file2
#			) &&
#			git submodule status --cached --recursive -- nested1 > ../actual
#		) &&
#		test_cmp expect actual
#	
ok 11 - use "git clone --recursive" to checkout all submodules
not ok - 12 test "update --recursive" with a flag with spaces
#	
#		git clone super "common objects" &&
#		git clone super clone5 &&
#		(
#			cd clone5 &&
#			test ! -d nested1/.git &&
#			git submodule update --init --recursive --reference="$(dirname "$PWD")/common objects" &&
#			test -d nested1/.git &&
#			test -d nested1/nested2/.git &&
#			test -d nested1/nested2/nested3/.git &&
#			test -f nested1/.git/objects/info/alternates &&
#			test -f nested1/nested2/.git/objects/info/alternates &&
#			test -f nested1/nested2/nested3/.git/objects/info/alternates
#		)
#	
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
# failed 3 among 13 test(s)
1..13
