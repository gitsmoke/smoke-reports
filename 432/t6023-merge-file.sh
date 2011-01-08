Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6023-merge-file/.git/
expecting success: 
	cp orig.txt test.txt &&
	git merge-file test.txt orig.txt orig.txt &&
	test_cmp test.txt orig.txt


ok 1 - merge with no changes

expecting success: git merge-file test.txt orig.txt new2.txt

ok 2 - merge without conflict

expecting success: 
	mkdir dir &&
	cp new1.txt dir/a.txt &&
	cp orig.txt dir/o.txt &&
	cp new2.txt dir/b.txt &&
	( cd dir && git merge-file a.txt o.txt b.txt )

ok 3 - works in subdirectory

expecting success: git merge-file --quiet test.txt orig.txt new2.txt

ok 4 - merge without conflict (--quiet)
expecting success: git merge-file test2.txt orig.txt new2.txt

ok 5 - merge without conflict (missing LF at EOF)

expecting success: test_cmp test.txt test2.txt

ok 6 - merge result added missing LF

expecting success: test_must_fail git merge-file test.txt orig.txt new3.txt

ok 7 - merge with conflicts

expecting success: test_cmp test.txt expect.txt

ok 8 - expected conflict markers

expecting success: test_must_fail git merge-file -L 1 -L 2 test.txt orig.txt new3.txt

ok 9 - merge with conflicts, using -L
expecting success: test_cmp test.txt expect.txt

ok 10 - expected conflict markers, with -L

expecting success: test_must_fail git merge-file -p orig.txt new1.txt new5.txt > out

ok 11 - conflict in removed tail

expecting success: test_cmp expect out

ok 12 - expected conflict markers

expecting success: 
	test_must_fail git merge-file -p \
		orig.txt "$TEST_DIRECTORY"/test4012.png new1.txt 2> merge.err &&
	grep "Cannot merge binary files" merge.err

error: Cannot merge binary files: /Users/trast/git-smoke/t/test4012.png

ok 13 - binary files cannot be merged

expecting success: 

	test_must_fail git merge-file -p new6.txt new5.txt new7.txt > output &&
	test 1 = $(grep ======= < output | wc -l)



ok 14 - MERGE_ZEALOUS simplifies non-conflicts

expecting success: 

	test_must_fail git merge-file -p \
		new8.txt new5.txt new9.txt > merge.out &&
	test 1 = $(grep ======= < merge.out | wc -l)



ok 15 - ZEALOUS_ALNUM

expecting success: 
	test_must_fail git merge-file -p --diff3 \
		new8.txt new5.txt new9.txt >actual &&
	test_cmp expect actual


ok 16 - "diff3 -m" style output (1)

expecting success: 
	git config merge.conflictstyle diff3 &&
	test_must_fail git merge-file -p \
		new8.txt new5.txt new9.txt >actual &&
	test_cmp expect actual


ok 17 - "diff3 -m" style output (2)

expecting success: 
	test_must_fail git merge-file -p --marker-size=10 \
		new8.txt new5.txt new9.txt >actual &&
	test_cmp expect actual


ok 18 - marker size

# passed all 18 test(s)
1..18
