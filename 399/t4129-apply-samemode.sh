Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4129-apply-samemode/.git/
expecting success: 
	echo original >file &&
	git add file &&
	test_tick &&
	git commit -m initial &&
	git tag initial &&
	echo modified >file &&
	git diff --stat -p >patch-0.txt &&
	chmod +x file &&
	git diff --stat -p >patch-1.txt
[master (root-commit) e950771] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - setup

expecting success: 
	git reset --hard &&
	chmod +x file &&
	git apply patch-0.txt &&
	test -x file
HEAD is now at e950771 initial
ok 2 - same mode (no index)
expecting success: 
	git reset --hard &&
	chmod +x file &&
	git add file &&
	git apply --index patch-0.txt &&
	test -x file &&
	git diff --exit-code
HEAD is now at e950771 initial
ok 3 - same mode (with index)

expecting success: 
	git reset --hard &&
	chmod +x file &&
	git add file &&
	git apply --cached patch-0.txt &&
	git ls-files -s file | grep "^100755"
HEAD is now at e950771 initial
100755 2e0996000b7e9019eabcad29391bf0f5c7702f0b 0	file

ok 4 - same mode (index only)

expecting success: 
	git reset --hard &&
	git apply patch-1.txt &&
	test -x file

HEAD is now at e950771 initial

ok 5 - mode update (no index)
expecting success: 
	git reset --hard &&
	git apply --index patch-1.txt &&
	test -x file &&
	git diff --exit-code
HEAD is now at e950771 initial

ok 6 - mode update (with index)

expecting success: 
	git reset --hard &&
	git apply --cached patch-1.txt &&
	git ls-files -s file | grep "^100755"
HEAD is now at e950771 initial
100755 2e0996000b7e9019eabcad29391bf0f5c7702f0b 0	file

ok 7 - mode update (index only)

# passed all 7 test(s)
1..7
