ok 1 - with no hook
ok 2 - with no hook (editor)
ok 3 - --no-verify with no hook
ok 4 - --no-verify with no hook (editor)
ok 5 - with succeeding hook
ok 6 - with succeeding hook (editor)
ok 7 - --no-verify with succeeding hook
ok 8 - --no-verify with succeeding hook (editor)
ok 9 - with failing hook
ok 10 - with failing hook (editor)
ok 11 - --no-verify with failing hook
ok 12 - --no-verify with failing hook (editor)
not ok - 13 with non-executable hook
#	
#	
#		echo "content" >> file &&
#		git add file &&
#		git commit -m "content"
#	
#	
not ok - 14 with non-executable hook (editor)
#	
#	
#		echo "content again" >> file &&
#		git add file &&
#		echo "content again" > FAKE_MSG &&
#		GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit -m "content again"
#	
#	
ok 15 - --no-verify with non-executable hook
ok 16 - --no-verify with non-executable hook (editor)
ok 17 - hook edits commit message
ok 18 - hook edits commit message (editor)
ok 19 - hook doesn't edit commit message
ok 20 - hook doesn't edit commit message (editor)
# failed 2 among 20 test(s)
1..20
