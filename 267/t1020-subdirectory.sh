ok 1 - setup
ok 2 - update-index and ls-files
ok 3 - cat-file
ok 4 - diff-files
ok 5 - write-tree
ok 6 - checkout-index
ok 7 - read-tree
not ok - 8 alias expansion
#	
#		(
#			git config alias.ss status &&
#			cd dir &&
#			git status &&
#			git ss
#		)
#	
ok 9 - no file/rev ambiguity check inside .git
ok 10 - no file/rev ambiguity check inside a bare repo
ok 11 - detection should not be fooled by a symlink
# failed 1 among 11 test(s)
1..11
