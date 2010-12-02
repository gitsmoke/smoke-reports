ok 1 - setup
ok 2 - 1, 2, 3 - no carry forward
ok 3 - 4 - carry forward local addition.
ok 4 - 5 - carry forward local addition.
ok 5 - 6 - local addition already has the same.
ok 6 - 7 - local addition already has the same.
ok 7 - 8 - conflicting addition.
ok 8 - 9 - conflicting addition.
ok 9 - 10 - path removed.
ok 10 - 11 - dirty path removed.
ok 11 - 12 - unmatching local changes being removed.
ok 12 - 13 - unmatching local changes being removed.
ok 13 - 14 - unchanged in two heads.
ok 14 - 15 - unchanged in two heads.
ok 15 - 16 - conflicting local change.
ok 16 - 17 - conflicting local change.
ok 17 - 18 - local change already having a good result.
ok 18 - 19 - local change already having a good result, further modified.
ok 19 - 20 - no local change, use new tree.
ok 20 - 21 - no local change, dirty cache.
ok 21 - 22 - local change cache updated.
ok 22 - DF vs DF/DF case setup.
ok 23 - DF vs DF/DF case test.
ok 24 - a/b (untracked) vs a case setup.
ok 25 - a/b (untracked) vs a, plus c/d case test.
ok 26 - a/b vs a, plus c/d case setup.
ok 27 - a/b vs a, plus c/d case test.
not ok - 28 -m references the correct modified tree
#	
#		echo >file-a &&
#		echo >file-b &&
#		git add file-a file-b &&
#		git commit -a -m "test for correct modified tree"
#		git branch initial-mod &&
#		echo b >file-b &&
#		git commit -a -m "B" &&
#		echo a >file-a &&
#		git add file-a &&
#		git ls-tree $(git write-tree) file-a >expect &&
#		git read-tree -m HEAD initial-mod &&
#		git ls-tree $(git write-tree) file-a >actual &&
#		test_cmp expect actual
#	
# failed 1 among 28 test(s)
1..28
