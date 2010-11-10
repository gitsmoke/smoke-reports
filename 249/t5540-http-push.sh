ok 1 - setup remote repository
ok 2 - clone remote repository
not ok - 3 push to remote repository with packed refs
#	
#		cd "$ROOT_PATH"/test_repo_clone &&
#		: >path2 &&
#		git add path2 &&
#		test_tick &&
#		git commit -m path2 &&
#		HEAD=$(git rev-parse --verify HEAD) &&
#		git push &&
#		(cd "$HTTPD_DOCUMENT_ROOT_PATH"/test_repo.git &&
#		 test $HEAD = $(git rev-parse --verify HEAD))
#	
not ok - 4 push already up-to-date
#	
#		git push
#	
not ok - 5 push to remote repository with unpacked refs
#	
#		(cd "$HTTPD_DOCUMENT_ROOT_PATH"/test_repo.git &&
#		 rm packed-refs &&
#		 git update-ref refs/heads/master $ORIG_HEAD &&
#		 git --bare update-server-info) &&
#		git push &&
#		(cd "$HTTPD_DOCUMENT_ROOT_PATH"/test_repo.git &&
#		 test $HEAD = $(git rev-parse --verify HEAD))
#	
not ok - 6 http-push fetches unpacked objects
#	
#		cp -R "$HTTPD_DOCUMENT_ROOT_PATH"/test_repo.git \
#			"$HTTPD_DOCUMENT_ROOT_PATH"/test_repo_unpacked.git &&
#	
#		git clone $HTTPD_URL/dumb/test_repo_unpacked.git \
#			"$ROOT_PATH"/fetch_unpacked &&
#	
#		# By reset, we force git to retrieve the object
#		(cd "$ROOT_PATH"/fetch_unpacked &&
#		 git reset --hard HEAD^ &&
#		 git remote rm origin &&
#		 git reflog expire --expire=0 --all &&
#		 git prune &&
#		 git push -f -v $HTTPD_URL/dumb/test_repo_unpacked.git master)
#	
not ok - 7 http-push fetches packed objects
#	
#		cp -R "$HTTPD_DOCUMENT_ROOT_PATH"/test_repo.git \
#			"$HTTPD_DOCUMENT_ROOT_PATH"/test_repo_packed.git &&
#	
#		git clone $HTTPD_URL/dumb/test_repo_packed.git \
#			"$ROOT_PATH"/test_repo_clone_packed &&
#	
#		(cd "$HTTPD_DOCUMENT_ROOT_PATH"/test_repo_packed.git &&
#		 git --bare repack &&
#		 git --bare prune-packed) &&
#	
#		# By reset, we force git to retrieve the packed object
#		(cd "$ROOT_PATH"/test_repo_clone_packed &&
#		 git reset --hard HEAD^ &&
#		 git remote rm origin &&
#		 git reflog expire --expire=0 --all &&
#		 git prune &&
#		 git push -f -v $HTTPD_URL/dumb/test_repo_packed.git master)
#	
not ok - 8 create and delete remote branch
#	
#		cd "$ROOT_PATH"/test_repo_clone &&
#		git checkout -b dev &&
#		: >path3 &&
#		git add path3 &&
#		test_tick &&
#		git commit -m dev &&
#		git push origin dev &&
#		git push origin :dev &&
#		test_must_fail git show-ref --verify refs/remotes/origin/dev
#	
ok 9 - MKCOL sends directory names with trailing slashes
not ok - 10 PUT and MOVE sends object to URLs with SHA-1 hash suffix
#	
#		sed -e "s/PUT /OP /" -e "s/MOVE /OP /" "$HTTPD_ROOT_PATH"/access.log |
#		grep -e "\"OP .*/objects/$x2/${x38}_$x40 HTTP/[.0-9]*\" 20[0-9] "
#	
#	
ok 11 - non-fast-forward push fails
not ok - 12 non-fast-forward push show ref status
#	
#			grep "^ ! \[rejected\][ ]*$BRANCH -> $BRANCH (non-fast-forward)$" output
#		
not ok - 13 non-fast-forward push shows help message
#	
#			grep "To prevent you from losing history, non-fast-forward updates were rejected" \
#				output
#		
# failed 9 among 13 test(s)
1..13
