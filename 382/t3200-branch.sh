Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3200-branch/.git/
expecting success: echo Hello > A &&
     git update-index --add A &&
     git commit -m "Initial commit." &&
     echo World >> A &&
     git update-index --add A &&
     git commit -m "Second commit." &&
     HEAD=$(git rev-parse --verify HEAD)
[master (root-commit) 3e1a58c] Initial commit.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A
[master 5f57fe0] Second commit.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - prepare a trivial repository

expecting success: 
     git branch --help </dev/null >/dev/null 2>/dev/null;
     ! test -f .git/refs/heads/--help

ok 2 - git branch --help should not have created a bogus branch

expecting success: 
	mkdir broken &&
	(
		cd broken &&
		git init &&
		>.git/refs/heads/master &&
		test_expect_code 129 git branch -h >usage 2>&1
	) &&
	grep "[Uu]sage" broken/usage
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3200-branch/broken/.git/
usage: git branch [options] [-r | -a] [--merged | --no-merged]

ok 3 - branch -h in broken repository

expecting success: git branch abc && test -f .git/refs/heads/abc

ok 4 - git branch abc should create a branch

expecting success: git branch a/b/c && test -f .git/refs/heads/a/b/c

ok 5 - git branch a/b/c should create a branch

expecting success: GIT_COMMITTER_DATE="2005-05-26 23:30" \
     git branch -l d/e/f &&
	 test -f .git/refs/heads/d/e/f &&
	 test -f .git/logs/refs/heads/d/e/f &&
	 test_cmp expect .git/logs/refs/heads/d/e/f

ok 6 - git branch -l d/e/f should create a branch and a log

expecting success: git branch -d d/e/f &&
	 test ! -f .git/refs/heads/d/e/f &&
	 test ! -f .git/logs/refs/heads/d/e/f
Deleted branch d/e/f (was 5f57fe0).

ok 7 - git branch -d d/e/f should delete a branch and a log

expecting success: git branch j &&
        git branch -d j &&
        git branch j/k
Deleted branch j (was 5f57fe0).

ok 8 - git branch j/k should work after branch j has been deleted

expecting success: git branch l/m &&
        git branch -d l/m &&
        git branch l
Deleted branch l/m (was 5f57fe0).

ok 9 - git branch l should work after branch l/m has been deleted

expecting success: git branch -l m &&
        git branch -m m m/m &&
        test -f .git/logs/refs/heads/m/m

ok 10 - git branch -m m m/m should work

expecting success: git branch -l n/n &&
        git branch -m n/n n
        test -f .git/logs/refs/heads/n

ok 11 - git branch -m n/n n should work

expecting success: 
	git branch o/o &&
        git branch o/p &&
	test_must_fail git branch -m o/o o


ok 12 - git branch -m o/o o should fail when o/p exists

expecting success: 
	git branch q &&
	git branch r &&
	test_must_fail git branch -m q r/q


ok 13 - git branch -m q r/q should fail when r exists

expecting success: 
	git branch -m q q2 &&
	git branch -m q2 q

ok 14 - git branch -m q q2 without config should succeed

expecting success: git branch -l s/s &&
        test -f .git/logs/refs/heads/s/s &&
        git branch -l s/t &&
        test -f .git/logs/refs/heads/s/t &&
        git branch -d s/t &&
        git branch -m s/s s &&
        test -f .git/logs/refs/heads/s
Deleted branch s/t (was 5f57fe0).
ok 15 - git branch -m s/s s should work when s/t is deleted
expecting success: test Hello = Hello &&
	 test_must_fail git config branch.s/s/dummy

ok 16 - config information was renamed, too

expecting success: 
	git symbolic-ref refs/heads/master2 refs/heads/master &&
	test_must_fail git branch -m master2 master3 &&
	git symbolic-ref refs/heads/master2 &&
	test -f .git/refs/heads/master &&
	! test -f .git/refs/heads/master3

refs/heads/master

ok 17 - renaming a symref is not allowed

expecting success: 
     git branch -l u &&
     mv .git/logs/refs/heads/u real-u &&
     ln -s real-u .git/logs/refs/heads/u &&
     test_must_fail git branch -m u v

ok 18 - git branch -m u v should fail when the reflog for u is a symlink

expecting success: git config remote.local.url . &&
     git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
     (git show-ref -q refs/remotes/local/master || git fetch local) &&
     git branch --track my1 local/master &&
     test $(git config branch.my1.remote) = local &&
     test $(git config branch.my1.merge) = refs/heads/master
Branch my1 set up to track remote branch master from local.

ok 19 - test tracking setup via --track

expecting success: git config remote.local.url . &&
     git config remote.local.fetch refs/heads/master:refs/remotes/local/master &&
     (git show-ref -q refs/remotes/local/master || git fetch local) &&
     git branch --track my4 local/master &&
     test $(git config branch.my4.remote) = local &&
     test $(git config branch.my4.merge) = refs/heads/master
Branch my4 set up to track remote branch master from local.

ok 20 - test tracking setup (non-wildcard, matching)

expecting success: git config remote.local.url . &&
     git config remote.local.fetch refs/heads/s:refs/remotes/local/s &&
     (git show-ref -q refs/remotes/local/master || git fetch local) &&
     git branch --track my5 local/master &&
     ! test "$(git config branch.my5.remote)" = local &&
     ! test "$(git config branch.my5.merge)" = refs/heads/master
Branch my5 set up to track local ref refs/remotes/local/master.

ok 21 - test tracking setup (non-wildcard, not matching)
expecting success: git config branch.autosetupmerge true &&
     git config remote.local.url . &&
     git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
     (git show-ref -q refs/remotes/local/master || git fetch local) &&
     git branch my3 local/master &&
     test $(git config branch.my3.remote) = local &&
     test $(git config branch.my3.merge) = refs/heads/master
Branch my3 set up to track remote branch master from local.

ok 22 - test tracking setup via config

expecting success: git config branch.autosetupmerge true &&
     git config remote.local.url . &&
     git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
     (git show-ref -q refs/remotes/local/master || git fetch local) &&
     git branch --no-track my2 local/master &&
     git config branch.autosetupmerge false &&
     ! test "$(git config branch.my2.remote)" = local &&
     ! test "$(git config branch.my2.merge)" = refs/heads/master

ok 23 - test overriding tracking setup via --no-track

expecting success: git config branch.autosetupmerge true &&
     git branch my6 s &&
     git config branch.automsetupmerge false &&
     test -z "$(git config branch.my6.remote)" &&
     test -z "$(git config branch.my6.merge)"

ok 24 - no tracking without .fetch entries

expecting success: git config remote.local.url . &&
     git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
     (git show-ref -q refs/remotes/local/o/o || git fetch local) &&
     git branch --track my7 local/o/o &&
     test "$(git config branch.my7.remote)" = local &&
     test "$(git config branch.my7.merge)" = refs/heads/o/o
Branch my7 set up to track remote branch o/o from local.

ok 25 - test tracking setup via --track but deeper
expecting success: git branch -d my7 &&
     test -z "$(git config branch.my7.remote)" &&
     test -z "$(git config branch.my7.merge)"
Deleted branch my7 (was 5f57fe0).
ok 26 - test deleting branch deletes branch config
expecting success: git branch my7 s &&
     sha1=$(git rev-parse my7 | cut -c 1-7) &&
     test "$(git branch -d my7 2>&1)" = "Deleted branch my7 (was $sha1)."

ok 27 - test deleting branch without config

expecting success: git branch --track my8 &&
     test "$(git config branch.my8.remote)" &&
     test "$(git config branch.my8.merge)"
Branch my8 set up to track local branch master.

ok 28 - test --track without .fetch entries

expecting success: git config branch.autosetupmerge always &&
     git branch my9 HEAD^ &&
     git config branch.autosetupmerge false

ok 29 - branch from non-branch HEAD w/autosetupmerge=always

expecting success: test_must_fail git branch --track my10 HEAD^

ok 30 - branch from non-branch HEAD w/--track causes failure
expecting success: GIT_COMMITTER_DATE="2005-05-26 23:30" \
     git checkout -b g/h/i -l master &&
	 test -f .git/refs/heads/g/h/i &&
	 test -f .git/logs/refs/heads/g/h/i &&
	 test_cmp expect .git/logs/refs/heads/g/h/i
ok 31 - git checkout -b g/h/i -l should create a branch and a log
expecting success: 
	git checkout master &&
	git config --unset core.logAllRefUpdates &&
	git checkout -b alpha &&
	git rev-parse --verify alpha@{0}
5f57fe0842ee87a8b28d9aa4cc741962c9a049bd

ok 32 - checkout -b makes reflog by default
expecting success: 
	git checkout master &&
	git config core.logAllRefUpdates false &&
	git checkout -b beta &&
	test_must_fail git rev-parse --verify beta@{0}
ok 33 - checkout -b does not make reflog when core.logAllRefUpdates = false

expecting success: 
	git checkout master &&
	git checkout -lb gamma &&
	git config --unset core.logAllRefUpdates &&
	git rev-parse --verify gamma@{0}
5f57fe0842ee87a8b28d9aa4cc741962c9a049bd

ok 34 - checkout -b with -l makes reflog when core.logAllRefUpdates = false
expecting success: 
	git config branch.autosetupmerge true &&
	git config remote.ambi1.url lalala &&
	git config remote.ambi1.fetch refs/heads/lalala:refs/heads/master &&
	git config remote.ambi2.url lilili &&
	git config remote.ambi2.fetch refs/heads/lilili:refs/heads/master &&
	git branch all1 master &&
	test -z "$(git config branch.all1.merge)"
ok 35 - avoid ambiguous track
expecting success: 
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	git config branch.autosetuprebase local &&
	(git show-ref -q refs/remotes/local/o || git fetch local) &&
	git branch mybase &&
	git branch --track myr1 mybase &&
	test "$(git config branch.myr1.remote)" = . &&
	test "$(git config branch.myr1.merge)" = refs/heads/mybase &&
	test "$(git config branch.myr1.rebase)" = true
Branch myr1 set up to track local branch mybase by rebasing.

ok 36 - autosetuprebase local on a tracked local branch

expecting success: 
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	git config branch.autosetuprebase always &&
	(git show-ref -q refs/remotes/local/o || git fetch local) &&
	git branch mybase2 &&
	git branch --track myr2 mybase &&
	test "$(git config branch.myr2.remote)" = . &&
	test "$(git config branch.myr2.merge)" = refs/heads/mybase &&
	test "$(git config branch.myr2.rebase)" = true
Branch myr2 set up to track local branch mybase by rebasing.

ok 37 - autosetuprebase always on a tracked local branch

expecting success: 
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	git config branch.autosetuprebase remote &&
	(git show-ref -q refs/remotes/local/o || git fetch local) &&
	git branch mybase3 &&
	git branch --track myr3 mybase2 &&
	test "$(git config branch.myr3.remote)" = . &&
	test "$(git config branch.myr3.merge)" = refs/heads/mybase2 &&
	! test "$(git config branch.myr3.rebase)" = true

Branch myr3 set up to track local branch mybase2.

ok 38 - autosetuprebase remote on a tracked local branch

expecting success: 
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	git config branch.autosetuprebase never &&
	(git show-ref -q refs/remotes/local/o || git fetch local) &&
	git branch mybase4 &&
	git branch --track myr4 mybase2 &&
	test "$(git config branch.myr4.remote)" = . &&
	test "$(git config branch.myr4.merge)" = refs/heads/mybase2 &&
	! test "$(git config branch.myr4.rebase)" = true

Branch myr4 set up to track local branch mybase2.

ok 39 - autosetuprebase never on a tracked local branch

expecting success: 
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	git config branch.autosetuprebase local &&
	(git show-ref -q refs/remotes/local/master || git fetch local) &&
	git branch --track myr5 local/master &&
	test "$(git config branch.myr5.remote)" = local &&
	test "$(git config branch.myr5.merge)" = refs/heads/master &&
	! test "$(git config branch.myr5.rebase)" = true

Branch myr5 set up to track remote branch master from local.

ok 40 - autosetuprebase local on a tracked remote branch

expecting success: 
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	git config branch.autosetuprebase never &&
	(git show-ref -q refs/remotes/local/master || git fetch local) &&
	git branch --track myr6 local/master &&
	test "$(git config branch.myr6.remote)" = local &&
	test "$(git config branch.myr6.merge)" = refs/heads/master &&
	! test "$(git config branch.myr6.rebase)" = true

Branch myr6 set up to track remote branch master from local.

ok 41 - autosetuprebase never on a tracked remote branch

expecting success: 
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	git config branch.autosetuprebase remote &&
	(git show-ref -q refs/remotes/local/master || git fetch local) &&
	git branch --track myr7 local/master &&
	test "$(git config branch.myr7.remote)" = local &&
	test "$(git config branch.myr7.merge)" = refs/heads/master &&
	test "$(git config branch.myr7.rebase)" = true

Branch myr7 set up to track remote branch master from local by rebasing.

ok 42 - autosetuprebase remote on a tracked remote branch

expecting success: 
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	git config branch.autosetuprebase remote &&
	(git show-ref -q refs/remotes/local/master || git fetch local) &&
	git branch --track myr8 local/master &&
	test "$(git config branch.myr8.remote)" = local &&
	test "$(git config branch.myr8.merge)" = refs/heads/master &&
	test "$(git config branch.myr8.rebase)" = true

Branch myr8 set up to track remote branch master from local by rebasing.

ok 43 - autosetuprebase always on a tracked remote branch

expecting success: 
	git config --unset branch.autosetuprebase &&
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	(git show-ref -q refs/remotes/local/master || git fetch local) &&
	git branch --track myr9 local/master &&
	test "$(git config branch.myr9.remote)" = local &&
	test "$(git config branch.myr9.merge)" = refs/heads/master &&
	test "z$(git config branch.myr9.rebase)" = z

Branch myr9 set up to track remote branch master from local.

ok 44 - autosetuprebase unconfigured on a tracked remote branch

expecting success: 
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	(git show-ref -q refs/remotes/local/o || git fetch local) &&
	git branch mybase10 &&
	git branch --track myr10 mybase2 &&
	test "$(git config branch.myr10.remote)" = . &&
	test "$(git config branch.myr10.merge)" = refs/heads/mybase2 &&
	test "z$(git config branch.myr10.rebase)" = z
Branch myr10 set up to track local branch mybase2.
ok 45 - autosetuprebase unconfigured on a tracked local branch
expecting success: 
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	(git show-ref -q refs/remotes/local/master || git fetch local) &&
	git branch --no-track myr11 mybase2 &&
	test "z$(git config branch.myr11.remote)" = z &&
	test "z$(git config branch.myr11.merge)" = z &&
	test "z$(git config branch.myr11.rebase)" = z

ok 46 - autosetuprebase unconfigured on untracked local branch

expecting success: 
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	(git show-ref -q refs/remotes/local/master || git fetch local) &&
	git branch --no-track myr12 local/master &&
	test "z$(git config branch.myr12.remote)" = z &&
	test "z$(git config branch.myr12.merge)" = z &&
	test "z$(git config branch.myr12.rebase)" = z

ok 47 - autosetuprebase unconfigured on untracked remote branch

expecting success: 
	git config branch.autosetuprebase never &&
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	(git show-ref -q refs/remotes/local/master || git fetch local) &&
	git branch --no-track myr13 mybase2 &&
	test "z$(git config branch.myr13.remote)" = z &&
	test "z$(git config branch.myr13.merge)" = z &&
	test "z$(git config branch.myr13.rebase)" = z

ok 48 - autosetuprebase never on an untracked local branch

expecting success: 
	git config branch.autosetuprebase local &&
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	(git show-ref -q refs/remotes/local/master || git fetch local) &&
	git branch --no-track myr14 mybase2 &&
	test "z$(git config branch.myr14.remote)" = z &&
	test "z$(git config branch.myr14.merge)" = z &&
	test "z$(git config branch.myr14.rebase)" = z

ok 49 - autosetuprebase local on an untracked local branch

expecting success: 
	git config branch.autosetuprebase remote &&
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	(git show-ref -q refs/remotes/local/master || git fetch local) &&
	git branch --no-track myr15 mybase2 &&
	test "z$(git config branch.myr15.remote)" = z &&
	test "z$(git config branch.myr15.merge)" = z &&
	test "z$(git config branch.myr15.rebase)" = z

ok 50 - autosetuprebase remote on an untracked local branch

expecting success: 
	git config branch.autosetuprebase always &&
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	(git show-ref -q refs/remotes/local/master || git fetch local) &&
	git branch --no-track myr16 mybase2 &&
	test "z$(git config branch.myr16.remote)" = z &&
	test "z$(git config branch.myr16.merge)" = z &&
	test "z$(git config branch.myr16.rebase)" = z

ok 51 - autosetuprebase always on an untracked local branch

expecting success: 
	git config branch.autosetuprebase never &&
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	(git show-ref -q refs/remotes/local/master || git fetch local) &&
	git branch --no-track myr17 local/master &&
	test "z$(git config branch.myr17.remote)" = z &&
	test "z$(git config branch.myr17.merge)" = z &&
	test "z$(git config branch.myr17.rebase)" = z

ok 52 - autosetuprebase never on an untracked remote branch

expecting success: 
	git config branch.autosetuprebase local &&
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	(git show-ref -q refs/remotes/local/master || git fetch local) &&
	git branch --no-track myr18 local/master &&
	test "z$(git config branch.myr18.remote)" = z &&
	test "z$(git config branch.myr18.merge)" = z &&
	test "z$(git config branch.myr18.rebase)" = z

ok 53 - autosetuprebase local on an untracked remote branch

expecting success: 
	git config branch.autosetuprebase remote &&
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	(git show-ref -q refs/remotes/local/master || git fetch local) &&
	git branch --no-track myr19 local/master &&
	test "z$(git config branch.myr19.remote)" = z &&
	test "z$(git config branch.myr19.merge)" = z &&
	test "z$(git config branch.myr19.rebase)" = z

ok 54 - autosetuprebase remote on an untracked remote branch

expecting success: 
	git config branch.autosetuprebase always &&
	git config remote.local.url . &&
	git config remote.local.fetch refs/heads/*:refs/remotes/local/* &&
	(git show-ref -q refs/remotes/local/master || git fetch local) &&
	git branch --no-track myr20 local/master &&
	test "z$(git config branch.myr20.remote)" = z &&
	test "z$(git config branch.myr20.merge)" = z &&
	test "z$(git config branch.myr20.rebase)" = z

ok 55 - autosetuprebase always on an untracked remote branch

expecting success: 
	git config branch.autosetuprebase garbage &&
	test_must_fail git branch
ok 56 - detect misconfigured autosetuprebase (bad value)
expecting success: 
	git config --unset branch.autosetuprebase &&
	echo "[branch] autosetuprebase" >> .git/config &&
	test_must_fail git branch &&
	git config --unset branch.autosetuprebase
ok 57 - detect misconfigured autosetuprebase (no value)

expecting success: 
	git checkout my9 &&
	git config --unset branch.my8.merge &&
	test_must_fail git branch -d my8
ok 58 - attempt to delete a branch without base and unmerged to HEAD
expecting success: 
	# we are on my9 which is the initial commit; traditionally
	# we would not have allowed deleting my8 that is not merged
	# to my9, but it is set to track master that already has my8
	git config branch.my8.merge refs/heads/master &&
	git branch -d my8
Deleted branch my8 (was 5f57fe0).
ok 59 - attempt to delete a branch merged to its base
expecting success: 
	git checkout master &&
	echo Third >>A &&
	git commit -m "Third commit" A &&
	git branch -t my10 my9 &&
	git branch -f my10 HEAD^ &&
	# we are on master which is at the third commit, and my10
	# is behind us, so traditionally we would have allowed deleting
	# it; but my10 is set to track my9 that is further behind.
	test_must_fail git branch -d my10
[master ce14ae4] Third commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Branch my10 set up to track local branch my9.

ok 60 - attempt to delete a branch merged to its base

# passed all 60 test(s)
1..60
