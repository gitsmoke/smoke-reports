ok 1 - setup
not ok - 2 merge c2 with a custom strategy
#	
#		git reset --hard c1 &&
#		git merge -s theirs c2 &&
#		test "$(git rev-parse c1)" != "$(git rev-parse HEAD)" &&
#		test "$(git rev-parse c1)" = "$(git rev-parse HEAD^1)" &&
#		test "$(git rev-parse c2)" = "$(git rev-parse HEAD^2)" &&
#		test "$(git rev-parse c2^{tree})" = "$(git rev-parse HEAD^{tree})" &&
#		git diff --exit-code &&
#		git diff --exit-code c2 HEAD &&
#		git diff --exit-code c2 &&
#		test -f c0.c &&
#		grep c1c1 c1.c &&
#		test -f c2.c
#	
# failed 1 among 2 test(s)
1..2
