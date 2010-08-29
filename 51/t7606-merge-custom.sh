ok 1 - set up custom strategy
ok 2 - setup
ok 3 - merge c2 with a custom strategy
not ok - 4 trivial merge with custom strategy
#	
#		git reset --hard c1 &&
#	
#		git rev-parse c1 >head.old &&
#		git rev-parse c3 >second-parent.expected &&
#		git rev-parse c3^{tree} >tree.expected &&
#		git merge -s theirs c3 &&
#	
#		git rev-parse HEAD >head.new &&
#		git rev-parse HEAD^1 >first-parent &&
#		git rev-parse HEAD^2 >second-parent &&
#		git rev-parse HEAD^{tree} >tree &&
#		git update-index --refresh &&
#		git diff --exit-code &&
#		git diff --exit-code c3 HEAD &&
#		git diff --exit-code c3 &&
#	
#		! test_cmp head.old head.new &&
#		test_cmp head.old first-parent &&
#		test_cmp second-parent.expected second-parent &&
#		test_cmp tree.expected tree &&
#		test -f c0.c &&
#		! test -e c1.c &&
#		test -f c3.c
#	
# failed 1 among 4 test(s)
1..4
