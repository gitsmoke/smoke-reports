Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5401-update-hooks/.git/
expecting success: 
	echo This is a test. >a &&
	git update-index --add a &&
	tree0=$(git write-tree) &&
	commit0=$(echo setup | git commit-tree $tree0) &&
	echo We hope it works. >a &&
	git update-index a &&
	tree1=$(git write-tree) &&
	commit1=$(echo modify | git commit-tree $tree1 -p $commit0) &&
	git update-ref refs/heads/master $commit0 &&
	git update-ref refs/heads/tofail $commit1 &&
	git clone --bare ./. victim.git &&
	GIT_DIR=victim.git git update-ref refs/heads/tofail $commit1 &&
	git update-ref refs/heads/master $commit1 &&
	git update-ref refs/heads/tofail $commit0
Cloning into bare repository victim.git
done.
ok 1 - setup
expecting success: 
	test_must_fail git send-pack --force ./victim.git \
		master tofail >send.out 2>send.err

ok 2 - push
expecting success: 
	test $(GIT_DIR=victim.git git rev-parse master) = $commit1 &&
	test $(GIT_DIR=victim.git git rev-parse tofail) = $commit1

ok 3 - updated as expected
expecting success: 
	test -f victim.git/pre-receive.args &&
	test -f victim.git/pre-receive.stdin &&
	test -f victim.git/update.args &&
	test -f victim.git/update.stdin &&
	test -f victim.git/post-receive.args &&
	test -f victim.git/post-receive.stdin &&
	test -f victim.git/post-update.args &&
	test -f victim.git/post-update.stdin

ok 4 - hooks ran

expecting success: 
	(echo $commit0 $commit1 refs/heads/master;
	 echo $commit1 $commit0 refs/heads/tofail
	) | test_cmp - victim.git/pre-receive.stdin

ok 5 - pre-receive hook input

expecting success: 
	(echo refs/heads/master $commit0 $commit1;
	 echo refs/heads/tofail $commit1 $commit0
	) | test_cmp - victim.git/update.args

ok 6 - update hook arguments

expecting success: 
	echo $commit0 $commit1 refs/heads/master |
	test_cmp - victim.git/post-receive.stdin

ok 7 - post-receive hook input

expecting success: 
	echo refs/heads/master |
	test_cmp - victim.git/post-update.args

ok 8 - post-update hook arguments

expecting success: 
	! test -s victim.git/update.stdin &&
	! test -s victim.git/post-update.stdin

ok 9 - all hook stdin is /dev/null

expecting success: 
	! test -s victim.git/pre-receive.args &&
	! test -s victim.git/post-receive.args

ok 10 - all *-receive hook args are empty

expecting success: 
	! test -s send.out
ok 11 - send-pack produced no output
expecting success: 
	grep ^remote: send.err | sed "s/ *\$//" >actual &&
	test_cmp expect actual

ok 12 - send-pack stderr contains hook messages
# passed all 12 test(s)
1..12
