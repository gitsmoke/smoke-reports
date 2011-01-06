Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5505-remote/.git/
expecting success: 

	setup_repository one &&
	setup_repository two &&
	(
		cd two && git branch another
	) &&
	git clone one test
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5505-remote/one/.git/
[master (root-commit) 9d34b14] Initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
[side 2ce9c50] Second
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 elif
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5505-remote/two/.git/
[master (root-commit) 9d34b14] Initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
[side 2ce9c50] Second
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 elif
Cloning into test
done.
ok 1 - setup
expecting success: 
(
	cd test &&
	tokens_match origin "$(git remote)" &&
	check_remote_track origin master side &&
	check_tracking_branch origin HEAD master side
)

ok 2 - remote information for the origin

expecting success: 
(
	cd test &&
	git remote add -f second ../two &&
	tokens_match "origin second" "$(git remote)" &&
	check_remote_track origin master side &&
	check_remote_track second master side another &&
	check_tracking_branch second master side another &&
	git for-each-ref "--format=%(refname)" refs/remotes |
	sed -e "/^refs\/remotes\/origin\//d" \
	    -e "/^refs\/remotes\/second\//d" >actual &&
	>expect &&
	test_cmp expect actual
)

Updating second
ok 3 - add another remote
expecting success: 
(
	cd test &&
	case `git config remote.second.fetch` in
	+*) true ;;
	 *) false ;;
	esac
)

ok 4 - remote forces tracking branches

expecting success: 
(
	cd test &&
	git symbolic-ref refs/remotes/second/HEAD refs/remotes/second/master &&
	git remote rm second
)


ok 5 - remove remote

expecting success: 
(
	cd test &&
	tokens_match origin "$(git remote)" &&
	check_remote_track origin master side &&
	git for-each-ref "--format=%(refname)" refs/remotes |
	sed -e "/^refs\/remotes\/origin\//d" >actual &&
	>expect &&
	test_cmp expect actual
)


ok 6 - remove remote

expecting success: 
(
	cd test &&
	{ cat >expect1 <<EOF
Note: A branch outside the refs/remotes/ hierarchy was not removed;
to delete it, use:
  git branch -d master
EOF
	} &&
	{ cat >expect2 <<EOF
Note: Some branches outside the refs/remotes/ hierarchy were not removed;
to delete them, use:
  git branch -d foobranch
  git branch -d master
EOF
	} &&
	git tag footag &&
	git config --add remote.oops.fetch "+refs/*:refs/*" &&
	git remote rm oops 2>actual1 &&
	git branch foobranch &&
	git config --add remote.oops.fetch "+refs/*:refs/*" &&
	git remote rm oops 2>actual2 &&
	git branch -d foobranch &&
	git tag -d footag &&
	test_cmp expect1 actual1 &&
	test_cmp expect2 actual2
)
Deleted branch foobranch (was 9d34b14).
Deleted tag 'footag' (was 9d34b14)
ok 7 - remove remote protects local branches
expecting success: 
	(cd test &&
	 git config --add remote.origin.fetch refs/heads/master:refs/heads/upstream &&
	 git fetch &&
	 git checkout -b ahead origin/master &&
	 echo 1 >> file &&
	 test_tick &&
	 git commit -m update file &&
	 git checkout master &&
	 git branch --track octopus origin/master &&
	 git branch --track rebase origin/master &&
	 git branch -d -r origin/master &&
	 git config --add remote.two.url ../two &&
	 git config --add remote.two.pushurl ../three &&
	 git config branch.rebase.rebase true &&
	 git config branch.octopus.merge "topic-a topic-b topic-c" &&
	 (cd ../one &&
	  echo 1 > file &&
	  test_tick &&
	  git commit -m update file) &&
	 git config --add remote.origin.push : &&
	 git config --add remote.origin.push refs/heads/master:refs/heads/upstream &&
	 git config --add remote.origin.push +refs/tags/lastbackup &&
	 git config --add remote.two.push +refs/heads/ahead:refs/heads/master &&
	 git config --add remote.two.push refs/heads/master:refs/heads/another &&
	 git remote show origin two > output &&
	 git branch -d rebase octopus &&
	 test_cmp expect output)
Branch ahead set up to track remote branch master from origin.
[ahead 847549e] update
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Branch octopus set up to track remote branch master from origin.
Branch rebase set up to track remote branch master from origin.
Deleted remote branch origin/master (was 9d34b14).
[master 6329a3c] update
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Deleted branch rebase (was 9d34b14).
Deleted branch octopus (was 9d34b14).

ok 8 - show
expecting success: 
	(mv one one.unreachable &&
	 cd test &&
	 git remote show -n origin > output &&
	 mv ../one.unreachable ../one &&
	 test_cmp expect output)

ok 9 - show -n

expecting success: 
	(cd one &&
	 git branch -m side side2) &&
	(cd test &&
	 git fetch origin &&
	 git remote prune origin &&
	 git rev-parse refs/remotes/origin/side2 &&
	 test_must_fail git rev-parse refs/remotes/origin/side)
Pruning origin
URL: /Users/trast/git-smoke/t/trash directory.t5505-remote/one
 * [pruned] origin/side
2ce9c504874e3f0ce77f83c0bb0b1024c7a6387f
refs/remotes/origin/side
ok 10 - prune
expecting success: 
	(cd test &&
	 git symbolic-ref refs/remotes/origin/HEAD &&
	 git remote set-head --delete origin &&
	 test_must_fail git symbolic-ref refs/remotes/origin/HEAD)
refs/remotes/origin/master
ok 11 - set-head --delete
expecting success: 
	(cd test &&
	 git remote set-head --auto origin &&
	 echo refs/remotes/origin/master >expect &&
	 git symbolic-ref refs/remotes/origin/HEAD >output &&
	 test_cmp expect output
	)
origin/HEAD set to master
ok 12 - set-head --auto
expecting success: 
	(cd test &&
	 test_must_fail git remote set-head --auto two >output 2>&1 &&
	test_cmp expect output)

ok 13 - set-head --auto fails w/multiple HEADs
expecting success: 
	(cd test &&
	 git remote set-head origin side2 &&
	 git symbolic-ref refs/remotes/origin/HEAD >output &&
	 git remote set-head origin master &&
	 test_cmp expect output)

ok 14 - set-head explicit
expecting success: 
	(cd one &&
	 git branch -m side2 side) &&
	(cd test &&
	 git remote prune --dry-run origin > output &&
	 git rev-parse refs/remotes/origin/side2 &&
	 test_must_fail git rev-parse refs/remotes/origin/side &&
	(cd ../one &&
	 git branch -m side side2) &&
	 test_cmp expect output)
2ce9c504874e3f0ce77f83c0bb0b1024c7a6387f
refs/remotes/origin/side
ok 15 - prune --dry-run
expecting success: 
	(mkdir mirror &&
	 cd mirror &&
	 git init --bare &&
	 git remote add --mirror -f origin ../one) &&
	(cd one &&
	 git branch -m side2 side) &&
	(cd mirror &&
	 git rev-parse --verify refs/heads/side2 &&
	 test_must_fail git rev-parse --verify refs/heads/side &&
	 git fetch origin &&
	 git remote prune origin &&
	 test_must_fail git rev-parse --verify refs/heads/side2 &&
	 git rev-parse --verify refs/heads/side)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5505-remote/mirror/
Updating origin
2ce9c504874e3f0ce77f83c0bb0b1024c7a6387f
Pruning origin
URL: ../one
 * [pruned] refs/heads/side2
2ce9c504874e3f0ce77f83c0bb0b1024c7a6387f

ok 16 - add --mirror && prune

expecting success: 
	(mkdir alttst &&
	 cd alttst &&
	 git init &&
	 git remote add -f origin ../one &&
	 git config remote.alt.url ../one &&
	 git config remote.alt.fetch "+refs/heads/*:refs/remotes/origin/*") &&
	(cd one &&
	 git branch -m side side2) &&
	(cd alttst &&
	 git rev-parse --verify refs/remotes/origin/side &&
	 test_must_fail git rev-parse --verify refs/remotes/origin/side2 &&
	 git fetch alt &&
	 git remote prune alt &&
	 test_must_fail git rev-parse --verify refs/remotes/origin/side &&
	 git rev-parse --verify refs/remotes/origin/side2)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5505-remote/alttst/.git/
Updating origin
2ce9c504874e3f0ce77f83c0bb0b1024c7a6387f
Pruning alt
URL: ../one
 * [pruned] origin/side
2ce9c504874e3f0ce77f83c0bb0b1024c7a6387f

ok 17 - add alt && prune

expecting success: 
	(cd one &&
	 >foobar &&
	 git add foobar &&
	 git commit -m "Foobar" &&
	 git tag -a -m "Foobar tag" foobar-tag &&
	 git reset --hard HEAD~1 &&
	 git tag -a -m "Some tag" some-tag) &&
	(mkdir add-tags &&
	 cd add-tags &&
	 git init &&
	 git remote add -f origin ../one &&
	 git tag -l some-tag >../test/output &&
	 git tag -l foobar-tag >>../test/output &&
	 test_must_fail git config remote.origin.tagopt) &&
	test_cmp test/expect test/output

[master ce374ef] Foobar
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 foobar
HEAD is now at 6329a3c update
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5505-remote/add-tags/.git/
Updating origin

ok 18 - add with reachable tags (default)

expecting success: 
	(rm -rf add-tags &&
	 mkdir add-tags &&
	 cd add-tags &&
	 git init &&
	 git remote add -f --tags origin ../one &&
	 git tag -l some-tag >../test/output &&
	 git tag -l foobar-tag >>../test/output &&
	 git config remote.origin.tagopt >>../test/output) &&
	test_cmp test/expect test/output

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5505-remote/add-tags/.git/
Updating origin

ok 19 - add --tags

expecting success: 
	(rm -rf add-tags &&
	 mkdir add-no-tags &&
	 cd add-no-tags &&
	 git init &&
	 git remote add -f --no-tags origin ../one &&
	 git tag -l some-tag >../test/output &&
	 git tag -l foobar-tag >../test/output &&
	 git config remote.origin.tagopt >>../test/output) &&
	(cd one &&
	 git tag -d some-tag foobar-tag) &&
	test_cmp test/expect test/output
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5505-remote/add-no-tags/.git/
Updating origin
Deleted tag 'some-tag' (was 280fcd8)
Deleted tag 'foobar-tag' (was 186cb71)

ok 20 - add --no-tags

expecting success: 
	(cd add-no-tags &&
	 test_must_fail git remote add -f --no-no-tags neworigin ../one)


ok 21 - reject --no-no-tags

expecting success: 

	(cd one &&
	 git remote add drosophila ../two &&
	 git remote add apis ../mirror &&
	 git remote update &&
	 git branch -r > output &&
	 test_cmp expect output)


Fetching drosophila
Fetching apis

ok 22 - update

expecting success: 

	(cd one &&
	 for b in $(git branch -r)
	 do
		git branch -r -d $b || break
	 done &&
	 git remote add manduca ../mirror &&
	 git remote add megaloprepus ../mirror &&
	 git config remotes.phobaeticus "drosophila megaloprepus" &&
	 git config remotes.titanus manduca &&
	 git remote update phobaeticus titanus &&
	 git branch -r > output &&
	 test_cmp expect output)


Deleted remote branch apis/master (was 6329a3c).
Deleted remote branch apis/side (was 2ce9c50).
Deleted remote branch drosophila/another (was 9d34b14).
Deleted remote branch drosophila/master (was 9d34b14).
Deleted remote branch drosophila/side (was 2ce9c50).
Fetching drosophila
Fetching megaloprepus
Fetching manduca

ok 23 - update with arguments

expecting success: 

	(cd one &&
	 git branch -m side2 side3) &&
	(cd test &&
	 git remote update --prune &&
	 (cd ../one && git branch -m side3 side2) &&
	 git rev-parse refs/remotes/origin/side3 &&
	 test_must_fail git rev-parse refs/remotes/origin/side2)

Fetching origin
Fetching two
2ce9c504874e3f0ce77f83c0bb0b1024c7a6387f
refs/remotes/origin/side2

ok 24 - update --prune

expecting success: 

	(cd one &&
	 for b in $(git branch -r)
	 do
		git branch -r -d $b || break
	 done &&
	 git config remote.drosophila.skipDefaultUpdate true &&
	 git remote update default &&
	 git branch -r > output &&
	 test_cmp expect output)


Deleted remote branch drosophila/another (was 9d34b14).
Deleted remote branch drosophila/master (was 9d34b14).
Deleted remote branch drosophila/side (was 2ce9c50).
Deleted remote branch manduca/master (was 6329a3c).
Deleted remote branch manduca/side (was 2ce9c50).
Deleted remote branch megaloprepus/master (was 6329a3c).
Deleted remote branch megaloprepus/side (was 2ce9c50).
Fetching apis
Fetching manduca
Fetching megaloprepus

ok 25 - update default

expecting success: 

	(cd one &&
	 for b in $(git branch -r)
	 do
		git branch -r -d $b || break
	 done &&
	 git config remotes.default "$(printf "	 drosophila  
")" &&
	 git remote update default &&
	 git branch -r > output &&
	 test_cmp expect output)


Deleted remote branch apis/master (was 6329a3c).
Deleted remote branch apis/side (was 2ce9c50).
Deleted remote branch manduca/master (was 6329a3c).
Deleted remote branch manduca/side (was 2ce9c50).
Deleted remote branch megaloprepus/master (was 6329a3c).
Deleted remote branch megaloprepus/side (was 2ce9c50).
Fetching drosophila

ok 26 - update default (overridden, with funny whitespace)

expecting success: 

	(cd one &&
	 for b in $(git branch -r)
	 do
		git branch -r -d $b || break
	 done &&
	 git config remotes.default "drosophila" &&
	 git remote update &&
	 git branch -r > output &&
	 test_cmp expect output)


Deleted remote branch drosophila/another (was 9d34b14).
Deleted remote branch drosophila/master (was 9d34b14).
Deleted remote branch drosophila/side (was 2ce9c50).
Fetching drosophila

ok 27 - update (with remotes.default defined)

expecting success: 

	git clone one three &&
	(cd three &&
	 git remote show origin > output &&
	 ! grep "^ *HEAD$" < output &&
	 ! grep -i stale < output)


Cloning into three
done.

ok 28 - "remote show" does not show symbolic refs

expecting success: 

	test_must_fail git remote add some:url desired-name



ok 29 - reject adding remote with an invalid name

expecting success: 

	git clone one four &&
	(cd four &&
	 git remote rename origin upstream &&
	 rmdir .git/refs/remotes/origin &&
	 test "$(git symbolic-ref refs/remotes/upstream/HEAD)" = "refs/remotes/upstream/master" &&
	 test "$(git rev-parse upstream/master)" = "$(git rev-parse master)" &&
	 test "$(git config remote.upstream.fetch)" = "+refs/heads/*:refs/remotes/upstream/*" &&
	 test "$(git config branch.master.remote)" = "upstream")


Cloning into four
done.

ok 30 - rename a remote

expecting success: 
	git clone one five &&
	origin_url=$(pwd)/one &&
	(cd five &&
	 git remote rm origin &&
	 mkdir -p .git/remotes &&
	 cat ../remotes_origin > .git/remotes/origin &&
	 git remote rename origin origin &&
	 ! test -f .git/remotes/origin &&
	 test "$(git config remote.origin.url)" = "$origin_url" &&
	 test "$(git config remote.origin.push)" = "refs/heads/master:refs/heads/upstream" &&
	 test "$(git config remote.origin.fetch)" = "refs/heads/master:refs/heads/origin")

Cloning into five
done.

ok 31 - migrate a remote from named file in $GIT_DIR/remotes

expecting success: 
	git clone one six &&
	origin_url=$(pwd)/one &&
	(cd six &&
	 git remote rm origin &&
	 echo "$origin_url" > .git/branches/origin &&
	 git remote rename origin origin &&
	 ! test -f .git/branches/origin &&
	 test "$(git config remote.origin.url)" = "$origin_url" &&
	 test "$(git config remote.origin.fetch)" = "refs/heads/master:refs/heads/origin")

Cloning into six
done.

ok 32 - migrate a remote from named file in $GIT_DIR/branches

expecting success: 
	git clone one seven &&
	(
		cd one &&
		git checkout side2 &&
		git branch -D master
	) &&
	(
		cd seven &&
		git remote prune origin
	) >err 2>&1 &&
	grep "has become dangling" err &&

	: And the dangling symref will not cause other annoying errors &&
	(
		cd seven &&
		git branch -a
	) 2>err &&
	! grep "points nowhere" err &&
	(
		cd seven &&
		test_must_fail git branch nomore origin
	) 2>err &&
	grep "dangling symref" err

Cloning into seven
done.
Deleted branch master (was 6329a3c).
 refs/remotes/origin/HEAD has become dangling!
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/side2
warning: ignoring dangling symref refs/remotes/origin/HEAD.

ok 33 - remote prune to cause a dangling symref

expecting success: 

	test_create_repo empty &&
	git clone empty empty-clone &&
	(
		cd empty-clone &&
		git remote show origin
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5505-remote/empty/.git/
Cloning into empty-clone
done.
* remote origin
  Fetch URL: /Users/trast/git-smoke/t/trash directory.t5505-remote/empty
  Push  URL: /Users/trast/git-smoke/t/trash directory.t5505-remote/empty
  HEAD branch: (unknown)
  Local branch configured for 'git pull':
    master merges with remote master

ok 34 - show empty remote

expecting success: 
	test_must_fail git remote set-branches &&
	test_must_fail git remote set-branches --add


ok 35 - remote set-branches requires a remote

expecting success: 
	echo "+refs/heads/*:refs/remotes/scratch/*" >expect.initial &&
	sort <<-\EOF >expect.add &&
	+refs/heads/*:refs/remotes/scratch/*
	+refs/heads/other:refs/remotes/scratch/other
	EOF
	sort <<-\EOF >expect.replace &&
	+refs/heads/maint:refs/remotes/scratch/maint
	+refs/heads/master:refs/remotes/scratch/master
	+refs/heads/next:refs/remotes/scratch/next
	EOF
	sort <<-\EOF >expect.add-two &&
	+refs/heads/maint:refs/remotes/scratch/maint
	+refs/heads/master:refs/remotes/scratch/master
	+refs/heads/next:refs/remotes/scratch/next
	+refs/heads/pu:refs/remotes/scratch/pu
	+refs/heads/t/topic:refs/remotes/scratch/t/topic
	EOF
	sort <<-\EOF >expect.setup-ffonly &&
	refs/heads/master:refs/remotes/scratch/master
	+refs/heads/next:refs/remotes/scratch/next
	EOF
	sort <<-\EOF >expect.respect-ffonly &&
	refs/heads/master:refs/remotes/scratch/master
	+refs/heads/next:refs/remotes/scratch/next
	+refs/heads/pu:refs/remotes/scratch/pu
	EOF

	git clone .git/ setbranches &&
	(
		cd setbranches &&
		git remote rename origin scratch &&
		git config --get-all remote.scratch.fetch >config-result &&
		sort <config-result >../actual.initial &&

		git remote set-branches scratch --add other &&
		git config --get-all remote.scratch.fetch >config-result &&
		sort <config-result >../actual.add &&

		git remote set-branches scratch maint master next &&
		git config --get-all remote.scratch.fetch >config-result &&
		sort <config-result >../actual.replace &&

		git remote set-branches --add scratch pu t/topic &&
		git config --get-all remote.scratch.fetch >config-result &&
		sort <config-result >../actual.add-two &&

		git config --unset-all remote.scratch.fetch &&
		git config remote.scratch.fetch \
			refs/heads/master:refs/remotes/scratch/master &&
		git config --add remote.scratch.fetch \
			+refs/heads/next:refs/remotes/scratch/next &&
		git config --get-all remote.scratch.fetch >config-result &&
		sort <config-result >../actual.setup-ffonly &&

		git remote set-branches --add scratch pu &&
		git config --get-all remote.scratch.fetch >config-result &&
		sort <config-result >../actual.respect-ffonly
	) &&
	test_cmp expect.initial actual.initial &&
	test_cmp expect.add actual.add &&
	test_cmp expect.replace actual.replace &&
	test_cmp expect.add-two actual.add-two &&
	test_cmp expect.setup-ffonly actual.setup-ffonly &&
	test_cmp expect.respect-ffonly actual.respect-ffonly
Cloning into setbranches
done.
ok 36 - remote set-branches

expecting success: 
	echo "+refs/*:refs/*" >expect.initial &&
	echo "+refs/heads/master:refs/heads/master" >expect.replace &&
	git clone --mirror .git/ setbranches-mirror &&
	(
		cd setbranches-mirror &&
		git remote rename origin scratch &&
		git config --get-all remote.scratch.fetch >../actual.initial &&

		git remote set-branches scratch heads/master &&
		git config --get-all remote.scratch.fetch >../actual.replace
	) &&
	test_cmp expect.initial actual.initial &&
	test_cmp expect.replace actual.replace
Cloning into bare repository setbranches-mirror
done.

ok 37 - remote set-branches with --mirror

expecting success: 
	git remote add someremote foo &&
	echo foo >expect &&
	git config --get-all remote.someremote.url >actual &&
	cmp expect actual


ok 38 - new remote

expecting success: 
	git remote set-url someremote bar &&
	echo bar >expect &&
	git config --get-all remote.someremote.url >actual &&
	cmp expect actual


ok 39 - remote set-url bar

expecting success: 
	git remote set-url someremote baz bar &&
	echo baz >expect &&
	git config --get-all remote.someremote.url >actual &&
	cmp expect actual


ok 40 - remote set-url baz bar

expecting success: 
	test_must_fail git remote set-url someremote zot bar &&
	echo baz >expect &&
	git config --get-all remote.someremote.url >actual &&
	cmp expect actual


ok 41 - remote set-url zot bar

expecting success: 
	test_must_fail git remote set-url --push someremote zot baz &&
	echo "YYY" >expect &&
	echo baz >>expect &&
	test_must_fail git config --get-all remote.someremote.pushurl >actual &&
	echo "YYY" >>actual &&
	git config --get-all remote.someremote.url >>actual &&
	cmp expect actual


ok 42 - remote set-url --push zot baz

expecting success: 
	git remote set-url --push someremote zot &&
	echo zot >expect &&
	echo "YYY" >>expect &&
	echo baz >>expect &&
	git config --get-all remote.someremote.pushurl >actual &&
	echo "YYY" >>actual &&
	git config --get-all remote.someremote.url >>actual &&
	cmp expect actual


ok 43 - remote set-url --push zot

expecting success: 
	git remote set-url --push someremote qux zot &&
	echo qux >expect &&
	echo "YYY" >>expect &&
	echo baz >>expect &&
	git config --get-all remote.someremote.pushurl >actual &&
	echo "YYY" >>actual &&
	git config --get-all remote.someremote.url >>actual &&
	cmp expect actual


ok 44 - remote set-url --push qux zot

expecting success: 
	git remote set-url --push someremote foo qu+x &&
	echo foo >expect &&
	echo "YYY" >>expect &&
	echo baz >>expect &&
	git config --get-all remote.someremote.pushurl >actual &&
	echo "YYY" >>actual &&
	git config --get-all remote.someremote.url >>actual &&
	cmp expect actual


ok 45 - remote set-url --push foo qu+x

expecting success: 
	git remote set-url --push --add someremote aaa &&
	echo foo >expect &&
	echo aaa >>expect &&
	echo "YYY" >>expect &&
	echo baz >>expect &&
	git config --get-all remote.someremote.pushurl >actual &&
	echo "YYY" >>actual &&
	git config --get-all remote.someremote.url >>actual &&
	cmp expect actual


ok 46 - remote set-url --push --add aaa

expecting success: 
	git remote set-url --push someremote bar aaa &&
	echo foo >expect &&
	echo bar >>expect &&
	echo "YYY" >>expect &&
	echo baz >>expect &&
	git config --get-all remote.someremote.pushurl >actual &&
	echo "YYY" >>actual &&
	git config --get-all remote.someremote.url >>actual &&
	cmp expect actual


ok 47 - remote set-url --push bar aaa

expecting success: 
	git remote set-url --push --delete someremote bar &&
	echo foo >expect &&
	echo "YYY" >>expect &&
	echo baz >>expect &&
	git config --get-all remote.someremote.pushurl >actual &&
	echo "YYY" >>actual &&
	git config --get-all remote.someremote.url >>actual &&
	cmp expect actual


ok 48 - remote set-url --push --delete bar

expecting success: 
	git remote set-url --push --delete someremote foo &&
	echo "YYY" >expect &&
	echo baz >>expect &&
	test_must_fail git config --get-all remote.someremote.pushurl >actual &&
	echo "YYY" >>actual &&
	git config --get-all remote.someremote.url >>actual &&
	cmp expect actual


ok 49 - remote set-url --push --delete foo

expecting success: 
	git remote set-url --add someremote bbb &&
	echo "YYY" >expect &&
	echo baz >>expect &&
	echo bbb >>expect &&
	test_must_fail git config --get-all remote.someremote.pushurl >actual &&
	echo "YYY" >>actual &&
	git config --get-all remote.someremote.url >>actual &&
	cmp expect actual


ok 50 - remote set-url --add bbb

expecting success: 
	test_must_fail git remote set-url --delete someremote .\* &&
	echo "YYY" >expect &&
	echo baz >>expect &&
	echo bbb >>expect &&
	test_must_fail git config --get-all remote.someremote.pushurl >actual &&
	echo "YYY" >>actual &&
	git config --get-all remote.someremote.url >>actual &&
	cmp expect actual

ok 51 - remote set-url --delete .*

expecting success: 
	git remote set-url --delete someremote bbb &&
	echo "YYY" >expect &&
	echo baz >>expect &&
	test_must_fail git config --get-all remote.someremote.pushurl >actual &&
	echo "YYY" >>actual &&
	git config --get-all remote.someremote.url >>actual &&
	cmp expect actual


ok 52 - remote set-url --delete bbb

expecting success: 
	test_must_fail git remote set-url --delete someremote baz &&
	echo "YYY" >expect &&
	echo baz >>expect &&
	test_must_fail git config --get-all remote.someremote.pushurl >actual &&
	echo "YYY" >>actual &&
	git config --get-all remote.someremote.url >>actual &&
	cmp expect actual


ok 53 - remote set-url --delete baz

expecting success: 
	git remote set-url --add someremote ccc &&
	echo "YYY" >expect &&
	echo baz >>expect &&
	echo ccc >>expect &&
	test_must_fail git config --get-all remote.someremote.pushurl >actual &&
	echo "YYY" >>actual &&
	git config --get-all remote.someremote.url >>actual &&
	cmp expect actual


ok 54 - remote set-url --add ccc

expecting success: 
	git remote set-url --delete someremote baz &&
	echo "YYY" >expect &&
	echo ccc >>expect &&
	test_must_fail git config --get-all remote.someremote.pushurl >actual &&
	echo "YYY" >>actual &&
	git config --get-all remote.someremote.url >>actual &&
	cmp expect actual

ok 55 - remote set-url --delete baz

# passed all 55 test(s)
1..55
