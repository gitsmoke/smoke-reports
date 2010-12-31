Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4252-am-options/.git/
expecting success: 
	cp "$tm/file-1-0" file-1 &&
	cp "$tm/file-2-0" file-2 &&
	git add file-1 file-2 &&
	test_tick &&
	git commit -m initial &&
	git tag initial
[master (root-commit) f06d5e1] initial
 Author: A U Thor <author@example.com>
 2 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 file-1
 create mode 100644 file-2

ok 1 - setup
expecting success: 
	rm -rf .git/rebase-apply &&
	git reset --hard initial &&
	test_must_fail git am --whitespace=fix "$tm"/am-test-1-? &&
	git am --skip &&
	grep 3 file-1 &&
	grep "^Six$" file-2
HEAD is now at f06d5e1 initial
Applying: Three
Patch failed at 0001 Three
When you have resolved this problem run gitam--resolved.
If you would prefer to skip this patch, instead run gitam--skip.
To restore the original branch and stop patching run gitam--abort.
Applying: Six
3
Six
ok 2 - interrupted am --whitespace=fix
expecting success: 
	rm -rf .git/rebase-apply &&
	git reset --hard initial &&
	test_must_fail git am -C1 "$tm"/am-test-2-? &&
	git am --skip &&
	grep 3 file-1 &&
	grep "^Three$" file-2
HEAD is now at f06d5e1 initial
Applying: Three
Patch failed at 0001 Three
When you have resolved this problem run gitam--resolved.
If you would prefer to skip this patch, instead run gitam--skip.
To restore the original branch and stop patching run gitam--abort.
Applying: Six
3
Three

ok 3 - interrupted am -C1

expecting success: 
	rm -rf .git/rebase-apply &&
	git reset --hard initial &&
	test_must_fail git am -p2 "$tm"/am-test-3-? &&
	git am --skip &&
	grep 3 file-1 &&
	grep "^Three$" file-2

HEAD is now at f06d5e1 initial
Applying: Three
Patch failed at 0001 Three
When you have resolved this problem run gitam--resolved.
If you would prefer to skip this patch, instead run gitam--skip.
To restore the original branch and stop patching run gitam--abort.
Applying: Six
3
Three

ok 4 - interrupted am -p2

expecting success: 
	rm -rf .git/rebase-apply &&
	git reset --hard initial &&
	test_must_fail git am -p2 -C1 "$tm"/am-test-4-? &&
	git am --skip &&
	grep 3 file-1 &&
	grep "^Three$" file-2

HEAD is now at f06d5e1 initial
Applying: Three
Patch failed at 0001 Three
When you have resolved this problem run gitam--resolved.
If you would prefer to skip this patch, instead run gitam--skip.
To restore the original branch and stop patching run gitam--abort.
Applying: Six
3
Three

ok 5 - interrupted am -C1 -p2

expecting success: 
	rm -rf .git/rebase-apply &&
	git reset --hard initial &&
	test_must_fail git am --directory="frotz nitfol" "$tm"/am-test-5-? &&
	git am --skip &&
	grep One "frotz nitfol/file-5"
HEAD is now at f06d5e1 initial
Applying: Six
Patch failed at 0001 Six
When you have resolved this problem run gitam--resolved.
If you would prefer to skip this patch, instead run gitam--skip.
To restore the original branch and stop patching run gitam--abort.
Applying: Six
One

ok 6 - interrupted am --directory="frotz nitfol"

expecting success: 
	with_sq="with'sq" &&
	rm -fr .git/rebase-apply &&
	git reset --hard initial &&
	git am --directory="$with_sq" "$tm"/am-test-5-2 &&
	test -f "$with_sq/file-5"
HEAD is now at f06d5e1 initial
Applying: Six

ok 7 - apply to a funny path

expecting success: 
	rm -rf .git/rebase-apply &&
	git reset --hard initial &&
	test_must_fail git am --reject "$tm"/am-test-6-1 &&
	grep "@@ -1,3 +1,3 @@" file-2.rej &&
	test_must_fail git diff-files --exit-code --quiet file-2 &&
	grep "[-]-reject" .git/rebase-apply/apply-opt
HEAD is now at f06d5e1 initial
Applying: Huh
Patch failed at 0001 Huh
When you have resolved this problem run gitam--resolved.
If you would prefer to skip this patch, instead run gitam--skip.
To restore the original branch and stop patching run gitam--abort.
@@ -1,3 +1,3 @@
  --reject

ok 8 - am --reject

# passed all 8 test(s)
1..8
