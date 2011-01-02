Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3903-stash/.git/
expecting success: 
	echo 1 > file &&
	git add file &&
	test_tick &&
	git commit -m initial &&
	echo 2 > file &&
	git add file &&
	echo 3 > file &&
	test_tick &&
	git stash &&
	git diff-files --quiet &&
	git diff-index --cached --quiet HEAD
[master (root-commit) 777c62c] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
Saved working directory and index state WIP on master: 777c62c initial
HEAD is now at 777c62c initial

ok 1 - stash some dirty working directory

expecting success: 
	test $(git rev-parse stash^) = $(git rev-parse HEAD) &&
	git diff stash^2..stash > output &&
	test_cmp output expect


ok 2 - parents of stash

expecting success: 
	echo 4 > other-file &&
	git add other-file &&
	echo 5 > other-file &&
	test_must_fail git stash apply


ok 3 - apply needs clean working directory

expecting success: 
	git add other-file &&
	test_tick &&
	git commit -m other-file &&
	git stash apply &&
	test 3 = $(cat file) &&
	test 1 = $(git show :file) &&
	test 1 = $(git show HEAD:file)

[master 58f2b0b] other-file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 other-file
Merging Updated upstream with Stashed changes
Merging:
virtual Updated upstream
virtual Stashed changes
found 1 common ancestor(s):
virtual f27c6ae26adb8396d3861976ba268f87ad8afa0b
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	output
no changes added to commit (use "git add" and/or "git commit -a")

ok 4 - apply stashed changes

expecting success: 
	git reset --hard HEAD^ &&
	echo 6 > other-file &&
	git add other-file &&
	test_tick &&
	git commit -m other-file &&
	git stash apply --index &&
	test 3 = $(cat file) &&
	test 2 = $(git show :file) &&
	test 1 = $(git show HEAD:file)

HEAD is now at 777c62c initial
[master dfc6a3a] other-file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 other-file
Merging Updated upstream with Stashed changes
Merging:
virtual Updated upstream
virtual Stashed changes
found 1 common ancestor(s):
virtual f27c6ae26adb8396d3861976ba268f87ad8afa0b
# On branch master
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
#	modified:   file
#
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	output

ok 5 - apply stashed changes (including index)

expecting success: 
	git reset --hard HEAD &&
	mkdir subdir &&
	(
		cd subdir &&
		git stash apply
	)

HEAD is now at dfc6a3a other-file
Merging Updated upstream with Stashed changes
Merging:
virtual Updated upstream
virtual Stashed changes
found 1 common ancestor(s):
virtual f27c6ae26adb8396d3861976ba268f87ad8afa0b
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	output
no changes added to commit (use "git add" and/or "git commit -a")

ok 6 - unstashing in a subdirectory

expecting success: 
	git reset --hard &&
	git stash list > stashlist1 &&
	echo 7 > file &&
	git stash &&
	git stash drop &&
	git stash list > stashlist2 &&
	test_cmp stashlist1 stashlist2 &&
	git stash apply &&
	test 3 = $(cat file) &&
	test 1 = $(git show :file) &&
	test 1 = $(git show HEAD:file)

HEAD is now at dfc6a3a other-file
Saved working directory and index state WIP on master: dfc6a3a other-file
HEAD is now at dfc6a3a other-file
Dropped refs/stash@{0} (281b6322bb5d5a60767338a21aa63c38615f2aed)
Merging Updated upstream with Stashed changes
Merging:
virtual Updated upstream
virtual Stashed changes
found 1 common ancestor(s):
virtual f27c6ae26adb8396d3861976ba268f87ad8afa0b
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	output
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")

ok 7 - drop top stash

expecting success: 
	git reset --hard &&
	echo 8 > file &&
	git stash &&
	echo 9 > file &&
	git stash &&
	git stash drop stash@{1} &&
	test 2 = $(git stash list | wc -l) &&
	git stash apply &&
	test 9 = $(cat file) &&
	test 1 = $(git show :file) &&
	test 1 = $(git show HEAD:file) &&
	git reset --hard &&
	git stash drop &&
	git stash apply &&
	test 3 = $(cat file) &&
	test 1 = $(git show :file) &&
	test 1 = $(git show HEAD:file)

HEAD is now at dfc6a3a other-file
Saved working directory and index state WIP on master: dfc6a3a other-file
HEAD is now at dfc6a3a other-file
Saved working directory and index state WIP on master: dfc6a3a other-file
HEAD is now at dfc6a3a other-file
Dropped stash@{1} (92d4526d13bc5d344732553b54468025cf816105)
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 770d5dd741b05b1e8b8a782bea5b55d3cf4c1603
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	output
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")
HEAD is now at dfc6a3a other-file
Dropped refs/stash@{0} (f832c5346ba9134fd39035bb03b35ab57a7513b3)
Merging Updated upstream with Stashed changes
Merging:
virtual Updated upstream
virtual Stashed changes
found 1 common ancestor(s):
virtual f27c6ae26adb8396d3861976ba268f87ad8afa0b
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	output
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")

ok 8 - drop middle stash

expecting success: 
	git reset --hard &&
	git stash pop &&
	test 3 = $(cat file) &&
	test 1 = $(git show :file) &&
	test 1 = $(git show HEAD:file) &&
	test 0 = $(git stash list | wc -l)

HEAD is now at dfc6a3a other-file
Merging Updated upstream with Stashed changes
Merging:
virtual Updated upstream
virtual Stashed changes
found 1 common ancestor(s):
virtual f27c6ae26adb8396d3861976ba268f87ad8afa0b
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	output
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")
Dropped refs/stash@{0} (05da73f5702757dd46f6e30d688263a2f4df879f)

ok 9 - stash pop
expecting success: 
	echo foo > file &&
	git commit file -m first &&
	echo bar > file &&
	echo bar2 > file2 &&
	git add file2 &&
	git stash &&
	echo baz > file &&
	git commit file -m second &&
	git stash branch stashbranch &&
	test refs/heads/stashbranch = $(git symbolic-ref HEAD) &&
	test $(git rev-parse HEAD) = $(git rev-parse master^) &&
	git diff --cached > output &&
	test_cmp output expect &&
	git diff > output &&
	test_cmp output expect1 &&
	git add file &&
	git commit -m alternate\ second &&
	git diff master..stashbranch > output &&
	test_cmp output expect2 &&
	test 0 = $(git stash list | wc -l)

[master 0543f76] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Saved working directory and index state WIP on master: 0543f76 first
HEAD is now at 0543f76 first
[master 73b6410] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 4ef46cf585089766e6044653b0d8f66d6f10af57
# On branch stashbranch
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
#	new file:   file2
#
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	expect1
#	expect2
#	output
#	stashlist1
#	stashlist2
Dropped refs/stash@{0} (f3e5c5191badc919b1a767dd28f7a949bc91689f)
[stashbranch b3d634c] alternate second
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 1 deletions(-)
 create mode 100644 file2

ok 10 - stash branch

expecting success: 
	echo foo > file &&
	git stash &&
	git stash apply -q > output.out 2>&1 &&
	test ! -s output.out
Saved working directory and index state WIP on stashbranch: b3d634c alternate second
HEAD is now at b3d634c alternate second

ok 11 - apply -q is quiet

expecting success: 
	git stash save --quiet > output.out 2>&1 &&
	test ! -s output.out

ok 12 - save -q is quiet

expecting success: 
	git stash pop -q > output.out 2>&1 &&
	test ! -s output.out

ok 13 - pop -q is quiet

expecting success: 
	echo foo > file &&
	git add file &&
	git stash save --quiet &&
	git stash pop -q --index > output.out 2>&1 &&
	test foo = "$(git show :file)" &&
	test ! -s output.out

ok 14 - pop -q --index works and is quiet

expecting success: 
	git stash &&
	git stash drop -q > output.out 2>&1 &&
	test ! -s output.out
Saved working directory and index state WIP on stashbranch: b3d634c alternate second
HEAD is now at b3d634c alternate second

ok 15 - drop -q is quiet

expecting success: 
	echo bar3 > file &&
	echo bar4 > file2 &&
	git add file2 &&
	git stash -k &&
	test bar,bar4 = $(cat file),$(cat file2)
Saved working directory and index state WIP on stashbranch: b3d634c alternate second
HEAD is now at b3d634c alternate second
ok 16 - stash -k
expecting success: 
	echo bar5 > file &&
	echo bar6 > file2 &&
	git add file2 &&
	test_must_fail git stash --invalid-option &&
	test_must_fail git stash save --invalid-option &&
	test bar5,bar6 = $(cat file),$(cat file2) &&
	git stash -- -message-starting-with-dash &&
	test bar,bar2 = $(cat file),$(cat file2)
Saved working directory and index state On stashbranch: -message-starting-with-dash
HEAD is now at b3d634c alternate second

ok 17 - stash --invalid-option

expecting success: 
	git reset --hard &&
	echo new >file3 &&
	git add file3 &&
	git stash save "added file" &&
	! test -r file3 &&
	git stash apply &&
	test new = "$(cat file3)"

HEAD is now at b3d634c alternate second
Saved working directory and index state On stashbranch: added file
HEAD is now at b3d634c alternate second
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 900fec698da3cabc83135ee0b8e2bd7f99a28ab4
# On branch stashbranch
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
#	new file:   file3
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	expect1
#	expect2
#	output
#	output.out
#	stashlist1
#	stashlist2

ok 18 - stash an added file

expecting success: 
	git reset --hard &&
	git rm file &&
	echo bar7 >file &&
	git stash save "rm then recreate" &&
	test bar = "$(cat file)" &&
	git stash apply &&
	test bar7 = "$(cat file)"

HEAD is now at b3d634c alternate second
rm 'file'
Saved working directory and index state On stashbranch: rm then recreate
HEAD is now at b3d634c alternate second
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 900fec698da3cabc83135ee0b8e2bd7f99a28ab4
# On branch stashbranch
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	expect1
#	expect2
#	output
#	output.out
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")

ok 19 - stash rm then recreate

expecting success: 
	git reset --hard &&
	git rm file &&
	echo file >.gitignore &&
	git stash save "rm and ignore" &&
	test bar = "$(cat file)" &&
	test file = "$(cat .gitignore)" &&
	git stash apply &&
	! test -r file &&
	test file = "$(cat .gitignore)"
HEAD is now at b3d634c alternate second
rm 'file'
Saved working directory and index state On stashbranch: rm and ignore
HEAD is now at b3d634c alternate second
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 900fec698da3cabc83135ee0b8e2bd7f99a28ab4
Removing file
# On branch stashbranch
# Changes not staged for commit:
#   (use "git add/rm <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	deleted:    file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	.gitignore
#	expect
#	expect1
#	expect2
#	output
#	output.out
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")

ok 20 - stash rm and ignore

expecting success: 
	git reset --hard &&
	git rm file &&
	echo file >.gitignore &&
	git add .gitignore &&
	git stash save "rm and ignore (stage .gitignore)" &&
	test bar = "$(cat file)" &&
	! test -r .gitignore &&
	git stash apply &&
	! test -r file &&
	test file = "$(cat .gitignore)"

HEAD is now at b3d634c alternate second
rm 'file'
Saved working directory and index state On stashbranch: rm and ignore (stage .gitignore)
HEAD is now at b3d634c alternate second
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 900fec698da3cabc83135ee0b8e2bd7f99a28ab4
Removing file
# On branch stashbranch
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
#	new file:   .gitignore
#
# Changes not staged for commit:
#   (use "git add/rm <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	deleted:    file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	expect1
#	expect2
#	output
#	output.out
#	stashlist1
#	stashlist2

ok 21 - stash rm and ignore (stage .gitignore)

expecting success: 
	git reset --hard &&
	rm file &&
	ln -s file2 file &&
	git stash save "file to symlink" &&
	test -f file &&
	test bar = "$(cat file)" &&
	git stash apply &&
	case "$(ls -l file)" in *" file -> file2") :;; *) false;; esac

HEAD is now at b3d634c alternate second
Saved working directory and index state On stashbranch: file to symlink
HEAD is now at b3d634c alternate second
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 900fec698da3cabc83135ee0b8e2bd7f99a28ab4
# On branch stashbranch
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	typechange: file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	expect1
#	expect2
#	output
#	output.out
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")

ok 22 - stash file to symlink

expecting success: 
	git reset --hard &&
	git rm file &&
	ln -s file2 file &&
	git stash save "file to symlink (stage rm)" &&
	test -f file &&
	test bar = "$(cat file)" &&
	git stash apply &&
	case "$(ls -l file)" in *" file -> file2") :;; *) false;; esac

HEAD is now at b3d634c alternate second
rm 'file'
Saved working directory and index state On stashbranch: file to symlink (stage rm)
HEAD is now at b3d634c alternate second
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 900fec698da3cabc83135ee0b8e2bd7f99a28ab4
# On branch stashbranch
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	typechange: file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	expect1
#	expect2
#	output
#	output.out
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")

ok 23 - stash file to symlink (stage rm)

expecting success: 
	git reset --hard &&
	rm file &&
	ln -s file2 file &&
	git add file &&
	git stash save "file to symlink (full stage)" &&
	test -f file &&
	test bar = "$(cat file)" &&
	git stash apply &&
	case "$(ls -l file)" in *" file -> file2") :;; *) false;; esac
HEAD is now at b3d634c alternate second
Saved working directory and index state On stashbranch: file to symlink (full stage)
HEAD is now at b3d634c alternate second
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 900fec698da3cabc83135ee0b8e2bd7f99a28ab4
# On branch stashbranch
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	typechange: file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	expect1
#	expect2
#	output
#	output.out
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")

ok 24 - stash file to symlink (full stage)

expecting success: 
	git reset --hard &&
	ln -s file filelink &&
	git add filelink &&
	git commit -m "Add symlink" &&
	rm filelink &&
	cp file filelink &&
	git stash save "symlink to file" &&
	test -h filelink &&
	case "$(ls -l filelink)" in *" filelink -> file") :;; *) false;; esac &&
	git stash apply &&
	! test -h filelink &&
	test bar = "$(cat file)"
HEAD is now at b3d634c alternate second
[stashbranch 8484164] Add symlink
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 120000 filelink
Saved working directory and index state On stashbranch: symlink to file
HEAD is now at 8484164 Add symlink
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual bf49a42d6fce288540f83c8f1df1958f7bea8e81
# On branch stashbranch
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	typechange: filelink
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	expect1
#	expect2
#	output
#	output.out
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")

ok 25 - stash symlink to file

expecting success: 
	git reset --hard &&
	git rm filelink &&
	cp file filelink &&
	git stash save "symlink to file (stage rm)" &&
	test -h filelink &&
	case "$(ls -l filelink)" in *" filelink -> file") :;; *) false;; esac &&
	git stash apply &&
	! test -h filelink &&
	test bar = "$(cat file)"
HEAD is now at 8484164 Add symlink
rm 'filelink'
Saved working directory and index state On stashbranch: symlink to file (stage rm)
HEAD is now at 8484164 Add symlink
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual bf49a42d6fce288540f83c8f1df1958f7bea8e81
# On branch stashbranch
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	typechange: filelink
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	expect1
#	expect2
#	output
#	output.out
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")

ok 26 - stash symlink to file (stage rm)

expecting success: 
	git reset --hard &&
	rm filelink &&
	cp file filelink &&
	git add filelink &&
	git stash save "symlink to file (full stage)" &&
	test -h filelink &&
	case "$(ls -l filelink)" in *" filelink -> file") :;; *) false;; esac &&
	git stash apply &&
	! test -h filelink &&
	test bar = "$(cat file)"
HEAD is now at 8484164 Add symlink
Saved working directory and index state On stashbranch: symlink to file (full stage)
HEAD is now at 8484164 Add symlink
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual bf49a42d6fce288540f83c8f1df1958f7bea8e81
# On branch stashbranch
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	typechange: filelink
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	expect1
#	expect2
#	output
#	output.out
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")

ok 27 - stash symlink to file (full stage)

checking known breakage: 
	git reset --hard &&
	mkdir dir &&
	echo foo >dir/file &&
	git add dir/file &&
	git commit -m "Add file in dir" &&
	rm -fr dir &&
	echo bar >dir &&
	git stash save "directory to file" &&
	test -d dir &&
	test foo = "$(cat dir/file)" &&
	test_must_fail git stash apply &&
	test bar = "$(cat dir)" &&
	git reset --soft HEAD^
HEAD is now at 8484164 Add symlink
[stashbranch a9556f6] Add file in dir
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 dir/file
Saved working directory and index state On stashbranch: directory to file
HEAD is now at a9556f6 Add file in dir
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 4f1019d02d9c10f9b5c1ece0778b2d50a0fcc259
Removing dir/file
# On branch stashbranch
# Changes not staged for commit:
#   (use "git add/rm <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	deleted:    dir/file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	expect1
#	expect2
#	output
#	output.out
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")

not ok 28 - stash directory to file # TODO known breakage

checking known breakage: 
	git reset --hard &&
	rm file &&
	mkdir file &&
	echo foo >file/file &&
	git stash save "file to directory" &&
	test -f file &&
	test bar = "$(cat file)" &&
	git stash apply &&
	test -f file/file &&
	test foo = "$(cat file/file)"

HEAD is now at a9556f6 Add file in dir
Saved working directory and index state On stashbranch: file to directory
HEAD is now at a9556f6 Add file in dir
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 4f1019d02d9c10f9b5c1ece0778b2d50a0fcc259
Removing file
# On branch stashbranch
# Changes not staged for commit:
#   (use "git add/rm <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	deleted:    file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	expect1
#	expect2
#	output
#	output.out
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")

not ok 29 - stash file to directory # TODO known breakage

expecting success: 
	git stash clear &&
	test_when_finished "git reset --hard HEAD" &&
	git reset --hard &&
	echo foo >> file &&
	STASH_ID=$(git stash create) &&
	git reset --hard &&
	git stash branch stash-branch ${STASH_ID} &&
	test_when_finished "git reset --hard HEAD && git checkout master && git branch -D stash-branch" &&
	test $(git ls-files --modified | wc -l) -eq 1
HEAD is now at a9556f6 Add file in dir
HEAD is now at a9556f6 Add file in dir
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 4f1019d02d9c10f9b5c1ece0778b2d50a0fcc259
# On branch stash-branch
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	expect1
#	expect2
#	output
#	output.out
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")
HEAD is now at a9556f6 Add file in dir
Deleted branch stash-branch (was a9556f6).
HEAD is now at 73b6410 second
ok 30 - stash branch - no stashes on stack, stash-like argument
expecting success: 
	git stash clear &&
	test_when_finished "git reset --hard HEAD" &&
	git reset --hard &&
	echo foo >> file &&
	git stash &&
	test_when_finished "git stash drop" &&
	echo bar >> file &&
	STASH_ID=$(git stash create) &&
	git reset --hard &&
	git stash branch stash-branch ${STASH_ID} &&
	test_when_finished "git reset --hard HEAD && git checkout master && git branch -D stash-branch" &&
	test $(git ls-files --modified | wc -l) -eq 1
HEAD is now at 73b6410 second
Saved working directory and index state WIP on master: 73b6410 second
HEAD is now at 73b6410 second
HEAD is now at 73b6410 second
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 3a18f644551a5809421ac2e8f6cc40181a075c5d
# On branch stash-branch
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	expect
#	expect1
#	expect2
#	output
#	output.out
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")
HEAD is now at 73b6410 second
Deleted branch stash-branch (was 73b6410).
Dropped refs/stash@{0} (9785023d3acc3c297876325ed71e13b797443769)
HEAD is now at 73b6410 second

ok 31 - stash branch - stashes on stack, stash-like argument

expecting success: 
	git stash clear &&
	test_when_finished "git reset --hard HEAD" &&
	git reset --hard &&
	echo foo >> file &&
	git stash &&
	test_when_finished "git stash drop" &&
	echo bar >> file &&
	STASH_ID=$(git stash create) &&
	git reset --hard &&
	cat >expected <<-EOF &&
	 file |    1 +
	 1 files changed, 1 insertions(+), 0 deletions(-)
	EOF
	git stash show ${STASH_ID} >actual &&
	test_cmp expected actual
HEAD is now at 73b6410 second
Saved working directory and index state WIP on master: 73b6410 second
HEAD is now at 73b6410 second
HEAD is now at 73b6410 second
Dropped refs/stash@{0} (9785023d3acc3c297876325ed71e13b797443769)
HEAD is now at 73b6410 second

ok 32 - stash show - stashes on stack, stash-like argument

expecting success: 
	git stash clear &&
	test_when_finished "git reset --hard HEAD" &&
	git reset --hard &&
	echo foo >> file &&
	git stash &&
	test_when_finished "git stash drop" &&
	echo bar >> file &&
	STASH_ID=$(git stash create) &&
	git reset --hard &&
	cat >expected <<-EOF &&
	diff --git a/file b/file
	index 7601807..935fbd3 100644
	--- a/file
	+++ b/file
	@@ -1 +1,2 @@
	 baz
	+bar
	EOF
	git stash show -p ${STASH_ID} >actual &&
	test_cmp expected actual
HEAD is now at 73b6410 second
Saved working directory and index state WIP on master: 73b6410 second
HEAD is now at 73b6410 second
HEAD is now at 73b6410 second
Dropped refs/stash@{0} (9785023d3acc3c297876325ed71e13b797443769)
HEAD is now at 73b6410 second
ok 33 - stash show -p - stashes on stack, stash-like argument
expecting success: 
	git stash clear &&
	test_when_finished "git reset --hard HEAD" &&
	git reset --hard &&
	echo foo >> file &&
	STASH_ID=$(git stash create) &&
	git reset --hard &&
	cat >expected <<-EOF &&
	 file |    1 +
	 1 files changed, 1 insertions(+), 0 deletions(-)
	EOF
	git stash show ${STASH_ID} >actual &&
	test_cmp expected actual
HEAD is now at 73b6410 second
HEAD is now at 73b6410 second
HEAD is now at 73b6410 second
ok 34 - stash show - no stashes on stack, stash-like argument
expecting success: 
	git stash clear &&
	test_when_finished "git reset --hard HEAD" &&
	git reset --hard &&
	echo foo >> file &&
	STASH_ID=$(git stash create) &&
	git reset --hard &&
	cat >expected <<-EOF &&
	diff --git a/file b/file
	index 7601807..71b52c4 100644
	--- a/file
	+++ b/file
	@@ -1 +1,2 @@
	 baz
	+foo
	EOF
	git stash show -p ${STASH_ID} >actual &&
	test_cmp expected actual
HEAD is now at 73b6410 second
HEAD is now at 73b6410 second
HEAD is now at 73b6410 second

ok 35 - stash show -p - no stashes on stack, stash-like argument

expecting success: 
	git stash clear &&
	test_when_finished "git reset --hard HEAD && git stash clear" &&
	git reset --hard &&
	echo foo > file &&
	git stash &&
	echo bar > file &&
	git stash &&
	test_must_fail git stash drop $(git rev-parse stash@{0}) &&
	git stash pop &&
	test bar = "$(cat file)" &&
	git reset --hard HEAD
HEAD is now at 73b6410 second
Saved working directory and index state WIP on master: 73b6410 second
HEAD is now at 73b6410 second
Saved working directory and index state WIP on master: 73b6410 second
HEAD is now at 73b6410 second
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 3a18f644551a5809421ac2e8f6cc40181a075c5d
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	actual
#	expect
#	expect1
#	expect2
#	expected
#	output
#	output.out
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")
Dropped refs/stash@{0} (db089f4879ef4ea76e6006bd24369aef1288cea8)
HEAD is now at 73b6410 second
HEAD is now at 73b6410 second

ok 36 - stash drop - fail early if specified stash is not a stash reference

expecting success: 
	git stash clear &&
	test_when_finished "git reset --hard HEAD && git stash clear" &&
	git reset --hard &&
	echo foo > file &&
	git stash &&
	echo bar > file &&
	git stash &&
	test_must_fail git stash pop $(git rev-parse stash@{0}) &&
	git stash pop &&
	test bar = "$(cat file)" &&
	git reset --hard HEAD

HEAD is now at 73b6410 second
Saved working directory and index state WIP on master: 73b6410 second
HEAD is now at 73b6410 second
Saved working directory and index state WIP on master: 73b6410 second
HEAD is now at 73b6410 second
Merging Version stash was based on with Stashed changes
Merging:
virtual Version stash was based on
virtual Stashed changes
found 1 common ancestor(s):
virtual 3a18f644551a5809421ac2e8f6cc40181a075c5d
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	actual
#	expect
#	expect1
#	expect2
#	expected
#	output
#	output.out
#	stashlist1
#	stashlist2
no changes added to commit (use "git add" and/or "git commit -a")
Dropped refs/stash@{0} (db089f4879ef4ea76e6006bd24369aef1288cea8)
HEAD is now at 73b6410 second
HEAD is now at 73b6410 second

ok 37 - stash pop - fail early if specified stash is not a stash reference

expecting success: 
	git stash clear &&
	echo bar5 > file &&
	echo bar6 > file2 &&
	git add file2 &&
	git stash &&
	! "git rev-parse --quiet --verify does-not-exist" &&
	test_must_fail git stash drop does-not-exist &&
	test_must_fail git stash drop does-not-exist@{0} &&
	test_must_fail git stash pop does-not-exist &&
	test_must_fail git stash pop does-not-exist@{0} &&
	test_must_fail git stash apply does-not-exist &&
	test_must_fail git stash apply does-not-exist@{0} &&
	test_must_fail git stash show does-not-exist &&
	test_must_fail git stash show does-not-exist@{0} &&
	test_must_fail git stash branch tmp does-not-exist &&
	test_must_fail git stash branch tmp does-not-exist@{0} &&
	git stash drop
Saved working directory and index state WIP on master: 73b6410 second
HEAD is now at 73b6410 second
Dropped refs/stash@{0} (be18490ff47864e44040bdfb54431a62abe1ebf1)

ok 38 - ref with non-existant reflog

expecting success: 
	git stash clear &&
	test_must_fail git stash drop stash@{0} &&
	echo bar5 > file &&
	echo bar6 > file2 &&
	git add file2 &&
	git stash &&
	test_must_fail git drop stash@{1} &&
	test_must_fail git pop stash@{1} &&
	test_must_fail git apply stash@{1} &&
	test_must_fail git show stash@{1} &&
	test_must_fail git branch tmp stash@{1} &&
	git stash drop
Saved working directory and index state WIP on master: 73b6410 second
HEAD is now at 73b6410 second
Dropped refs/stash@{0} (be18490ff47864e44040bdfb54431a62abe1ebf1)

ok 39 - invalid ref of the form stash@{n}, n >= N

expecting success: 
	git stash clear &&
	echo foo >file &&
	git add file &&
	git commit -m initial &&
	echo bar >file &&
	git stash &&
	test_must_fail git stash branch master stash@{0} &&
	git rev-parse stash@{0} --
[master bbf26c0] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Saved working directory and index state WIP on master: bbf26c0 initial
HEAD is now at bbf26c0 initial
de622cbd5cfa2bfe378d7a0691540649fc02be44
--

ok 40 - stash branch should not drop the stash if the branch exists

# still have 2 known breakage(s)
# passed all remaining 38 test(s)
1..40
