ok 1 - setup
ok 2 - -p --relative=subdir/
ok 3 - -p --relative=subdir
ok 4 - -p --relative=sub
ok 5 - --stat --relative=subdir/
not ok - 6 --stat --relative=subdir
#	
#		git diff --stat --relative=subdir HEAD^ >actual &&
#		test_cmp expected actual
#	
ok 7 - --stat --relative=sub
ok 8 - --raw --relative=subdir/
not ok - 9 --raw --relative=subdir
#	
#		git diff --no-abbrev --raw --relative=subdir HEAD^ >actual &&
#		test_cmp expected actual
#	
ok 10 - --raw --relative=sub
# failed 2 among 10 test(s)
1..10
