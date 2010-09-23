ok 1 - set up basic repo with 1 file (hello) and 4 commits
ok 2 - bisect starts with only one bad
ok 3 - bisect does not start with only one good
ok 4 - bisect start with one bad and good
ok 5 - bisect fails if given any junk instead of revs
ok 6 - bisect reset: back in the master branch
ok 7 - bisect reset: back in another branch
ok 8 - bisect reset when not bisecting
ok 9 - bisect reset removes packed refs
not ok - 10 bisect start: back in good branch
#	
#		git branch > branch.output &&
#		grep "* other" branch.output > /dev/null &&
#		git bisect start $HASH4 $HASH1 -- &&
#		git bisect good &&
#		git bisect start $HASH4 $HASH1 -- &&
#		git bisect bad &&
#		git bisect reset &&
#		git branch > branch.output &&
#		grep "* other" branch.output > /dev/null
#	
not ok - 11 bisect start: no ".git/BISECT_START" if junk rev
#	
#		git bisect start $HASH4 $HASH1 -- &&
#		git bisect good &&
#		test_must_fail git bisect start $HASH4 foo -- &&
#		git branch > branch.output &&
#		grep "* other" branch.output > /dev/null &&
#		test_must_fail test -e .git/BISECT_START
#	
not ok - 12 bisect start: no ".git/BISECT_START" if mistaken rev
#	
#		git bisect start $HASH4 $HASH1 -- &&
#		git bisect good &&
#		test_must_fail git bisect start $HASH1 $HASH4 -- &&
#		git branch > branch.output &&
#		grep "* other" branch.output > /dev/null &&
#		test_must_fail test -e .git/BISECT_START
#	
not ok - 13 bisect start: no ".git/BISECT_START" if checkout error
#	
#		echo "temp stuff" > hello &&
#		test_must_fail git bisect start $HASH4 $HASH1 -- &&
#		git branch &&
#		git branch > branch.output &&
#		grep "* other" branch.output > /dev/null &&
#		test_must_fail test -e .git/BISECT_START &&
#		test -z "$(git for-each-ref "refs/bisect/*")" &&
#		git checkout HEAD hello
#	
not ok - 14 bisect skip: successfull result
#	
#		git bisect reset &&
#		git bisect start $HASH4 $HASH1 &&
#		git bisect skip &&
#		git bisect bad > my_bisect_log.txt &&
#		grep "$HASH2 is the first bad commit" my_bisect_log.txt &&
#		git bisect reset
#	
not ok - 15 bisect skip: cannot tell between 3 commits
#	
#		git bisect start $HASH4 $HASH1 &&
#		git bisect skip || return 1
#	
#		if git bisect skip > my_bisect_log.txt
#		then
#			echo Oops, should have failed.
#			false
#		else
#			test $? -eq 2 &&
#			grep "first bad commit could be any of" my_bisect_log.txt &&
#			! grep $HASH1 my_bisect_log.txt &&
#			grep $HASH2 my_bisect_log.txt &&
#			grep $HASH3 my_bisect_log.txt &&
#			grep $HASH4 my_bisect_log.txt &&
#			git bisect reset
#		fi
#	
not ok - 16 bisect skip: cannot tell between 2 commits
#	
#		git bisect start $HASH4 $HASH1 &&
#		git bisect skip || return 1
#	
#		if git bisect good > my_bisect_log.txt
#		then
#			echo Oops, should have failed.
#			false
#		else
#			test $? -eq 2 &&
#			grep "first bad commit could be any of" my_bisect_log.txt &&
#			! grep $HASH1 my_bisect_log.txt &&
#			! grep $HASH2 my_bisect_log.txt &&
#			grep $HASH3 my_bisect_log.txt &&
#			grep $HASH4 my_bisect_log.txt &&
#			git bisect reset
#		fi
#	
not ok - 17 bisect skip: with commit both bad and skipped
#	
#		git bisect start &&
#		git bisect skip &&
#		git bisect bad &&
#		git bisect good $HASH1 &&
#		git bisect skip &&
#		if git bisect good > my_bisect_log.txt
#		then
#			echo Oops, should have failed.
#			false
#		else
#			test $? -eq 2 &&
#			grep "first bad commit could be any of" my_bisect_log.txt &&
#			! grep $HASH1 my_bisect_log.txt &&
#			! grep $HASH2 my_bisect_log.txt &&
#			grep $HASH3 my_bisect_log.txt &&
#			grep $HASH4 my_bisect_log.txt &&
#			git bisect reset
#		fi
#	
not ok - 18 "git bisect run" simple case
#	echo "#"\!"/bin/sh" > test_script.sh &&
#	     echo "grep Another hello > /dev/null" >> test_script.sh &&
#	     echo "test \$? -ne 0" >> test_script.sh &&
#	     chmod +x test_script.sh &&
#	     git bisect start &&
#	     git bisect good $HASH1 &&
#	     git bisect bad $HASH4 &&
#	     git bisect run ./test_script.sh > my_bisect_log.txt &&
#	     grep "$HASH3 is the first bad commit" my_bisect_log.txt &&
#	     git bisect reset
not ok - 19 "git bisect run" with more complex "git bisect start"
#	echo "#"\!"/bin/sh" > test_script.sh &&
#	     echo "grep Ciao hello > /dev/null" >> test_script.sh &&
#	     echo "test \$? -ne 0" >> test_script.sh &&
#	     chmod +x test_script.sh &&
#	     git bisect start $HASH4 $HASH1 &&
#	     git bisect run ./test_script.sh > my_bisect_log.txt &&
#	     grep "$HASH4 is the first bad commit" my_bisect_log.txt &&
#	     git bisect reset
not ok - 20 bisect skip: add line and then a new test
#	
#		add_line_into_file "5: Another new line." hello &&
#		HASH5=$(git rev-parse --verify HEAD) &&
#		git bisect start $HASH5 $HASH1 &&
#		git bisect skip &&
#		git bisect good > my_bisect_log.txt &&
#		grep "$HASH5 is the first bad commit" my_bisect_log.txt &&
#		git bisect log > log_to_replay.txt &&
#		git bisect reset
#	
not ok - 21 bisect skip and bisect replay
#	
#		git bisect replay log_to_replay.txt > my_bisect_log.txt &&
#		grep "$HASH5 is the first bad commit" my_bisect_log.txt &&
#		git bisect reset
#	
not ok - 22 bisect run & skip: cannot tell between 2
#	
#		add_line_into_file "6: Yet a line." hello &&
#		HASH6=$(git rev-parse --verify HEAD) &&
#		echo "#"\!"/bin/sh" > test_script.sh &&
#		echo "sed -ne \\$p hello | grep Ciao > /dev/null && exit 125" >> test_script.sh &&
#		echo "grep line hello > /dev/null" >> test_script.sh &&
#		echo "test \$? -ne 0" >> test_script.sh &&
#		chmod +x test_script.sh &&
#		git bisect start $HASH6 $HASH1 &&
#		if git bisect run ./test_script.sh > my_bisect_log.txt
#		then
#			echo Oops, should have failed.
#			false
#		else
#			test $? -eq 2 &&
#			grep "first bad commit could be any of" my_bisect_log.txt &&
#			! grep $HASH3 my_bisect_log.txt &&
#			! grep $HASH6 my_bisect_log.txt &&
#			grep $HASH4 my_bisect_log.txt &&
#			grep $HASH5 my_bisect_log.txt
#		fi
#	
not ok - 23 bisect run & skip: find first bad
#	
#		git bisect reset &&
#		add_line_into_file "7: Should be the last line." hello &&
#		HASH7=$(git rev-parse --verify HEAD) &&
#		echo "#"\!"/bin/sh" > test_script.sh &&
#		echo "sed -ne \\$p hello | grep Ciao > /dev/null && exit 125" >> test_script.sh &&
#		echo "sed -ne \\$p hello | grep day > /dev/null && exit 125" >> test_script.sh &&
#		echo "grep Yet hello > /dev/null" >> test_script.sh &&
#		echo "test \$? -ne 0" >> test_script.sh &&
#		chmod +x test_script.sh &&
#		git bisect start $HASH7 $HASH1 &&
#		git bisect run ./test_script.sh > my_bisect_log.txt &&
#		grep "$HASH6 is the first bad commit" my_bisect_log.txt
#	
not ok - 24 bisect skip only one range
#	
#		git bisect reset &&
#		git bisect start $HASH7 $HASH1 &&
#		git bisect skip $HASH1..$HASH5 &&
#		test "$HASH6" = "$(git rev-parse --verify HEAD)" &&
#		test_must_fail git bisect bad > my_bisect_log.txt &&
#		grep "first bad commit could be any of" my_bisect_log.txt
#	
not ok - 25 bisect skip many ranges
#	
#		git bisect start $HASH7 $HASH1 &&
#		test "$HASH4" = "$(git rev-parse --verify HEAD)" &&
#		git bisect skip $HASH2 $HASH2.. ..$HASH5 &&
#		test "$HASH6" = "$(git rev-parse --verify HEAD)" &&
#		test_must_fail git bisect bad > my_bisect_log.txt &&
#		grep "first bad commit could be any of" my_bisect_log.txt
#	
not ok - 26 bisect starting with a detached HEAD
#	
#		git bisect reset &&
#		git checkout master^ &&
#		HEAD=$(git rev-parse --verify HEAD) &&
#		git bisect start &&
#		test $HEAD = $(cat .git/BISECT_START) &&
#		git bisect reset &&
#		test $HEAD = $(git rev-parse --verify HEAD)
#	
not ok - 27 bisect errors out if bad and good are mistaken
#	
#		git bisect reset &&
#		test_must_fail git bisect start $HASH2 $HASH4 2> rev_list_error &&
#		grep "mistake good and bad" rev_list_error &&
#		git bisect reset
#	
not ok - 28 bisect does not create a "bisect" branch
#	
#		git bisect reset &&
#		git bisect start $HASH7 $HASH1 &&
#		git branch bisect &&
#		rev_hash4=$(git rev-parse --verify HEAD) &&
#		test "$rev_hash4" = "$HASH4" &&
#		git branch -D bisect &&
#		git bisect good &&
#		git branch bisect &&
#		rev_hash6=$(git rev-parse --verify HEAD) &&
#		test "$rev_hash6" = "$HASH6" &&
#		git bisect good > my_bisect_log.txt &&
#		grep "$HASH7 is the first bad commit" my_bisect_log.txt &&
#		git bisect reset &&
#		rev_hash6=$(git rev-parse --verify bisect) &&
#		test "$rev_hash6" = "$HASH6" &&
#		git branch -D bisect
#	
not ok - 29 side branch creation
#	
#		git bisect reset &&
#		git checkout -b side $HASH4 &&
#		add_line_into_file "5(side): first line on a side branch" hello2 &&
#		SIDE_HASH5=$(git rev-parse --verify HEAD) &&
#		add_line_into_file "6(side): second line on a side branch" hello2 &&
#		SIDE_HASH6=$(git rev-parse --verify HEAD) &&
#		add_line_into_file "7(side): third line on a side branch" hello2 &&
#		SIDE_HASH7=$(git rev-parse --verify HEAD)
#	
not ok - 30 good merge base when good and bad are siblings
#	
#		git bisect start "$HASH7" "$SIDE_HASH7" > my_bisect_log.txt &&
#		grep "merge base must be tested" my_bisect_log.txt &&
#		grep $HASH4 my_bisect_log.txt &&
#		git bisect good > my_bisect_log.txt &&
#		test_must_fail grep "merge base must be tested" my_bisect_log.txt &&
#		grep $HASH6 my_bisect_log.txt &&
#		git bisect reset
#	
not ok - 31 skipped merge base when good and bad are siblings
#	
#		git bisect start "$SIDE_HASH7" "$HASH7" > my_bisect_log.txt &&
#		grep "merge base must be tested" my_bisect_log.txt &&
#		grep $HASH4 my_bisect_log.txt &&
#		git bisect skip > my_bisect_log.txt 2>&1 &&
#		grep "warning" my_bisect_log.txt &&
#		grep $SIDE_HASH6 my_bisect_log.txt &&
#		git bisect reset
#	
not ok - 32 bad merge base when good and bad are siblings
#	
#		git bisect start "$HASH7" HEAD > my_bisect_log.txt &&
#		grep "merge base must be tested" my_bisect_log.txt &&
#		grep $HASH4 my_bisect_log.txt &&
#		test_must_fail git bisect bad > my_bisect_log.txt 2>&1 &&
#		grep "merge base $HASH4 is bad" my_bisect_log.txt &&
#		grep "fixed between $HASH4 and \[$SIDE_HASH7\]" my_bisect_log.txt &&
#		git bisect reset
#	
not ok - 33 many merge bases creation
#	
#		git checkout "$SIDE_HASH5" &&
#		git merge -m "merge HASH5 and SIDE_HASH5" "$HASH5" &&
#		A_HASH=$(git rev-parse --verify HEAD) &&
#		git checkout side &&
#		git merge -m "merge HASH7 and SIDE_HASH7" "$HASH7" &&
#		B_HASH=$(git rev-parse --verify HEAD) &&
#		git merge-base --all "$A_HASH" "$B_HASH" > merge_bases.txt &&
#		test $(wc -l < merge_bases.txt) = "2" &&
#		grep "$HASH5" merge_bases.txt &&
#		grep "$SIDE_HASH5" merge_bases.txt
#	
not ok - 34 good merge bases when good and bad are siblings
#	
#		git bisect start "$B_HASH" "$A_HASH" > my_bisect_log.txt &&
#		grep "merge base must be tested" my_bisect_log.txt &&
#		git bisect good > my_bisect_log2.txt &&
#		grep "merge base must be tested" my_bisect_log2.txt &&
#		{
#			{
#				grep "$SIDE_HASH5" my_bisect_log.txt &&
#				grep "$HASH5" my_bisect_log2.txt
#			} || {
#				grep "$SIDE_HASH5" my_bisect_log2.txt &&
#				grep "$HASH5" my_bisect_log.txt
#			}
#		} &&
#		git bisect reset
#	
not ok - 35 optimized merge base checks
#	
#		git bisect start "$HASH7" "$SIDE_HASH7" > my_bisect_log.txt &&
#		grep "merge base must be tested" my_bisect_log.txt &&
#		grep "$HASH4" my_bisect_log.txt &&
#		git bisect good > my_bisect_log2.txt &&
#		test -f ".git/BISECT_ANCESTORS_OK" &&
#		test "$HASH6" = $(git rev-parse --verify HEAD) &&
#		git bisect bad > my_bisect_log3.txt &&
#		git bisect good "$A_HASH" > my_bisect_log4.txt &&
#		grep "merge base must be tested" my_bisect_log4.txt &&
#		test_must_fail test -f ".git/BISECT_ANCESTORS_OK"
#	
not ok - 36 "parallel" side branch creation
#	
#		git bisect reset &&
#		git checkout -b parallel $HASH1 &&
#		mkdir dir1 dir2 &&
#		add_line_into_file "1(para): line 1 on parallel branch" dir1/file1 &&
#		PARA_HASH1=$(git rev-parse --verify HEAD) &&
#		add_line_into_file "2(para): line 2 on parallel branch" dir2/file2 &&
#		PARA_HASH2=$(git rev-parse --verify HEAD) &&
#		add_line_into_file "3(para): line 3 on parallel branch" dir2/file3 &&
#		PARA_HASH3=$(git rev-parse --verify HEAD)
#		git merge -m "merge HASH4 and PARA_HASH3" "$HASH4" &&
#		PARA_HASH4=$(git rev-parse --verify HEAD)
#		add_line_into_file "5(para): add line on parallel branch" dir1/file1 &&
#		PARA_HASH5=$(git rev-parse --verify HEAD)
#		add_line_into_file "6(para): add line on parallel branch" dir2/file2 &&
#		PARA_HASH6=$(git rev-parse --verify HEAD)
#		git merge -m "merge HASH7 and PARA_HASH6" "$HASH7" &&
#		PARA_HASH7=$(git rev-parse --verify HEAD)
#	
not ok - 37 restricting bisection on one dir
#	
#		git bisect reset &&
#		git bisect start HEAD $HASH1 -- dir1 &&
#		para1=$(git rev-parse --verify HEAD) &&
#		test "$para1" = "$PARA_HASH1" &&
#		git bisect bad > my_bisect_log.txt &&
#		grep "$PARA_HASH1 is the first bad commit" my_bisect_log.txt
#	
not ok - 38 restricting bisection on one dir and a file
#	
#		git bisect reset &&
#		git bisect start HEAD $HASH1 -- dir1 hello &&
#		para4=$(git rev-parse --verify HEAD) &&
#		test "$para4" = "$PARA_HASH4" &&
#		git bisect bad &&
#		hash3=$(git rev-parse --verify HEAD) &&
#		test "$hash3" = "$HASH3" &&
#		git bisect good &&
#		hash4=$(git rev-parse --verify HEAD) &&
#		test "$hash4" = "$HASH4" &&
#		git bisect good &&
#		para1=$(git rev-parse --verify HEAD) &&
#		test "$para1" = "$PARA_HASH1" &&
#		git bisect good > my_bisect_log.txt &&
#		grep "$PARA_HASH4 is the first bad commit" my_bisect_log.txt
#	
not ok - 39 skipping away from skipped commit
#	
#		git bisect start $PARA_HASH7 $HASH1 &&
#		para4=$(git rev-parse --verify HEAD) &&
#		test "$para4" = "$PARA_HASH4" &&
#	        git bisect skip &&
#		hash7=$(git rev-parse --verify HEAD) &&
#		test "$hash7" = "$HASH7" &&
#	        git bisect skip &&
#		para3=$(git rev-parse --verify HEAD) &&
#		test "$para3" = "$PARA_HASH3"
#	
not ok - 40 erroring out when using bad path parameters
#	
#		test_must_fail git bisect start $PARA_HASH7 $HASH1 -- foobar 2> error.txt &&
#		grep "bad path parameters" error.txt
#	
# failed 31 among 40 test(s)
1..40
