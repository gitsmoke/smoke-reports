Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7506-status-submodule/.git/
expecting success: 
	test_create_repo sub &&
	(
		cd sub &&
		: >bar &&
		git add bar &&
		git commit -m " Add bar" &&
		: >foo &&
		git add foo &&
		git commit -m " Add foo"
	) &&
	echo output > .gitignore &&
	git add sub .gitignore &&
	git commit -m "Add submodule sub"
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7506-status-submodule/sub/.git/
[master (root-commit) 7297391]  Add bar
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 bar
[master 5be4e2d]  Add foo
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master (root-commit) 4fd98ca] Add submodule sub
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 .gitignore
 create mode 160000 sub

ok 1 - setup

expecting success: 
	git status >output &&
	grep "nothing to commit" output

nothing to commit (working directory clean)

ok 2 - status clean

expecting success: 
	test_must_fail git commit --dry-run -a >output &&
	grep "nothing to commit" output

nothing to commit (working directory clean)

ok 3 - commit --dry-run -a clean

expecting success: 
	(cd sub && git reset --hard) &&
	echo "changed" >sub/foo &&
	git status >output &&
	grep "modified:   sub (modified content)" output

HEAD is now at 5be4e2d  Add foo
#	modified:   sub (modified content)

ok 4 - status with modified file in submodule

expecting success: 
	(cd sub && git reset --hard) &&
	echo "changed" >sub/foo &&
	git status --porcelain >output &&
	diff output - <<-\EOF
	 M sub
	EOF

HEAD is now at 5be4e2d  Add foo

ok 5 - status with modified file in submodule (porcelain)

expecting success: 
	(cd sub && git reset --hard && echo >foo && git add foo) &&
	git status >output &&
	grep "modified:   sub (modified content)" output

HEAD is now at 5be4e2d  Add foo
#	modified:   sub (modified content)

ok 6 - status with added file in submodule

expecting success: 
	(cd sub && git reset --hard && echo >foo && git add foo) &&
	git status --porcelain >output &&
	diff output - <<-\EOF
	 M sub
	EOF

HEAD is now at 5be4e2d  Add foo

ok 7 - status with added file in submodule (porcelain)

expecting success: 
	(cd sub && git reset --hard) &&
	echo "content" >sub/new-file &&
	git status >output &&
	grep "modified:   sub (untracked content)" output

HEAD is now at 5be4e2d  Add foo
#	modified:   sub (untracked content)

ok 8 - status with untracked file in submodule

expecting success: 
	git status -uno >output &&
	grep "^nothing to commit" output

nothing to commit (use -u to show untracked files)

ok 9 - status -uno with untracked file in submodule

expecting success: 
	git status --porcelain >output &&
	diff output - <<-\EOF
	 M sub
	EOF


ok 10 - status with untracked file in submodule (porcelain)

expecting success: 
	(cd sub && git reset --hard && echo >foo && git add foo) &&
	echo "content" >sub/new-file &&
	git status >output &&
	grep "modified:   sub (modified content, untracked content)" output

HEAD is now at 5be4e2d  Add foo
#	modified:   sub (modified content, untracked content)

ok 11 - status with added and untracked file in submodule

expecting success: 
	(cd sub && git reset --hard && echo >foo && git add foo) &&
	echo "content" >sub/new-file &&
	git status --porcelain >output &&
	diff output - <<-\EOF
	 M sub
	EOF
HEAD is now at 5be4e2d  Add foo
ok 12 - status with added and untracked file in submodule (porcelain)
expecting success: 
	(cd sub && git reset --hard) &&
	rm sub/new-file &&
	(cd sub && echo "next change" >foo && git commit -m "next change" foo) &&
	echo "changed" >sub/foo &&
	git status >output &&
	grep "modified:   sub (new commits, modified content)" output
HEAD is now at 5be4e2d  Add foo
[master cc44572] next change
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
#	modified:   sub (new commits, modified content)
ok 13 - status with modified file in modified submodule
expecting success: 
	(cd sub && git reset --hard) &&
	echo "changed" >sub/foo &&
	git status --porcelain >output &&
	diff output - <<-\EOF
	 M sub
	EOF
HEAD is now at cc44572 next change
ok 14 - status with modified file in modified submodule (porcelain)
expecting success: 
	(cd sub && git reset --hard && echo >foo && git add foo) &&
	git status >output &&
	grep "modified:   sub (new commits, modified content)" output
HEAD is now at cc44572 next change
#	modified:   sub (new commits, modified content)
ok 15 - status with added file in modified submodule
expecting success: 
	(cd sub && git reset --hard && echo >foo && git add foo) &&
	git status --porcelain >output &&
	diff output - <<-\EOF
	 M sub
	EOF
HEAD is now at cc44572 next change
ok 16 - status with added file in modified submodule (porcelain)
expecting success: 
	(cd sub && git reset --hard) &&
	echo "content" >sub/new-file &&
	git status >output &&
	grep "modified:   sub (new commits, untracked content)" output
HEAD is now at cc44572 next change
#	modified:   sub (new commits, untracked content)
ok 17 - status with untracked file in modified submodule
expecting success: 
	git status --porcelain >output &&
	diff output - <<-\EOF
	 M sub
	EOF

ok 18 - status with untracked file in modified submodule (porcelain)

expecting success: 
	(cd sub && git reset --hard && echo >foo && git add foo) &&
	echo "content" >sub/new-file &&
	git status >output &&
	grep "modified:   sub (new commits, modified content, untracked content)" output
HEAD is now at cc44572 next change
#	modified:   sub (new commits, modified content, untracked content)
ok 19 - status with added and untracked file in modified submodule
expecting success: 
	(cd sub && git reset --hard && echo >foo && git add foo) &&
	echo "content" >sub/new-file &&
	git status --porcelain >output &&
	diff output - <<-\EOF
	 M sub
	EOF
HEAD is now at cc44572 next change
ok 20 - status with added and untracked file in modified submodule (porcelain)
expecting success: 
	(cd sub &&
	 rm -f new-file
	 REAL="$(pwd)/../.real" &&
	 mv .git "$REAL"
	 echo "gitdir: $REAL" >.git) &&
	 echo .real >>.gitignore &&
	 git commit -m "added .real to .gitignore" .gitignore
[master 712b695] added .real to .gitignore
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 21 - setup .git file for sub

expecting success: 
	(cd sub && git reset --hard && echo >foo && git add foo) &&
	git status >output &&
	grep "modified:   sub (new commits, modified content)" output
HEAD is now at cc44572 next change
#	modified:   sub (new commits, modified content)
ok 22 - status with added file in modified submodule with .git file
expecting success: 
	rm -rf sub/* sub/.git

ok 23 - rm submodule contents
expecting success: 
	git status >output &&
	grep "nothing to commit" output
nothing to commit (working directory clean)

ok 24 - status clean (empty submodule dir)

expecting success: 
	test_must_fail git commit --dry-run -a >output &&
	grep "nothing to commit" output

nothing to commit (working directory clean)

ok 25 - status -a clean (empty submodule dir)

# passed all 25 test(s)
1..25
