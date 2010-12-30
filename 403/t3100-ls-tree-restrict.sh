Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3100-ls-tree-restrict/.git/
expecting success: mkdir path2 path2/baz &&
     echo Hi >path0 &&
     if test_have_prereq SYMLINKS
     then
	ln -s path0 path1 &&
	ln -s ../path1 path2/bazbo
	make_expected () {
		cat >expected
	}
     else
	printf path0 > path1 &&
	printf ../path1 > path2/bazbo
	make_expected () {
		sed -e "s/120000 /100644 /" >expected
	}
     fi &&
     echo Lo >path2/foo &&
     echo Mi >path2/baz/b &&
     find path? \( -type f -o -type l \) -print |
     xargs git update-index --add &&
     tree=`git write-tree` &&
     echo $tree
a384d4f8dd786f29d6da4705dee4c2c0bc6b5049

ok 1 - setup

expecting success: git ls-tree $tree >current &&
     make_expected <<\EOF &&
100644 blob X	path0
120000 blob X	path1
040000 tree X	path2
EOF
     test_output

ok 2 - ls-tree plain

expecting success: git ls-tree -r $tree >current &&
     make_expected <<\EOF &&
100644 blob X	path0
120000 blob X	path1
100644 blob X	path2/baz/b
120000 blob X	path2/bazbo
100644 blob X	path2/foo
EOF
     test_output

ok 3 - ls-tree recursive

expecting success: git ls-tree -r -t $tree >current &&
     make_expected <<\EOF &&
100644 blob X	path0
120000 blob X	path1
040000 tree X	path2
040000 tree X	path2/baz
100644 blob X	path2/baz/b
120000 blob X	path2/bazbo
100644 blob X	path2/foo
EOF
     test_output

ok 4 - ls-tree recursive with -t

expecting success: git ls-tree -r -d $tree >current &&
     make_expected <<\EOF &&
040000 tree X	path2
040000 tree X	path2/baz
EOF
     test_output

ok 5 - ls-tree recursive with -d

expecting success: git ls-tree $tree path >current &&
     make_expected <<\EOF &&
EOF
     test_output

ok 6 - ls-tree filtered with path

expecting success: git ls-tree $tree path1 path0 >current &&
     make_expected <<\EOF &&
100644 blob X	path0
120000 blob X	path1
EOF
     test_output

ok 7 - ls-tree filtered with path1 path0

expecting success: git ls-tree $tree path0/ >current &&
     make_expected <<\EOF &&
EOF
     test_output

ok 8 - ls-tree filtered with path0/

expecting success: git ls-tree $tree path2 >current &&
     make_expected <<\EOF &&
040000 tree X	path2
EOF
     test_output
ok 9 - ls-tree filtered with path2

expecting success: git ls-tree $tree path2/ >current &&
     make_expected <<\EOF &&
040000 tree X	path2/baz
120000 blob X	path2/bazbo
100644 blob X	path2/foo
EOF
     test_output

ok 10 - ls-tree filtered with path2/

expecting success: git ls-tree $tree path2/baz >current &&
     make_expected <<\EOF &&
040000 tree X	path2/baz
EOF
     test_output

ok 11 - ls-tree filtered with path2/baz

expecting success: git ls-tree $tree path2/bak >current &&
     make_expected <<\EOF &&
EOF
     test_output

ok 12 - ls-tree filtered with path2/bak

expecting success: git ls-tree -t $tree path2/bak >current &&
     make_expected <<\EOF &&
040000 tree X	path2
EOF
     test_output

ok 13 - ls-tree -t filtered with path2/bak

expecting success: git ls-tree $tree path2/baz path2/bazbo >current &&
     make_expected <<\EOF &&
040000 tree X	path2/baz
120000 blob X	path2/bazbo
EOF
     test_output

ok 14 - ls-tree with one path a prefix of the other

# passed all 14 test(s)
1..14
