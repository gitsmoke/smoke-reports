Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5514-fetch-multiple/.git/
expecting success: 
	setup_repository one &&
	setup_repository two &&
	(
		cd two && git branch another
	) &&
	git clone --mirror two three &&
	git clone one test

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5514-fetch-multiple/one/.git/
[master (root-commit) 9d34b14] Initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
[side 2ce9c50] Second
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 elif
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5514-fetch-multiple/two/.git/
[master (root-commit) 9d34b14] Initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
[side 2ce9c50] Second
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 elif
Cloning into bare repository three
done.
Cloning into test
done.

ok 1 - setup

expecting success: 
	(cd test &&
	 git remote add one ../one &&
	 git remote add two ../two &&
	 git remote add three ../three &&
	 git fetch --all &&
	 git branch -r > output &&
	 test_cmp expect output)
Fetching origin
Fetching one
Fetching two
Fetching three
ok 2 - git fetch --all

expecting success: 
	(git clone one test2 &&
	 cd test2 &&
	 git remote add bad ../non-existing &&
	 git remote add one ../one &&
	 git remote add two ../two &&
	 git remote add three ../three &&
	 test_must_fail git fetch --all &&
	 git branch -r > output &&
	 test_cmp ../test/expect output)
Cloning into test2
done.
Fetching origin
Fetching bad
Fetching one
Fetching two
Fetching three
ok 3 - git fetch --all should continue if a remote has errors

expecting success: 
	(cd test &&
	 test_must_fail git fetch --all origin &&
	 test_must_fail git fetch --all origin master)
ok 4 - git fetch --all does not allow non-option arguments
expecting success: 
	(git clone one test3 &&
	 cd test3 &&
	 git remote add three ../three &&
	 git fetch --multiple three &&
	 git branch -r > output &&
	 test_cmp ../expect output)
Cloning into test3
done.
Fetching three
ok 5 - git fetch --multiple (but only one remote)

expecting success: 
	(git clone one test4 &&
	 cd test4 &&
	 git remote rm origin &&
	 git remote add one ../one &&
	 git remote add two ../two &&
	 git fetch --multiple one two &&
	 git branch -r > output &&
	 test_cmp ../expect output)
Cloning into test4
done.
Fetching one
Fetching two

ok 6 - git fetch --multiple (two remotes)

expecting success: 
	(cd test4 &&
	 test_must_fail git fetch --multiple four)


ok 7 - git fetch --multiple (bad remote names)

expecting success: 
	(cd test4 &&
	 for b in $(git branch -r)
	 do
		git branch -r -d $b || break
	 done &&
	 git remote add three ../three &&
	 git config remote.three.skipFetchAll true &&
	 git fetch --all &&
	 git branch -r > output &&
	 test_cmp ../expect output)

Deleted remote branch one/master (was 9d34b14).
Deleted remote branch one/side (was 2ce9c50).
Deleted remote branch two/another (was 9d34b14).
Deleted remote branch two/master (was 9d34b14).
Deleted remote branch two/side (was 2ce9c50).
Fetching one
Fetching two
ok 8 - git fetch --all (skipFetchAll)
expecting success: 
	(cd test4 &&
	 for b in $(git branch -r)
	 do
		git branch -r -d $b || break
	 done &&
	 git fetch --multiple one two three &&
	 git branch -r > output &&
	 test_cmp ../expect output)

Deleted remote branch one/master (was 9d34b14).
Deleted remote branch one/side (was 2ce9c50).
Deleted remote branch two/another (was 9d34b14).
Deleted remote branch two/master (was 9d34b14).
Deleted remote branch two/side (was 2ce9c50).
Fetching one
Fetching two
Fetching three
ok 9 - git fetch --multiple (ignoring skipFetchAll)
# passed all 9 test(s)
1..9
