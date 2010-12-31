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
		! test -s out
	

ok 6 - complaints for ignored ign

expecting success: 
		grep -e "Use -f if" err
	
Use -f if you really want to add them.

ok 7 - complaints for ignored ign output
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" file 2>err &&
		git ls-files "$i" >out &&
		! test -s out
	

ok 8 - complaints for ignored ign with unignored file

expecting success: 
		grep -e "Use -f if" err
	
Use -f if you really want to add them.

ok 9 - complaints for ignored ign with unignored file output

expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" 2>err &&
		git ls-files "$i" >out &&
		! test -s out
	

ok 10 - complaints for ignored dir/ign

expecting success: 
		grep -e "Use -f if" err
	
Use -f if you really want to add them.

ok 11 - complaints for ignored dir/ign output

expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" file 2>err &&
		git ls-files "$i" >out &&
		! test -s out
	

ok 12 - complaints for ignored dir/ign with unignored file

expecting success: 
		grep -e "Use -f if" err
	
Use -f if you really want to add them.

ok 13 - complaints for ignored dir/ign with unignored file output
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" 2>err &&
		git ls-files "$i" >out &&
		! test -s out
	

ok 14 - complaints for ignored dir/sub
expecting success: 
		grep -e "Use -f if" err
	
Use -f if you really want to add them.
ok 15 - complaints for ignored dir/sub output
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" file 2>err &&
		git ls-files "$i" >out &&
		! test -s out
	

ok 16 - complaints for ignored dir/sub with unignored file

expecting success: 
		grep -e "Use -f if" err
	
Use -f if you really want to add them.

ok 17 - complaints for ignored dir/sub with unignored file output
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" 2>err &&
		git ls-files "$i" >out &&
		! test -s out
	

ok 18 - complaints for ignored dir/sub/ign

expecting success: 
		grep -e "Use -f if" err
	
Use -f if you really want to add them.

ok 19 - complaints for ignored dir/sub/ign output
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" file 2>err &&
		git ls-files "$i" >out &&
		! test -s out
	

ok 20 - complaints for ignored dir/sub/ign with unignored file

expecting success: 
		grep -e "Use -f if" err
	
Use -f if you really want to add them.

ok 21 - complaints for ignored dir/sub/ign with unignored file output

expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" 2>err &&
		git ls-files "$i" >out &&
		! test -s out
	

ok 22 - complaints for ignored sub/file
expecting success: 
		grep -e "Use -f if" err
	
Use -f if you really want to add them.
ok 23 - complaints for ignored sub/file output
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" file 2>err &&
		git ls-files "$i" >out &&
		! test -s out
	

ok 24 - complaints for ignored sub/file with unignored file

expecting success: 
		grep -e "Use -f if" err
	
Use -f if you really want to add them.

ok 25 - complaints for ignored sub/file with unignored file output
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" 2>err &&
		git ls-files "$i" >out &&
		! test -s out
	

ok 26 - complaints for ignored sub

expecting success: 
		grep -e "Use -f if" err
	
Use -f if you really want to add them.

ok 27 - complaints for ignored sub output
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" file 2>err &&
		git ls-files "$i" >out &&
		! test -s out
	

ok 28 - complaints for ignored sub with unignored file

expecting success: 
		grep -e "Use -f if" err
	
Use -f if you really want to add them.

ok 29 - complaints for ignored sub with unignored file output

expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" 2>err &&
		git ls-files "$i" >out &&
		! test -s out
	

ok 30 - complaints for ignored sub/file

expecting success: 
		grep -e "Use -f if" err
	
Use -f if you really want to add them.

ok 31 - complaints for ignored sub/file output
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" file 2>err &&
		git ls-files "$i" >out &&
		! test -s out
	

ok 32 - complaints for ignored sub/file with unignored file

expecting success: 
		grep -e "Use -f if" err
	
Use -f if you really want to add them.

ok 33 - complaints for ignored sub/file with unignored file output

expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" 2>err &&
		git ls-files "$i" >out &&
		! test -s out
	

ok 34 - complaints for ignored sub/ign

expecting success: 
		grep -e "Use -f if" err
	
Use -f if you really want to add them.

ok 35 - complaints for ignored sub/ign output
expecting success: 
		rm -f .git/index &&
		test_must_fail git add "$i" file 2>err &&
		git ls-files "$i" >out &&
		! test -s out
	

ok 36 - complaints for ignored sub/ign with unignored file

expecting success: 
		grep -e "Use -f if" err
	
Use -f if you really want to add them.

ok 37 - complaints for ignored sub/ign with unignored file output
expecting success: 
		rm -f .git/index &&
		(
			cd dir &&
			test_must_fail git add "$i" 2>err &&
			git ls-files "$i" >out &&
			! test -s out
		)
	

ok 38 - complaints for ignored sub in dir

expecting success: 
		(
			cd dir &&
			grep -e "Use -f if" err
		)
	
Use -f if you really want to add them.

ok 39 - complaints for ignored sub in dir output

expecting success: 
		rm -f .git/index &&
		(
			cd dir &&
			test_must_fail git add "$i" 2>err &&
			git ls-files "$i" >out &&
			! test -s out
		)
	

ok 40 - complaints for ignored sub/file in dir

expecting success: 
		(
			cd dir &&
			grep -e "Use -f if" err
		)
	
Use -f if you really want to add them.

ok 41 - complaints for ignored sub/file in dir output

expecting success: 
		rm -f .git/index &&
		(
			cd dir &&
			test_must_fail git add "$i" 2>err &&
			git ls-files "$i" >out &&
			! test -s out
		)
	

ok 42 - complaints for ignored sub/ign in dir

expecting success: 
		(
			cd dir &&
			grep -e "Use -f if" err
		)
	
Use -f if you really want to add them.

ok 43 - complaints for ignored sub/ign in dir output

expecting success: 
		rm -f .git/index &&
		(
			cd sub &&
			test_must_fail git add "$i" 2>err &&
			git ls-files "$i" >out &&
			! test -s out
		)
	

ok 44 - complaints for ignored ign in sub

expecting success: 
		(
			cd sub &&
			grep -e "Use -f if" err
		)
	
Use -f if you really want to add them.

ok 45 - complaints for ignored ign in sub output

expecting success: 
		rm -f .git/index &&
		(
			cd sub &&
			test_must_fail git add "$i" 2>err &&
			git ls-files "$i" >out &&
			! test -s out
		)
	

ok 46 - complaints for ignored file in sub

expecting success: 
		(
			cd sub &&
			grep -e "Use -f if" err
		)
	
Use -f if you really want to add them.
ok 47 - complaints for ignored file in sub output
# passed all 47 test(s)
1..47
