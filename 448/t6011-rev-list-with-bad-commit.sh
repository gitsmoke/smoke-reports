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
[master (root-commit) a8700f5] first commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master 6308009] second commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 bar
[master c48747d] third commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 baz
[master 8ba2c5e] fourth commit
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
   
commit a8700f580793e2ac50a243a6e44aabb7245ed88d
Author: A U Thor <author@example.com>
Date:   Thu Jan 13 04:02:18 2011 +0000

    first commit
ok 6 - first commit is still available

# passed all 6 test(s)
1..6
