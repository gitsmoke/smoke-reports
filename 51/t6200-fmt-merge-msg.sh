ok 1 - setup
ok 2 - message for merging local branch
ok 3 - message for merging external branch
ok 4 - [merge] summary/log configuration
not ok - 5 fmt-merge-msg -m
#	
#		echo "Sync with left" >expected &&
#		cat >expected.log <<-EOF &&
#		Sync with left
#	
#		* ${apos}left${apos} of $(pwd):
#		  Left #5
#		  Left #4
#		  Left #3
#		  Common #2
#		  Common #1
#		EOF
#	
#		test_might_fail git config --unset merge.log &&
#		test_might_fail git config --unset merge.summary &&
#		git checkout master &&
#		git fetch "$(pwd)" left &&
#		git fmt-merge-msg -m "Sync with left" <.git/FETCH_HEAD >actual &&
#		git fmt-merge-msg --log -m "Sync with left" \
#						<.git/FETCH_HEAD >actual.log &&
#		git config merge.log true &&
#		git fmt-merge-msg -m "Sync with left" \
#						<.git/FETCH_HEAD >actual.log-config &&
#		git fmt-merge-msg --no-log -m "Sync with left" \
#						<.git/FETCH_HEAD >actual.nolog &&
#	
#		test_cmp expected actual &&
#		test_cmp expected.log actual.log &&
#		test_cmp expected.log actual.log-config &&
#		test_cmp expected actual.nolog
#	
ok 6 - setup: expected shortlog for two branches
ok 7 - shortlog for two branches
ok 8 - merge-msg -F
ok 9 - merge-msg -F in subdirectory
ok 10 - merge-msg with nothing to merge
ok 11 - merge-msg tag
ok 12 - merge-msg two tags
ok 13 - merge-msg tag and branch
ok 14 - merge-msg lots of commits
# failed 1 among 14 test(s)
1..14
