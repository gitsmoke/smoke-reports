Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5404-tracking-branches/.git/
expecting success: 
	echo 1 >file &&
	git add file &&
	git commit -m 1 &&
	git branch b1 &&
	git branch b2 &&
	git branch b3 &&
	git clone . aa &&
	git checkout b1 &&
	echo b1 >>file &&
	git commit -a -m b1 &&
	git checkout b2 &&
	echo b2 >>file &&
	git commit -a -m b2
[master (root-commit) 847f34c] 1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
Cloning into aa
done.
[b1 8248c71] b1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[b2 df10a7b] b2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 
	cd aa &&
	b1=$(git rev-parse origin/b1) &&
	b2=$(git rev-parse origin/b2) &&
	git checkout -b b1 origin/b1 &&
	echo aa-b1 >>file &&
	git commit -a -m aa-b1 &&
	git checkout -b b2 origin/b2 &&
	echo aa-b2 >>file &&
	git commit -a -m aa-b2 &&
	git checkout master &&
	echo aa-master >>file &&
	git commit -a -m aa-master
Branch b1 set up to track remote branch b1 from origin.
[b1 6ed893a] aa-b1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Branch b2 set up to track remote branch b2 from origin.
[b2 626b748] aa-b2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master d4770bb] aa-master
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 2 - prepare pushable branches

expecting success: 
	test_must_fail git push

ok 3 - mixed-success push returns error

expecting success: 
	test "$(git rev-parse origin/master)" = "$(git rev-parse master)"
ok 4 - check tracking branches updated correctly after push

expecting success: 
	test "$(git rev-parse origin/b1)" = "$b1" &&
	test "$(git rev-parse origin/b2)" = "$b2"

ok 5 - check tracking branches not updated for failed refs

expecting success: 
	git push origin :b1 &&
	test "$(git rev-parse origin/b1)" = "origin/b1"

ok 6 - deleted branches have their tracking branches removed

expecting success: 
	git branch -d -r origin/b3 &&
	git push origin :b3 >output 2>&1 &&
	! grep error output

Deleted remote branch origin/b3 (was 847f34c).

ok 7 - already deleted tracking branches ignored

# passed all 7 test(s)
1..7
