ok 1 - with no hook
ok 2 - --no-verify with no hook
ok 3 - with succeeding hook
ok 4 - --no-verify with succeeding hook
ok 5 - with failing hook
ok 6 - --no-verify with failing hook
not ok - 7 with non-executable hook
#	
#	
#		echo "content" >> file &&
#		git add file &&
#		git commit -m "content"
#	
#	
ok 8 - --no-verify with non-executable hook
# failed 1 among 8 test(s)
1..8
