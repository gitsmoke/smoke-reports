Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3210-pack-refs/.git/
expecting success: echo Hello > A &&
     git update-index --add A &&
     git commit -m "Initial commit." &&
     HEAD=$(git rev-parse --verify HEAD)
[master (root-commit) 31a68f2] Initial commit.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A

ok 1 - prepare a trivial repository
expecting success: git branch a &&
     SHA1=`cat .git/refs/heads/a` &&
     echo "$SHA1 refs/heads/a" >expect &&
     git show-ref a >result &&
     test_cmp expect result

ok 2 - see if git show-ref works as expected

expecting success: git branch b &&
     git pack-refs --all &&
     rm -f .git/refs/heads/b &&
     echo "$SHA1 refs/heads/b" >expect &&
     git show-ref b >result &&
     test_cmp expect result

ok 3 - see if a branch still exists when packed

expecting success: 
     git branch c &&
     git pack-refs --all &&
     rm -f .git/refs/heads/c &&
     test_must_fail git branch c/d

ok 4 - git branch c/d should barf if branch c exists

expecting success: git branch e &&
     git pack-refs --all --prune &&
     echo "$SHA1 refs/heads/e" >expect &&
     git show-ref e >result &&
     test_cmp expect result

ok 5 - see if a branch still exists after git pack-refs --prune

expecting success: 
     git branch f &&
     git pack-refs --all --prune &&
     ! test -f .git/refs/heads/f


ok 6 - see if git pack-refs --prune remove ref files

expecting success: 
     git branch r/s/t &&
     git pack-refs --all --prune &&
     ! test -e .git/refs/heads/r


ok 7 - see if git pack-refs --prune removes empty dirs

expecting success: git branch g/h &&
     git pack-refs --all --prune &&
     git branch -d g/h &&
     git branch g &&
     git pack-refs --all &&
     git branch -d g
Deleted branch g/h (was 31a68f2).
Deleted branch g (was 31a68f2).

ok 8 - git branch g should work when git branch g/h has been deleted

expecting success: 
     git branch i &&
     git pack-refs --all --prune &&
     test_must_fail git branch i/j/k
ok 9 - git branch i/j/k should barf if branch i exists

expecting success: git branch k/l &&
     git branch k/lm &&
     git branch -d k/l &&
     git branch k/l/m &&
     git branch -d k/l/m &&
     git branch -d k/lm &&
     git branch k
Deleted branch k/l (was 31a68f2).
Deleted branch k/l/m (was 31a68f2).
Deleted branch k/lm (was 31a68f2).

ok 10 - test git branch k after branch k/l/m and k/lm have been deleted

expecting success: git branch n/o &&
     git branch n/op &&
     git branch -d n/o &&
     git branch n/o/p &&
     git branch -d n/op &&
     git pack-refs --all --prune &&
     git branch -d n/o/p &&
     git branch n
Deleted branch n/o (was 31a68f2).
Deleted branch n/op (was 31a68f2).
Deleted branch n/o/p (was 31a68f2).

ok 11 - test git branch n after some branch deletion and pruning

expecting success: git branch q &&
	 git pack-refs --all --prune &&
	 git update-ref refs/heads/q refs/heads/q &&
	 ! test -f .git/refs/heads/q

ok 12 - see if up-to-date packed refs are preserved

expecting success: 
	git tag foo &&
	git pack-refs --all --prune &&
	git show-ref >all-of-them &&
	git pack-refs &&
	git show-ref >again &&
	test_cmp all-of-them again

ok 13 - pack, prune and repack

# passed all 13 test(s)
1..13
