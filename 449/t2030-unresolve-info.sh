Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2030-unresolve-info/.git/
expecting success: 
	mkdir fi &&
	test_commit initial fi/le first &&
	git branch side &&
	git branch another &&
	test_commit second fi/le second &&
	git checkout side &&
	test_commit third fi/le third &&
	git checkout another &&
	test_commit fourth fi/le fourth &&
	git checkout master

[master (root-commit) 443cc16] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fi/le
[master af3f913] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[side 6a89c46] third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[another c62ce17] fourth
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
	prime_resolve_undo &&
	test_tick &&
	git commit -m merged &&
	echo committing keeps &&
	check_resolve_undo kept fi/le initial:fi/le second:fi/le third:fi/le &&
	git checkout second^0 &&
	echo switching clears &&
	check_resolve_undo cleared

HEAD is now at af3f913 second
Merging:
af3f913 second
virtual third^0
found 1 common ancestor(s):
443cc16 initial
Auto-merging fi/le
CONFLICT (content): Merge conflict in fi/le
Automatic merge failed; fix conflicts and then commit the result.
merge does not leave anything
resolving records
[detached HEAD 716fff1] merged
 Author: A U Thor <author@example.com>
committing keeps
switching clears
ok 2 - add records switch clears
expecting success: 
	prime_resolve_undo &&
	test_tick &&
	git commit -m merged &&
	echo committing keeps &&
	check_resolve_undo kept fi/le initial:fi/le second:fi/le third:fi/le &&

	echo merge clears upfront &&
	test_must_fail git merge fourth^0 &&
	check_resolve_undo nuked &&

	git rm -f fi/le &&
	echo resolving records &&
	check_resolve_undo recorded fi/le initial:fi/le HEAD:fi/le fourth:fi/le &&

	git reset --hard &&
	echo resetting discards &&
	check_resolve_undo discarded
HEAD is now at af3f913 second
Merging:
af3f913 second
virtual third^0
found 1 common ancestor(s):
443cc16 initial
Auto-merging fi/le
CONFLICT (content): Merge conflict in fi/le
Automatic merge failed; fix conflicts and then commit the result.
merge does not leave anything
resolving records
[detached HEAD edc8995] merged
 Author: A U Thor <author@example.com>
committing keeps
merge clears upfront
Merging:
edc8995 merged
virtual fourth^0
found 1 common ancestor(s):
443cc16 initial
Auto-merging fi/le
CONFLICT (content): Merge conflict in fi/le
Automatic merge failed; fix conflicts and then commit the result.
fi/le: needs merge
rm 'fi/le'
resolving records
HEAD is now at edc8995 merged
resetting discards

ok 3 - rm records reset clears

expecting success: 
	prime_resolve_undo &&
	test_tick &&
	git commit -m merged &&
	echo committing keeps &&
	check_resolve_undo kept fi/le initial:fi/le second:fi/le third:fi/le &&

	echo plumbing clear &&
	git update-index --clear-resolve-undo &&
	check_resolve_undo cleared
HEAD is now at edc8995 merged
Merging:
af3f913 second
virtual third^0
found 1 common ancestor(s):
443cc16 initial
Auto-merging fi/le
CONFLICT (content): Merge conflict in fi/le
Automatic merge failed; fix conflicts and then commit the result.
merge does not leave anything
resolving records
[detached HEAD 87a2113] merged
 Author: A U Thor <author@example.com>
committing keeps
plumbing clear
ok 4 - plumbing clears
expecting success: 
	prime_resolve_undo &&
	git diff HEAD &&
	git checkout --conflict=merge fi/le &&
	echo checkout used the record and removed it &&
	check_resolve_undo removed &&
	echo the index and the work tree is unmerged again &&
	git diff >actual &&
	grep "^++<<<<<<<" actual
HEAD is now at 87a2113 merged
Merging:
af3f913 second
virtual third^0
found 1 common ancestor(s):
443cc16 initial
Auto-merging fi/le
CONFLICT (content): Merge conflict in fi/le
Automatic merge failed; fix conflicts and then commit the result.
merge does not leave anything
resolving records
diff --git a/fi/le b/fi/le
index e019be0..8dca2f8 100644
--- a/fi/le
+++ b/fi/le
@@ -1 +1 @@
-second
+different
checkout used the record and removed it
the index and the work tree is unmerged again
++<<<<<<< ours
ok 5 - add records checkout -m undoes
expecting success: 
	prime_resolve_undo &&
	git update-index --unresolve fi/le &&
	git ls-files -u >actual &&
	test $(wc -l <actual) = 3
HEAD is now at af3f913 second
Merging:
af3f913 second
virtual third^0
found 1 common ancestor(s):
443cc16 initial
Auto-merging fi/le
CONFLICT (content): Merge conflict in fi/le
Automatic merge failed; fix conflicts and then commit the result.
merge does not leave anything
resolving records
ok 6 - unmerge with plumbing
expecting success: 
	mkdir .git/rr-cache &&
	prime_resolve_undo &&
	echo record the resolution &&
	git rerere &&
	rerere_id=$(cd .git/rr-cache && echo */postimage) &&
	rerere_id=${rerere_id%/postimage} &&
	test -f .git/rr-cache/$rerere_id/postimage &&
	git checkout -m fi/le &&
	echo resurrect the conflict &&
	grep "^=======" fi/le &&
	echo reresolve the conflict &&
	git rerere &&
	test "z$(cat fi/le)" = zdifferent &&
	echo register the resolution again &&
	git add fi/le &&
	check_resolve_undo kept fi/le initial:fi/le second:fi/le third:fi/le &&
	test -z "$(git ls-files -u)" &&
	git rerere forget fi/le &&
	! test -f .git/rr-cache/$rerere_id/postimage &&
	tr " " "
" <.git/MERGE_RR >actual &&
	echo "$rerere_id	fi/le" >expect &&
	test_cmp expect actual
HEAD is now at af3f913 second
Merging:
af3f913 second
virtual third^0
found 1 common ancestor(s):
443cc16 initial
Auto-merging fi/le
CONFLICT (content): Merge conflict in fi/le
Automatic merge failed; fix conflicts and then commit the result.
merge does not leave anything
resolving records
record the resolution
resurrect the conflict
=======
reresolve the conflict
register the resolution again
ok 7 - rerere and rerere forget
expecting success: 
	rm -fr .git/rr-cache &&
	mkdir .git/rr-cache &&
	prime_resolve_undo &&
	echo record the resolution &&
	(cd fi && git rerere) &&
	rerere_id=$(cd .git/rr-cache && echo */postimage) &&
	rerere_id=${rerere_id%/postimage} &&
	test -f .git/rr-cache/$rerere_id/postimage &&
	(cd fi && git checkout -m le) &&
	echo resurrect the conflict &&
	grep "^=======" fi/le &&
	echo reresolve the conflict &&
	(cd fi && git rerere) &&
	test "z$(cat fi/le)" = zdifferent &&
	echo register the resolution again &&
	(cd fi && git add le) &&
	check_resolve_undo kept fi/le initial:fi/le second:fi/le third:fi/le &&
	test -z "$(git ls-files -u)" &&
	(cd fi && git rerere forget le) &&
	! test -f .git/rr-cache/$rerere_id/postimage &&
	tr " " "
" <.git/MERGE_RR >actual &&
	echo "$rerere_id	fi/le" >expect &&
	test_cmp expect actual
HEAD is now at af3f913 second
Merging:
af3f913 second
virtual third^0
found 1 common ancestor(s):
443cc16 initial
Auto-merging fi/le
CONFLICT (content): Merge conflict in fi/le
Automatic merge failed; fix conflicts and then commit the result.
merge does not leave anything
resolving records
record the resolution
resurrect the conflict
=======
reresolve the conflict
register the resolution again
ok 8 - rerere and rerere forget (subdirectory)

# passed all 8 test(s)
1..8
