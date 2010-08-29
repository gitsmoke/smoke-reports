ok 1 - setup
not ok - 2 Commit Decorations Colored Correctly
#	
#		git log --first-parent --abbrev=10 --all --decorate --oneline --color=always |
#		sed "s/[0-9a-f]\{10,10\}/COMMIT_ID/" >out &&
#		test_cmp expected out
#	
# failed 1 among 2 test(s)
1..2
