Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0000-basic/.git/
expecting success: cmp -s /dev/null should-be-empty
ok 1 - .git/objects should be empty after git init in an empty repo.
expecting success: test $(wc -l < full-of-directories) = 3
ok 2 - .git/objects should have 3 subdirectories.
expecting success: 
    :

ok 3 - success is reported like this
checking known breakage: 
    false
not ok 4 - pretend we have a known breakage # TODO known breakage
expecting success: 
    mkdir passing-todo &&
    (cd passing-todo &&
    cat >passing-todo.sh <<EOF &&
#!/bin/sh

test_description='A passing TODO test

This is run in a sub test-lib so that we do not get incorrect passing
metrics
'

# Point to the t/test-lib.sh, which isn't in ../ as usual
TEST_DIRECTORY="/Users/trast/git-smoke/t"
. "$TEST_DIRECTORY"/test-lib.sh

test_expect_failure 'pretend we have fixed a known breakage' '
    :
'

test_done
EOF
    chmod +x passing-todo.sh &&
    ./passing-todo.sh >out 2>err &&
    ! test -s err &&
cat >expect <<EOF &&
ok 1 - pretend we have fixed a known breakage # TODO known breakage
# fixed 1 known breakage(s)
# passed all 1 test(s)
1..1
EOF
    test_cmp expect out)

ok 5 - pretend we have fixed a known breakage (run in sub test-lib)

expecting success: 
    test_have_prereq HAVEIT &&
    haveit=yes


ok 6 - test runs if prerequisite is satisfied

skipping test: unmet prerequisite causes test to be skipped 
    donthaveit=no

ok 7 # skip unmet prerequisite causes test to be skipped (missing DONTHAVEIT)

expecting success: 
    test_have_prereq HAVEIT &&
    test_have_prereq HAVETHIS &&
    haveit=yes


ok 8 - test runs if prerequisites are satisfied

skipping test: unmet prerequisites causes test to be skipped 
    donthaveit=no

ok 9 # skip unmet prerequisites causes test to be skipped (missing DONTHAVEIT of HAVEIT,DONTHAVEIT)

skipping test: unmet prerequisites causes test to be skipped 
    donthaveiteither=no
ok 10 # skip unmet prerequisites causes test to be skipped (missing DONTHAVEIT of DONTHAVEIT,HAVEIT)

expecting success: 
    test_when_finished clean=yes


ok 11 - tests clean up after themselves

expecting success: 
    mkdir failing-cleanup &&
    (cd failing-cleanup &&
    cat >failing-cleanup.sh <<EOF &&
#!/bin/sh

test_description='Failing tests with cleanup commands'

# Point to the t/test-lib.sh, which isn't in ../ as usual
TEST_DIRECTORY="/Users/trast/git-smoke/t"
. "$TEST_DIRECTORY"/test-lib.sh

test_expect_success 'tests clean up even after a failure' '
    touch clean-after-failure &&
    test_when_finished rm clean-after-failure &&
    (exit 1)
'

test_expect_success 'failure to clean up causes the test to fail' '
    test_when_finished "(exit 2)"
'

test_done
EOF
    chmod +x failing-cleanup.sh &&
    test_must_fail ./failing-cleanup.sh >out 2>err &&
    ! test -s err &&
    ! test -f "trash directory.failing-cleanup/clean-after-failure" &&
sed -e 's/Z$//' >expect <<\EOF &&
not ok - 1 tests clean up even after a failure
#	Z
#	    touch clean-after-failure &&
#	    test_when_finished rm clean-after-failure &&
#	    (exit 1)
#	Z
not ok - 2 failure to clean up causes the test to fail
#	Z
#	    test_when_finished "(exit 2)"
#	Z
# failed 2 among 2 test(s)
1..2
EOF
    test_cmp expect out)

ok 12 - tests clean up even on failures

expecting success: 
    test_must_fail git update-index should-be-empty
ok 13 - git update-index without --add should fail adding.
expecting success: git update-index --add should-be-empty

ok 14 - git update-index with --add should succeed.
expecting success: tree=$(git write-tree)

ok 15 - writing tree out with git write-tree

expecting success: test "$tree" = 7bb943559a305bdd6bdee2cef6e5df2413c3d30a

ok 16 - validate object ID of a known tree.

expecting success: 
    test_must_fail git update-index should-be-empty

ok 17 - git update-index without --remove should fail removing.
expecting success: git update-index --remove should-be-empty

ok 18 - git update-index with --remove should be able to remove.

expecting success: tree=$(git write-tree)

ok 19 - git write-tree should be able to write an empty tree.

expecting success: test "$tree" = 4b825dc642cb6eb9a060e54bf8d69288fbee4904

ok 20 - validate object ID of a known tree.

expecting success: find path* ! -type d -print | xargs git update-index --add

ok 21 - adding various types of objects with git update-index --add.

expecting success: git ls-files --stage >current

ok 22 - showing stage with git ls-files --stage

expecting success: test_cmp expected current

ok 23 - validate git ls-files output for a known tree.

expecting success: tree=$(git write-tree)

ok 24 - writing tree out with git write-tree.

expecting success: test "$tree" = "$expectedtree"

ok 25 - validate object ID for a known tree.

expecting success: git ls-tree $tree >current

ok 26 - showing tree with git ls-tree

expecting success: test_cmp expected current

ok 27 - git ls-tree output for a known tree.

expecting success: git ls-tree -r $tree >current

ok 28 - showing tree with git ls-tree -r

expecting success: test_cmp expected current

ok 29 - git ls-tree -r output for a known tree.

expecting success: git ls-tree -r -t $tree >current

ok 30 - showing tree with git ls-tree -r -t

expecting success: test_cmp expected current

ok 31 - git ls-tree -r output for a known tree.

expecting success: ptree=$(git write-tree --prefix=path3)

ok 32 - writing partial tree out with git write-tree --prefix.

expecting success: test "$ptree" = "$expectedptree1"

ok 33 - validate object ID for a known tree.

expecting success: ptree=$(git write-tree --prefix=path3/subp3)

ok 34 - writing partial tree out with git write-tree --prefix.

expecting success: test "$ptree" = "$expectedptree2"

ok 35 - validate object ID for a known tree.

expecting success: git update-index --index-info < badobjects

ok 36 - put invalid objects into the index.

expecting success: 
    test_must_fail git write-tree


ok 37 - writing this tree without --missing-ok.

expecting success: git write-tree --missing-ok
851a367613bb6e1f0b2b518323eafed530b5b4c4

ok 38 - writing this tree with --missing-ok.

expecting success: git read-tree $tree &&
     test -f .git/index &&
     newtree=$(git write-tree) &&
     test "$newtree" = "$tree"

ok 39 - git read-tree followed by write-tree should be idempotent.

expecting success: git diff-files >current && test_cmp current expected >/dev/null

ok 40 - validate git diff-files output for a know cache/work tree state.

expecting success: git update-index --refresh

ok 41 - git update-index --refresh should succeed.

expecting success: git diff-files >current && cmp -s current /dev/null

ok 42 - no diff after checkout and git update-index --refresh.

expecting success: commit0=$(echo NO | git commit-tree $P) &&
     tree=$(git show --pretty=raw $commit0 |
	 sed -n -e "s/^tree //p" -e "/^author /q") &&
     test "z$tree" = "z$P"

ok 43 - git commit-tree records the correct tree in a commit.

expecting success: commit1=$(echo NO | git commit-tree $P -p $commit0) &&
     parent=$(git show --pretty=raw $commit1 |
	 sed -n -e "s/^parent //p" -e "/^author /q") &&
     test "z$commit0" = "z$parent"

ok 44 - git commit-tree records the correct parent in a commit.

expecting success: commit2=$(echo NO | git commit-tree $P -p $commit0 -p $commit0) &&
     parent=$(git show --pretty=raw $commit2 |
	 sed -n -e "s/^parent //p" -e "/^author /q" |
	 sort -u) &&
     test "z$commit0" = "z$parent" &&
     numparent=$(git show --pretty=raw $commit2 |
	 sed -n -e "s/^parent //p" -e "/^author /q" |
	 wc -l) &&
     test $numparent = 1

ok 45 - git commit-tree omits duplicated parent in a commit.

expecting success: 
	mv path0 tmp &&
	mv path2 path0 &&
	mv tmp path2 &&
	git update-index --add --replace path2 path0/file2 &&
	numpath0=$(git ls-files path0 | wc -l) &&
	test $numpath0 = 1


ok 46 - update-index D/F conflict

expecting success: 
	mkdir first &&
	ln -s ../.git first/.git &&
	mkdir second &&
	ln -s ../first second/other &&
	mkdir third &&
	dir="$(cd .git; pwd -P)" &&
	dir2=third/../second/other/.git &&
	test "$dir" = "$(test-path-utils make_absolute_path $dir2)" &&
	file="$dir"/index &&
	test "$file" = "$(test-path-utils make_absolute_path $dir2/index)" &&
	basename=blub &&
	test "$dir/$basename" = "$(cd .git && test-path-utils make_absolute_path "$basename")" &&
	ln -s ../first/file .git/syml &&
	sym="$(cd first; pwd -P)"/file &&
	test "$sym" = "$(test-path-utils make_absolute_path "$dir2/syml")"


ok 47 - absolute path works as expected

expecting success: 

	a=a && # 1
	a=$a$a$a$a$a$a$a$a$a$a$a$a$a$a$a$a && # 16
	a=$a$a$a$a$a$a$a$a$a$a$a$a$a$a$a$a && # 256
	a=$a$a$a$a$a$a$a$a$a$a$a$a$a$a$a$a && # 4096
	a=${a}q &&

	>path4 &&
	git update-index --add path4 &&
	(
		git ls-files -s path4 |
		sed -e "s/	.*/	/" |
		tr -d "
"
		echo "$a"
	) | git update-index --index-info &&
	len=$(git ls-files "a*" | wc -c) &&
	test $len = 4098


ok 48 - very long name in the index handled sanely

# still have 1 known breakage(s)
# passed all remaining 47 test(s)
1..48
