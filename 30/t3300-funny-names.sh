ok 1 - git ls-files no-funny
ok 2 - git ls-files with-funny
ok 3 - git ls-files -z with-funny
ok 4 - git ls-tree with funny
ok 5 - git diff-index with-funny
ok 6 - git diff-tree with-funny
ok 7 - git diff-index -z with-funny
ok 8 - git diff-tree -z with-funny
ok 9 - git diff-tree -C with-funny
ok 10 - git diff-tree delete with-funny
ok 11 - git diff-tree delete with-funny
not ok - 12 git diff-tree delete with-funny
#	git diff-index -M -p $t0 |
#		 sed -e "s/index [0-9]*%/index NUM%/" >current &&
#		 test_cmp expected current
ok 13 - git diff-tree rename with-funny applied
ok 14 - git diff-tree delete with-funny applied
ok 15 - git apply non-git diff
# failed 1 among 15 test(s)
1..15
