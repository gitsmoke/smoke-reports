Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3001-ls-files-others-exclude/.git/
expecting success: git ls-files --others \
       --exclude=\*.6 \
       --exclude-per-directory=.gitignore \
       --exclude-from=.git/ignore \
       >output &&
     test_cmp expect output

ok 1 - git ls-files --others with various exclude options.

expecting success: git ls-files --others \
       --exclude=\*.6 \
       --exclude-per-directory=.gitignore \
       --exclude-from=.git/ignore \
       >output &&
     test_cmp expect output

ok 2 - git ls-files --others with 
 line endings.

expecting success: 
	git add $allignores &&
	git update-index --skip-worktree $allignores &&
	rm $allignores

ok 3 - setup skip-worktree gitignore

expecting success: git ls-files --others \
       --exclude=\*.6 \
       --exclude-per-directory=.gitignore \
       --exclude-from=.git/ignore \
       >output &&
     test_cmp expect output

ok 4 - git ls-files --others with various exclude options.

expecting success: 
	git checkout $allignores &&
	rm .git/index

ok 5 - restore gitignore
expecting success: test_cmp expect output
ok 6 - git status honors core.excludesfile
expecting success: 

	git ls-files --others --exclude=one/ >output &&
	if grep "^one/" output
	then
		echo Ooops
		false
	else
		: happy
	fi

ok 7 - trailing slash in exclude allows directory match(1)

expecting success: 

	git ls-files --others --exclude=one/two/ >output &&
	if grep "^one/two/" output
	then
		echo Ooops
		false
	else
		: happy
	fi

ok 8 - trailing slash in exclude allows directory match (2)

expecting success: 

	>two &&
	git ls-files --others --exclude=two/ >output &&
	grep "^two" output
two

ok 9 - trailing slash in exclude forces directory match (1)

expecting success: 

	git ls-files --others --exclude=one/a.1/ >output &&
	grep "^one/a.1" output
one/a.1

ok 10 - trailing slash in exclude forces directory match (2)
expecting success: 

	git ls-files --others --exclude="a.*" --exclude="!a.1" >output &&
	grep "^a.1" output
a.1

ok 11 - negated exclude matches can override previous ones

expecting success: 
	mkdir -p top/l1/l2 &&
	(
		cd top &&
		git init &&
		echo /.gitignore >.gitignore &&
		echo l1 >>.gitignore &&
		echo l2 >l1/.gitignore &&
		>l1/l2/l1
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3001-ls-files-others-exclude/top/.git/

ok 12 - subdirectory ignore (setup)

expecting success: 
	(
		cd top &&
		git ls-files -o --exclude-standard
	) >actual &&
	>expect &&
	test_cmp expect actual

ok 13 - subdirectory ignore (toplevel)

expecting success: 
	(
		cd top/l1/l2 &&
		git ls-files -o --exclude-standard
	) >actual &&
	>expect &&
	test_cmp expect actual

ok 14 - subdirectory ignore (l1/l2)

expecting success: 
	(
		cd top/l1 &&
		git ls-files -o --exclude-standard
	) >actual &&
	>expect &&
	test_cmp expect actual

ok 15 - subdirectory ignore (l1)

# passed all 15 test(s)
1..15
