Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5701-clone-local/.git/
expecting success: 
	: >file && git add . && git commit -m1 &&
	git clone --bare . a.git &&
	git clone --bare . x &&
	test "$(GIT_CONFIG=a.git/config git config --bool core.bare)" = true &&
	test "$(GIT_CONFIG=x/config git config --bool core.bare)" = true &&
	git bundle create b1.bundle --all &&
	git bundle create b2.bundle master &&
	mkdir dir &&
	cp b1.bundle dir/b3 &&
	cp b1.bundle b4
[master (root-commit) fdc8595] 1
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
Cloning into bare repository a.git...
done.
Cloning into bare repository x...
done.

ok 1 - preparing origin repository

expecting success: 
	cd "$D" &&
	git clone -l -s a b &&
	cd b &&
	test "$(GIT_CONFIG=.git/config git config --bool core.bare)" = false &&
	git fetch

Cloning into b...
done.

ok 2 - local clone without .git suffix

expecting success: 
	cd "$D" &&
	git clone -l -s a.git c &&
	cd c &&
	git fetch
Cloning into c...
done.
ok 3 - local clone with .git suffix
expecting success: 
	cd "$D" &&
	git clone -l -s x y &&
	cd y &&
	git fetch
Cloning into y...
done.

ok 4 - local clone from x

expecting success: 
	cd "$D" &&
	if git clone -l -s x.git z
	then
		echo "Oops, should have failed"
		false
	else
		echo happy
	fi

Cloning into z...
happy

ok 5 - local clone from x.git that does not exist

expecting success: 
	cd "$D" &&
	git clone --bare --no-hardlinks x w &&
	cd w &&
	linked=$(find objects -type f ! -links 1 | wc -l) &&
	test 0 = $linked

Cloning into bare repository w...
done.

ok 6 - With -no-hardlinks, local will make a copy

expecting success: 
	cd "$D" &&
	rm -fr w &&
	git clone -l --bare x w &&
	cd w &&
	copied=$(find objects -type f -links 1 | wc -l) &&
	test 0 = $copied

Cloning into bare repository w...
done.

ok 7 - Even without -l, local will make a hardlink

expecting success: 
	cd "$D" &&
	echo "ref: refs/heads/nonexistent" > a.git/HEAD &&
	git clone a d &&
	cd d &&
	git fetch &&
	test ! -e .git/refs/remotes/origin/HEAD
Cloning into d...
done.

ok 8 - local clone of repo with nonexistent ref in HEAD

expecting success: 
	cd "$D" &&
	git clone dir/b3 &&
	cd b3 &&
	git fetch

Cloning into b3...
ok 9 - bundle clone without .bundle suffix

expecting success: 
	cd "$D" &&
	git clone b1.bundle &&
	cd b1 &&
	git fetch
Cloning into b1...

ok 10 - bundle clone with .bundle suffix

expecting success: 
	cd "$D" &&
	git clone b4 bdl &&
	cd bdl &&
	git fetch

Cloning into bdl...

ok 11 - bundle clone from b4

expecting success: 
	cd "$D" &&
	if git clone b4.bundle bb
	then
		echo "Oops, should have failed"
		false
	else
		echo happy
	fi

Cloning into bb...
happy
ok 12 - bundle clone from b4.bundle that does not exist
expecting success: 
	cd "$D" &&
	git clone b2.bundle b2 &&
	cd b2 &&
	git fetch &&
	test ! -e .git/refs/heads/master
Cloning into b2...

ok 13 - bundle clone with nonexistent HEAD

expecting success: 
	cd "$D" &&
	mkdir empty &&
	(cd empty &&
	 git init &&
	 git config receive.denyCurrentBranch warn) &&
	git clone empty empty-clone &&
	test_tick &&
	(cd empty-clone
	 echo "content" >> foo &&
	 git add foo &&
	 git commit -m "Initial commit" &&
	 git push origin master &&
	 expected=$(git rev-parse master) &&
	 actual=$(git --git-dir=../empty/.git rev-parse master) &&
	 test $actual = $expected)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5701-clone-local/empty/.git/
Cloning into empty-clone...
done.
[master (root-commit) b8e7dd3] Initial commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
ok 14 - clone empty repository

expecting success: 
	cd "$D" &&
	rm -fr empty/ empty-clone/ &&
	mkdir empty &&
	(cd empty && git init) &&
	git clone empty empty-clone &&
	(cd empty-clone &&
	test_must_fail git push)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5701-clone-local/empty/.git/
Cloning into empty-clone...
done.

ok 15 - clone empty repository, and then push should not segfault.

# passed all 15 test(s)
1..15
