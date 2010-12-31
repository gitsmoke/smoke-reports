Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7010-setup/.git/
expecting success: 

	mkdir -p a/b/c a/e &&
	D=$(pwd) &&
	>a/b/c/d &&
	>a/e/f



ok 1 - setup

expecting success: 

	git add "$D/a/b/c/d" &&
	git ls-files >current &&
	echo a/b/c/d >expect &&
	test_cmp expect current



ok 2 - git add (absolute)

expecting success: 

	rm -f .git/index &&
	(
		cd a/b &&
		git add "../e/./f"
	) &&
	git ls-files >current &&
	echo a/e/f >expect &&
	test_cmp expect current



ok 3 - git add (funny relative)

expecting success: 

	rm -f .git/index &&
	git add a &&
	git rm -f --cached "$D/a/b/c/d" &&
	git ls-files >current &&
	echo a/e/f >expect &&
	test_cmp expect current


rm 'a/b/c/d'

ok 4 - git rm (absolute)

expecting success: 

	rm -f .git/index &&
	git add a &&
	(
		cd a/b &&
		git rm -f --cached "../e/./f"
	) &&
	git ls-files >current &&
	echo a/b/c/d >expect &&
	test_cmp expect current


rm 'a/e/f'

ok 5 - git rm (funny relative)

expecting success: 

	rm -f .git/index &&
	git add a &&
	git ls-files "$D/a/e/../b" >current &&
	echo a/b/c/d >expect &&
	test_cmp expect current



ok 6 - git ls-files (absolute)

expecting success: 

	rm -f .git/index &&
	git add a &&
	(
		cd a/b &&
		git ls-files "../b/c"
	)  >current &&
	echo c/d >expect &&
	test_cmp expect current

ok 7 - git ls-files (relative #1)

expecting success: 

	rm -f .git/index &&
	git add a &&
	(
		cd a/b &&
		git ls-files --full-name "../e/f"
	)  >current &&
	echo a/e/f >expect &&
	test_cmp expect current



ok 8 - git ls-files (relative #2)

expecting success: 

	rm -f .git/index &&
	git add a &&
	(
		cd a/b &&
		git ls-files "../e/f"
	)  >current &&
	echo ../e/f >expect &&
	test_cmp expect current



ok 9 - git ls-files (relative #3)

expecting success: 
	git commit -m "foo" &&
	echo aa >>a/b/c/d &&
	git commit -m "aa" "$(pwd)/a/b/c/d"

[master (root-commit) 5016e92] foo
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a/b/c/d
 create mode 100644 a/e/f
[master 595b3c1] aa
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 10 - commit using absolute path names

expecting success: 
	echo bb >>a/b/c/d &&
	git commit -m "bb" "$(pwd)/a/b/c/d" &&

	git log a/b/c/d >f1.txt &&
	git log "$(pwd)/a/b/c/d" >f2.txt &&
	test_cmp f1.txt f2.txt

[master f5c2f60] bb
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 11 - log using absolute path names

expecting success: 
	git blame a/b/c/d >f1.txt &&
	git blame "$(pwd)/a/b/c/d" >f2.txt &&
	test_cmp f1.txt f2.txt


ok 12 - blame using absolute path names

expecting success: 
	test_create_repo tester

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7010-setup/tester/.git/

ok 13 - setup deeper work tree

expecting success: (
	cd tester &&
	d1="$(cd .. ; pwd)" &&
	test_must_fail git add "$d1"
)

ok 14 - add a directory outside the work tree

expecting success: (
	cd tester &&
	f="$(pwd)x" &&
	echo "$f" &&
	touch "$f" &&
	test_must_fail git add "$f"
)
/Users/trast/git-smoke/t/trash directory.t7010-setup/testerx

ok 15 - add a file outside the work tree, nasty case 1

expecting success: (
	cd tester &&
	f="$(pwd | sed "s/.$//")x" &&
	echo "$f" &&
	touch "$f" &&
	test_must_fail git add "$f"
)
/Users/trast/git-smoke/t/trash directory.t7010-setup/testex

ok 16 - add a file outside the work tree, nasty case 2

# passed all 16 test(s)
1..16
