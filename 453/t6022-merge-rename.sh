ok 1 - setup
ok 2 - pull renaming branch into unrenaming one
ok 3 - pull renaming branch into another renaming one
ok 4 - pull unrenaming branch into renaming one
ok 5 - pull conflicting renames
ok 6 - interference with untracked working tree file
ok 7 - interference with untracked working tree file
ok 8 - interference with untracked working tree file
ok 9 - updated working tree file should prevent the merge
ok 10 - updated working tree file should prevent the merge
ok 11 - interference with untracked working tree file
ok 12 - merge of identical changes in a renamed file
ok 13 - setup for rename + d/f conflicts
ok 14 - Rename+D/F conflict; renamed file merges + dir not in way
not ok - 15 Rename+D/F conflict; renamed file merges but dir in way
#	
#		git reset --hard &&
#		rm -rf dir~* &&
#		git checkout -q renamed-file-has-no-conflicts^0 &&
#		test_must_fail git merge --strategy=recursive dir-in-way >output &&
#	
#		grep "CONFLICT (delete/modify): dir/file-in-the-way" output &&
#		grep "Auto-merging dir" output &&
#		grep "Adding as dir~HEAD instead" output &&
#	
#		test 2 -eq "$(git ls-files -u | wc -l)" &&
#		test 2 -eq "$(git ls-files -u dir/file-in-the-way | wc -l)" &&
#	
#		test_must_fail git diff --quiet &&
#		test_must_fail git diff --cached --quiet &&
#	
#		test -f dir/file-in-the-way &&
#		test -f dir~HEAD &&
#		test_cmp expected dir~HEAD
#	
not ok - 16 Same as previous, but merged other way
#	
#		git reset --hard &&
#		rm -rf dir~* &&
#		git checkout -q dir-in-way^0 &&
#		test_must_fail git merge --strategy=recursive renamed-file-has-no-conflicts >output 2>errors &&
#	
#		! grep "error: refusing to lose untracked file at" errors &&
#		grep "CONFLICT (delete/modify): dir/file-in-the-way" output &&
#		grep "Auto-merging dir" output &&
#		grep "Adding as dir~renamed-file-has-no-conflicts instead" output &&
#	
#		test 2 -eq "$(git ls-files -u | wc -l)" &&
#		test 2 -eq "$(git ls-files -u dir/file-in-the-way | wc -l)" &&
#	
#		test_must_fail git diff --quiet &&
#		test_must_fail git diff --cached --quiet &&
#	
#		test -f dir/file-in-the-way &&
#		test -f dir~renamed-file-has-no-conflicts &&
#		test_cmp expected dir~renamed-file-has-no-conflicts
#	
not ok - 17 Rename+D/F conflict; renamed file cannot merge, dir not in way
#	
#		git reset --hard &&
#		rm -rf dir~* &&
#		git checkout -q renamed-file-has-conflicts^0 &&
#		test_must_fail git merge --strategy=recursive dir-not-in-way &&
#	
#		test 3 -eq "$(git ls-files -u | wc -l)" &&
#		test 3 -eq "$(git ls-files -u dir | wc -l)" &&
#	
#		test_must_fail git diff --quiet &&
#		test_must_fail git diff --cached --quiet &&
#	
#		test -f dir &&
#		test_cmp expected dir
#	
not ok - 18 Rename+D/F conflict; renamed file cannot merge and dir in the way
#	
#		modify s/dir-not-in-way/dir-in-way/ expected &&
#	
#		git reset --hard &&
#		rm -rf dir~* &&
#		git checkout -q renamed-file-has-conflicts^0 &&
#		test_must_fail git merge --strategy=recursive dir-in-way &&
#	
#		test 5 -eq "$(git ls-files -u | wc -l)" &&
#		test 3 -eq "$(git ls-files -u dir | grep -v file-in-the-way | wc -l)" &&
#		test 2 -eq "$(git ls-files -u dir/file-in-the-way | wc -l)" &&
#	
#		test_must_fail git diff --quiet &&
#		test_must_fail git diff --cached --quiet &&
#	
#		test -f dir/file-in-the-way &&
#		test -f dir~HEAD &&
#		test_cmp expected dir~HEAD
#	
not ok - 19 Same as previous, but merged other way
#	
#		git reset --hard &&
#		rm -rf dir~* &&
#		git checkout -q dir-in-way^0 &&
#		test_must_fail git merge --strategy=recursive renamed-file-has-conflicts &&
#	
#		test 5 -eq "$(git ls-files -u | wc -l)" &&
#		test 3 -eq "$(git ls-files -u dir | grep -v file-in-the-way | wc -l)" &&
#		test 2 -eq "$(git ls-files -u dir/file-in-the-way | wc -l)" &&
#	
#		test_must_fail git diff --quiet &&
#		test_must_fail git diff --cached --quiet &&
#	
#		test -f dir/file-in-the-way &&
#		test -f dir~renamed-file-has-conflicts &&
#		test_cmp expected dir~renamed-file-has-conflicts
#	
ok 20 - setup both rename source and destination involved in D/F conflict
ok 21 - both rename source and destination involved in D/F conflict
ok 22 - setup pair rename to parent of other (D/F conflicts)
not ok - 23 pair rename to parent of other (D/F conflicts) w/ untracked dir
#	
#		git checkout -q rename-one^0 &&
#		mkdir one &&
#		test_must_fail git merge --strategy=recursive rename-two &&
#	
#		test 2 -eq "$(git ls-files -u | wc -l)" &&
#		test 1 -eq "$(git ls-files -u one | wc -l)" &&
#		test 1 -eq "$(git ls-files -u two | wc -l)" &&
#	
#		test_must_fail git diff --quiet &&
#	
#		test 4 -eq $(find . | grep -v .git | wc -l) &&
#	
#		test -d one &&
#		test -f one~rename-two &&
#		test -f two &&
#		test "other" = $(cat one~rename-two) &&
#		test "stuff" = $(cat two)
#	
ok 24 - pair rename to parent of other (D/F conflicts) w/ clean start
ok 25 - setup rename of one file to two, with directories in the way
not ok - 26 check handling of differently renamed file with D/F conflicts
#	
#		git checkout -q first-rename^0 &&
#		test_must_fail git merge --strategy=recursive second-rename &&
#	
#		test 5 -eq "$(git ls-files -s | wc -l)" &&
#		test 3 -eq "$(git ls-files -u | wc -l)" &&
#		test 1 -eq "$(git ls-files -u one | wc -l)" &&
#		test 1 -eq "$(git ls-files -u two | wc -l)" &&
#		test 1 -eq "$(git ls-files -u original | wc -l)" &&
#		test 2 -eq "$(git ls-files -o | wc -l)" &&
#	
#		test -f one/file &&
#		test -f two/file &&
#		test -f one~HEAD &&
#		test -f two~second-rename &&
#		! test -f original
#	
ok 27 - setup rename one file to two; directories moving out of the way
not ok - 28 check handling of differently renamed file with D/F conflicts
#	
#		git checkout -q first-rename-redo^0 &&
#		test_must_fail git merge --strategy=recursive second-rename-redo &&
#	
#		test 3 -eq "$(git ls-files -u | wc -l)" &&
#		test 1 -eq "$(git ls-files -u one | wc -l)" &&
#		test 1 -eq "$(git ls-files -u two | wc -l)" &&
#		test 1 -eq "$(git ls-files -u original | wc -l)" &&
#		test 0 -eq "$(git ls-files -o | wc -l)" &&
#	
#		test -f one &&
#		test -f two &&
#		! test -f original
#	
# failed 8 among 28 test(s)
1..28
