Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/.git/
expecting success: 

	>path1 &&
	git add path1 &&
	test_tick &&
	git commit -a -m repo &&
	the_first_commit=$(git show-ref -s --verify refs/heads/master) &&

	>path2 &&
	git add path2 &&
	test_tick &&
	git commit -a -m second &&
	the_commit=$(git show-ref -s --verify refs/heads/master)


[master (root-commit) b9c09d6] repo
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 path1
[master 9ad36e1] second
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 path2

ok 1 - setup

expecting success: 
	mk_empty &&
	(
		cd testrepo &&
		git fetch .. refs/heads/master:refs/remotes/origin/master &&

		r=$(git show-ref -s --verify refs/remotes/origin/master) &&
		test "z$r" = "z$the_commit" &&

		test 1 = $(git for-each-ref refs/remotes/origin | wc -l)
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/

ok 2 - fetch without wildcard

expecting success: 
	mk_empty &&
	(
		cd testrepo &&
		git config remote.up.url .. &&
		git config remote.up.fetch "refs/heads/*:refs/remotes/origin/*" &&
		git fetch up &&

		r=$(git show-ref -s --verify refs/remotes/origin/master) &&
		test "z$r" = "z$the_commit" &&

		test 1 = $(git for-each-ref refs/remotes/origin | wc -l)
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 3 - fetch with wildcard

expecting success: 
	mk_empty &&
	(
		TRASH=$(pwd)/ &&
		cd testrepo &&
		git config "url.$TRASH.insteadOf" trash/ &&
		git config remote.up.url trash/. &&
		git config remote.up.fetch "refs/heads/*:refs/remotes/origin/*" &&
		git fetch up &&

		r=$(git show-ref -s --verify refs/remotes/origin/master) &&
		test "z$r" = "z$the_commit" &&

		test 1 = $(git for-each-ref refs/remotes/origin | wc -l)
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/

ok 4 - fetch with insteadOf

expecting success: 
	mk_empty &&
	(
		TRASH=$(pwd)/ &&
		cd testrepo &&
		git config "url.trash/.pushInsteadOf" "$TRASH" &&
		git config remote.up.url "$TRASH." &&
		git config remote.up.fetch "refs/heads/*:refs/remotes/origin/*" &&
		git fetch up &&

		r=$(git show-ref -s --verify refs/remotes/origin/master) &&
		test "z$r" = "z$the_commit" &&

		test 1 = $(git for-each-ref refs/remotes/origin | wc -l)
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 5 - fetch with pushInsteadOf (should not rewrite)
expecting success: 
	mk_empty &&

	git push testrepo refs/heads/master:refs/remotes/origin/master &&
	(
		cd testrepo &&
		r=$(git show-ref -s --verify refs/remotes/origin/master) &&
		test "z$r" = "z$the_commit" &&

		test 1 = $(git for-each-ref refs/remotes/origin | wc -l)
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 6 - push without wildcard
expecting success: 
	mk_empty &&

	git push testrepo "refs/heads/*:refs/remotes/origin/*" &&
	(
		cd testrepo &&
		r=$(git show-ref -s --verify refs/remotes/origin/master) &&
		test "z$r" = "z$the_commit" &&

		test 1 = $(git for-each-ref refs/remotes/origin | wc -l)
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 7 - push with wildcard

expecting success: 
	mk_empty &&
	TRASH="$(pwd)/" &&
	git config "url.$TRASH.insteadOf" trash/ &&
	git push trash/testrepo refs/heads/master:refs/remotes/origin/master &&
	(
		cd testrepo &&
		r=$(git show-ref -s --verify refs/remotes/origin/master) &&
		test "z$r" = "z$the_commit" &&

		test 1 = $(git for-each-ref refs/remotes/origin | wc -l)
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 8 - push with insteadOf
expecting success: 
	mk_empty &&
	TRASH="$(pwd)/" &&
	git config "url.$TRASH.pushInsteadOf" trash/ &&
	git push trash/testrepo refs/heads/master:refs/remotes/origin/master &&
	(
		cd testrepo &&
		r=$(git show-ref -s --verify refs/remotes/origin/master) &&
		test "z$r" = "z$the_commit" &&

		test 1 = $(git for-each-ref refs/remotes/origin | wc -l)
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/

ok 9 - push with pushInsteadOf

expecting success: 
	mk_empty &&
	TRASH="$(pwd)/" &&
	git config "url.trash2/.pushInsteadOf" trash/ &&
	git config remote.r.url trash/wrong &&
	git config remote.r.pushurl "$TRASH/testrepo" &&
	git push r refs/heads/master:refs/remotes/origin/master &&
	(
		cd testrepo &&
		r=$(git show-ref -s --verify refs/remotes/origin/master) &&
		test "z$r" = "z$the_commit" &&

		test 1 = $(git for-each-ref refs/remotes/origin | wc -l)
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 10 - push with pushInsteadOf and explicit pushurl (pushInsteadOf should not rewrite)
expecting success: 

	mk_test heads/master &&
	git push testrepo &&
	check_push_result $the_commit heads/master
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 11 - push with matching heads
expecting success: 

	mk_test heads/master &&
	git push testrepo : &&
	check_push_result $the_commit heads/master
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/

ok 12 - push with matching heads on the command line

expecting success: 

	mk_test heads/master &&
	git push testrepo : &&
	git commit --amend -massaged &&
	test_must_fail git push testrepo &&
	check_push_result $the_commit heads/master &&
	git reset --hard $the_commit
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
[master ead0604] assaged
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 path2
HEAD is now at 9ad36e1 second

ok 13 - failed (non-fast-forward) push with matching heads
expecting success: 

	mk_test heads/master &&
	git push testrepo : &&
	git commit --amend -massaged &&
	git push --force testrepo &&
	! check_push_result $the_commit heads/master &&
	git reset --hard $the_commit
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
[master ead0604] assaged
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 path2
Oops, refs/heads/master is wrong
HEAD is now at 9ad36e1 second

ok 14 - push --force with matching heads

expecting success: 

	mk_test heads/master &&
	git push testrepo : &&
	git commit --amend -massaged &&
	git push testrepo +: &&
	! check_push_result $the_commit heads/master &&
	git reset --hard $the_commit


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
[master ead0604] assaged
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 path2
Oops, refs/heads/master is wrong
HEAD is now at 9ad36e1 second

ok 15 - push with matching heads and forced update

expecting success: 

	mk_test heads/master &&
	git push testrepo master:master &&
	check_push_result $the_commit heads/master


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 16 - push with no ambiguity (1)
expecting success: 

	mk_test remotes/origin/master &&
	git push testrepo master:origin/master &&
	check_push_result $the_commit remotes/origin/master
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 17 - push with no ambiguity (2)

expecting success: 

	mk_test heads/master heads/t/master &&
	git branch -f t/master master &&
	git push testrepo master &&
	check_push_result $the_commit heads/master &&
	check_push_result $the_first_commit heads/t/master
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/

ok 18 - push with colon-less refspec, no ambiguity

expecting success: 

	mk_test heads/master remotes/origin/master &&
	git push testrepo master:master &&
	check_push_result $the_commit heads/master &&
	check_push_result $the_first_commit remotes/origin/master


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 19 - push with weak ambiguity (1)

expecting success: 

	mk_test heads/master remotes/origin/master remotes/another/master &&
	git push testrepo master:master &&
	check_push_result $the_commit heads/master &&
	check_push_result $the_first_commit remotes/origin/master remotes/another/master
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 20 - push with weak ambiguity (2)

expecting success: 

	mk_test heads/frotz tags/frotz &&
	if git push testrepo master:frotz
	then
		echo "Oops, should have failed"
		false
	else
		check_push_result $the_first_commit heads/frotz tags/frotz
	fi
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/

ok 21 - push with ambiguity

expecting success: 

	mk_test heads/frotz tags/frotz &&
	git branch -f frotz master &&
	git push testrepo frotz &&
	check_push_result $the_commit heads/frotz &&
	check_push_result $the_first_commit tags/frotz
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 22 - push with colon-less refspec (1)

expecting success: 

	mk_test heads/frotz tags/frotz &&
	if git show-ref --verify -q refs/heads/frotz
	then
		git branch -D frotz
	fi &&
	git tag -f frotz &&
	git push testrepo frotz &&
	check_push_result $the_commit tags/frotz &&
	check_push_result $the_first_commit heads/frotz
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
Deleted branch frotz (was 9ad36e1).
Updated tag 'frotz' (was 0000000)
ok 23 - push with colon-less refspec (2)
expecting success: 

	mk_test &&
	if git show-ref --verify -q refs/tags/frotz
	then
		git tag -d frotz
	fi &&
	git branch -f frotz master &&
	git push testrepo frotz &&
	check_push_result $the_commit heads/frotz &&
	test 1 = $( cd testrepo && git show-ref | wc -l )
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
Deleted tag 'frotz' (was 9ad36e1)
ok 24 - push with colon-less refspec (3)
expecting success: 

	mk_test &&
	if git show-ref --verify -q refs/heads/frotz
	then
		git branch -D frotz
	fi &&
	git tag -f frotz &&
	git push testrepo frotz &&
	check_push_result $the_commit tags/frotz &&
	test 1 = $( cd testrepo && git show-ref | wc -l )
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
Deleted branch frotz (was 9ad36e1).
Updated tag 'frotz' (was 0000000)

ok 25 - push with colon-less refspec (4)

expecting success: 

	mk_test &&
	git push testrepo master:branch &&
	check_push_result $the_commit heads/branch
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 26 - push head with non-existant, incomplete dest

expecting success: 

	mk_test &&
	git tag -f v1.0 &&
	git push testrepo v1.0:tag &&
	check_push_result $the_commit tags/tag
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
Updated tag 'v1.0' (was 0000000)

ok 27 - push tag with non-existant, incomplete dest

expecting success: 

	mk_test &&
	test_must_fail git push testrepo `git rev-parse master`:foo


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/

ok 28 - push sha1 with non-existant, incomplete dest

expecting success: 

	mk_test &&
	test_must_fail git push testrepo master^:branch
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 29 - push ref expression with non-existant, incomplete dest

expecting success: 

	mk_test heads/master &&
	git checkout master &&
	git push testrepo HEAD &&
	check_push_result $the_commit heads/master
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 30 - push with HEAD

expecting success: 

	mk_test heads/master &&
	git checkout -b local master &&
	git push testrepo HEAD &&
	check_push_result $the_commit heads/local
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 31 - push with HEAD nonexisting at remote

expecting success: 

	mk_test heads/master &&
	git checkout master &&
	git branch -D local &&
	git checkout -b local &&
	git push testrepo master local &&
	check_push_result $the_commit heads/master &&
	check_push_result $the_commit heads/local &&

	# Without force rewinding should fail
	git reset --hard HEAD^ &&
	test_must_fail git push testrepo HEAD &&
	check_push_result $the_commit heads/local &&

	# With force rewinding should succeed
	git push testrepo +HEAD &&
	check_push_result $the_first_commit heads/local
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
Deleted branch local (was 9ad36e1).
HEAD is now at b9c09d6 repo
ok 32 - push with +HEAD

expecting success: 

	mk_test &&
	git checkout master &&
	git push testrepo HEAD:branch &&
	check_push_result $the_commit heads/branch
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 33 - push HEAD with non-existant, incomplete dest
expecting success: 

	mk_test heads/local &&
	git checkout master &&
	git branch -f local $the_commit &&
	(
		cd testrepo &&
		git checkout local &&
		git reset --hard $the_first_commit
	) &&
	git config remote.there.url testrepo &&
	git config remote.there.push HEAD &&
	git config branch.master.remote there &&
	git push &&
	check_push_result $the_commit heads/master &&
	check_push_result $the_first_commit heads/local
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
HEAD is now at b9c09d6 repo

ok 34 - push with config remote.*.push = HEAD
expecting success: 

	mk_test heads/master &&
	git checkout master &&
	git config remote.there.url test2repo &&
	git config remote.there.pushurl testrepo &&
	git push there &&
	check_push_result $the_commit heads/master
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 35 - push with config remote.*.pushurl
expecting success: 

	mk_test heads/master &&
	(
		cd testrepo &&
		old_commit=$(git show-ref -s --verify refs/heads/master)
	) &&
	git push --dry-run testrepo &&
	check_push_result $old_commit heads/master
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 36 - push with dry-run

expecting success: 

	mk_test heads/master &&
	mk_child child &&
	(
		cd child &&
		git pull .. master &&
		git push &&
		test $(git rev-parse master) = \
			$(git rev-parse remotes/origin/master)
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
Cloning into child
done.
Updating b9c09d6..9ad36e1
Fast-forward
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 path2
ok 37 - push updates local refs

expecting success: 

	mk_test heads/master &&
	mk_child child1 &&
	mk_child child2 &&
	(cd child1 && git pull .. master && git push) &&
	(
		cd child2 &&
		git pull ../child1 master &&
		git push &&
		test $(git rev-parse master) = \
			$(git rev-parse remotes/origin/master)
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
Cloning into child1
done.
Cloning into child2
done.
Updating b9c09d6..9ad36e1
Fast-forward
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 path2
Updating b9c09d6..9ad36e1
Fast-forward
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 path2

ok 38 - push updates up-to-date local refs

expecting success: 

	mk_test heads/master &&
	mk_child child &&
	(
		cd child &&
		git push &&
		! test -f .git/refs/remotes/origin/master
	)


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
Cloning into child
done.
ok 39 - push preserves up-to-date packed refs

expecting success: 

	mk_test heads/master &&
	mk_child child &&
	mkdir testrepo/.git/hooks &&
	echo "#!/no/frobnication/today" >testrepo/.git/hooks/pre-receive &&
	chmod +x testrepo/.git/hooks/pre-receive &&
	(
		cd child &&
		git pull .. master
		test_must_fail git push &&
		test $(git rev-parse master) != \
			$(git rev-parse remotes/origin/master)
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
Cloning into child
done.
Updating b9c09d6..9ad36e1
Fast-forward
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 path2

ok 40 - push does not update local refs on failure

expecting success: 

	mk_test heads/master &&
	rm -f testrepo/.git/objects/??/* &&
	git push testrepo :refs/heads/master &&
	(cd testrepo && test_must_fail git rev-parse --verify refs/heads/master)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 41 - allow deleting an invalid remote ref
expecting success: 
	mk_test heads/master &&
	(cd testrepo && git config receive.denyDeleteCurrent warn) &&
	git push testrepo --delete master &&
	(cd testrepo && test_must_fail git rev-parse --verify refs/heads/master)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 42 - allow deleting a ref using --delete

expecting success: 
	mk_test heads/master &&
	git tag -a -m dummy_message deltag heads/master &&
	git push testrepo --tags &&
	(cd testrepo && git rev-parse --verify -q refs/tags/deltag) &&
	git push testrepo --delete tag deltag &&
	(cd testrepo && test_must_fail git rev-parse --verify refs/tags/deltag)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
6e5fba4679ec93de5598d25f1c27f6b6073c29fe

ok 43 - allow deleting a tag using --delete

expecting success: 
	mk_test heads/master &&
	test_must_fail git push testrepo --delete
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 44 - push --delete without args aborts

expecting success: 
	mk_test heads/master &&
	test_must_fail git push testrepo --delete master:foo
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 45 - push --delete refuses src:dest refspecs

expecting success: 
	mk_test heads/master &&
	(
		cd testrepo &&
		git checkout master &&
		git config receive.denyCurrentBranch warn
	) &&
	git push testrepo master 2>stderr &&
	grep "warning: updating the current branch" stderr
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
remote: warning: updating the current branch        

ok 46 - warn on push to HEAD of non-bare repository

expecting success: 
	mk_test heads/master &&
	(
		cd testrepo &&
		git checkout master &&
		git config receive.denyCurrentBranch true
	) &&
	test_must_fail git push testrepo master
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 47 - deny push to HEAD of non-bare repository

expecting success: 
	mk_test heads/master &&
	(
		cd testrepo &&
		git checkout master &&
		git config receive.denyCurrentBranch true &&
		git config core.bare true
	) &&
	git push testrepo master 2>stderr &&
	! grep "warning: updating the current branch" stderr
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 48 - allow push to HEAD of bare repository (bare)

expecting success: 
	mk_test heads/master &&
	(
		cd testrepo &&
		git checkout master &&
		git config receive.denyCurrentBranch false
	) &&
	git push testrepo master 2>stderr &&
	! grep "warning: updating the current branch" stderr
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 49 - allow push to HEAD of non-bare repository (config)
expecting success: 
	mk_empty &&
	git branch second $the_first_commit &&
	git checkout second &&
	echo ".." > testrepo/.git/branches/branch1 &&
	(
		cd testrepo &&
		git fetch branch1 &&
		r=$(git show-ref -s --verify refs/heads/branch1) &&
		test "z$r" = "z$the_commit" &&
		test 1 = $(git for-each-ref refs/heads | wc -l)
	) &&
	git checkout master
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 50 - fetch with branches

expecting success: 
	mk_empty &&
	echo "..#second" > testrepo/.git/branches/branch2 &&
	(
		cd testrepo &&
		git fetch branch2 &&
		r=$(git show-ref -s --verify refs/heads/branch2) &&
		test "z$r" = "z$the_first_commit" &&
		test 1 = $(git for-each-ref refs/heads | wc -l)
	) &&
	git checkout master
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 51 - fetch with branches containing #

expecting success: 
	mk_empty &&
	git checkout second &&
	echo "testrepo" > .git/branches/branch1 &&
	git push branch1 &&
	(
		cd testrepo &&
		r=$(git show-ref -s --verify refs/heads/master) &&
		test "z$r" = "z$the_first_commit" &&
		test 1 = $(git for-each-ref refs/heads | wc -l)
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 52 - push with branches
expecting success: 
	mk_empty &&
	echo "testrepo#branch3" > .git/branches/branch2 &&
	git push branch2 &&
	(
		cd testrepo &&
		r=$(git show-ref -s --verify refs/heads/branch3) &&
		test "z$r" = "z$the_first_commit" &&
		test 1 = $(git for-each-ref refs/heads | wc -l)
	) &&
	git checkout master
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 53 - push with branches containing #

expecting success: 
	mk_test heads/master &&
	mk_child child1 &&
	mk_child child2 &&
	(
		cd child1 &&
		git branch foo &&
		git symbolic-ref refs/heads/bar refs/heads/foo
		git config receive.denyCurrentBranch false
	) &&
	(
		cd child2 &&
		>path2 &&
		git add path2 &&
		test_tick &&
		git commit -a -m child2 &&
		git branch foo &&
		git branch bar &&
		git push ../child1 foo bar
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
Cloning into child1
done.
Cloning into child2
done.
[master 730546d] child2
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 path2

ok 54 - push into aliased refs (consistent)

expecting success: 
	mk_test heads/master &&
	mk_child child1 &&
	mk_child child2 &&
	(
		cd child1 &&
		git branch foo &&
		git symbolic-ref refs/heads/bar refs/heads/foo
		git config receive.denyCurrentBranch false
	) &&
	(
		cd child2 &&
		>path2 &&
		git add path2 &&
		test_tick &&
		git commit -a -m child2 &&
		git branch foo &&
		>path3 &&
		git add path3 &&
		test_tick &&
		git commit -a -m child2 &&
		git branch bar &&
		test_must_fail git push ../child1 foo bar 2>stderr &&
		grep "refusing inconsistent update" stderr
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
Cloning into child1
done.
Cloning into child2
done.
[master 730546d] child2
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 path2
[master 2ba6bb5] child2
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 path3
remote: error: refusing inconsistent update between symref 'refs/heads/bar' (b9c09d6..2ba6bb5) and its target 'refs/heads/foo' (b9c09d6..730546d)        
ok 55 - push into aliased refs (inconsistent)
expecting success: 
	mk_empty &&
	echo >.git/foo  "To testrepo" &&
	echo >>.git/foo "*	refs/heads/master:refs/remotes/origin/master	[new branch]"  &&
	echo >>.git/foo "Done" &&
	git push >.git/bar --porcelain  testrepo refs/heads/master:refs/remotes/origin/master &&
	(
		cd testrepo &&
		r=$(git show-ref -s --verify refs/remotes/origin/master) &&
		test "z$r" = "z$the_commit" &&
		test 1 = $(git for-each-ref refs/remotes/origin | wc -l)
	) &&
	test_cmp .git/foo .git/bar
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/

ok 56 - push --porcelain

expecting success: 
	mk_empty &&
	test_must_fail git push >.git/bar --porcelain asdfasdfasd refs/heads/master:refs/remotes/origin/master &&
	test_must_fail grep -q Done .git/bar
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
ok 57 - push --porcelain bad url

expecting success: 
	mk_empty &&
	git push testrepo refs/heads/master:refs/remotes/origin/master &&
	(cd testrepo &&
		git reset --hard origin/master^
		git config receive.denyCurrentBranch true) &&

	echo >.git/foo  "To testrepo"  &&
	echo >>.git/foo "!	refs/heads/master:refs/heads/master	[remote rejected] (branch is currently checked out)" &&

	test_must_fail git push >.git/bar --porcelain  testrepo refs/heads/master:refs/heads/master &&
	test_cmp .git/foo .git/bar
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
HEAD is now at b9c09d6 repo
ok 58 - push --porcelain rejected

expecting success: 
	mk_empty &&
	git push testrepo refs/heads/master:refs/remotes/origin/master &&
	(cd testrepo &&
		git reset --hard origin/master
		git config receive.denyCurrentBranch true) &&

	echo >.git/foo  "To testrepo"  &&
	echo >>.git/foo "!	refs/heads/master^:refs/heads/master	[rejected] (non-fast-forward)" &&
	echo >>.git/foo "Done" &&

	test_must_fail git push >.git/bar --porcelain  --dry-run testrepo refs/heads/master^:refs/heads/master &&
	test_cmp .git/foo .git/bar
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5516-fetch-push/testrepo/.git/
HEAD is now at 9ad36e1 second
ok 59 - push --porcelain --dry-run rejected

# passed all 59 test(s)
1..59
