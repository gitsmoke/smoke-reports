ok 1 - setup
ok 2 - set up fuzz_conflict() helper
not ok - 3 Merge after setting text=auto
#	
#		cat <<-\EOF >expected &&
#		first line
#		same line
#		EOF
#	
#		git config merge.renormalize true &&
#		git rm -fr . &&
#		rm -f .gitattributes &&
#		git reset --hard a &&
#		git merge b &&
#		test_cmp expected file
#	
not ok - 4 Merge addition of text=auto
#	
#		cat <<-\EOF >expected &&
#		first line
#		same line
#		EOF
#	
#		git config merge.renormalize true &&
#		git rm -fr . &&
#		rm -f .gitattributes &&
#		git reset --hard b &&
#		git merge a &&
#		test_cmp expected file
#	
not ok - 5 Detect CRLF/LF conflict after setting text=auto
#	
#		q_to_cr <<-\EOF >expected &&
#		<<<<<<<
#		first line
#		same line
#		=======
#		first lineQ
#		same lineQ
#		>>>>>>>
#		EOF
#	
#		git config merge.renormalize false &&
#		rm -f .gitattributes &&
#		git reset --hard a &&
#		test_must_fail git merge b &&
#		fuzz_conflict file >file.fuzzy &&
#		test_cmp expected file.fuzzy
#	
not ok - 6 Detect LF/CRLF conflict from addition of text=auto
#	
#		q_to_cr <<-\EOF >expected &&
#		<<<<<<<
#		first lineQ
#		same lineQ
#		=======
#		first line
#		same line
#		>>>>>>>
#		EOF
#	
#		git config merge.renormalize false &&
#		rm -f .gitattributes &&
#		git reset --hard b &&
#		test_must_fail git merge a &&
#		fuzz_conflict file >file.fuzzy &&
#		test_cmp expected file.fuzzy
#	
not ok 7 - checkout -m after setting text=auto # TODO known breakage
not ok 8 - checkout -m addition of text=auto # TODO known breakage
ok 9 - cherry-pick patch from after text=auto was added # TODO known breakage
ok 10 - Test delete/normalize conflict
# fixed 1 known breakage(s)
# still have 2 known breakage(s)
# failed 4 among remaining 8 test(s)
1..10
