Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5520-pull/.git/
expecting success: 

	echo file >file &&
	git add file &&
	git commit -a -m original


[master (root-commit) ab09abb] original
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - setup

expecting success: 
	mkdir cloned &&
	cd cloned &&
	git init &&
	git pull ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5520-pull/cloned/.git/

ok 2 - pulling into void

expecting success: 
	test -f file &&
	test -f cloned/file &&
	test_cmp file cloned/file


ok 3 - checking the results

expecting success: 
	mkdir cloned-uho &&
	(
		cd cloned-uho &&
		git init &&
		git pull .. master:master
	) &&
	test -f file &&
	test -f cloned-uho/file &&
	test_cmp file cloned-uho/file
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5520-pull/cloned-uho/.git/
ok 4 - pulling into void using master:master
expecting success: 

	git branch copy master &&
	git config branch.copy.remote . &&
	git config branch.copy.merge refs/heads/master &&
	echo updated >file &&
	git commit -a -m updated &&
	git checkout copy &&
	test `cat file` = file &&
	git pull &&
	test `cat file` = updated
[master 462d469] updated
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Your branch is behind 'master' by 1 commit, and can be fast-forwarded.
Updating ab09abb..462d469
Fast-forward
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 5 - test . as a remote

expecting success: 
	git checkout -b second master^ &&
	echo modified >file &&
	git commit -a -m modified &&
	git checkout copy &&
	git reset --hard HEAD^ &&
	test `cat file` = file &&
	git pull . second &&
	test `cat file` = modified
[second 42f043d] modified
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at ab09abb original
Updating ab09abb..42f043d
Fast-forward
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 6 - the default remote . should not break explicit pull

expecting success: 
	git branch to-rebase &&
	echo modified again > file &&
	git commit -m file file &&
	git checkout to-rebase &&
	echo new > file2 &&
	git add file2 &&
	git commit -m "new file" &&
	git tag before-rebase &&
	git pull --rebase . copy &&
	test $(git rev-parse HEAD^) = $(git rev-parse copy) &&
	test new = $(git show HEAD:file2)
[copy 049c23c] file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[to-rebase 123472b] new file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2
First, rewinding head to replay your work on top of it...
Applying: new file

ok 7 - --rebase

expecting success: 
	git reset --hard before-rebase &&
	git config branch.to-rebase.rebase 1 &&
	git pull . copy &&
	git config branch.to-rebase.rebase 0 &&
	test $(git rev-parse HEAD^) = $(git rev-parse copy) &&
	test new = $(git show HEAD:file2)

HEAD is now at 123472b new file
First, rewinding head to replay your work on top of it...
Applying: new file

ok 8 - branch.to-rebase.rebase

expecting success: 

	git remote add -f me . &&
	git checkout copy &&
	git tag copy-orig &&
	git reset --hard HEAD^ &&
	echo conflicting modification > file &&
	git commit -m conflict file &&
	git checkout to-rebase &&
	echo file > file2 &&
	git commit -m to-rebase file2 &&
	git tag to-rebase-orig &&
	git pull --rebase me copy &&
	test "conflicting modification" = "$(cat file)" &&
	test file = $(cat file2)
Updating me
Your branch and 'master' have diverged,
and have 2 and 1 different commit(s) each, respectively.
HEAD is now at 42f043d modified
[copy 4e35e30] conflict
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[to-rebase 382ffe8] to-rebase
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
First, rewinding head to replay your work on top of it...
Applying: new file
Applying: to-rebase

ok 9 - --rebase with rebased upstream

expecting success: 

	git update-ref refs/remotes/me/copy copy-orig &&
	git checkout --track -b to-rebase2 me/copy &&
	git reset --hard to-rebase-orig &&
	git pull --rebase &&
	test "conflicting modification" = "$(cat file)" &&
	test file = $(cat file2)


Branch to-rebase2 set up to track remote branch copy from me.
HEAD is now at 382ffe8 to-rebase
First, rewinding head to replay your work on top of it...
Applying: new file
Applying: to-rebase

ok 10 - --rebase with rebased default upstream

expecting success: 

	git update-ref refs/remotes/me/copy copy-orig &&
	git reset --hard to-rebase-orig &&
	git checkout --track -b to-rebase3 me/copy &&
	git reset --hard to-rebase-orig &&
	git fetch &&
	git pull --rebase &&
	test "conflicting modification" = "$(cat file)" &&
	test file = "$(cat file2)"
HEAD is now at 382ffe8 to-rebase
Branch to-rebase3 set up to track remote branch copy from me.
HEAD is now at 382ffe8 to-rebase
First, rewinding head to replay your work on top of it...
Applying: new file
Applying: to-rebase
ok 11 - rebased upstream + fetch + pull --rebase
expecting success: 

	git checkout to-rebase &&
	git update-ref refs/remotes/me/copy copy^ &&
	COPY=$(git rev-parse --verify me/copy) &&
	git rebase --onto $COPY copy &&
	git config branch.to-rebase.remote me &&
	git config branch.to-rebase.merge refs/heads/copy &&
	git config branch.to-rebase.rebase true &&
	echo dirty >> file &&
	git add file &&
	test_must_fail git pull &&
	test $COPY = $(git rev-parse --verify me/copy) &&
	git checkout HEAD -- file &&
	git pull &&
	test $COPY != $(git rev-parse --verify me/copy)
First, rewinding head to replay your work on top of it...
Applying: new file
Applying: to-rebase
First, rewinding head to replay your work on top of it...
Applying: new file
Applying: to-rebase
ok 12 - pull --rebase dies early with dirty working directory
expecting success: 
	git rev-parse master >expect &&
	mkdir empty_repo &&
	(cd empty_repo &&
	 git init &&
	 git pull --rebase .. master &&
	 git rev-parse HEAD >../actual
	) &&
	test_cmp expect actual
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5520-pull/empty_repo/.git/
ok 13 - pull --rebase works on branch yet to be born
expecting success: 
	mkdir src &&
	(cd src &&
	 git init &&
	 printf "1
2
3
4
5
6
7
8
9
10
" > stuff &&
	 git add stuff &&
	 git commit -m "Initial revision"
	) &&
	git clone src dst &&
	(cd src &&
	 modify s/5/43/ stuff &&
	 git commit -a -m "5->43" &&
	 modify s/6/42/ stuff &&
	 git commit -a -m "Make it bigger"
	) &&
	(cd dst &&
	 modify s/5/43/ stuff &&
	 git commit -a -m "Independent discovery of 5->43"
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5520-pull/src/.git/
[master (root-commit) 51c6929] Initial revision
 Author: A U Thor <author@example.com>
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 stuff
Cloning into dst...
done.
[master 711b097] 5->43
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master cc7bf99] Make it bigger
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 196d0e2] Independent discovery of 5->43
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 14 - setup for detecting upstreamed changes

expecting success: 
	(cd dst &&
	 git pull --rebase &&
	 test -z "$(git ls-files -u)"
	)
First, rewinding head to replay your work on top of it...
Nothing to do.

ok 15 - git pull --rebase detects upstreamed changes

expecting success: 
	(cd dst &&
	 test_might_fail git rebase --abort &&
	 git reset --hard origin/master
	) &&
	git clone --bare src src-replace.git &&
	rm -rf src &&
	mv src-replace.git src &&
	(cd dst &&
	 modify s/2/22/ stuff &&
	 git commit -a -m "Change 2" &&
	 modify s/3/33/ stuff &&
	 git commit -a -m "Change 3" &&
	 modify s/4/44/ stuff &&
	 git commit -a -m "Change 4" &&
	 git push &&

	 modify s/44/55/ stuff &&
	 git commit --amend -a -m "Modified Change 4"
	)
HEAD is now at cc7bf99 Make it bigger
Cloning into bare repository src-replace.git...
done.
[master acd397e] Change 2
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 2 deletions(-)
[master a79b4b1] Change 3
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 2 deletions(-)
[master bba817c] Change 4
 Author: A U Thor <author@example.com>
 1 files changed, 3 insertions(+), 3 deletions(-)
[master 5f67e84] Modified Change 4
 Author: A U Thor <author@example.com>
 1 files changed, 3 insertions(+), 3 deletions(-)

ok 16 - setup for avoiding reapplying old patches

expecting success: 
	(cd dst &&
	 test_must_fail git pull --rebase &&
	 test 1 = $(find .git/rebase-apply -name "000*" | wc -l)
	)
First, rewinding head to replay your work on top of it...
Applying: Modified Change 4
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with Modified Change 4
Merging:
bba817c Change 4
virtual Modified Change 4
found 1 common ancestor(s):
virtual e369e858ec1aa73d497d02c4f23e5cf4ae2d3c3b
Auto-merging stuff
CONFLICT (content): Merge conflict in stuff
Failed to merge in the changes.
Patch failed at 0001 Modified Change 4

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".


ok 17 - git pull --rebase does not reapply old patches

expecting success: 
	git checkout -b copy2 to-rebase-orig &&
	git pull --rebase . to-rebase &&
	test "conflicting modification" = "$(cat file)" &&
	test file = "$(cat file2)"
First, rewinding head to replay your work on top of it...
Nothing to do.

ok 18 - git pull --rebase against local branch

# passed all 18 test(s)
1..18
