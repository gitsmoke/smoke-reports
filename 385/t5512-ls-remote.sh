Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5512-ls-remote/.git/
expecting success: 

	>file &&
	git add file &&
	test_tick &&
	git commit -m initial &&
	git tag mark &&
	git show-ref --tags -d | sed -e "s/ /	/" >expected.tag &&
	(
		echo "$(git rev-parse HEAD)	HEAD"
		git show-ref -d	| sed -e "s/ /	/"
	) >expected.all &&

	git remote add self "$(pwd)/.git"
[master (root-commit) 1bd44cb] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - setup

expecting success: 

	git ls-remote --tags .git >actual &&
	test_cmp expected.tag actual

ok 2 - ls-remote --tags .git

expecting success: 

	git ls-remote .git >actual &&
	test_cmp expected.all actual



ok 3 - ls-remote .git

expecting success: 

	git ls-remote --tags self >actual &&
	test_cmp expected.tag actual



ok 4 - ls-remote --tags self

expecting success: 

	git ls-remote self >actual &&
	test_cmp expected.all actual

ok 5 - ls-remote self

expecting success: 

	test_must_fail git ls-remote



ok 6 - dies when no remote specified and no default remotes found

expecting success: 

	URL="$(pwd)/.git" &&
	echo "From $URL" >exp_err &&

	git remote add origin "$URL" &&
	git ls-remote 2>actual_err >actual &&

	test_cmp exp_err actual_err &&
	test_cmp expected.all actual



ok 7 - use "origin" when no remote specified

expecting success: 

	git ls-remote -q 2>actual_err &&
	test_must_fail test_cmp exp_err actual_err


1bd44cb9d13204b0fe1958db0082f5028a16eb3a	HEAD
1bd44cb9d13204b0fe1958db0082f5028a16eb3a	refs/heads/master
1bd44cb9d13204b0fe1958db0082f5028a16eb3a	refs/tags/mark
--- exp_err	2010-12-24 04:02:30.000000000 +0000
+++ actual_err	2010-12-24 04:02:30.000000000 +0000
@@ -1 +0,0 @@
-From /Users/trast/git-smoke/t/trash directory.t5512-ls-remote/.git

ok 8 - suppress "From <url>" with -q

expecting success: 

	#
	# Test that we are indeed using branch.<name>.remote, not "origin", even
	# though the "origin" remote has been set.
	#

	# setup a new remote to differentiate from "origin"
	git clone . other.git &&
	(
		cd other.git &&
		echo "$(git rev-parse HEAD)	HEAD"
		git show-ref	| sed -e "s/ /	/"
	) >exp &&

	URL="other.git" &&
	echo "From $URL" >exp_err &&

	git remote add other $URL &&
	git config branch.master.remote other &&

	git ls-remote 2>actual_err >actual &&
	test_cmp exp_err actual_err &&
	test_cmp exp actual


Cloning into other.git...
done.

ok 9 - use branch.<name>.remote if possible

expecting success: 
	#
	# Do not expect "git ls-remote <pattern>" to work; ls-remote, correctly,
	# confuses <pattern> for <remote>. Although ugly, this behaviour is akin
	# to the confusion of refspecs for remotes by git-fetch and git-push,
	# eg:
	#
	#   $ git fetch branch
	#

	# We could just as easily have used "master"; the "*" emphasizes its
	# role as a pattern.
	test_must_fail git ls-remote refs*master >actual 2>&1 &&
	test_cmp exp actual



ok 10 - confuses pattern as remote when no remote specified

# passed all 10 test(s)
1..10
