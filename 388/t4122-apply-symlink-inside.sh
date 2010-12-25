Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4122-apply-symlink-inside/.git/
expecting success: 

	mkdir -p arch/i386/boot arch/x86_64 &&
	lecho 1 2 3 4 5 >arch/i386/boot/Makefile &&
	ln -s ../i386/boot arch/x86_64/boot &&
	git add . &&
	test_tick &&
	git commit -m initial &&
	git branch test &&

	rm arch/x86_64/boot &&
	mkdir arch/x86_64/boot &&
	lecho 2 3 4 5 6 >arch/x86_64/boot/Makefile &&
	git add . &&
	test_tick &&
	git commit -a -m second &&

	git format-patch --binary -1 --stdout >test.patch
[master (root-commit) f9acfaa] initial
 Author: A U Thor <author@example.com>
 2 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 arch/i386/boot/Makefile
 create mode 120000 arch/x86_64/boot
[master e8e99d5] second
 Author: A U Thor <author@example.com>
 2 files changed, 5 insertions(+), 1 deletions(-)
 delete mode 120000 arch/x86_64/boot
 create mode 100644 arch/x86_64/boot/Makefile

ok 1 - setup

expecting success: 

	git checkout test &&
	git diff --exit-code test &&
	git diff --exit-code --cached test &&
	git apply --index test.patch
ok 2 - apply
expecting success: 

	git diff --exit-code master &&
	git diff --exit-code --cached master &&
	test_tick &&
	git commit -m replay &&
	T1=$(git rev-parse "master^{tree}") &&
	T2=$(git rev-parse "HEAD^{tree}") &&
	test "z$T1" = "z$T2"
[test 66a4bdc] replay
 Author: A U Thor <author@example.com>
 2 files changed, 5 insertions(+), 1 deletions(-)
 delete mode 120000 arch/x86_64/boot
 create mode 100644 arch/x86_64/boot/Makefile

ok 3 - check result

# passed all 3 test(s)
1..3
