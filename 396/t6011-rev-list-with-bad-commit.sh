Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6011-rev-list-with-bad-commit/.git/
expecting success: 
   git init &&
   git config core.compression 0 &&
   git config core.logallrefupdates false &&
   echo "foo" > foo &&
   git add foo &&
   git commit -m "first commit" &&
   echo "bar" > bar &&
   git add bar &&
   git commit -m "second commit" &&
   echo "baz" > baz &&
   git add baz &&
   git commit -m "third commit" &&
   echo "foo again" >> foo &&
   git add foo &&
   git commit -m "fourth commit" &&
   git repack -a -f -d
   
Reinitialized existing Git repository in /Users/trast/git-smoke/t/trash directory.t6011-rev-list-with-bad-commit/.git/
[master (root-commit) b42cb28] first commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master e70a749] second commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 bar
[master e38929c] third commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 baz
[master a23add1] fourth commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup
expecting success: 
   revs=$(git rev-list --all | wc -l) &&
   test $revs -eq 4 &&
   first_commit=$(git rev-parse HEAD~3)
   

ok 2 - verify number of revisions

expecting success: 
   perl -i.bak -pe "s/second commit/socond commit/" .git/objects/pack/*.pack &&
   test_must_fail git fsck --full
   

ok 3 - corrupt second commit object

expecting success: 
   test_must_fail git rev-list --all > /dev/null
   

ok 4 - rev-list should fail
expecting success: 
   test_must_fail git repack -a -f -d
   
ok 5 - git repack _MUST_ fail

expecting success: 
   git log $first_commit
   
commit b42cb28862e638df2a67e64ba57c8473ac93462e
Author: A U Thor <author@example.com>
Date:   Tue Dec 28 04:02:18 2010 +0000

    first commit

ok 6 - first commit is still available

# passed all 6 test(s)
1..6
