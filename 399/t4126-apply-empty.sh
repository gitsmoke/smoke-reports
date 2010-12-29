Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4126-apply-empty/.git/
expecting success: 
	>empty &&
	git add empty &&
	test_tick &&
	git commit -m initial &&
	for i in a b c d e
	do
		echo $i
	done >empty &&
	cat empty >expect &&
	git diff |
	sed -e "/^diff --git/d" \
	    -e "/^index /d" \
	    -e "s|a/empty|empty.orig|" \
	    -e "s|b/empty|empty|" >patch0 &&
	sed -e "s|empty|missing|" patch0 >patch1 &&
	>empty &&
	git update-index --refresh
[master (root-commit) e3f79fd] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 empty

ok 1 - setup
expecting success: 
	git reset --hard &&
	rm -f missing &&
	git apply patch0 &&
	test_cmp expect empty
HEAD is now at e3f79fd initial

ok 2 - apply empty

expecting success: 
	git reset --hard &&
	rm -f missing &&
	git apply --index patch0 &&
	test_cmp expect empty &&
	git diff --exit-code

HEAD is now at e3f79fd initial

ok 3 - apply --index empty

expecting success: 
	git reset --hard &&
	rm -f missing &&
	git apply patch1 &&
	test_cmp expect missing
HEAD is now at e3f79fd initial
ok 4 - apply create
expecting success: 
	git reset --hard &&
	rm -f missing &&
	git apply --index patch1 &&
	test_cmp expect missing &&
	git diff --exit-code
HEAD is now at e3f79fd initial

ok 5 - apply --index create

# passed all 5 test(s)
1..5
