Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5510-fetch/.git/
expecting success: 
	echo >file original &&
	git add file &&
	git commit -a -m original
[master (root-commit) df45352] original
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - setup
expecting success: 
	git clone . one &&
	(
		cd one &&
		echo >file updated by one &&
		git commit -a -m "updated by one"
	) &&
	git clone . two &&
	(
		cd two &&
		git config branch.master.remote one &&
		git config remote.one.url ../one/.git/ &&
		git config remote.one.fetch refs/heads/master:refs/heads/one
	) &&
	git clone . three &&
	(
		cd three &&
		git config branch.master.remote two &&
		git config branch.master.merge refs/heads/one &&
		mkdir -p .git/remotes &&
		{
			echo "URL: ../two/.git/"
			echo "Pull: refs/heads/master:refs/heads/two"
			echo "Pull: refs/heads/one:refs/heads/one"
		} >.git/remotes/two
	) &&
	git clone . bundle &&
	git clone . seven
Cloning into one...
done.
[master e8835a5] updated by one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Cloning into two...
done.
Cloning into three...
done.
Cloning into bundle...
done.
Cloning into seven...
done.

ok 2 - clone and setup child repos

expecting success: 
	cd "$D" &&
	echo >file updated by origin &&
	git commit -a -m "updated by origin" &&
	cd two &&
	git fetch &&
	test -f .git/refs/heads/one &&
	mine=`git rev-parse refs/heads/one` &&
	his=`cd ../one && git rev-parse refs/heads/master` &&
	test "z$mine" = "z$his"
[master 55d41cd] updated by origin
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 3 - fetch test

expecting success: 
	cd "$D" &&
	cd three &&
	git fetch &&
	test -f .git/refs/heads/two &&
	test -f .git/refs/heads/one &&
	master_in_two=`cd ../two && git rev-parse master` &&
	one_in_two=`cd ../two && git rev-parse one` &&
	{
		echo "$master_in_two	not-for-merge"
		echo "$one_in_two	"
	} >expected &&
	cut -f -2 .git/FETCH_HEAD >actual &&
	test_cmp expected actual
ok 4 - fetch test for-merge

expecting success: 

    cd "$D" &&

    mkdir notags &&
    cd notags &&
    git init &&

    git fetch -t ..
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5510-fetch/notags/.git/

ok 5 - fetch tags when there is no tags

expecting success: 

	cd "$D" &&
	git tag -a -m annotated anno HEAD &&
	git tag light HEAD &&

	mkdir four &&
	cd four &&
	git init &&

	git fetch .. :track &&
	git show-ref --verify refs/tags/anno &&
	git show-ref --verify refs/tags/light
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5510-fetch/four/.git/
68863459b6f2da77ec39e16e479e0597c1a3562b refs/tags/anno
55d41cd47a6209fb42bbf5e1a3aaaed9ee0ad913 refs/tags/light

ok 6 - fetch following tags

expecting success: 

	cd "$D" &&

	mkdir five &&
	cd five &&
	git init &&

	test_must_fail git fetch .. anno:five
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5510-fetch/five/.git/

ok 7 - fetch must not resolve short tag name

expecting success: 

	cd "$D" &&
	git update-ref refs/remotes/six/HEAD HEAD &&

	mkdir six &&
	cd six &&
	git init &&

	test_must_fail git fetch .. six:six


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5510-fetch/six/.git/
ok 8 - fetch must not resolve short remote name

expecting success: 
	cd "$D" &&
	echo >file updated again by origin &&
	git commit -a -m "tip" &&
	git bundle create bundle1 master^..master
[master b45ade2] tip
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 9 - create bundle 1

expecting success: 
	head -n 1 "$D"/bundle1 | grep "^#" &&
	head -n 2 "$D"/bundle1 | grep "^-[0-9a-f]\{40\} " &&
	head -n 3 "$D"/bundle1 | grep "^[0-9a-f]\{40\} " &&
	head -n 4 "$D"/bundle1 | grep "^$"

# v2 git bundle
-55d41cd47a6209fb42bbf5e1a3aaaed9ee0ad913 updated by origin
b45ade240265d4e239e758f5e88e85144d912ddb refs/heads/master


ok 10 - header of bundle looks right

expecting success: 
	cd "$D" &&
	git bundle create bundle2 master~2..master


ok 11 - create bundle 2

expecting success: 
	cd "$D/bundle" &&
	git checkout -b some-branch &&
	test_must_fail git fetch "$D/bundle1" master:master

ok 12 - unbundle 1

expecting success: 
	cd "$D" &&
	(
		while read x && test -n "$x"
		do
			:;
		done
		cat
	) <bundle1 >bundle.pack &&
	git index-pack bundle.pack &&
	test_bundle_object_count bundle.pack 3

3fb9673bd4b486296cbccae306ee8a070c23628f
ok 13 - bundle 1 has only 3 files 

expecting success: 
	cd "$D/bundle" &&
	git fetch ../bundle2 master:master &&
	test "tip" = "$(git log -1 --pretty=oneline master | cut -b42-)"
ok 14 - unbundle 2
expecting success: 
	cd "$D" &&
	touch file2 &&
	git add file2 &&
	git commit -m add.file2 file2 &&
	git bundle create bundle3 -1 HEAD &&
	(
		while read x && test -n "$x"
		do
			:;
		done
		cat
	) <bundle3 >bundle.pack &&
	git index-pack bundle.pack &&
	test_bundle_object_count bundle.pack 3
[master 3b423bc] add.file2
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file2
5b64ff113182770e59913d89a5ef0e4fdbca1e68

ok 15 - bundle does not prerequisite objects

expecting success: 

	cd "$D" &&
	git tag -a -m 1.0 v1.0 master &&
	git bundle create bundle4 v1.0

ok 16 - bundle should be able to create a full history

expecting success: 
	git pack-refs &&
	mkdir rsynced &&
	(cd rsynced &&
	 git init --bare &&
	 git fetch "rsync:$(pwd)/../.git" master:refs/heads/master &&
	 git gc --prune &&
	 test $(git rev-parse master) = $(cd .. && git rev-parse master) &&
	 git fsck --full)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5510-fetch/rsynced/

ok 17 - fetch via rsync

expecting success: 
	mkdir rsynced2 &&
	(cd rsynced2 &&
	 git init) &&
	(cd rsynced &&
	 git push "rsync:$(pwd)/../rsynced2/.git" master) &&
	(cd rsynced2 &&
	 git gc --prune &&
	 test $(git rev-parse master) = $(cd .. && git rev-parse master) &&
	 git fsck --full)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5510-fetch/rsynced2/.git/
dangling tag 68863459b6f2da77ec39e16e479e0597c1a3562b
dangling tag 1542287f8b750d4219b32a705405c426c01a16c1

ok 18 - push via rsync

expecting success: 
	mkdir rsynced3 &&
	(cd rsynced3 &&
	 git init) &&
	git push --all "rsync:$(pwd)/rsynced3/.git" &&
	(cd rsynced3 &&
	 test $(git rev-parse master) = $(cd .. && git rev-parse master) &&
	 git fsck --full)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5510-fetch/rsynced3/.git/
ok 19 - push via rsync

expecting success: 
	git config branch.master.remote yeti &&
	git config branch.master.merge refs/heads/bigfoot &&
	git config remote.blub.url one &&
	git config remote.blub.fetch "refs/heads/*:refs/remotes/one/*" &&
	git fetch blub

ok 20 - fetch with a non-applying branch.<name>.merge

expecting success: 
	one_head=$(cd one && git rev-parse HEAD) &&
	this_head=$(git rev-parse HEAD) &&
	git update-ref -d FETCH_HEAD &&
	git fetch one &&
	test $one_head = "$(git rev-parse --verify FETCH_HEAD)" &&
	test $this_head = "$(git rev-parse --verify HEAD)"
ok 21 - fetch from GIT URL with a non-applying branch.<name>.merge [1]
expecting success: 
	one_ref=$(cd one && git symbolic-ref HEAD) &&
	git config branch.master.remote blub &&
	git config branch.master.merge "$one_ref" &&
	git update-ref -d FETCH_HEAD &&
	git fetch one &&
	test $one_head = "$(git rev-parse --verify FETCH_HEAD)" &&
	test $this_head = "$(git rev-parse --verify HEAD)"

ok 22 - fetch from GIT URL with a non-applying branch.<name>.merge [2]

expecting success: 
	git config branch.master.merge "${one_ref}_not" &&
	git update-ref -d FETCH_HEAD &&
	git fetch one &&
	test $one_head = "$(git rev-parse --verify FETCH_HEAD)" &&
	test $this_head = "$(git rev-parse --verify HEAD)"
ok 23 - fetch from GIT URL with a non-applying branch.<name>.merge [3]

expecting success: 
	test_must_fail git fetch "a\!'b" > result 2>&1 &&
	cat result &&
	grep "fatal: 'a\\!'b'" result
fatal: 'a\!'b' does not appear to be a git repository
fatal: The remote end hung up unexpectedly
fatal: 'a\!'b' does not appear to be a git repository

ok 24 - quoting of a strangely named repo

expecting success: 

	cd "$D" &&
	git bundle create bundle5 HEAD master &&
	git bundle list-heads bundle5 >actual &&
	for h in HEAD refs/heads/master
	do
		echo "$(git rev-parse --verify $h) $h"
	done >expect &&
	test_cmp expect actual

ok 25 - bundle should record HEAD correctly

expecting success: 

	cd "$D" &&
	git branch -f side &&
	(
		cd three &&
		o=$(git rev-parse --verify refs/remotes/origin/master) &&
		git fetch origin master &&
		n=$(git rev-parse --verify refs/remotes/origin/master) &&
		test "$o" = "$n" &&
		test_must_fail git rev-parse --verify refs/remotes/origin/side
	)


ok 26 - explicit fetch should not update tracking

expecting success: 

	cd "$D" &&
	git branch -f side &&
	(
		cd three &&
		o=$(git rev-parse --verify refs/remotes/origin/master) &&
		git pull origin master &&
		n=$(git rev-parse --verify refs/remotes/origin/master) &&
		test "$o" = "$n" &&
		test_must_fail git rev-parse --verify refs/remotes/origin/side
	)
Updating df45352..3b423bc
Fast-forward
 file  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 create mode 100644 file2

ok 27 - explicit pull should not update tracking

expecting success: 

	cd "$D" &&
	git branch -f side &&
	(
		cd three &&
		o=$(git rev-parse --verify refs/remotes/origin/master) &&
		git fetch origin &&
		n=$(git rev-parse --verify refs/remotes/origin/master) &&
		test "$o" != "$n" &&
		git rev-parse --verify refs/remotes/origin/side
	)
3b423bc19eda08e2025c6a4ceeafa4d8874b82d1

ok 28 - configured fetch updates tracking

expecting success: 

	cd "$D" &&
	test_must_fail git push seven no:no
ok 29 - pushing nonexistent branch by mistake should not segv
expecting success: 

	cd "$D" &&
	git clone .git follow &&
	git checkout HEAD^0 &&
	(
		for i in 1 2 3 4 5 6 7
		do
			echo $i >>file &&
			git commit -m $i -a &&
			git tag -a -m $i excess-$i || exit 1
		done
	) &&
	git checkout master &&
	(
		cd follow &&
		git fetch
	)

Cloning into follow...
done.
[detached HEAD c26271a] 1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[detached HEAD 55757fe] 2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[detached HEAD 90ac979] 3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[detached HEAD ef45c8d] 4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[detached HEAD da63653] 5
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[detached HEAD a79ed6a] 6
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[detached HEAD ba0a709] 7
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 30 - auto tag following fetches minimum

expecting success: 

	test_must_fail git fetch . side:master



ok 31 - refuse to fetch into the current branch

expecting success: 

	git fetch --update-head-ok . side:master



ok 32 - fetch into the current branch with --update-head-ok

expecting success: 

	rm -f .git/FETCH_HEAD &&
	git fetch --dry-run . &&
	! test -f .git/FETCH_HEAD


ok 33 - fetch --dry-run

expecting success: 
        mkdir dups &&
        cd dups &&
        git init &&
        git config branch.master.remote three &&
        git config remote.three.url ../three/.git &&
        git config remote.three.fetch +refs/heads/*:refs/remotes/origin/* &&
        git config --add remote.three.fetch +refs/heads/*:refs/remotes/origin/* &&
        git fetch three
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5510-fetch/dups/.git/
ok 34 - should be able to fetch with duplicate refspecs

# passed all 34 test(s)
1..34
