ok 1 - setup
ok 2 - message for merging local branch
ok 3 - message for merging external branch
ok 4 - [merge] summary/log configuration
ok 5 - setup: clear [merge] configuration
ok 6 - setup FETCH_HEAD
not ok - 7 merge.log=3 limits shortlog length
#	
#		cat >expected <<-EOF &&
#		Merge branch ${apos}left${apos}
#	
#		* left: (5 commits)
#		  Left #5
#		  Left #4
#		  Left #3
#		  ...
#		EOF
#	
#		git -c merge.log=3 fmt-merge-msg <.git/FETCH_HEAD >actual &&
#		test_cmp expected actual
#	
ok 8 - merge.log=5 shows all 5 commits
ok 9 - merge.log=0 disables shortlog
not ok - 10 --log=3 limits shortlog length
#	
#		cat >expected <<-EOF &&
#		Merge branch ${apos}left${apos}
#	
#		* left: (5 commits)
#		  Left #5
#		  Left #4
#		  Left #3
#		  ...
#		EOF
#	
#		git fmt-merge-msg --log=3 <.git/FETCH_HEAD >actual &&
#		test_cmp expected actual
#	
not ok - 11 --log=5 shows all 5 commits
#	
#		cat >expected <<-EOF &&
#		Merge branch ${apos}left${apos}
#	
#		* left:
#		  Left #5
#		  Left #4
#		  Left #3
#		  Common #2
#		  Common #1
#		EOF
#	
#		git fmt-merge-msg --log=5 <.git/FETCH_HEAD >actual &&
#		test_cmp expected actual
#	
ok 12 - --no-log disables shortlog
ok 13 - --log=0 disables shortlog
ok 14 - fmt-merge-msg -m
ok 15 - setup: expected shortlog for two branches
ok 16 - shortlog for two branches
ok 17 - merge-msg -F
ok 18 - merge-msg -F in subdirectory
ok 19 - merge-msg with nothing to merge
ok 20 - merge-msg tag
ok 21 - merge-msg two tags
ok 22 - merge-msg tag and branch
ok 23 - merge-msg lots of commits
# failed 3 among 23 test(s)
1..23
