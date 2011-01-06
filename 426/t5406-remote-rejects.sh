Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5406-remote-rejects/.git/
expecting success: 
	mkdir .git/hooks &&
	(echo "#!/bin/sh" ; echo "exit 1") >.git/hooks/update &&
	chmod +x .git/hooks/update &&
	echo 1 >file &&
	git add file &&
	git commit -m 1 &&
	git clone . child &&
	cd child &&
	echo 2 >file &&
	git commit -a -m 2
[master (root-commit) 45b13cd] 1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
Cloning into child
done.
[master 4430462] 2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup
expecting success: test_must_fail git push 2>stderr
ok 2 - push reports error
expecting success: grep rejected stderr
 ! [remote rejected] master -> master (branch is currently checked out)
ok 3 - individual ref reports error
# passed all 3 test(s)
1..3
