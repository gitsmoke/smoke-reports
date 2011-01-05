Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6030-bisect-porcelain/.git/
expecting success: 
     add_line_into_file "1: Hello World" hello &&
     HASH1=$(git rev-parse --verify HEAD) &&
     add_line_into_file "2: A new day for git" hello &&
     HASH2=$(git rev-parse --verify HEAD) &&
     add_line_into_file "3: Another new day for git" hello &&
     HASH3=$(git rev-parse --verify HEAD) &&
     add_line_into_file "4: Ciao for now" hello &&
     HASH4=$(git rev-parse --verify HEAD)

ok 1 - set up basic repo with 1 file (hello) and 4 commits

expecting success: 
	git bisect reset &&
	git bisect start &&
	git bisect bad $HASH4 &&
	git bisect next
We are not bisecting.
Bisecting: 1 revision left to test after this (roughly 1 step)
[7b7f204a749c3125d5224ed61ea2ae1187ad046f] Add <2: A new day for git> into <hello>.

ok 2 - bisect starts with only one bad

expecting success: 
	git bisect reset &&
	git bisect start &&
	git bisect good $HASH1 || return 1

	if git bisect next
	then
		echo Oops, should have failed.
		false
	else
		:
	fi
ok 3 - bisect does not start with only one good

expecting success: 
	git bisect reset &&
	git bisect start &&
	git bisect good $HASH1 &&
	git bisect bad $HASH4 &&
	git bisect next
Bisecting: 0 revisions left to test after this (roughly 1 step)
[3de952f2416b6084f557ec417709eac740c6818c] Add <3: Another new day for git> into <hello>.
Bisecting: 0 revisions left to test after this (roughly 1 step)
[3de952f2416b6084f557ec417709eac740c6818c] Add <3: Another new day for git> into <hello>.
ok 4 - bisect start with one bad and good

expecting success: 
	git bisect reset &&
	test_must_fail git bisect start foo $HASH1 -- &&
	test_must_fail git bisect start $HASH4 $HASH1 bar -- &&
	test -z "$(git for-each-ref "refs/bisect/*")" &&
	test -z "$(ls .git/BISECT_* 2>/dev/null)" &&
	git bisect start &&
	test_must_fail git bisect good foo $HASH1 &&
	test_must_fail git bisect good $HASH1 bar &&
	test_must_fail git bisect bad frotz &&
	test_must_fail git bisect bad $HASH3 $HASH4 &&
	test_must_fail git bisect skip bar $HASH3 &&
	test_must_fail git bisect skip $HASH1 foo &&
	test -z "$(git for-each-ref "refs/bisect/*")" &&
	git bisect good $HASH1 &&
	git bisect bad $HASH4
Bisecting: 0 revisions left to test after this (roughly 1 step)
[3de952f2416b6084f557ec417709eac740c6818c] Add <3: Another new day for git> into <hello>.

ok 5 - bisect fails if given any junk instead of revs

expecting success: 
	git bisect reset &&
	echo "* master" > branch.expect &&
	git branch > branch.output &&
	cmp branch.expect branch.output

ok 6 - bisect reset: back in the master branch

expecting success: 
	git checkout -b other &&
	git bisect start &&
	git bisect good $HASH1 &&
	git bisect bad $HASH3 &&
	git bisect reset &&
	echo "  master" > branch.expect &&
	echo "* other" >> branch.expect &&
	git branch > branch.output &&
	cmp branch.expect branch.output
Bisecting: 0 revisions left to test after this (roughly 0 steps)
[7b7f204a749c3125d5224ed61ea2ae1187ad046f] Add <2: A new day for git> into <hello>.
ok 7 - bisect reset: back in another branch

expecting success: 
	git bisect reset &&
	git branch > branch.output &&
	cmp branch.expect branch.output
We are not bisecting.

ok 8 - bisect reset when not bisecting

expecting success: 
	git bisect reset &&
	git bisect start &&
	git bisect good $HASH1 &&
	git bisect bad $HASH3 &&
	git pack-refs --all --prune &&
	git bisect next &&
	git bisect reset &&
	test -z "$(git for-each-ref "refs/bisect/*")" &&
	test -z "$(git for-each-ref "refs/heads/bisect")"
We are not bisecting.
Bisecting: 0 revisions left to test after this (roughly 0 steps)
[7b7f204a749c3125d5224ed61ea2ae1187ad046f] Add <2: A new day for git> into <hello>.
Bisecting: 0 revisions left to test after this (roughly 0 steps)
[7b7f204a749c3125d5224ed61ea2ae1187ad046f] Add <2: A new day for git> into <hello>.
ok 9 - bisect reset removes packed refs
expecting success: 
	git branch > branch.output &&
	grep "* other" branch.output > /dev/null &&
	git bisect start $HASH4 $HASH1 -- &&
	git bisect good &&
	git bisect start $HASH4 $HASH1 -- &&
	git bisect bad &&
	git bisect reset &&
	git branch > branch.output &&
	grep "* other" branch.output > /dev/null
Bisecting: 0 revisions left to test after this (roughly 1 step)
[3de952f2416b6084f557ec417709eac740c6818c] Add <3: Another new day for git> into <hello>.
32a594a3fdac2d57cf6d02987e30eec68511498c is the first bad commit
commit 32a594a3fdac2d57cf6d02987e30eec68511498c
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:16:13 2005 -0700

    Add <4: Ciao for now> into <hello>.

:100644 100644 2601b1193ce6251a6a1a51885a2f660dd931b5d8 af8e44a1153de8c58d0e2cfd9b1da2ac1959e9ff M	hello
Bisecting: 0 revisions left to test after this (roughly 1 step)
[3de952f2416b6084f557ec417709eac740c6818c] Add <3: Another new day for git> into <hello>.
Bisecting: 0 revisions left to test after this (roughly 0 steps)
[7b7f204a749c3125d5224ed61ea2ae1187ad046f] Add <2: A new day for git> into <hello>.
ok 10 - bisect start: back in good branch

expecting success: 
	git bisect start $HASH4 $HASH1 -- &&
	git bisect good &&
	test_must_fail git bisect start $HASH4 foo -- &&
	git branch > branch.output &&
	grep "* other" branch.output > /dev/null &&
	test_must_fail test -e .git/BISECT_START
Bisecting: 0 revisions left to test after this (roughly 1 step)
[3de952f2416b6084f557ec417709eac740c6818c] Add <3: Another new day for git> into <hello>.
32a594a3fdac2d57cf6d02987e30eec68511498c is the first bad commit
commit 32a594a3fdac2d57cf6d02987e30eec68511498c
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:16:13 2005 -0700

    Add <4: Ciao for now> into <hello>.

:100644 100644 2601b1193ce6251a6a1a51885a2f660dd931b5d8 af8e44a1153de8c58d0e2cfd9b1da2ac1959e9ff M	hello
ok 11 - bisect start: no ".git/BISECT_START" if junk rev

expecting success: 
	git bisect start $HASH4 $HASH1 -- &&
	git bisect good &&
	test_must_fail git bisect start $HASH1 $HASH4 -- &&
	git branch > branch.output &&
	grep "* other" branch.output > /dev/null &&
	test_must_fail test -e .git/BISECT_START
Bisecting: 0 revisions left to test after this (roughly 1 step)
[3de952f2416b6084f557ec417709eac740c6818c] Add <3: Another new day for git> into <hello>.
32a594a3fdac2d57cf6d02987e30eec68511498c is the first bad commit
commit 32a594a3fdac2d57cf6d02987e30eec68511498c
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:16:13 2005 -0700

    Add <4: Ciao for now> into <hello>.

:100644 100644 2601b1193ce6251a6a1a51885a2f660dd931b5d8 af8e44a1153de8c58d0e2cfd9b1da2ac1959e9ff M	hello
ok 12 - bisect start: no ".git/BISECT_START" if mistaken rev
expecting success: 
	echo "temp stuff" > hello &&
	test_must_fail git bisect start $HASH4 $HASH1 -- &&
	git branch &&
	git branch > branch.output &&
	grep "* other" branch.output > /dev/null &&
	test_must_fail test -e .git/BISECT_START &&
	test -z "$(git for-each-ref "refs/bisect/*")" &&
	git checkout HEAD hello
Bisecting: 0 revisions left to test after this (roughly 1 step)
Aborting
  master
* other

ok 13 - bisect start: no ".git/BISECT_START" if checkout error
expecting success: 
	git bisect reset &&
	git bisect start $HASH4 $HASH1 &&
	git bisect skip &&
	git bisect bad > my_bisect_log.txt &&
	grep "$HASH2 is the first bad commit" my_bisect_log.txt &&
	git bisect reset
We are not bisecting.
Bisecting: 0 revisions left to test after this (roughly 1 step)
[3de952f2416b6084f557ec417709eac740c6818c] Add <3: Another new day for git> into <hello>.
Bisecting: 0 revisions left to test after this (roughly 1 step)
[7b7f204a749c3125d5224ed61ea2ae1187ad046f] Add <2: A new day for git> into <hello>.
7b7f204a749c3125d5224ed61ea2ae1187ad046f is the first bad commit
ok 14 - bisect skip: successfull result
expecting success: 
	git bisect start $HASH4 $HASH1 &&
	git bisect skip || return 1

	if git bisect skip > my_bisect_log.txt
	then
		echo Oops, should have failed.
		false
	else
		test $? -eq 2 &&
		grep "first bad commit could be any of" my_bisect_log.txt &&
		! grep $HASH1 my_bisect_log.txt &&
		grep $HASH2 my_bisect_log.txt &&
		grep $HASH3 my_bisect_log.txt &&
		grep $HASH4 my_bisect_log.txt &&
		git bisect reset
	fi
Bisecting: 0 revisions left to test after this (roughly 1 step)
[3de952f2416b6084f557ec417709eac740c6818c] Add <3: Another new day for git> into <hello>.
Bisecting: 0 revisions left to test after this (roughly 1 step)
[7b7f204a749c3125d5224ed61ea2ae1187ad046f] Add <2: A new day for git> into <hello>.
The first bad commit could be any of:
7b7f204a749c3125d5224ed61ea2ae1187ad046f
3de952f2416b6084f557ec417709eac740c6818c
32a594a3fdac2d57cf6d02987e30eec68511498c
ok 15 - bisect skip: cannot tell between 3 commits

expecting success: 
	git bisect start $HASH4 $HASH1 &&
	git bisect skip || return 1

	if git bisect good > my_bisect_log.txt
	then
		echo Oops, should have failed.
		false
	else
		test $? -eq 2 &&
		grep "first bad commit could be any of" my_bisect_log.txt &&
		! grep $HASH1 my_bisect_log.txt &&
		! grep $HASH2 my_bisect_log.txt &&
		grep $HASH3 my_bisect_log.txt &&
		grep $HASH4 my_bisect_log.txt &&
		git bisect reset
	fi
Bisecting: 0 revisions left to test after this (roughly 1 step)
[3de952f2416b6084f557ec417709eac740c6818c] Add <3: Another new day for git> into <hello>.
Bisecting: 0 revisions left to test after this (roughly 1 step)
[7b7f204a749c3125d5224ed61ea2ae1187ad046f] Add <2: A new day for git> into <hello>.
The first bad commit could be any of:
3de952f2416b6084f557ec417709eac740c6818c
32a594a3fdac2d57cf6d02987e30eec68511498c
ok 16 - bisect skip: cannot tell between 2 commits
expecting success: 
	git bisect start &&
	git bisect skip &&
	git bisect bad &&
	git bisect good $HASH1 &&
	git bisect skip &&
	if git bisect good > my_bisect_log.txt
	then
		echo Oops, should have failed.
		false
	else
		test $? -eq 2 &&
		grep "first bad commit could be any of" my_bisect_log.txt &&
		! grep $HASH1 my_bisect_log.txt &&
		! grep $HASH2 my_bisect_log.txt &&
		grep $HASH3 my_bisect_log.txt &&
		grep $HASH4 my_bisect_log.txt &&
		git bisect reset
	fi
Bisecting: 0 revisions left to test after this (roughly 1 step)
[3de952f2416b6084f557ec417709eac740c6818c] Add <3: Another new day for git> into <hello>.
Bisecting: 0 revisions left to test after this (roughly 1 step)
[7b7f204a749c3125d5224ed61ea2ae1187ad046f] Add <2: A new day for git> into <hello>.
The first bad commit could be any of:
3de952f2416b6084f557ec417709eac740c6818c
32a594a3fdac2d57cf6d02987e30eec68511498c

ok 17 - bisect skip: with commit both bad and skipped

expecting success: echo "#"\!"/bin/sh" > test_script.sh &&
     echo "grep Another hello > /dev/null" >> test_script.sh &&
     echo "test \$? -ne 0" >> test_script.sh &&
     chmod +x test_script.sh &&
     git bisect start &&
     git bisect good $HASH1 &&
     git bisect bad $HASH4 &&
     git bisect run ./test_script.sh > my_bisect_log.txt &&
     grep "$HASH3 is the first bad commit" my_bisect_log.txt &&
     git bisect reset
Bisecting: 0 revisions left to test after this (roughly 1 step)
[3de952f2416b6084f557ec417709eac740c6818c] Add <3: Another new day for git> into <hello>.
3de952f2416b6084f557ec417709eac740c6818c is the first bad commit

ok 18 - "git bisect run" simple case

expecting success: echo "#"\!"/bin/sh" > test_script.sh &&
     echo "grep Ciao hello > /dev/null" >> test_script.sh &&
     echo "test \$? -ne 0" >> test_script.sh &&
     chmod +x test_script.sh &&
     git bisect start $HASH4 $HASH1 &&
     git bisect run ./test_script.sh > my_bisect_log.txt &&
     grep "$HASH4 is the first bad commit" my_bisect_log.txt &&
     git bisect reset
Bisecting: 0 revisions left to test after this (roughly 1 step)
[3de952f2416b6084f557ec417709eac740c6818c] Add <3: Another new day for git> into <hello>.
32a594a3fdac2d57cf6d02987e30eec68511498c is the first bad commit
ok 19 - "git bisect run" with more complex "git bisect start"
expecting success: 
	add_line_into_file "5: Another new line." hello &&
	HASH5=$(git rev-parse --verify HEAD) &&
	git bisect start $HASH5 $HASH1 &&
	git bisect skip &&
	git bisect good > my_bisect_log.txt &&
	grep "$HASH5 is the first bad commit" my_bisect_log.txt &&
	git bisect log > log_to_replay.txt &&
	git bisect reset
Bisecting: 1 revision left to test after this (roughly 1 step)
[3de952f2416b6084f557ec417709eac740c6818c] Add <3: Another new day for git> into <hello>.
Bisecting: 1 revision left to test after this (roughly 1 step)
[32a594a3fdac2d57cf6d02987e30eec68511498c] Add <4: Ciao for now> into <hello>.
3082e11d3a0f2edca194c8ce1eb802256e38e75e is the first bad commit

ok 20 - bisect skip: add line and then a new test

expecting success: 
	git bisect replay log_to_replay.txt > my_bisect_log.txt &&
	grep "$HASH5 is the first bad commit" my_bisect_log.txt &&
	git bisect reset

3082e11d3a0f2edca194c8ce1eb802256e38e75e is the first bad commit

ok 21 - bisect skip and bisect replay

expecting success: 
	add_line_into_file "6: Yet a line." hello &&
	HASH6=$(git rev-parse --verify HEAD) &&
	echo "#"\!"/bin/sh" > test_script.sh &&
	echo "sed -ne \\$p hello | grep Ciao > /dev/null && exit 125" >> test_script.sh &&
	echo "grep line hello > /dev/null" >> test_script.sh &&
	echo "test \$? -ne 0" >> test_script.sh &&
	chmod +x test_script.sh &&
	git bisect start $HASH6 $HASH1 &&
	if git bisect run ./test_script.sh > my_bisect_log.txt
	then
		echo Oops, should have failed.
		false
	else
		test $? -eq 2 &&
		grep "first bad commit could be any of" my_bisect_log.txt &&
		! grep $HASH3 my_bisect_log.txt &&
		! grep $HASH6 my_bisect_log.txt &&
		grep $HASH4 my_bisect_log.txt &&
		grep $HASH5 my_bisect_log.txt
	fi

Bisecting: 2 revisions left to test after this (roughly 1 step)
[3de952f2416b6084f557ec417709eac740c6818c] Add <3: Another new day for git> into <hello>.
The first bad commit could be any of:
[32a594a3fdac2d57cf6d02987e30eec68511498c] Add <4: Ciao for now> into <hello>.
32a594a3fdac2d57cf6d02987e30eec68511498c
[3082e11d3a0f2edca194c8ce1eb802256e38e75e] Add <5: Another new line.> into <hello>.
3082e11d3a0f2edca194c8ce1eb802256e38e75e

ok 22 - bisect run & skip: cannot tell between 2

expecting success: 
	git bisect reset &&
	add_line_into_file "7: Should be the last line." hello &&
	HASH7=$(git rev-parse --verify HEAD) &&
	echo "#"\!"/bin/sh" > test_script.sh &&
	echo "sed -ne \\$p hello | grep Ciao > /dev/null && exit 125" >> test_script.sh &&
	echo "sed -ne \\$p hello | grep day > /dev/null && exit 125" >> test_script.sh &&
	echo "grep Yet hello > /dev/null" >> test_script.sh &&
	echo "test \$? -ne 0" >> test_script.sh &&
	chmod +x test_script.sh &&
	git bisect start $HASH7 $HASH1 &&
	git bisect run ./test_script.sh > my_bisect_log.txt &&
	grep "$HASH6 is the first bad commit" my_bisect_log.txt

Bisecting: 2 revisions left to test after this (roughly 2 steps)
[32a594a3fdac2d57cf6d02987e30eec68511498c] Add <4: Ciao for now> into <hello>.
ff29dcbe6fe49a0b462bddf0691a013c12a53316 is the first bad commit

ok 23 - bisect run & skip: find first bad

expecting success: 
	git bisect reset &&
	git bisect start $HASH7 $HASH1 &&
	git bisect skip $HASH1..$HASH5 &&
	test "$HASH6" = "$(git rev-parse --verify HEAD)" &&
	test_must_fail git bisect bad > my_bisect_log.txt &&
	grep "first bad commit could be any of" my_bisect_log.txt
Bisecting: 2 revisions left to test after this (roughly 2 steps)
[32a594a3fdac2d57cf6d02987e30eec68511498c] Add <4: Ciao for now> into <hello>.
Bisecting: 2 revisions left to test after this (roughly 2 steps)
[ff29dcbe6fe49a0b462bddf0691a013c12a53316] Add <6: Yet a line.> into <hello>.
The first bad commit could be any of:

ok 24 - bisect skip only one range

expecting success: 
	git bisect start $HASH7 $HASH1 &&
	test "$HASH4" = "$(git rev-parse --verify HEAD)" &&
	git bisect skip $HASH2 $HASH2.. ..$HASH5 &&
	test "$HASH6" = "$(git rev-parse --verify HEAD)" &&
	test_must_fail git bisect bad > my_bisect_log.txt &&
	grep "first bad commit could be any of" my_bisect_log.txt

Bisecting: 2 revisions left to test after this (roughly 2 steps)
[32a594a3fdac2d57cf6d02987e30eec68511498c] Add <4: Ciao for now> into <hello>.
Bisecting: 2 revisions left to test after this (roughly 2 steps)
[ff29dcbe6fe49a0b462bddf0691a013c12a53316] Add <6: Yet a line.> into <hello>.
The first bad commit could be any of:
ok 25 - bisect skip many ranges
expecting success: 
	git bisect reset &&
	git checkout master^ &&
	HEAD=$(git rev-parse --verify HEAD) &&
	git bisect start &&
	test $HEAD = $(cat .git/BISECT_START) &&
	git bisect reset &&
	test $HEAD = $(git rev-parse --verify HEAD)
ok 26 - bisect starting with a detached HEAD
expecting success: 
	git bisect reset &&
	test_must_fail git bisect start $HASH2 $HASH4 2> rev_list_error &&
	grep "mistake good and bad" rev_list_error &&
	git bisect reset
We are not bisecting.
Maybe you mistake good and bad revs?
We are not bisecting.
ok 27 - bisect errors out if bad and good are mistaken
expecting success: 
	git bisect reset &&
	git bisect start $HASH7 $HASH1 &&
	git branch bisect &&
	rev_hash4=$(git rev-parse --verify HEAD) &&
	test "$rev_hash4" = "$HASH4" &&
	git branch -D bisect &&
	git bisect good &&
	git branch bisect &&
	rev_hash6=$(git rev-parse --verify HEAD) &&
	test "$rev_hash6" = "$HASH6" &&
	git bisect good > my_bisect_log.txt &&
	grep "$HASH7 is the first bad commit" my_bisect_log.txt &&
	git bisect reset &&
	rev_hash6=$(git rev-parse --verify bisect) &&
	test "$rev_hash6" = "$HASH6" &&
	git branch -D bisect
We are not bisecting.
Bisecting: 2 revisions left to test after this (roughly 2 steps)
[32a594a3fdac2d57cf6d02987e30eec68511498c] Add <4: Ciao for now> into <hello>.
Deleted branch bisect (was 32a594a).
Bisecting: 0 revisions left to test after this (roughly 1 step)
[ff29dcbe6fe49a0b462bddf0691a013c12a53316] Add <6: Yet a line.> into <hello>.
3659270ffa1e67547111a107f53191676dff3424 is the first bad commit
Deleted branch bisect (was ff29dcb).

ok 28 - bisect does not create a "bisect" branch
expecting success: 
	git bisect reset &&
	git checkout -b side $HASH4 &&
	add_line_into_file "5(side): first line on a side branch" hello2 &&
	SIDE_HASH5=$(git rev-parse --verify HEAD) &&
	add_line_into_file "6(side): second line on a side branch" hello2 &&
	SIDE_HASH6=$(git rev-parse --verify HEAD) &&
	add_line_into_file "7(side): third line on a side branch" hello2 &&
	SIDE_HASH7=$(git rev-parse --verify HEAD)
We are not bisecting.
ok 29 - side branch creation
expecting success: 
	git bisect start "$HASH7" "$SIDE_HASH7" > my_bisect_log.txt &&
	grep "merge base must be tested" my_bisect_log.txt &&
	grep $HASH4 my_bisect_log.txt &&
	git bisect good > my_bisect_log.txt &&
	test_must_fail grep "merge base must be tested" my_bisect_log.txt &&
	grep $HASH6 my_bisect_log.txt &&
	git bisect reset
Bisecting: a merge base must be tested
[32a594a3fdac2d57cf6d02987e30eec68511498c] Add <4: Ciao for now> into <hello>.
[ff29dcbe6fe49a0b462bddf0691a013c12a53316] Add <6: Yet a line.> into <hello>.

ok 30 - good merge base when good and bad are siblings

expecting success: 
	git bisect start "$SIDE_HASH7" "$HASH7" > my_bisect_log.txt &&
	grep "merge base must be tested" my_bisect_log.txt &&
	grep $HASH4 my_bisect_log.txt &&
	git bisect skip > my_bisect_log.txt 2>&1 &&
	grep "warning" my_bisect_log.txt &&
	grep $SIDE_HASH6 my_bisect_log.txt &&
	git bisect reset

Bisecting: a merge base must be tested
[32a594a3fdac2d57cf6d02987e30eec68511498c] Add <4: Ciao for now> into <hello>.
warning: the merge base between 5f781ef4cb0a9c22dd8218d08759770f336c6b8b and [3659270ffa1e67547111a107f53191676dff3424] must be skipped.
[11ec2d5fe9fe0e901ce1c6680bb1025a3431ebcf] Add <6(side): second line on a side branch> into <hello2>.

ok 31 - skipped merge base when good and bad are siblings

expecting success: 
	git bisect start "$HASH7" HEAD > my_bisect_log.txt &&
	grep "merge base must be tested" my_bisect_log.txt &&
	grep $HASH4 my_bisect_log.txt &&
	test_must_fail git bisect bad > my_bisect_log.txt 2>&1 &&
	grep "merge base $HASH4 is bad" my_bisect_log.txt &&
	grep "fixed between $HASH4 and \[$SIDE_HASH7\]" my_bisect_log.txt &&
	git bisect reset

Bisecting: a merge base must be tested
[32a594a3fdac2d57cf6d02987e30eec68511498c] Add <4: Ciao for now> into <hello>.
The merge base 32a594a3fdac2d57cf6d02987e30eec68511498c is bad.
This means the bug has been fixed between 32a594a3fdac2d57cf6d02987e30eec68511498c and [5f781ef4cb0a9c22dd8218d08759770f336c6b8b].

ok 32 - bad merge base when good and bad are siblings

expecting success: 
	git checkout "$SIDE_HASH5" &&
	git merge -m "merge HASH5 and SIDE_HASH5" "$HASH5" &&
	A_HASH=$(git rev-parse --verify HEAD) &&
	git checkout side &&
	git merge -m "merge HASH7 and SIDE_HASH7" "$HASH7" &&
	B_HASH=$(git rev-parse --verify HEAD) &&
	git merge-base --all "$A_HASH" "$B_HASH" > merge_bases.txt &&
	test $(wc -l < merge_bases.txt) = "2" &&
	grep "$HASH5" merge_bases.txt &&
	grep "$SIDE_HASH5" merge_bases.txt

Merging:
7208484 Create file <hello2> with <5(side): first line on a side branch> inside.
virtual 3082e11d3a0f2edca194c8ce1eb802256e38e75e
found 1 common ancestor(s):
32a594a Add <4: Ciao for now> into <hello>.
Merge made by recursive.
 hello |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
Merging:
5f781ef Add <7(side): third line on a side branch> into <hello2>.
virtual 3659270ffa1e67547111a107f53191676dff3424
found 1 common ancestor(s):
32a594a Add <4: Ciao for now> into <hello>.
Merge made by recursive.
 hello |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
3082e11d3a0f2edca194c8ce1eb802256e38e75e
7208484534e368cca8612445f78d2afcf429f37e

ok 33 - many merge bases creation

expecting success: 
	git bisect start "$B_HASH" "$A_HASH" > my_bisect_log.txt &&
	grep "merge base must be tested" my_bisect_log.txt &&
	git bisect good > my_bisect_log2.txt &&
	grep "merge base must be tested" my_bisect_log2.txt &&
	{
		{
			grep "$SIDE_HASH5" my_bisect_log.txt &&
			grep "$HASH5" my_bisect_log2.txt
		} || {
			grep "$SIDE_HASH5" my_bisect_log2.txt &&
			grep "$HASH5" my_bisect_log.txt
		}
	} &&
	git bisect reset
Bisecting: a merge base must be tested
Bisecting: a merge base must be tested
[7208484534e368cca8612445f78d2afcf429f37e] Create file <hello2> with <5(side): first line on a side branch> inside.
[3082e11d3a0f2edca194c8ce1eb802256e38e75e] Add <5: Another new line.> into <hello>.
ok 34 - good merge bases when good and bad are siblings
expecting success: 
	git bisect start "$HASH7" "$SIDE_HASH7" > my_bisect_log.txt &&
	grep "merge base must be tested" my_bisect_log.txt &&
	grep "$HASH4" my_bisect_log.txt &&
	git bisect good > my_bisect_log2.txt &&
	test -f ".git/BISECT_ANCESTORS_OK" &&
	test "$HASH6" = $(git rev-parse --verify HEAD) &&
	git bisect bad > my_bisect_log3.txt &&
	git bisect good "$A_HASH" > my_bisect_log4.txt &&
	grep "merge base must be tested" my_bisect_log4.txt &&
	test_must_fail test -f ".git/BISECT_ANCESTORS_OK"
Bisecting: a merge base must be tested
[32a594a3fdac2d57cf6d02987e30eec68511498c] Add <4: Ciao for now> into <hello>.
Bisecting: a merge base must be tested

ok 35 - optimized merge base checks

expecting success: 
	git bisect reset &&
	git checkout -b parallel $HASH1 &&
	mkdir dir1 dir2 &&
	add_line_into_file "1(para): line 1 on parallel branch" dir1/file1 &&
	PARA_HASH1=$(git rev-parse --verify HEAD) &&
	add_line_into_file "2(para): line 2 on parallel branch" dir2/file2 &&
	PARA_HASH2=$(git rev-parse --verify HEAD) &&
	add_line_into_file "3(para): line 3 on parallel branch" dir2/file3 &&
	PARA_HASH3=$(git rev-parse --verify HEAD) &&
	git merge -m "merge HASH4 and PARA_HASH3" "$HASH4" &&
	PARA_HASH4=$(git rev-parse --verify HEAD) &&
	add_line_into_file "5(para): add line on parallel branch" dir1/file1 &&
	PARA_HASH5=$(git rev-parse --verify HEAD) &&
	add_line_into_file "6(para): add line on parallel branch" dir2/file2 &&
	PARA_HASH6=$(git rev-parse --verify HEAD) &&
	git merge -m "merge HASH7 and PARA_HASH6" "$HASH7" &&
	PARA_HASH7=$(git rev-parse --verify HEAD)

Merging:
a5a4dc8 Create file <dir2/file3> with <3(para): line 3 on parallel branch> inside.
virtual 32a594a3fdac2d57cf6d02987e30eec68511498c
found 1 common ancestor(s):
88bcdc1 Create file <hello> with <1: Hello World> inside.
Merge made by recursive.
 hello |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
Merging:
6d284ea Add <6(para): add line on parallel branch> into <dir2/file2>.
virtual 3659270ffa1e67547111a107f53191676dff3424
found 1 common ancestor(s):
32a594a Add <4: Ciao for now> into <hello>.
Merge made by recursive.
 hello |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

ok 36 - "parallel" side branch creation

expecting success: 
	git bisect reset &&
	git bisect start HEAD $HASH1 -- dir1 &&
	para1=$(git rev-parse --verify HEAD) &&
	test "$para1" = "$PARA_HASH1" &&
	git bisect bad > my_bisect_log.txt &&
	grep "$PARA_HASH1 is the first bad commit" my_bisect_log.txt

We are not bisecting.
Bisecting: 0 revisions left to test after this (roughly 0 steps)
[de049b9c4e10f2524a46e151b65aa4f156fd52d6] Create file <dir1/file1> with <1(para): line 1 on parallel branch> inside.
de049b9c4e10f2524a46e151b65aa4f156fd52d6 is the first bad commit
ok 37 - restricting bisection on one dir
expecting success: 
	git bisect reset &&
	git bisect start HEAD $HASH1 -- dir1 hello &&
	para4=$(git rev-parse --verify HEAD) &&
	test "$para4" = "$PARA_HASH4" &&
	git bisect bad &&
	hash3=$(git rev-parse --verify HEAD) &&
	test "$hash3" = "$HASH3" &&
	git bisect good &&
	hash4=$(git rev-parse --verify HEAD) &&
	test "$hash4" = "$HASH4" &&
	git bisect good &&
	para1=$(git rev-parse --verify HEAD) &&
	test "$para1" = "$PARA_HASH1" &&
	git bisect good > my_bisect_log.txt &&
	grep "$PARA_HASH4 is the first bad commit" my_bisect_log.txt
Bisecting: 4 revisions left to test after this (roughly 2 steps)
[3f04efc661812c541a2f96ecaae46a79c6ea2464] merge HASH4 and PARA_HASH3
Bisecting: 2 revisions left to test after this (roughly 1 step)
[3de952f2416b6084f557ec417709eac740c6818c] Add <3: Another new day for git> into <hello>.
Bisecting: 1 revision left to test after this (roughly 1 step)
[32a594a3fdac2d57cf6d02987e30eec68511498c] Add <4: Ciao for now> into <hello>.
Bisecting: 0 revisions left to test after this (roughly 0 steps)
[de049b9c4e10f2524a46e151b65aa4f156fd52d6] Create file <dir1/file1> with <1(para): line 1 on parallel branch> inside.
3f04efc661812c541a2f96ecaae46a79c6ea2464 is the first bad commit

ok 38 - restricting bisection on one dir and a file

expecting success: 
	git bisect start $PARA_HASH7 $HASH1 &&
	para4=$(git rev-parse --verify HEAD) &&
	test "$para4" = "$PARA_HASH4" &&
        git bisect skip &&
	hash7=$(git rev-parse --verify HEAD) &&
	test "$hash7" = "$HASH7" &&
        git bisect skip &&
	para3=$(git rev-parse --verify HEAD) &&
	test "$para3" = "$PARA_HASH3"

Bisecting: 5 revisions left to test after this (roughly 3 steps)
[3f04efc661812c541a2f96ecaae46a79c6ea2464] merge HASH4 and PARA_HASH3
Bisecting: 6 revisions left to test after this (roughly 3 steps)
[3659270ffa1e67547111a107f53191676dff3424] Add <7: Should be the last line.> into <hello>.
Bisecting: 6 revisions left to test after this (roughly 3 steps)
[a5a4dc83955e310a4f693ab6f6bcea46c8544843] Create file <dir2/file3> with <3(para): line 3 on parallel branch> inside.

ok 39 - skipping away from skipped commit

expecting success: 
	test_must_fail git bisect start $PARA_HASH7 $HASH1 -- foobar 2> error.txt &&
	grep "bad path parameters" error.txt
Maybe you started with bad path parameters?
ok 40 - erroring out when using bad path parameters

# passed all 40 test(s)
1..40
