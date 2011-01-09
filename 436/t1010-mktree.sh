Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1010-mktree/.git/
expecting success: 
	for d in a a. a0
	do
		mkdir "$d" && echo "$d/one" >"$d/one" &&
		git add "$d"
	done &&
	echo zero >one &&
	git update-index --add --info-only one &&
	git write-tree --missing-ok >tree.missing &&
	git ls-tree $(cat tree.missing) >top.missing &&
	git ls-tree -r $(cat tree.missing) >all.missing &&
	echo one >one &&
	git add one &&
	git write-tree >tree &&
	git ls-tree $(cat tree) >top &&
	git ls-tree -r $(cat tree) >all &&
	test_tick &&
	git commit -q -m one &&
	H=$(git rev-parse HEAD) &&
	git update-index --add --cacheinfo 160000 $H sub &&
	test_tick &&
	git commit -q -m two &&
	git rev-parse HEAD^{tree} >tree.withsub &&
	git ls-tree HEAD >top.withsub &&
	git ls-tree -r HEAD >all.withsub

ok 1 - setup

expecting success: 
	git mktree <top >actual &&
	test_cmp tree actual

ok 2 - ls-tree piped to mktree (1)

expecting success: 
	git mktree <top.withsub >actual &&
	test_cmp tree.withsub actual

ok 3 - ls-tree piped to mktree (2)

expecting success: 
	perl -e "print reverse <>" <top |
	git mktree >actual &&
	test_cmp tree actual

ok 4 - ls-tree output in wrong order given to mktree (1)

expecting success: 
	perl -e "print reverse <>" <top.withsub |
	git mktree >actual &&
	test_cmp tree.withsub actual

ok 5 - ls-tree output in wrong order given to mktree (2)

expecting success: 
	git mktree --missing <top.missing >actual &&
	test_cmp tree.missing actual


ok 6 - allow missing object with --missing

expecting success: 
	test_must_fail git mktree <all >actual


ok 7 - mktree refuses to read ls-tree -r output (1)

expecting success: 
	test_must_fail git mktree <all.withsub >actual


ok 8 - mktree refuses to read ls-tree -r output (2)

# passed all 8 test(s)
1..8
