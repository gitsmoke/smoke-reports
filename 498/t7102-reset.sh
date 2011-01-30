ok 1 - creating initial files and commits
ok 2 - giving a non existing revision should fail
ok 3 - reset --soft with unmerged index should fail
ok 4 - giving paths with options different than --mixed should fail
ok 5 - giving unrecognized options should fail
ok 6 - trying to do reset --soft with pending merge should fail
ok 7 - trying to do reset --soft with pending checkout merge should fail
ok 8 - resetting to HEAD with no changes should succeed and do nothing
ok 9 - --soft reset only should show changes in diff --cached
ok 10 - changing files and redo the last commit should succeed
ok 11 - --hard reset should change the files and undo commits permanently
ok 12 - redoing changes adding them without commit them should succeed
ok 13 - --mixed reset to HEAD should unadd the files
ok 14 - redoing the last two commits should succeed
ok 15 - --hard reset to HEAD should clear a failed merge
ok 16 - --hard reset to ORIG_HEAD should clear a fast-forward merge
ok 17 - test --mixed <paths>
ok 18 - test resetting the index at give paths
ok 19 - resetting an unmodified path is a no-op
ok 20 - --mixed refreshes the index
ok 21 - disambiguation (1)
ok 22 - disambiguation (2)
ok 23 - disambiguation (3)
ok 24 - disambiguation (4)
# passed all 24 test(s)
1..24
