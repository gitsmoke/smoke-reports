ok 1 - setup a submodule tree
not ok - 2 test basic "submodule foreach" usage
#	
#		git clone super clone &&
#		(
#			cd clone &&
#			git submodule update --init -- sub1 sub3 &&
#			git submodule foreach "echo \$toplevel-\$name-\$path-\$sha1" > ../actual &&
#			git config foo.bar zar &&
#			git submodule foreach "git config --file \"\$toplevel/.git/config\" foo.bar"
#		) &&
#		test_cmp expect actual
#	
ok 3 - setup nested submodules
ok 4 - use "submodule foreach" to checkout 2nd level submodule
ok 5 - use "foreach --recursive" to checkout all submodules
not ok - 6 test messages from "foreach --recursive"
#	
#		(
#			cd clone2 &&
#			git submodule foreach --recursive "true" > ../actual
#		) &&
#		test_cmp expect actual
#	
not ok - 7 test "foreach --quiet --recursive"
#	
#		(
#			cd clone2 &&
#			git submodule foreach -q --recursive "echo \$name-\$path" > ../actual
#		) &&
#		test_cmp expect actual
#	
ok 8 - use "update --recursive" to checkout all submodules
not ok - 9 test "status --recursive"
#	
#		(
#			cd clone3 &&
#			git submodule status --recursive > ../actual
#		) &&
#		test_cmp expect actual
#	
ok 10 - use "git clone --recursive" to checkout all submodules
# failed 4 among 10 test(s)
1..10
