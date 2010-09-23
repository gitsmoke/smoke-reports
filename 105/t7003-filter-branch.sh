ok 1 - setup
ok 2 - rewrite identically
ok 3 - result is really identical
ok 4 - rewrite bare repository identically
ok 5 - result is really identical
not ok - 6 correct GIT_DIR while using -d
#	
#		mkdir drepo &&
#		( cd drepo &&
#		git init &&
#		test_commit drepo &&
#		git filter-branch -d "$TRASHDIR/dfoo" \
#			--index-filter "cp \"$TRASHDIR\"/dfoo/backup-refs \"$TRASHDIR\"" \
#		) &&
#		grep drepo "$TRASHDIR/backup-refs"
#	
ok 7 - Fail if commit filter fails
not ok - 8 rewrite, renaming a specific file
#	
#		git filter-branch -f --tree-filter "mv D.t doh || :" HEAD
#	
not ok - 9 test that the file was renamed
#	
#		test D = "$(git show HEAD:doh --)" &&
#		! test -f D.t &&
#		test -f doh &&
#		test D = "$(cat doh)"
#	
not ok - 10 rewrite, renaming a specific directory
#	
#		git filter-branch -f --tree-filter "mv dir diroh || :" HEAD
#	
not ok - 11 test that the directory was renamed
#	
#		test dir/D = "$(git show HEAD:diroh/D.t --)" &&
#		! test -d dir &&
#		test -d diroh &&
#		! test -d diroh/dir &&
#		test -f diroh/D.t &&
#		test dir/D = "$(cat diroh/D.t)"
#	
not ok - 12 rewrite one branch, keeping a side branch
#	
#		git branch modD oldD &&
#		git filter-branch -f --tree-filter "mv B.t boh || :" D..modD
#	
ok 13 - common ancestor is still common (unchanged)
not ok - 14 filter subdirectory only
#	
#		mkdir subdir &&
#		touch subdir/new &&
#		git add subdir/new &&
#		test_tick &&
#		git commit -m "subdir" &&
#		echo H > A.t &&
#		test_tick &&
#		git commit -m "not subdir" A.t &&
#		echo A > subdir/new &&
#		test_tick &&
#		git commit -m "again subdir" subdir/new &&
#		git rm A.t &&
#		test_tick &&
#		git commit -m "again not subdir" &&
#		git branch sub &&
#		git branch sub-earlier HEAD~2 &&
#		git filter-branch -f --subdirectory-filter subdir \
#			refs/heads/sub refs/heads/sub-earlier
#	
not ok - 15 subdirectory filter result looks okay
#	
#		test 2 = $(git rev-list sub | wc -l) &&
#		git show sub:new &&
#		test_must_fail git show sub:subdir &&
#		git show sub-earlier:new &&
#		test_must_fail git show sub-earlier:subdir
#	
not ok - 16 more setup
#	
#		git checkout master &&
#		mkdir subdir &&
#		echo A > subdir/new &&
#		git add subdir/new &&
#		test_tick &&
#		git commit -m "subdir on master" subdir/new &&
#		git rm A.t &&
#		test_tick &&
#		git commit -m "again subdir on master" &&
#		git merge branch
#	
not ok - 17 use index-filter to move into a subdirectory
#	
#		git branch directorymoved &&
#		git filter-branch -f --index-filter \
#			 "git ls-files -s | sed \"s-	-&newsubdir/-\" |
#		          GIT_INDEX_FILE=\$GIT_INDEX_FILE.new \
#				git update-index --index-info &&
#			  mv \"\$GIT_INDEX_FILE.new\" \"\$GIT_INDEX_FILE\"" directorymoved &&
#		git diff --exit-code HEAD directorymoved:newsubdir
#	
not ok - 18 stops when msg filter fails
#	
#		old=$(git rev-parse HEAD) &&
#		test_must_fail git filter-branch -f --msg-filter false HEAD &&
#		test $old = $(git rev-parse HEAD) &&
#		rm -rf .git-rewrite
#	
FATAL: Unexpected exit with code 2
