Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3101-ls-tree-dirname/.git/
expecting success: 
	echo 111 >1.txt &&
	echo 222 >2.txt &&
	mkdir path0 path0/a path0/a/b path0/a/b/c &&
	echo 111 >path0/a/b/c/1.txt &&
	mkdir path1 path1/b path1/b/c &&
	echo 111 >path1/b/c/1.txt &&
	mkdir path2 &&
	echo 111 >path2/1.txt &&
	mkdir path3 &&
	echo 111 >path3/1.txt &&
	echo 222 >path3/2.txt &&
	find *.txt path* \( -type f -o -type l \) -print |
	xargs git update-index --add &&
	tree=`git write-tree` &&
	echo $tree
ef2ea4d6de8ec0863f430e4cad7468ce74f60aa7

ok 1 - setup

expecting success: 
	git ls-tree $tree >current &&
	cat >expected <<\EOF &&
100644 blob X	1.txt
100644 blob X	2.txt
040000 tree X	path0
040000 tree X	path1
040000 tree X	path2
040000 tree X	path3
EOF
	test_output


ok 2 - ls-tree plain

expecting success: 
	git ls-tree -r $tree >current &&
	cat >expected <<\EOF &&
100644 blob X	1.txt
100644 blob X	2.txt
100644 blob X	path0/a/b/c/1.txt
100644 blob X	path1/b/c/1.txt
100644 blob X	path2/1.txt
100644 blob X	path3/1.txt
100644 blob X	path3/2.txt
EOF
	test_output


ok 3 - ls-tree recursive

expecting success: 
	git ls-tree $tree 1.txt >current &&
	cat >expected <<\EOF &&
100644 blob X	1.txt
EOF
	test_output


ok 4 - ls-tree filter 1.txt

expecting success: 
	git ls-tree $tree path1/b/c/1.txt >current &&
	cat >expected <<\EOF &&
100644 blob X	path1/b/c/1.txt
EOF
	test_output

ok 5 - ls-tree filter path1/b/c/1.txt

expecting success: 
	git ls-tree $tree 1.txt path0/a/b/c/1.txt \
		path1/b/c/1.txt path2/1.txt path3/1.txt >current &&
	cat >expected <<\EOF &&
100644 blob X	1.txt
100644 blob X	path0/a/b/c/1.txt
100644 blob X	path1/b/c/1.txt
100644 blob X	path2/1.txt
100644 blob X	path3/1.txt
EOF
	test_output

ok 6 - ls-tree filter all 1.txt files

expecting success: 
	git ls-tree $tree path3 path2 path0/a/b/c path1/b/c path0/a >current &&
	cat >expected <<\EOF &&
040000 tree X	path0/a/b/c
040000 tree X	path1/b/c
040000 tree X	path2
040000 tree X	path3
EOF
	test_output

ok 7 - ls-tree filter directories

expecting success: 
	git ls-tree $tree 1.txt ./1.txt .//1.txt \
		path3/1.txt path3/./1.txt path3 path3// >current &&
	cat >expected <<\EOF &&
100644 blob X	1.txt
100644 blob X	path3/1.txt
100644 blob X	path3/2.txt
EOF
	test_output

ok 8 - ls-tree filter odd names

expecting success: 
	git ls-tree $tree 1.txt/ abc.txt \
		path3//23.txt path3/2.txt/// >current &&
	>expected &&
	test_output

ok 9 - ls-tree filter missing files and extra slashes

expecting success: 
	git ls-tree $tree pa path3/a >current &&
	>expected &&
	test_output

ok 10 - ls-tree filter is leading path match

expecting success: 
	(
		cd path0 &&
		git ls-tree --full-name $tree a
	) >current &&
	cat >expected <<\EOF &&
040000 tree X	path0/a
EOF
	test_output

ok 11 - ls-tree --full-name

expecting success: 
	(
		cd path1/b/c &&
		git ls-tree --full-tree $tree
	) >current &&
	cat >expected <<\EOF &&
100644 blob X	1.txt
100644 blob X	2.txt
040000 tree X	path0
040000 tree X	path1
040000 tree X	path2
040000 tree X	path3
EOF
	test_output

ok 12 - ls-tree --full-tree

expecting success: 
	(
		cd path3/ &&
		git ls-tree --full-tree -r $tree
	) >current &&
	cat >expected <<\EOF &&
100644 blob X	1.txt
100644 blob X	2.txt
100644 blob X	path0/a/b/c/1.txt
100644 blob X	path1/b/c/1.txt
100644 blob X	path2/1.txt
100644 blob X	path3/1.txt
100644 blob X	path3/2.txt
EOF
	test_output

ok 13 - ls-tree --full-tree -r

expecting success: 
	git ls-tree --abbrev=5 $tree >current &&
	sed -e "s/ $_x05[0-9a-f]*	/ X	/" <current >check &&
	cat >expected <<\EOF &&
100644 blob X	1.txt
100644 blob X	2.txt
040000 tree X	path0
040000 tree X	path1
040000 tree X	path2
040000 tree X	path3
EOF
	test_cmp expected check


ok 14 - ls-tree --abbrev=5

expecting success: 
	git ls-tree --name-only $tree >current &&
	cat >expected <<\EOF &&
1.txt
2.txt
path0
path1
path2
path3
EOF
	test_output


ok 15 - ls-tree --name-only

expecting success: 
	git ls-tree --name-only -r $tree >current &&
	cat >expected <<\EOF &&
1.txt
2.txt
path0/a/b/c/1.txt
path1/b/c/1.txt
path2/1.txt
path3/1.txt
path3/2.txt
EOF
	test_output


ok 16 - ls-tree --name-only -r

# passed all 16 test(s)
1..16
