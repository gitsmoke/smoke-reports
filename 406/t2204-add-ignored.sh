Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2204-add-ignored/.git/
expecting success: 
	mkdir sub dir dir/sub &&
	echo sub >.gitignore &&
	echo ign >>.gitignore &&
	for p in . sub dir dir/sub
	do
		>"$p/ign" &&
		>"$p/file" || exit 1
	done


ok 1 - setup

expecting success: 
		rm -f .git/index &&
		git add "$i" &&
		git ls-files "$i" >out &&
		test -s out
	

ok 2 - no complaints for unignored file

expecting success: 
		rm -f .git/index &&
		git add "$i" &&
		git ls-files "$i" >out &&
		test -s out
	

ok 3 - no complaints for unignored dir/file

expecting success: 
		rm -f .git/index &&
		git add "$i" &&
		git ls-files "$i" >out &&
		test -s out
	

ok 4 - no complaints for unignored dir

expecting success: 
		rm -f .git/index &&
		git add "$i" &&
		git ls-files "$i" >out &&
		test -s out
	

ok 5 - no complaints for unignored d*

expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" 2>err &&
		git ls-files "$i" >out &&
		! test -s out &&
		grep -e "Use -f if" err &&
		cat err
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
ign
Use -f if you really want to add them.
fatal: no files added

ok 6 - complaints for ignored ign
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" file 2>err &&
		git ls-files "$i" >out &&
		! test -s out &&
		grep -e "Use -f if" err &&
		cat err
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
ign
Use -f if you really want to add them.
fatal: no files added

ok 7 - complaints for ignored ign with unignored file
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" 2>err &&
		git ls-files "$i" >out &&
		! test -s out &&
		grep -e "Use -f if" err &&
		cat err
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
dir/ign
Use -f if you really want to add them.
fatal: no files added

ok 8 - complaints for ignored dir/ign
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" file 2>err &&
		git ls-files "$i" >out &&
		! test -s out &&
		grep -e "Use -f if" err &&
		cat err
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
dir/ign
Use -f if you really want to add them.
fatal: no files added

ok 9 - complaints for ignored dir/ign with unignored file
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" 2>err &&
		git ls-files "$i" >out &&
		! test -s out &&
		grep -e "Use -f if" err &&
		cat err
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
dir/sub
Use -f if you really want to add them.
fatal: no files added

ok 10 - complaints for ignored dir/sub

expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" file 2>err &&
		git ls-files "$i" >out &&
		! test -s out &&
		grep -e "Use -f if" err &&
		cat err
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
dir/sub
Use -f if you really want to add them.
fatal: no files added

ok 11 - complaints for ignored dir/sub with unignored file

expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" 2>err &&
		git ls-files "$i" >out &&
		! test -s out &&
		grep -e "Use -f if" err &&
		cat err
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
dir/sub
Use -f if you really want to add them.
fatal: no files added

ok 12 - complaints for ignored dir/sub/ign

expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" file 2>err &&
		git ls-files "$i" >out &&
		! test -s out &&
		grep -e "Use -f if" err &&
		cat err
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
dir/sub
Use -f if you really want to add them.
fatal: no files added

ok 13 - complaints for ignored dir/sub/ign with unignored file
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" 2>err &&
		git ls-files "$i" >out &&
		! test -s out &&
		grep -e "Use -f if" err &&
		cat err
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
sub
Use -f if you really want to add them.
fatal: no files added

ok 14 - complaints for ignored sub/file
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" file 2>err &&
		git ls-files "$i" >out &&
		! test -s out &&
		grep -e "Use -f if" err &&
		cat err
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
sub
Use -f if you really want to add them.
fatal: no files added

ok 15 - complaints for ignored sub/file with unignored file

expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" 2>err &&
		git ls-files "$i" >out &&
		! test -s out &&
		grep -e "Use -f if" err &&
		cat err
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
sub
Use -f if you really want to add them.
fatal: no files added

ok 16 - complaints for ignored sub

expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" file 2>err &&
		git ls-files "$i" >out &&
		! test -s out &&
		grep -e "Use -f if" err &&
		cat err
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
sub
Use -f if you really want to add them.
fatal: no files added

ok 17 - complaints for ignored sub with unignored file

expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" 2>err &&
		git ls-files "$i" >out &&
		! test -s out &&
		grep -e "Use -f if" err &&
		cat err
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
sub
Use -f if you really want to add them.
fatal: no files added

ok 18 - complaints for ignored sub/file
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" file 2>err &&
		git ls-files "$i" >out &&
		! test -s out &&
		grep -e "Use -f if" err &&
		cat err
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
sub
Use -f if you really want to add them.
fatal: no files added

ok 19 - complaints for ignored sub/file with unignored file

expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" 2>err &&
		git ls-files "$i" >out &&
		! test -s out &&
		grep -e "Use -f if" err &&
		cat err
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
sub
Use -f if you really want to add them.
fatal: no files added

ok 20 - complaints for ignored sub/ign

expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" file 2>err &&
		git ls-files "$i" >out &&
		! test -s out &&
		grep -e "Use -f if" err &&
		cat err
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
sub
Use -f if you really want to add them.
fatal: no files added

ok 21 - complaints for ignored sub/ign with unignored file

expecting success: 
		rm -f .git/index &&
		(
			cd dir &&
			test_must_fail git add "$i" 2>err &&
			git ls-files "$i" >out &&
			! test -s out &&
			grep -e "Use -f if" err &&
			cat err
		)
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
dir/sub
Use -f if you really want to add them.
fatal: no files added

ok 22 - complaints for ignored sub in dir

expecting success: 
		rm -f .git/index &&
		(
			cd dir &&
			test_must_fail git add "$i" 2>err &&
			git ls-files "$i" >out &&
			! test -s out &&
			grep -e "Use -f if" err &&
			cat err
		)
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
dir/sub
Use -f if you really want to add them.
fatal: no files added

ok 23 - complaints for ignored sub/file in dir
expecting success: 
		rm -f .git/index &&
		(
			cd dir &&
			test_must_fail git add "$i" 2>err &&
			git ls-files "$i" >out &&
			! test -s out &&
			grep -e "Use -f if" err &&
			cat err
		)
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
dir/sub
Use -f if you really want to add them.
fatal: no files added

ok 24 - complaints for ignored sub/ign in dir
expecting success: 
		rm -f .git/index &&
		(
			cd sub &&
			test_must_fail git add "$i" 2>err &&
			git ls-files "$i" >out &&
			! test -s out &&
			grep -e "Use -f if" err &&
			cat err
		)
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
sub
Use -f if you really want to add them.
fatal: no files added

ok 25 - complaints for ignored ign in sub
expecting success: 
		rm -f .git/index &&
		(
			cd sub &&
			test_must_fail git add "$i" 2>err &&
			git ls-files "$i" >out &&
			! test -s out &&
			grep -e "Use -f if" err &&
			cat err
		)
	
Use -f if you really want to add them.
The following paths are ignored by one of your .gitignore files:
sub
Use -f if you really want to add them.
fatal: no files added

ok 26 - complaints for ignored file in sub
# passed all 26 test(s)
1..26
