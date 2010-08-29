ok 1 - setup 1
ok 2 - setup 2
ok 3 - setup 3
ok 4 - setup 4
ok 5 - setup 5
ok 6 - setup 6
ok 7 - setup 7
ok 8 - merge-recursive simple
ok 9 - merge-recursive result
not ok - 10 fail if the index has unresolved entries
#	
#	
#		rm -fr [abcd] &&
#		git checkout -f "$c1" &&
#	
#		test_must_fail git merge "$c5" &&
#		test_must_fail git merge "$c5" 2> out &&
#		grep "not possible because you have unmerged files" out &&
#		git add -u &&
#		test_must_fail git merge "$c5" 2> out &&
#		grep "You have not concluded your merge" out &&
#		rm -f .git/MERGE_HEAD &&
#		test_must_fail git merge "$c5" 2> out &&
#		grep "Your local changes to the following files would be overwritten by merge:" out
#	
ok 11 - merge-recursive remove conflict
ok 12 - merge-recursive remove conflict
ok 13 - merge-recursive d/f simple
ok 14 - merge-recursive result
ok 15 - merge-recursive d/f conflict
ok 16 - merge-recursive d/f conflict result
ok 17 - merge-recursive d/f conflict the other way
ok 18 - merge-recursive d/f conflict result the other way
ok 19 - merge-recursive d/f conflict
not ok - 20 merge-recursive d/f conflict result
#	
#	
#		git ls-files -s >actual &&
#		(
#			echo "100644 $o1 0	a"
#			echo "100644 $o0 0	b"
#			echo "100644 $o0 0	c"
#			echo "100644 $o6 3	d"
#			echo "100644 $o0 1	d/e"
#			echo "100644 $o1 2	d/e"
#		) >expected &&
#		test_cmp expected actual
#	
#	
not ok - 21 merge-recursive d/f conflict
#	
#	
#		rm -fr [abcd] &&
#		git reset --hard &&
#		git checkout -f "$c6" &&
#	
#		git merge-recursive "$c0" -- "$c6" "$c1"
#		status=$?
#		case "$status" in
#		1)
#			: happy
#			;;
#		*)
#			echo >&2 "why status $status!!!"
#			false
#			;;
#		esac
#	
not ok - 22 merge-recursive d/f conflict result
#	
#	
#		git ls-files -s >actual &&
#		(
#			echo "100644 $o1 0	a"
#			echo "100644 $o0 0	b"
#			echo "100644 $o0 0	c"
#			echo "100644 $o6 2	d"
#			echo "100644 $o0 1	d/e"
#			echo "100644 $o1 3	d/e"
#		) >expected &&
#		test_cmp expected actual
#	
#	
not ok - 23 reset and 3-way merge
#	
#	
#		git reset --hard "$c2" &&
#		git read-tree -m "$c0" "$c2" "$c1"
#	
#	
not ok - 24 reset and bind merge
#	
#	
#		git reset --hard master &&
#		git read-tree --prefix=M/ master &&
#		git ls-files -s >actual &&
#		(
#			echo "100644 $o1 0	M/a"
#			echo "100644 $o0 0	M/b"
#			echo "100644 $o0 0	M/c"
#			echo "100644 $o1 0	M/d/e"
#			echo "100644 $o1 0	a"
#			echo "100644 $o0 0	b"
#			echo "100644 $o0 0	c"
#			echo "100644 $o1 0	d/e"
#		) >expected &&
#		test_cmp expected actual &&
#	
#		git read-tree --prefix=a1/ master &&
#		git ls-files -s >actual &&
#		(
#			echo "100644 $o1 0	M/a"
#			echo "100644 $o0 0	M/b"
#			echo "100644 $o0 0	M/c"
#			echo "100644 $o1 0	M/d/e"
#			echo "100644 $o1 0	a"
#			echo "100644 $o1 0	a1/a"
#			echo "100644 $o0 0	a1/b"
#			echo "100644 $o0 0	a1/c"
#			echo "100644 $o1 0	a1/d/e"
#			echo "100644 $o0 0	b"
#			echo "100644 $o0 0	c"
#			echo "100644 $o1 0	d/e"
#		) >expected &&
#		test_cmp expected actual
#	
#		git read-tree --prefix=z/ master &&
#		git ls-files -s >actual &&
#		(
#			echo "100644 $o1 0	M/a"
#			echo "100644 $o0 0	M/b"
#			echo "100644 $o0 0	M/c"
#			echo "100644 $o1 0	M/d/e"
#			echo "100644 $o1 0	a"
#			echo "100644 $o1 0	a1/a"
#			echo "100644 $o0 0	a1/b"
#			echo "100644 $o0 0	a1/c"
#			echo "100644 $o1 0	a1/d/e"
#			echo "100644 $o0 0	b"
#			echo "100644 $o0 0	c"
#			echo "100644 $o1 0	d/e"
#			echo "100644 $o1 0	z/a"
#			echo "100644 $o0 0	z/b"
#			echo "100644 $o0 0	z/c"
#			echo "100644 $o1 0	z/d/e"
#		) >expected &&
#		test_cmp expected actual
#	
#	
not ok - 25 merge removes empty directories
#	
#	
#		git reset --hard master &&
#		git checkout -b rm &&
#		git rm d/e &&
#		git commit -mremoved-d/e &&
#		git checkout master &&
#		git merge -s recursive rm &&
#		test_must_fail test -d d
#	
not ok 26 - merge-recursive simple w/submodule # TODO known breakage
not ok 27 - merge-recursive simple w/submodule result # TODO known breakage
# still have 2 known breakage(s)
# failed 7 among remaining 25 test(s)
1..27
