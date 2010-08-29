ok 1 - setup
ok 2 - file add A, !B
not ok - 3 file add !A, B
#	
#		cat >expected <<\EXPECTED &&
#	added in local
#	  our    100644 43d5a8ed6ef6c00ff775008633f95787d088285d ONE
#	EXPECTED
#	
#		git reset --hard initial &&
#		test_commit "add-not-a-b" "ONE" "AAA" &&
#		git merge-tree initial add-not-a-b initial >actual &&
#		test_cmp expected actual
#	
ok 4 - file add A, B (same)
ok 5 - file add A, B (different)
ok 6 - file change A, !B
ok 7 - file change !A, B
ok 8 - file change A, B (same)
ok 9 - file change A, B (different)
ok 10 - file change A, B (mixed)
ok 11 - file remove A, !B
not ok - 12 file remove !A, B
#	
#		cat >expected <<\EXPECTED &&
#	removed in remote
#	  base   100644 43d5a8ed6ef6c00ff775008633f95787d088285d ONE
#	  our    100644 43d5a8ed6ef6c00ff775008633f95787d088285d ONE
#	@@ -1 +0,0 @@
#	-AAA
#	EXPECTED
#	
#		git reset --hard initial &&
#		test_commit "rm-not-a-b-base" "ONE" "AAA" &&
#		git rm ONE &&
#		git commit -m "rm-not-a-b" &&
#		git tag "rm-not-a-b" &&
#		git merge-tree rm-a-not-b-base rm-a-not-b-base rm-a-not-b >actual &&
#		test_cmp expected actual
#	
not ok - 13 file change A, remove B
#	
#		cat >expected <<\EXPECTED &&
#	removed in remote
#	  base   100644 43d5a8ed6ef6c00ff775008633f95787d088285d ONE
#	  our    100644 ba629238ca89489f2b350e196ca445e09d8bb834 ONE
#	@@ -1 +0,0 @@
#	-BBB
#	EXPECTED
#	
#		git reset --hard initial &&
#		test_commit "change-a-rm-b-base" "ONE" "AAA" &&
#		test_commit "change-a-rm-b-A" "ONE" "BBB" &&
#		git reset --hard change-a-rm-b-base &&
#		git rm ONE &&
#		git commit -m "change-a-rm-b-B" &&
#		git tag "change-a-rm-b-B" &&
#		git merge-tree change-a-rm-b-base change-a-rm-b-A change-a-rm-b-B \
#			>actual &&
#		test_cmp expected actual
#	
ok 14 - file remove A, change B
# failed 3 among 14 test(s)
1..14
