ok 1 - setup
ok 2 - setup for merge search
not ok - 3 merge with one side as a fast-forward of the other
#	
#		(cd merge-search &&
#		 git checkout -b test-forward b &&
#		 git merge d &&
#		 git ls-tree test-forward sub | cut -f1 | cut -f3 -d" " > actual &&
#		 (cd sub &&
#		  git rev-parse sub-d > ../expect) &&
#		 test_cmp actual expect)
#	
not ok - 4 merging should conflict for non fast-forward
#	
#		(cd merge-search &&
#		 git checkout -b test-nonforward b &&
#		 (cd sub &&
#		  git rev-parse sub-d > ../expect) &&
#		 test_must_fail git merge c 2> actual  &&
#		 grep $(cat expect) actual > /dev/null &&
#		 git reset --hard)
#	
not ok - 5 merging should fail for ambiguous common parent
#	
#		cd merge-search &&
#		git checkout -b test-ambiguous b &&
#		(cd sub &&
#		 git checkout -b ambiguous sub-b &&
#		 git merge sub-c &&
#		 git rev-parse sub-d > ../expect1 &&
#		 git rev-parse ambiguous > ../expect2) &&
#		test_must_fail git merge c 2> actual &&
#		grep $(cat expect1) actual > /dev/null &&
#		grep $(cat expect2) actual > /dev/null &&
#		git reset --hard &&
#		cd ..
#	
not ok - 6 merging should fail for changes that are backwards
#	
#		cd merge-search &&
#		git checkout -b bb a &&
#		(cd sub &&
#		 git checkout sub-b) &&
#		git commit -a -m "bb" &&
#	
#		git checkout -b e bb &&
#		(cd sub &&
#		 git checkout sub-a) &&
#		git commit -a -m "e" &&
#	
#		git checkout -b f bb &&
#		(cd sub &&
#		 git checkout sub-d) &&
#		git commit -a -m "f" &&
#	
#		git checkout -b test-backward e &&
#		test_must_fail git merge f &&
#		cd ..
#	
not ok - 7 merging with a modify/modify conflict between merge bases
#	
#	
#		git reset --hard HEAD &&
#		git checkout -b test2 c &&
#		git merge d
#	
#	
# failed 5 among 7 test(s)
1..7
