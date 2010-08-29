ok 1 - setup
not ok - 2 untracked files overwritten by merge
#	
#		test_must_fail git merge branch 2>out &&
#		test_cmp out expect
#	
not ok - 3 untracked files or local changes ovewritten by merge
#	
#		git add two &&
#		git add three &&
#		git add four &&
#		test_must_fail git merge branch 2>out &&
#		test_cmp out expect
#	
not ok - 4 cannot switch branches because of local changes
#	
#		git add five &&
#		mkdir rep &&
#		echo one >rep/one &&
#		echo two >rep/two &&
#		git add rep/one rep/two &&
#		git commit -m Fourth &&
#		git checkout master &&
#		echo uno >rep/one &&
#		echo dos >rep/two &&
#		test_must_fail git checkout branch 2>out &&
#		test_cmp out expect
#	
not ok - 5 not uptodate file porcelain checkout error
#	
#		git add rep/one rep/two &&
#		test_must_fail git checkout branch 2>out &&
#		test_cmp out expect
#	
not ok - 6 not_uptodate_dir porcelain checkout error
#	
#		git init uptodate &&
#		cd uptodate &&
#		mkdir rep &&
#		mkdir rep2 &&
#		touch rep/foo &&
#		touch rep2/foo &&
#		git add rep/foo rep2/foo &&
#		git commit -m init &&
#		git checkout -b branch &&
#		git rm rep -r &&
#		git rm rep2 -r &&
#		>rep &&
#		>rep2 &&
#		git add rep rep2&&
#		git commit -m "added test as a file" &&
#		git checkout master &&
#		>rep/untracked-file &&
#		>rep2/untracked-file &&
#		test_must_fail git checkout branch 2>out &&
#		test_cmp out ../expect
#	
# failed 5 among 6 test(s)
1..6
