ok 1 - setup
ok 2 - apply --build-fake-ancestor
not ok - 3 apply --build-fake-ancestor in a subdirectory
#	
#		git checkout 3 &&
#		echo "C" > sub/3.t &&
#		git diff > 3.patch &&
#		git reset --hard &&
#		git checkout 4 &&
#		(
#			cd sub &&
#			git apply --build-fake-ancestor 3.ancestor ../3.patch &&
#			test -f 3.ancestor
#		) &&
#		git apply --build-fake-ancestor 3.ancestor 3.patch &&
#		test_cmp sub/3.ancestor 3.ancestor
#	
# failed 1 among 3 test(s)
1..3
