Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/.git/
expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 0 0/sub &&
	cd 0 && git init && cd ..
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/0/.git/

ok 1 - #0: setup

expecting success: 
	cat >0/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/0
setup: cwd: $TRASH_DIRECTORY/0
setup: prefix: (null)
EOF
	test_repo 0

ok 2 - #0: at root

expecting success: 
	cat >0/sub/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/0
setup: cwd: $TRASH_DIRECTORY/0
setup: prefix: sub/
EOF
	test_repo 0/sub

ok 3 - #0: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 1 1/sub 1.wt 1.wt/sub 1/wt 1/wt/sub &&
	cd 1 &&
	git init &&
	GIT_WORK_TREE=non-existent &&
	export GIT_WORK_TREE &&
	cd ..
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/1/.git/

ok 4 - #1: setup

expecting success: 
	cat >1/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/1
setup: cwd: $TRASH_DIRECTORY/1
setup: prefix: (null)
EOF
	test_repo 1

ok 5 - #1: at root

expecting success: 
	cat >1/sub/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/1
setup: cwd: $TRASH_DIRECTORY/1
setup: prefix: sub/
EOF
	test_repo 1/sub

ok 6 - #1: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 2 2/sub &&
	cd 2 && git init && cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/2/.git/

ok 7 - #2: setup

expecting success: 
	cat >2/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/2/.git
setup: worktree: $TRASH_DIRECTORY/2
setup: cwd: $TRASH_DIRECTORY/2
setup: prefix: (null)
EOF
	test_repo 2 "$TRASH_DIRECTORY/2/.git"

ok 8 - #2: at root

expecting success: 
	cat >2/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/2/.git
setup: worktree: $TRASH_DIRECTORY/2/sub
setup: cwd: $TRASH_DIRECTORY/2/sub
setup: prefix: (null)
EOF
	test_repo 2/sub "$TRASH_DIRECTORY/2/.git"

ok 9 - #2: in subdir

expecting success: 
	cat >2/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/2
setup: cwd: $TRASH_DIRECTORY/2
setup: prefix: (null)
EOF
	test_repo 2 .git


ok 10 - #2: relative GIT_DIR at root

expecting success: 
	cat >2/sub/expected <<EOF &&
setup: git_dir: ../.git
setup: worktree: $TRASH_DIRECTORY/2/sub
setup: cwd: $TRASH_DIRECTORY/2/sub
setup: prefix: (null)
EOF
	test_repo 2/sub ../.git


ok 11 - #2: relative GIT_DIR in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 3 3/sub 3/sub/sub 3.wt 3.wt/sub 3/wt 3/wt/sub &&
	cd 3 && git init && cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/3/.git/

ok 12 - #3: setup

expecting success: 
	cat >3/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/3
setup: cwd: $TRASH_DIRECTORY/3
setup: prefix: (null)
EOF
	test_repo 3 .git "$TRASH_DIRECTORY/3"

ok 13 - #3: GIT_DIR(rel), GIT_WORK_TREE=root at root

expecting success: 
	cat >3/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/3
setup: cwd: $TRASH_DIRECTORY/3
setup: prefix: (null)
EOF
	test_repo 3 .git .


ok 14 - #3: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root

expecting success: 
	cat >3/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY/3
setup: cwd: $TRASH_DIRECTORY/3
setup: prefix: (null)
EOF
	test_repo 3 "$TRASH_DIRECTORY/3/.git" "$TRASH_DIRECTORY/3"


ok 15 - #3: GIT_DIR, GIT_WORK_TREE=root at root

expecting success: 
	cat >3/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY/3
setup: cwd: $TRASH_DIRECTORY/3
setup: prefix: (null)
EOF
	test_repo 3 "$TRASH_DIRECTORY/3/.git" .


ok 16 - #3: GIT_DIR, GIT_WORK_TREE=root(rel) at root

expecting success: 
	cat >3/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY/3
setup: cwd: $TRASH_DIRECTORY/3
setup: prefix: sub/sub/
EOF
	test_repo 3/sub/sub ../../.git "$TRASH_DIRECTORY/3"

ok 17 - #3: GIT_DIR(rel), GIT_WORKTREE=root in subdir

expecting success: 
	cat >3/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY/3
setup: cwd: $TRASH_DIRECTORY/3
setup: prefix: sub/sub/
EOF
	test_repo 3/sub/sub ../../.git ../..


ok 18 - #3: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir

expecting success: 
	cat >3/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY/3
setup: cwd: $TRASH_DIRECTORY/3
setup: prefix: sub/
EOF
	test_repo 3/sub "$TRASH_DIRECTORY/3/.git" "$TRASH_DIRECTORY/3"


ok 19 - #3: GIT_DIR, GIT_WORKTREE=root in subdir

expecting success: 
	cat >3/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY/3
setup: cwd: $TRASH_DIRECTORY/3
setup: prefix: sub/sub/
EOF
	test_repo 3/sub/sub "$TRASH_DIRECTORY/3/.git" ../..

ok 20 - #3: GIT_DIR, GIT_WORKTREE=root(rel) in subdir

expecting success: 
	cat >3/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/3/wt
setup: cwd: $TRASH_DIRECTORY/3
setup: prefix: (null)
EOF
	test_repo 3 .git "$TRASH_DIRECTORY/3/wt"

ok 21 - #3: GIT_DIR(rel), GIT_WORK_TREE=wt at root

expecting success: 
	cat >3/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/3/wt
setup: cwd: $TRASH_DIRECTORY/3
setup: prefix: (null)
EOF
	test_repo 3 .git wt

ok 22 - #3: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root

expecting success: 
	cat >3/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY/3/wt
setup: cwd: $TRASH_DIRECTORY/3
setup: prefix: (null)
EOF
	test_repo 3 "$TRASH_DIRECTORY/3/.git" wt

ok 23 - #3: GIT_DIR, GIT_WORK_TREE=wt(rel) at root

expecting success: 
	cat >3/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY/3/wt
setup: cwd: $TRASH_DIRECTORY/3
setup: prefix: (null)
EOF
	test_repo 3 "$TRASH_DIRECTORY/3/.git" "$TRASH_DIRECTORY/3/wt"

ok 24 - #3: GIT_DIR, GIT_WORK_TREE=wt at root

expecting success: 
	cat >3/sub/sub/expected <<EOF &&
setup: git_dir: ../../.git
setup: worktree: $TRASH_DIRECTORY/3/wt
setup: cwd: $TRASH_DIRECTORY/3/sub/sub
setup: prefix: (null)
EOF
	test_repo 3/sub/sub ../../.git "$TRASH_DIRECTORY/3/wt"

ok 25 - #3: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir

expecting success: 
	cat >3/sub/sub/expected <<EOF &&
setup: git_dir: ../../.git
setup: worktree: $TRASH_DIRECTORY/3/wt
setup: cwd: $TRASH_DIRECTORY/3/sub/sub
setup: prefix: (null)
EOF
	test_repo 3/sub/sub ../../.git ../../wt

ok 26 - #3: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir

expecting success: 
	cat >3/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY/3/wt
setup: cwd: $TRASH_DIRECTORY/3/sub/sub
setup: prefix: (null)
EOF
	test_repo 3/sub/sub "$TRASH_DIRECTORY/3/.git" ../../wt

ok 27 - #3: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir

expecting success: 
	cat >3/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY/3/wt
setup: cwd: $TRASH_DIRECTORY/3/sub/sub
setup: prefix: (null)
EOF
	test_repo 3/sub/sub "$TRASH_DIRECTORY/3/.git" "$TRASH_DIRECTORY/3/wt"

ok 28 - #3: GIT_DIR, GIT_WORK_TREE=wt in subdir

expecting success: 
	cat >3/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 3/
EOF
	test_repo 3 .git "$TRASH_DIRECTORY"

ok 29 - #3: GIT_DIR(rel), GIT_WORK_TREE=.. at root

expecting success: 
	cat >3/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 3/
EOF
	test_repo 3 .git ..

ok 30 - #3: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root

expecting success: 
	cat >3/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 3/
EOF
	test_repo 3 "$TRASH_DIRECTORY/3/.git" ..

ok 31 - #3: GIT_DIR, GIT_WORK_TREE=..(rel) at root

expecting success: 
	cat >3/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 3/
EOF
	test_repo 3 "$TRASH_DIRECTORY/3/.git" "$TRASH_DIRECTORY"


ok 32 - #3: GIT_DIR, GIT_WORK_TREE=.. at root

expecting success: 
	cat >3/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 3/sub/sub/
EOF
	test_repo 3/sub/sub ../../.git "$TRASH_DIRECTORY"

ok 33 - #3: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir

expecting success: 
	cat >3/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 3/sub/sub/
EOF
	test_repo 3/sub/sub ../../.git ../../..

ok 34 - #3: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir

expecting success: 
	cat >3/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 3/sub/sub/
EOF
	test_repo 3/sub/sub "$TRASH_DIRECTORY/3/.git" ../../../

ok 35 - #3: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir

expecting success: 
	cat >3/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/3/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 3/sub/sub/
EOF
	test_repo 3/sub/sub "$TRASH_DIRECTORY/3/.git" "$TRASH_DIRECTORY"

ok 36 - #3: GIT_DIR, GIT_WORK_TREE=.. in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 4 4/sub &&
	cd 4 &&
	git init &&
	git config core.worktree non-existent &&
	cd ..
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/4/.git/
ok 37 - #4: setup
expecting success: 
	cat >4/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/4
setup: cwd: $TRASH_DIRECTORY/4
setup: prefix: (null)
EOF
	test_repo 4

ok 38 - #4: at root

expecting success: 
	cat >4/sub/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/4
setup: cwd: $TRASH_DIRECTORY/4
setup: prefix: sub/
EOF
	test_repo 4/sub

ok 39 - #4: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 5 5/sub &&
	cd 5 &&
	git init &&
	git config core.worktree non-existent &&
	GIT_WORK_TREE=non-existent-too &&
	export GIT_WORK_TREE &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/5/.git/

ok 40 - #5: setup

expecting success: 
	cat >5/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/5
setup: cwd: $TRASH_DIRECTORY/5
setup: prefix: (null)
EOF
	test_repo 5


ok 41 - #5: at root

expecting success: 
	cat >5/sub/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/5
setup: cwd: $TRASH_DIRECTORY/5
setup: prefix: sub/
EOF
	test_repo 5/sub

ok 42 - #5: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 6 6/sub 6/sub/sub 6.wt 6.wt/sub 6/wt 6/wt/sub &&
	cd 6 && git init && cd ..
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/6/.git/

ok 43 - #6: setup

expecting success: 
	cat >6/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/6
setup: cwd: $TRASH_DIRECTORY/6
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY/6" &&
	test_repo 6 .git

ok 44 - #6: GIT_DIR(rel), core.worktree=.. at root

expecting success: 
	cat >6/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/6
setup: cwd: $TRASH_DIRECTORY/6
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree .. &&
	test_repo 6 .git

ok 45 - #6: GIT_DIR(rel), core.worktree=..(rel) at root

expecting success: 
	cat >6/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY/6
setup: cwd: $TRASH_DIRECTORY/6
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY/6" &&
	test_repo 6 "$TRASH_DIRECTORY/6/.git"

ok 46 - #6: GIT_DIR, core.worktree=.. at root

expecting success: 
	cat >6/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY/6
setup: cwd: $TRASH_DIRECTORY/6
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree .. &&
	test_repo 6 "$TRASH_DIRECTORY/6/.git"

ok 47 - #6: GIT_DIR, core.worktree=..(rel) at root

expecting success: 
	cat >6/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY/6
setup: cwd: $TRASH_DIRECTORY/6
setup: prefix: sub/sub/
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY/6" &&
	test_repo 6/sub/sub ../../.git

ok 48 - #6: GIT_DIR(rel), core.worktree=.. in subdir

expecting success: 
	cat >6/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY/6
setup: cwd: $TRASH_DIRECTORY/6
setup: prefix: sub/sub/
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree .. &&
	test_repo 6/sub/sub ../../.git

ok 49 - #6: GIT_DIR(rel), core.worktree=..(rel) in subdir

expecting success: 
	cat >6/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY/6
setup: cwd: $TRASH_DIRECTORY/6
setup: prefix: sub/
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY/6" &&
	test_repo 6/sub "$TRASH_DIRECTORY/6/.git"

ok 50 - #6: GIT_DIR, core.worktree=.. in subdir

expecting success: 
	cat >6/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY/6
setup: cwd: $TRASH_DIRECTORY/6
setup: prefix: sub/sub/
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree .. &&
	test_repo 6/sub/sub "$TRASH_DIRECTORY/6/.git"

ok 51 - #6: GIT_DIR, core.worktree=..(rel) in subdir

expecting success: 
	cat >6/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/6/wt
setup: cwd: $TRASH_DIRECTORY/6
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY/6/wt" &&
	test_repo 6 .git

ok 52 - #6: GIT_DIR(rel), core.worktree=../wt at root

expecting success: 
	cat >6/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/6/wt
setup: cwd: $TRASH_DIRECTORY/6
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree ../wt &&
	test_repo 6 .git


ok 53 - #6: GIT_DIR(rel), core.worktree=../wt(rel) at root

expecting success: 
	cat >6/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY/6/wt
setup: cwd: $TRASH_DIRECTORY/6
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree ../wt &&
	test_repo 6 "$TRASH_DIRECTORY/6/.git"

ok 54 - #6: GIT_DIR, core.worktree=../wt(rel) at root

expecting success: 
	cat >6/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY/6/wt
setup: cwd: $TRASH_DIRECTORY/6
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY/6/wt" &&
	test_repo 6 "$TRASH_DIRECTORY/6/.git"


ok 55 - #6: GIT_DIR, core.worktree=../wt at root

expecting success: 
	cat >6/sub/sub/expected <<EOF &&
setup: git_dir: ../../.git
setup: worktree: $TRASH_DIRECTORY/6/wt
setup: cwd: $TRASH_DIRECTORY/6/sub/sub
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY/6/wt" &&
	test_repo 6/sub/sub ../../.git


ok 56 - #6: GIT_DIR(rel), core.worktree=../wt in subdir

expecting success: 
	cat >6/sub/sub/expected <<EOF &&
setup: git_dir: ../../.git
setup: worktree: $TRASH_DIRECTORY/6/wt
setup: cwd: $TRASH_DIRECTORY/6/sub/sub
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree ../wt &&
	test_repo 6/sub/sub ../../.git


ok 57 - #6: GIT_DIR(rel), core.worktree=../wt(rel) in subdir

expecting success: 
	cat >6/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY/6/wt
setup: cwd: $TRASH_DIRECTORY/6/sub/sub
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree ../wt &&
	test_repo 6/sub/sub "$TRASH_DIRECTORY/6/.git"


ok 58 - #6: GIT_DIR, core.worktree=../wt(rel) in subdir

expecting success: 
	cat >6/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY/6/wt
setup: cwd: $TRASH_DIRECTORY/6/sub/sub
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY/6/wt" &&
	test_repo 6/sub/sub "$TRASH_DIRECTORY/6/.git"


ok 59 - #6: GIT_DIR, core.worktree=../wt in subdir

expecting success: 
	cat >6/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 6/
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY" &&
	test_repo 6 .git


ok 60 - #6: GIT_DIR(rel), core.worktree=../.. at root

expecting success: 
	cat >6/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 6/
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree ../../ &&
	test_repo 6 .git


ok 61 - #6: GIT_DIR(rel), core.worktree=../..(rel) at root

expecting success: 
	cat >6/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 6/
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree ../../ &&
	test_repo 6 "$TRASH_DIRECTORY/6/.git"


ok 62 - #6: GIT_DIR, core.worktree=../..(rel) at root

expecting success: 
	cat >6/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 6/
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY" &&
	test_repo 6 "$TRASH_DIRECTORY/6/.git"


ok 63 - #6: GIT_DIR, core.worktree=../.. at root

expecting success: 
	cat >6/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 6/sub/sub/
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY" &&
	test_repo 6/sub/sub ../../.git


ok 64 - #6: GIT_DIR(rel), core.worktree=../.. in subdir

expecting success: 
	cat >6/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 6/sub/sub/
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree ../.. &&
	test_repo 6/sub/sub ../../.git


ok 65 - #6: GIT_DIR(rel), core.worktree=../..(rel) in subdir

expecting success: 
	cat >6/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 6/sub/sub/
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree ../.. &&
	test_repo 6/sub/sub "$TRASH_DIRECTORY/6/.git"


ok 66 - #6: GIT_DIR, core.worktree=../..(rel) in subdir

expecting success: 
	cat >6/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/6/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 6/sub/sub/
EOF
	git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY" &&
	test_repo 6/sub/sub "$TRASH_DIRECTORY/6/.git"


ok 67 - #6: GIT_DIR, core.worktree=../.. in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 7 7/sub 7/sub/sub 7.wt 7.wt/sub 7/wt 7/wt/sub &&
	cd 7 &&
	git init &&
	git config core.worktree non-existent &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/7/.git/

ok 68 - #7: setup

expecting success: 
	cat >7/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/7
setup: cwd: $TRASH_DIRECTORY/7
setup: prefix: (null)
EOF
	test_repo 7 .git "$TRASH_DIRECTORY/7"


ok 69 - #7: GIT_DIR(rel), GIT_WORK_TREE=root at root

expecting success: 
	cat >7/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/7
setup: cwd: $TRASH_DIRECTORY/7
setup: prefix: (null)
EOF
	test_repo 7 .git .


ok 70 - #7: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root

expecting success: 
	cat >7/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY/7
setup: cwd: $TRASH_DIRECTORY/7
setup: prefix: (null)
EOF
	test_repo 7 "$TRASH_DIRECTORY/7/.git" "$TRASH_DIRECTORY/7"


ok 71 - #7: GIT_DIR, GIT_WORK_TREE=root at root

expecting success: 
	cat >7/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY/7
setup: cwd: $TRASH_DIRECTORY/7
setup: prefix: (null)
EOF
	test_repo 7 "$TRASH_DIRECTORY/7/.git" .


ok 72 - #7: GIT_DIR, GIT_WORK_TREE=root(rel) at root

expecting success: 
	cat >7/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY/7
setup: cwd: $TRASH_DIRECTORY/7
setup: prefix: sub/sub/
EOF
	test_repo 7/sub/sub ../../.git "$TRASH_DIRECTORY/7"

ok 73 - #7: GIT_DIR(rel), GIT_WORKTREE=root in subdir

expecting success: 
	cat >7/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY/7
setup: cwd: $TRASH_DIRECTORY/7
setup: prefix: sub/sub/
EOF
	test_repo 7/sub/sub ../../.git ../..


ok 74 - #7: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir

expecting success: 
	cat >7/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY/7
setup: cwd: $TRASH_DIRECTORY/7
setup: prefix: sub/
EOF
	test_repo 7/sub "$TRASH_DIRECTORY/7/.git" "$TRASH_DIRECTORY/7"


ok 75 - #7: GIT_DIR, GIT_WORKTREE=root in subdir

expecting success: 
	cat >7/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY/7
setup: cwd: $TRASH_DIRECTORY/7
setup: prefix: sub/sub/
EOF
	test_repo 7/sub/sub "$TRASH_DIRECTORY/7/.git" ../..


ok 76 - #7: GIT_DIR, GIT_WORKTREE=root(rel) in subdir

expecting success: 
	cat >7/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/7/wt
setup: cwd: $TRASH_DIRECTORY/7
setup: prefix: (null)
EOF
	test_repo 7 .git "$TRASH_DIRECTORY/7/wt"


ok 77 - #7: GIT_DIR(rel), GIT_WORK_TREE=wt at root

expecting success: 
	cat >7/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/7/wt
setup: cwd: $TRASH_DIRECTORY/7
setup: prefix: (null)
EOF
	test_repo 7 .git wt


ok 78 - #7: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root

expecting success: 
	cat >7/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY/7/wt
setup: cwd: $TRASH_DIRECTORY/7
setup: prefix: (null)
EOF
	test_repo 7 "$TRASH_DIRECTORY/7/.git" wt


ok 79 - #7: GIT_DIR, GIT_WORK_TREE=wt(rel) at root

expecting success: 
	cat >7/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY/7/wt
setup: cwd: $TRASH_DIRECTORY/7
setup: prefix: (null)
EOF
	test_repo 7 "$TRASH_DIRECTORY/7/.git" "$TRASH_DIRECTORY/7/wt"


ok 80 - #7: GIT_DIR, GIT_WORK_TREE=wt at root

expecting success: 
	cat >7/sub/sub/expected <<EOF &&
setup: git_dir: ../../.git
setup: worktree: $TRASH_DIRECTORY/7/wt
setup: cwd: $TRASH_DIRECTORY/7/sub/sub
setup: prefix: (null)
EOF
	test_repo 7/sub/sub ../../.git "$TRASH_DIRECTORY/7/wt"


ok 81 - #7: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir

expecting success: 
	cat >7/sub/sub/expected <<EOF &&
setup: git_dir: ../../.git
setup: worktree: $TRASH_DIRECTORY/7/wt
setup: cwd: $TRASH_DIRECTORY/7/sub/sub
setup: prefix: (null)
EOF
	test_repo 7/sub/sub ../../.git ../../wt


ok 82 - #7: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir

expecting success: 
	cat >7/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY/7/wt
setup: cwd: $TRASH_DIRECTORY/7/sub/sub
setup: prefix: (null)
EOF
	test_repo 7/sub/sub "$TRASH_DIRECTORY/7/.git" ../../wt


ok 83 - #7: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir

expecting success: 
	cat >7/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY/7/wt
setup: cwd: $TRASH_DIRECTORY/7/sub/sub
setup: prefix: (null)
EOF
	test_repo 7/sub/sub "$TRASH_DIRECTORY/7/.git" "$TRASH_DIRECTORY/7/wt"


ok 84 - #7: GIT_DIR, GIT_WORK_TREE=wt in subdir

expecting success: 
	cat >7/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 7/
EOF
	test_repo 7 .git "$TRASH_DIRECTORY"


ok 85 - #7: GIT_DIR(rel), GIT_WORK_TREE=.. at root

expecting success: 
	cat >7/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 7/
EOF
	test_repo 7 .git ..


ok 86 - #7: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root

expecting success: 
	cat >7/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 7/
EOF
	test_repo 7 "$TRASH_DIRECTORY/7/.git" ..


ok 87 - #7: GIT_DIR, GIT_WORK_TREE=..(rel) at root

expecting success: 
	cat >7/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 7/
EOF
	test_repo 7 "$TRASH_DIRECTORY/7/.git" "$TRASH_DIRECTORY"


ok 88 - #7: GIT_DIR, GIT_WORK_TREE=.. at root

expecting success: 
	cat >7/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 7/sub/sub/
EOF
	test_repo 7/sub/sub ../../.git "$TRASH_DIRECTORY"


ok 89 - #7: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir

expecting success: 
	cat >7/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 7/sub/sub/
EOF
	test_repo 7/sub/sub ../../.git ../../..


ok 90 - #7: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir

expecting success: 
	cat >7/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 7/sub/sub/
EOF
	test_repo 7/sub/sub "$TRASH_DIRECTORY/7/.git" ../../../


ok 91 - #7: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir

expecting success: 
	cat >7/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/7/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 7/sub/sub/
EOF
	test_repo 7/sub/sub "$TRASH_DIRECTORY/7/.git" "$TRASH_DIRECTORY"


ok 92 - #7: GIT_DIR, GIT_WORK_TREE=.. in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 8 8/sub &&
	cd 8 &&
	git init &&
	mv .git ../8.git &&
	echo gitdir: ../8.git >.git &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/8/.git/

ok 93 - #8: setup

expecting success: 
	cat >8/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/8.git
setup: worktree: $TRASH_DIRECTORY/8
setup: cwd: $TRASH_DIRECTORY/8
setup: prefix: (null)
EOF
	test_repo 8


ok 94 - #8: at root

expecting success: 
	cat >8/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/8.git
setup: worktree: $TRASH_DIRECTORY/8
setup: cwd: $TRASH_DIRECTORY/8
setup: prefix: sub/
EOF
	test_repo 8/sub


ok 95 - #8: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 9 9/sub 9.wt 9.wt/sub 9/wt 9/wt/sub &&
	cd 9 &&
	git init &&
	mv .git ../9.git &&
	echo gitdir: ../9.git >.git &&
	GIT_WORK_TREE=non-existent &&
	export GIT_WORK_TREE &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/9/.git/

ok 96 - #9: setup

expecting success: 
	cat >9/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/9.git
setup: worktree: $TRASH_DIRECTORY/9
setup: cwd: $TRASH_DIRECTORY/9
setup: prefix: (null)
EOF
	test_repo 9


ok 97 - #9: at root

expecting success: 
	cat >9/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/9.git
setup: worktree: $TRASH_DIRECTORY/9
setup: cwd: $TRASH_DIRECTORY/9
setup: prefix: sub/
EOF
	test_repo 9/sub


ok 98 - #9: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 10 10/sub &&
	cd 10 &&
	git init &&
	mv .git ../10.git &&
	echo gitdir: ../10.git >.git &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/10/.git/

ok 99 - #10: setup

expecting success: 
	cat >10/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/10.git
setup: worktree: $TRASH_DIRECTORY/10
setup: cwd: $TRASH_DIRECTORY/10
setup: prefix: (null)
EOF
	test_repo 10 "$TRASH_DIRECTORY/10/.git"


ok 100 - #10: at root

expecting success: 
	cat >10/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/10.git
setup: worktree: $TRASH_DIRECTORY/10/sub
setup: cwd: $TRASH_DIRECTORY/10/sub
setup: prefix: (null)
EOF
	test_repo 10/sub "$TRASH_DIRECTORY/10/.git"


ok 101 - #10: in subdir

expecting success: 
	cat >10/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/10.git
setup: worktree: $TRASH_DIRECTORY/10
setup: cwd: $TRASH_DIRECTORY/10
setup: prefix: (null)
EOF
	test_repo 10 .git


ok 102 - #10: relative GIT_DIR at root

expecting success: 
	cat >10/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/10.git
setup: worktree: $TRASH_DIRECTORY/10/sub
setup: cwd: $TRASH_DIRECTORY/10/sub
setup: prefix: (null)
EOF
	test_repo 10/sub ../.git


ok 103 - #10: relative GIT_DIR in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 11 11/sub 11/sub/sub 11.wt 11.wt/sub 11/wt 11/wt/sub &&
	cd 11 &&
	git init &&
	mv .git ../11.git &&
	echo gitdir: ../11.git >.git &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/11/.git/

ok 104 - #11: setup

expecting success: 
	cat >11/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY/11
setup: cwd: $TRASH_DIRECTORY/11
setup: prefix: (null)
EOF
	test_repo 11 .git "$TRASH_DIRECTORY/11"


ok 105 - #11: GIT_DIR(rel), GIT_WORK_TREE=root at root

expecting success: 
	cat >11/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY/11
setup: cwd: $TRASH_DIRECTORY/11
setup: prefix: (null)
EOF
	test_repo 11 .git .


ok 106 - #11: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root

expecting success: 
	cat >11/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY/11
setup: cwd: $TRASH_DIRECTORY/11
setup: prefix: (null)
EOF
	test_repo 11 "$TRASH_DIRECTORY/11/.git" "$TRASH_DIRECTORY/11"


ok 107 - #11: GIT_DIR, GIT_WORK_TREE=root at root

expecting success: 
	cat >11/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY/11
setup: cwd: $TRASH_DIRECTORY/11
setup: prefix: (null)
EOF
	test_repo 11 "$TRASH_DIRECTORY/11/.git" .


ok 108 - #11: GIT_DIR, GIT_WORK_TREE=root(rel) at root

expecting success: 
	cat >11/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY/11
setup: cwd: $TRASH_DIRECTORY/11
setup: prefix: sub/sub/
EOF
	test_repo 11/sub/sub ../../.git "$TRASH_DIRECTORY/11"


ok 109 - #11: GIT_DIR(rel), GIT_WORKTREE=root in subdir

expecting success: 
	cat >11/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY/11
setup: cwd: $TRASH_DIRECTORY/11
setup: prefix: sub/sub/
EOF
	test_repo 11/sub/sub ../../.git ../..


ok 110 - #11: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir

expecting success: 
	cat >11/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY/11
setup: cwd: $TRASH_DIRECTORY/11
setup: prefix: sub/
EOF
	test_repo 11/sub "$TRASH_DIRECTORY/11/.git" "$TRASH_DIRECTORY/11"


ok 111 - #11: GIT_DIR, GIT_WORKTREE=root in subdir

expecting success: 
	cat >11/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY/11
setup: cwd: $TRASH_DIRECTORY/11
setup: prefix: sub/sub/
EOF
	test_repo 11/sub/sub "$TRASH_DIRECTORY/11/.git" ../..


ok 112 - #11: GIT_DIR, GIT_WORKTREE=root(rel) in subdir

expecting success: 
	cat >11/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY/11/wt
setup: cwd: $TRASH_DIRECTORY/11
setup: prefix: (null)
EOF
	test_repo 11 .git "$TRASH_DIRECTORY/11/wt"


ok 113 - #11: GIT_DIR(rel), GIT_WORK_TREE=wt at root

expecting success: 
	cat >11/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY/11/wt
setup: cwd: $TRASH_DIRECTORY/11
setup: prefix: (null)
EOF
	test_repo 11 .git wt


ok 114 - #11: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root

expecting success: 
	cat >11/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY/11/wt
setup: cwd: $TRASH_DIRECTORY/11
setup: prefix: (null)
EOF
	test_repo 11 "$TRASH_DIRECTORY/11/.git" wt


ok 115 - #11: GIT_DIR, GIT_WORK_TREE=wt(rel) at root

expecting success: 
	cat >11/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY/11/wt
setup: cwd: $TRASH_DIRECTORY/11
setup: prefix: (null)
EOF
	test_repo 11 "$TRASH_DIRECTORY/11/.git" "$TRASH_DIRECTORY/11/wt"


ok 116 - #11: GIT_DIR, GIT_WORK_TREE=wt at root

expecting success: 
	cat >11/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY/11/wt
setup: cwd: $TRASH_DIRECTORY/11/sub/sub
setup: prefix: (null)
EOF
	test_repo 11/sub/sub ../../.git "$TRASH_DIRECTORY/11/wt"


ok 117 - #11: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir

expecting success: 
	cat >11/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY/11/wt
setup: cwd: $TRASH_DIRECTORY/11/sub/sub
setup: prefix: (null)
EOF
	test_repo 11/sub/sub ../../.git ../../wt

ok 118 - #11: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir

expecting success: 
	cat >11/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY/11/wt
setup: cwd: $TRASH_DIRECTORY/11/sub/sub
setup: prefix: (null)
EOF
	test_repo 11/sub/sub "$TRASH_DIRECTORY/11/.git" ../../wt


ok 119 - #11: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir

expecting success: 
	cat >11/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY/11/wt
setup: cwd: $TRASH_DIRECTORY/11/sub/sub
setup: prefix: (null)
EOF
	test_repo 11/sub/sub "$TRASH_DIRECTORY/11/.git" "$TRASH_DIRECTORY/11/wt"


ok 120 - #11: GIT_DIR, GIT_WORK_TREE=wt in subdir

expecting success: 
	cat >11/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 11/
EOF
	test_repo 11 .git "$TRASH_DIRECTORY"


ok 121 - #11: GIT_DIR(rel), GIT_WORK_TREE=.. at root

expecting success: 
	cat >11/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 11/
EOF
	test_repo 11 .git ..


ok 122 - #11: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root

expecting success: 
	cat >11/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 11/
EOF
	test_repo 11 "$TRASH_DIRECTORY/11/.git" ..


ok 123 - #11: GIT_DIR, GIT_WORK_TREE=..(rel) at root

expecting success: 
	cat >11/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 11/
EOF
	test_repo 11 "$TRASH_DIRECTORY/11/.git" "$TRASH_DIRECTORY"


ok 124 - #11: GIT_DIR, GIT_WORK_TREE=.. at root

expecting success: 
	cat >11/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 11/sub/sub/
EOF
	test_repo 11/sub/sub ../../.git "$TRASH_DIRECTORY"


ok 125 - #11: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir

expecting success: 
	cat >11/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 11/sub/sub/
EOF
	test_repo 11/sub/sub ../../.git ../../..

ok 126 - #11: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir

expecting success: 
	cat >11/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 11/sub/sub/
EOF
	test_repo 11/sub/sub "$TRASH_DIRECTORY/11/.git" ../../../

ok 127 - #11: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir

expecting success: 
	cat >11/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/11.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 11/sub/sub/
EOF
	test_repo 11/sub/sub "$TRASH_DIRECTORY/11/.git" "$TRASH_DIRECTORY"

ok 128 - #11: GIT_DIR, GIT_WORK_TREE=.. in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 12 12/sub 12/sub/sub 12.wt 12.wt/sub 12/wt 12/wt/sub &&
	cd 12 &&
	git init &&
	git config core.worktree non-existent &&
	mv .git ../12.git &&
	echo gitdir: ../12.git >.git &&
	cd ..
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/12/.git/
ok 129 - #12: setup
expecting success: 
	cat >12/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/12.git
setup: worktree: $TRASH_DIRECTORY/12
setup: cwd: $TRASH_DIRECTORY/12
setup: prefix: (null)
EOF
	test_repo 12

ok 130 - #12: at root

expecting success: 
	cat >12/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/12.git
setup: worktree: $TRASH_DIRECTORY/12
setup: cwd: $TRASH_DIRECTORY/12
setup: prefix: sub/
EOF
	test_repo 12/sub

ok 131 - #12: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 13 13/sub 13/sub/sub 13.wt 13.wt/sub 13/wt 13/wt/sub &&
	cd 13 &&
	git init &&
	git config core.worktree non-existent &&
	GIT_WORK_TREE=non-existent-too &&
	export GIT_WORK_TREE &&
	mv .git ../13.git &&
	echo gitdir: ../13.git >.git &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/13/.git/

ok 132 - #13: setup

expecting success: 
	cat >13/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/13.git
setup: worktree: $TRASH_DIRECTORY/13
setup: cwd: $TRASH_DIRECTORY/13
setup: prefix: (null)
EOF
	test_repo 13

ok 133 - #13: at root

expecting success: 
	cat >13/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/13.git
setup: worktree: $TRASH_DIRECTORY/13
setup: cwd: $TRASH_DIRECTORY/13
setup: prefix: sub/
EOF
	test_repo 13/sub

ok 134 - #13: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 14 14/sub 14/sub/sub 14.wt 14.wt/sub 14/wt 14/wt/sub &&
	cd 14 &&
	git init &&
	mv .git ../14.git &&
	echo gitdir: ../14.git >.git &&
	cd ..
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/14/.git/
ok 135 - #14: setup
expecting success: 
	cat >14/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY/14
setup: cwd: $TRASH_DIRECTORY/14
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY/14" &&
	test_repo 14 .git

ok 136 - #14: GIT_DIR(rel), core.worktree=../14 at root

expecting success: 
	cat >14/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY/14
setup: cwd: $TRASH_DIRECTORY/14
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree ../14 &&
	test_repo 14 .git

ok 137 - #14: GIT_DIR(rel), core.worktree=../14(rel) at root

expecting success: 
	cat >14/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY/14
setup: cwd: $TRASH_DIRECTORY/14
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY/14" &&
	test_repo 14 "$TRASH_DIRECTORY/14/.git"

ok 138 - #14: GIT_DIR, core.worktree=../14 at root

expecting success: 
	cat >14/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY/14
setup: cwd: $TRASH_DIRECTORY/14
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree ../14 &&
	test_repo 14 "$TRASH_DIRECTORY/14/.git"

ok 139 - #14: GIT_DIR, core.worktree=../14(rel) at root

expecting success: 
	cat >14/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY/14
setup: cwd: $TRASH_DIRECTORY/14
setup: prefix: sub/sub/
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY/14" &&
	test_repo 14/sub/sub ../../.git

ok 140 - #14: GIT_DIR(rel), core.worktree=../14 in subdir

expecting success: 
	cat >14/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY/14
setup: cwd: $TRASH_DIRECTORY/14
setup: prefix: sub/sub/
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree ../14 &&
	test_repo 14/sub/sub ../../.git

ok 141 - #14: GIT_DIR(rel), core.worktree=../14(rel) in subdir

expecting success: 
	cat >14/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY/14
setup: cwd: $TRASH_DIRECTORY/14
setup: prefix: sub/
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY/14" &&
	test_repo 14/sub "$TRASH_DIRECTORY/14/.git"

ok 142 - #14: GIT_DIR, core.worktree=../14 in subdir

expecting success: 
	cat >14/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY/14
setup: cwd: $TRASH_DIRECTORY/14
setup: prefix: sub/sub/
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree ../14 &&
	test_repo 14/sub/sub "$TRASH_DIRECTORY/14/.git"

ok 143 - #14: GIT_DIR, core.worktree=../14(rel) in subdir

expecting success: 
	cat >14/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY/14/wt
setup: cwd: $TRASH_DIRECTORY/14
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY/14/wt" &&
	test_repo 14 .git

ok 144 - #14: GIT_DIR(rel), core.worktree=../14/wt at root

expecting success: 
	cat >14/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY/14/wt
setup: cwd: $TRASH_DIRECTORY/14
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree ../14/wt &&
	test_repo 14 .git

ok 145 - #14: GIT_DIR(rel), core.worktree=../14/wt(rel) at root

expecting success: 
	cat >14/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY/14/wt
setup: cwd: $TRASH_DIRECTORY/14
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree ../14/wt &&
	test_repo 14 "$TRASH_DIRECTORY/14/.git"

ok 146 - #14: GIT_DIR, core.worktree=../14/wt(rel) at root

expecting success: 
	cat >14/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY/14/wt
setup: cwd: $TRASH_DIRECTORY/14
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY/14/wt" &&
	test_repo 14 "$TRASH_DIRECTORY/14/.git"

ok 147 - #14: GIT_DIR, core.worktree=../14/wt at root

expecting success: 
	cat >14/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY/14/wt
setup: cwd: $TRASH_DIRECTORY/14/sub/sub
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY/14/wt" &&
	test_repo 14/sub/sub ../../.git

ok 148 - #14: GIT_DIR(rel), core.worktree=../14/wt in subdir

expecting success: 
	cat >14/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY/14/wt
setup: cwd: $TRASH_DIRECTORY/14/sub/sub
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree ../14/wt &&
	test_repo 14/sub/sub ../../.git

ok 149 - #14: GIT_DIR(rel), core.worktree=../14/wt(rel) in subdir

expecting success: 
	cat >14/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY/14/wt
setup: cwd: $TRASH_DIRECTORY/14/sub/sub
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree ../14/wt &&
	test_repo 14/sub/sub "$TRASH_DIRECTORY/14/.git"

ok 150 - #14: GIT_DIR, core.worktree=../14/wt(rel) in subdir

expecting success: 
	cat >14/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY/14/wt
setup: cwd: $TRASH_DIRECTORY/14/sub/sub
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY/14/wt" &&
	test_repo 14/sub/sub "$TRASH_DIRECTORY/14/.git"

ok 151 - #14: GIT_DIR, core.worktree=../14/wt in subdir

expecting success: 
	cat >14/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 14/
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY" &&
	test_repo 14 .git

ok 152 - #14: GIT_DIR(rel), core.worktree=.. at root

expecting success: 
	cat >14/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 14/
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree .. &&
	test_repo 14 .git

ok 153 - #14: GIT_DIR(rel), core.worktree=..(rel) at root

expecting success: 
	cat >14/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 14/
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree .. &&
	test_repo 14 "$TRASH_DIRECTORY/14/.git"

ok 154 - #14: GIT_DIR, core.worktree=..(rel) at root

expecting success: 
	cat >14/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 14/
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY" &&
	test_repo 14 "$TRASH_DIRECTORY/14/.git"

ok 155 - #14: GIT_DIR, core.worktree=.. at root

expecting success: 
	cat >14/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 14/sub/sub/
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY" &&
	test_repo 14/sub/sub ../../.git

ok 156 - #14: GIT_DIR(rel), core.worktree=.. in subdir

expecting success: 
	cat >14/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 14/sub/sub/
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree .. &&
	test_repo 14/sub/sub ../../.git

ok 157 - #14: GIT_DIR(rel), core.worktree=..(rel) in subdir

expecting success: 
	cat >14/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 14/sub/sub/
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree .. &&
	test_repo 14/sub/sub "$TRASH_DIRECTORY/14/.git"

ok 158 - #14: GIT_DIR, core.worktree=..(rel) in subdir

expecting success: 
	cat >14/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/14.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 14/sub/sub/
EOF
	git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY" &&
	test_repo 14/sub/sub "$TRASH_DIRECTORY/14/.git"

ok 159 - #14: GIT_DIR, core.worktree=.. in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 15 15/sub 15/sub/sub 15.wt 15.wt/sub 15/wt 15/wt/sub &&
	cd 15 &&
	git init &&
	git config core.worktree non-existent &&
	mv .git ../15.git &&
	echo gitdir: ../15.git >.git &&
	cd ..
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/15/.git/
ok 160 - #15: setup
expecting success: 
	cat >15/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY/15
setup: cwd: $TRASH_DIRECTORY/15
setup: prefix: (null)
EOF
	test_repo 15 .git "$TRASH_DIRECTORY/15"

ok 161 - #15: GIT_DIR(rel), GIT_WORK_TREE=root at root

expecting success: 
	cat >15/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY/15
setup: cwd: $TRASH_DIRECTORY/15
setup: prefix: (null)
EOF
	test_repo 15 .git .

ok 162 - #15: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root

expecting success: 
	cat >15/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY/15
setup: cwd: $TRASH_DIRECTORY/15
setup: prefix: (null)
EOF
	test_repo 15 "$TRASH_DIRECTORY/15/.git" "$TRASH_DIRECTORY/15"

ok 163 - #15: GIT_DIR, GIT_WORK_TREE=root at root

expecting success: 
	cat >15/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY/15
setup: cwd: $TRASH_DIRECTORY/15
setup: prefix: (null)
EOF
	test_repo 15 "$TRASH_DIRECTORY/15/.git" .

ok 164 - #15: GIT_DIR, GIT_WORK_TREE=root(rel) at root

expecting success: 
	cat >15/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY/15
setup: cwd: $TRASH_DIRECTORY/15
setup: prefix: sub/sub/
EOF
	test_repo 15/sub/sub ../../.git "$TRASH_DIRECTORY/15"

ok 165 - #15: GIT_DIR(rel), GIT_WORKTREE=root in subdir

expecting success: 
	cat >15/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY/15
setup: cwd: $TRASH_DIRECTORY/15
setup: prefix: sub/sub/
EOF
	test_repo 15/sub/sub ../../.git ../..

ok 166 - #15: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir

expecting success: 
	cat >15/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY/15
setup: cwd: $TRASH_DIRECTORY/15
setup: prefix: sub/
EOF
	test_repo 15/sub "$TRASH_DIRECTORY/15/.git" "$TRASH_DIRECTORY/15"

ok 167 - #15: GIT_DIR, GIT_WORKTREE=root in subdir

expecting success: 
	cat >15/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY/15
setup: cwd: $TRASH_DIRECTORY/15
setup: prefix: sub/sub/
EOF
	test_repo 15/sub/sub "$TRASH_DIRECTORY/15/.git" ../..

ok 168 - #15: GIT_DIR, GIT_WORKTREE=root(rel) in subdir

expecting success: 
	cat >15/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY/15/wt
setup: cwd: $TRASH_DIRECTORY/15
setup: prefix: (null)
EOF
	test_repo 15 .git "$TRASH_DIRECTORY/15/wt"


ok 169 - #15: GIT_DIR(rel), GIT_WORK_TREE=wt at root

expecting success: 
	cat >15/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY/15/wt
setup: cwd: $TRASH_DIRECTORY/15
setup: prefix: (null)
EOF
	test_repo 15 .git wt


ok 170 - #15: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root

expecting success: 
	cat >15/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY/15/wt
setup: cwd: $TRASH_DIRECTORY/15
setup: prefix: (null)
EOF
	test_repo 15 "$TRASH_DIRECTORY/15/.git" wt


ok 171 - #15: GIT_DIR, GIT_WORK_TREE=wt(rel) at root

expecting success: 
	cat >15/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY/15/wt
setup: cwd: $TRASH_DIRECTORY/15
setup: prefix: (null)
EOF
	test_repo 15 "$TRASH_DIRECTORY/15/.git" "$TRASH_DIRECTORY/15/wt"

ok 172 - #15: GIT_DIR, GIT_WORK_TREE=wt at root

expecting success: 
	cat >15/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY/15/wt
setup: cwd: $TRASH_DIRECTORY/15/sub/sub
setup: prefix: (null)
EOF
	test_repo 15/sub/sub ../../.git "$TRASH_DIRECTORY/15/wt"


ok 173 - #15: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir

expecting success: 
	cat >15/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY/15/wt
setup: cwd: $TRASH_DIRECTORY/15/sub/sub
setup: prefix: (null)
EOF
	test_repo 15/sub/sub ../../.git ../../wt

ok 174 - #15: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir

expecting success: 
	cat >15/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY/15/wt
setup: cwd: $TRASH_DIRECTORY/15/sub/sub
setup: prefix: (null)
EOF
	test_repo 15/sub/sub "$TRASH_DIRECTORY/15/.git" ../../wt

ok 175 - #15: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir

expecting success: 
	cat >15/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY/15/wt
setup: cwd: $TRASH_DIRECTORY/15/sub/sub
setup: prefix: (null)
EOF
	test_repo 15/sub/sub "$TRASH_DIRECTORY/15/.git" "$TRASH_DIRECTORY/15/wt"


ok 176 - #15: GIT_DIR, GIT_WORK_TREE=wt in subdir

expecting success: 
	cat >15/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 15/
EOF
	test_repo 15 .git "$TRASH_DIRECTORY"

ok 177 - #15: GIT_DIR(rel), GIT_WORK_TREE=.. at root

expecting success: 
	cat >15/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 15/
EOF
	test_repo 15 .git ..


ok 178 - #15: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root

expecting success: 
	cat >15/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 15/
EOF
	test_repo 15 "$TRASH_DIRECTORY/15/.git" ..


ok 179 - #15: GIT_DIR, GIT_WORK_TREE=..(rel) at root

expecting success: 
	cat >15/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 15/
EOF
	test_repo 15 "$TRASH_DIRECTORY/15/.git" "$TRASH_DIRECTORY"

ok 180 - #15: GIT_DIR, GIT_WORK_TREE=.. at root

expecting success: 
	cat >15/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 15/sub/sub/
EOF
	test_repo 15/sub/sub ../../.git "$TRASH_DIRECTORY"


ok 181 - #15: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir

expecting success: 
	cat >15/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 15/sub/sub/
EOF
	test_repo 15/sub/sub ../../.git ../../..

ok 182 - #15: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir

expecting success: 
	cat >15/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 15/sub/sub/
EOF
	test_repo 15/sub/sub "$TRASH_DIRECTORY/15/.git" ../../../


ok 183 - #15: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir

expecting success: 
	cat >15/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/15.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 15/sub/sub/
EOF
	test_repo 15/sub/sub "$TRASH_DIRECTORY/15/.git" "$TRASH_DIRECTORY"


ok 184 - #15: GIT_DIR, GIT_WORK_TREE=.. in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 16 16/sub &&
	cd 16 &&
	git init &&
	mkdir .git/wt .git/wt/sub &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/16/.git/

ok 185 - #16.1: setup

expecting success: 
	cat >16/.git/expected <<EOF &&
setup: git_dir: .
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/16/.git
setup: prefix: (null)
EOF
	test_repo 16/.git

ok 186 - #16.1: at .git

expecting success: 
	cat >16/.git/wt/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/16/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/16/.git/wt
setup: prefix: (null)
EOF
	test_repo 16/.git/wt


ok 187 - #16.1: in .git/wt

expecting success: 
	cat >16/.git/wt/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/16/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/16/.git/wt/sub
setup: prefix: (null)
EOF
	test_repo 16/.git/wt/sub


ok 188 - #16.1: in .git/wt/sub

expecting success: 
	git config --file="$TRASH_DIRECTORY/16/.git/config" core.bare true


ok 189 - #16.2: setup

expecting success: 
	cat >16/.git/expected <<EOF &&
setup: git_dir: .
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/16/.git
setup: prefix: (null)
EOF
	test_repo 16/.git


ok 190 - #16.2: at .git

expecting success: 
	cat >16/.git/wt/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/16/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/16/.git/wt
setup: prefix: (null)
EOF
	test_repo 16/.git/wt

ok 191 - #16.2: in .git/wt

expecting success: 
	cat >16/.git/wt/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/16/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/16/.git/wt/sub
setup: prefix: (null)
EOF
	test_repo 16/.git/wt/sub


ok 192 - #16.2: in .git/wt/sub

expecting success: 
	cat >16/expected <<EOF &&
setup: git_dir: .git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/16
setup: prefix: (null)
EOF
	test_repo 16

ok 193 - #16.2: at root

expecting success: 
	cat >16/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/16/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/16/sub
setup: prefix: (null)
EOF
	test_repo 16/sub


ok 194 - #16.2: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 17 17/sub &&
	cd 17 &&
	git init &&
	mkdir .git/wt .git/wt/sub &&
	GIT_WORK_TREE=non-existent &&
	export GIT_WORK_TREE &&
	cd ..
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/17/.git/

ok 195 - #17.1: setup

expecting success: 
	cat >17/.git/expected <<EOF &&
setup: git_dir: .
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/17/.git
setup: prefix: (null)
EOF
	test_repo 17/.git

ok 196 - #17.1: at .git

expecting success: 
	cat >17/.git/wt/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/17/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/17/.git/wt
setup: prefix: (null)
EOF
	test_repo 17/.git/wt

ok 197 - #17.1: in .git/wt

expecting success: 
	cat >17/.git/wt/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/17/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/17/.git/wt/sub
setup: prefix: (null)
EOF
	test_repo 17/.git/wt/sub

ok 198 - #17.1: in .git/wt/sub

expecting success: 
	git config --file="$TRASH_DIRECTORY/17/.git/config" core.bare true


ok 199 - #17.2: setup

expecting success: 
	cat >17/.git/expected <<EOF &&
setup: git_dir: .
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/17/.git
setup: prefix: (null)
EOF
	test_repo 17/.git


ok 200 - #17.2: at .git

expecting success: 
	cat >17/.git/wt/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/17/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/17/.git/wt
setup: prefix: (null)
EOF
	test_repo 17/.git/wt


ok 201 - #17.2: in .git/wt

expecting success: 
	cat >17/.git/wt/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/17/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/17/.git/wt/sub
setup: prefix: (null)
EOF
	test_repo 17/.git/wt/sub

ok 202 - #17.2: in .git/wt/sub

expecting success: 
	cat >17/expected <<EOF &&
setup: git_dir: .git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/17
setup: prefix: (null)
EOF
	test_repo 17

ok 203 - #17.2: at root

expecting success: 
	cat >17/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/17/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/17/sub
setup: prefix: (null)
EOF
	test_repo 17/sub

ok 204 - #17.2: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 18 18/sub &&
	cd 18 &&
	git init &&
	mkdir .git/wt .git/wt/sub &&
	git config core.bare true &&
	cd ..
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/18/.git/
ok 205 - #18: setup
expecting success: 
	cat >18/expected <<EOF &&
setup: git_dir: .git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/18
setup: prefix: (null)
EOF
	 test_repo 18 .git

ok 206 - #18: (rel) at root

expecting success: 
	cat >18/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/18/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/18
setup: prefix: (null)
EOF
	 test_repo 18 "$TRASH_DIRECTORY/18/.git"

ok 207 - #18: at root

expecting success: 
	cat >18/sub/expected <<EOF &&
setup: git_dir: ../.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/18/sub
setup: prefix: (null)
EOF
	test_repo 18/sub ../.git


ok 208 - #18: (rel) in subdir

expecting success: 
	cat >18/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/18/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/18/sub
setup: prefix: (null)
EOF
	test_repo 18/sub "$TRASH_DIRECTORY/18/.git"


ok 209 - #18: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 19 19/sub 19/sub/sub 19.wt 19.wt/sub 19/wt 19/wt/sub &&
	cd 19 &&
	git init &&
	git config core.bare true &&
	cd ..
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/19/.git/

ok 210 - #19: setup

expecting success: 
	cat >19/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/19
setup: cwd: $TRASH_DIRECTORY/19
setup: prefix: (null)
EOF
	test_repo 19 .git "$TRASH_DIRECTORY/19"


ok 211 - #19: GIT_DIR(rel), GIT_WORK_TREE=root at root

expecting success: 
	cat >19/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/19
setup: cwd: $TRASH_DIRECTORY/19
setup: prefix: (null)
EOF
	test_repo 19 .git .


ok 212 - #19: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root

expecting success: 
	cat >19/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY/19
setup: cwd: $TRASH_DIRECTORY/19
setup: prefix: (null)
EOF
	test_repo 19 "$TRASH_DIRECTORY/19/.git" "$TRASH_DIRECTORY/19"


ok 213 - #19: GIT_DIR, GIT_WORK_TREE=root at root

expecting success: 
	cat >19/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY/19
setup: cwd: $TRASH_DIRECTORY/19
setup: prefix: (null)
EOF
	test_repo 19 "$TRASH_DIRECTORY/19/.git" .


ok 214 - #19: GIT_DIR, GIT_WORK_TREE=root(rel) at root

expecting success: 
	cat >19/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY/19
setup: cwd: $TRASH_DIRECTORY/19
setup: prefix: sub/sub/
EOF
	test_repo 19/sub/sub ../../.git "$TRASH_DIRECTORY/19"


ok 215 - #19: GIT_DIR(rel), GIT_WORKTREE=root in subdir

expecting success: 
	cat >19/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY/19
setup: cwd: $TRASH_DIRECTORY/19
setup: prefix: sub/sub/
EOF
	test_repo 19/sub/sub ../../.git ../..

ok 216 - #19: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir

expecting success: 
	cat >19/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY/19
setup: cwd: $TRASH_DIRECTORY/19
setup: prefix: sub/
EOF
	test_repo 19/sub "$TRASH_DIRECTORY/19/.git" "$TRASH_DIRECTORY/19"


ok 217 - #19: GIT_DIR, GIT_WORKTREE=root in subdir

expecting success: 
	cat >19/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY/19
setup: cwd: $TRASH_DIRECTORY/19
setup: prefix: sub/sub/
EOF
	test_repo 19/sub/sub "$TRASH_DIRECTORY/19/.git" ../..


ok 218 - #19: GIT_DIR, GIT_WORKTREE=root(rel) in subdir

expecting success: 
	cat >19/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/19/wt
setup: cwd: $TRASH_DIRECTORY/19
setup: prefix: (null)
EOF
	test_repo 19 .git "$TRASH_DIRECTORY/19/wt"


ok 219 - #19: GIT_DIR(rel), GIT_WORK_TREE=wt at root

expecting success: 
	cat >19/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/19/wt
setup: cwd: $TRASH_DIRECTORY/19
setup: prefix: (null)
EOF
	test_repo 19 .git wt


ok 220 - #19: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root

expecting success: 
	cat >19/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY/19/wt
setup: cwd: $TRASH_DIRECTORY/19
setup: prefix: (null)
EOF
	test_repo 19 "$TRASH_DIRECTORY/19/.git" wt


ok 221 - #19: GIT_DIR, GIT_WORK_TREE=wt(rel) at root

expecting success: 
	cat >19/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY/19/wt
setup: cwd: $TRASH_DIRECTORY/19
setup: prefix: (null)
EOF
	test_repo 19 "$TRASH_DIRECTORY/19/.git" "$TRASH_DIRECTORY/19/wt"


ok 222 - #19: GIT_DIR, GIT_WORK_TREE=wt at root

expecting success: 
	cat >19/sub/sub/expected <<EOF &&
setup: git_dir: ../../.git
setup: worktree: $TRASH_DIRECTORY/19/wt
setup: cwd: $TRASH_DIRECTORY/19/sub/sub
setup: prefix: (null)
EOF
	test_repo 19/sub/sub ../../.git "$TRASH_DIRECTORY/19/wt"


ok 223 - #19: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir

expecting success: 
	cat >19/sub/sub/expected <<EOF &&
setup: git_dir: ../../.git
setup: worktree: $TRASH_DIRECTORY/19/wt
setup: cwd: $TRASH_DIRECTORY/19/sub/sub
setup: prefix: (null)
EOF
	test_repo 19/sub/sub ../../.git ../../wt


ok 224 - #19: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir

expecting success: 
	cat >19/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY/19/wt
setup: cwd: $TRASH_DIRECTORY/19/sub/sub
setup: prefix: (null)
EOF
	test_repo 19/sub/sub "$TRASH_DIRECTORY/19/.git" ../../wt

ok 225 - #19: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir

expecting success: 
	cat >19/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY/19/wt
setup: cwd: $TRASH_DIRECTORY/19/sub/sub
setup: prefix: (null)
EOF
	test_repo 19/sub/sub "$TRASH_DIRECTORY/19/.git" "$TRASH_DIRECTORY/19/wt"


ok 226 - #19: GIT_DIR, GIT_WORK_TREE=wt in subdir

expecting success: 
	cat >19/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 19/
EOF
	test_repo 19 .git "$TRASH_DIRECTORY"


ok 227 - #19: GIT_DIR(rel), GIT_WORK_TREE=.. at root

expecting success: 
	cat >19/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 19/
EOF
	test_repo 19 .git ..


ok 228 - #19: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root

expecting success: 
	cat >19/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 19/
EOF
	test_repo 19 "$TRASH_DIRECTORY/19/.git" ..


ok 229 - #19: GIT_DIR, GIT_WORK_TREE=..(rel) at root

expecting success: 
	cat >19/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 19/
EOF
	test_repo 19 "$TRASH_DIRECTORY/19/.git" "$TRASH_DIRECTORY"


ok 230 - #19: GIT_DIR, GIT_WORK_TREE=.. at root

expecting success: 
	cat >19/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 19/sub/sub/
EOF
	test_repo 19/sub/sub ../../.git "$TRASH_DIRECTORY"


ok 231 - #19: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir

expecting success: 
	cat >19/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 19/sub/sub/
EOF
	test_repo 19/sub/sub ../../.git ../../..


ok 232 - #19: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir

expecting success: 
	cat >19/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 19/sub/sub/
EOF
	test_repo 19/sub/sub "$TRASH_DIRECTORY/19/.git" ../../../


ok 233 - #19: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir

expecting success: 
	cat >19/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/19/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 19/sub/sub/
EOF
	test_repo 19/sub/sub "$TRASH_DIRECTORY/19/.git" "$TRASH_DIRECTORY"

ok 234 - #19: GIT_DIR, GIT_WORK_TREE=.. in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 20 20/sub &&
	cd 20 &&
	git init &&
	git config core.worktree non-existent &&
	mkdir .git/wt .git/wt/sub &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/20/.git/

ok 235 - #20.1: setup

expecting success: 
	cat >20/.git/expected <<EOF &&
setup: git_dir: .
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/20/.git
setup: prefix: (null)
EOF
	test_repo 20/.git

ok 236 - #20.1: at .git

expecting success: 
	cat >20/.git/wt/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/20/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/20/.git/wt
setup: prefix: (null)
EOF
	test_repo 20/.git/wt

ok 237 - #20.1: in .git/wt

expecting success: 
	cat >20/.git/wt/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/20/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/20/.git/wt/sub
setup: prefix: (null)
EOF
	test_repo 20/.git/wt/sub

ok 238 - #20.1: in .git/wt/sub

expecting success: 
	git config --file="$TRASH_DIRECTORY/20/.git/config" core.bare true

ok 239 - #20.2: setup
expecting success: 
	cat >20/.git/expected <<EOF &&
setup: git_dir: .
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/20/.git
setup: prefix: (null)
EOF
	test_repo 20/.git

ok 240 - #20.2: at .git

expecting success: 
	cat >20/.git/wt/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/20/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/20/.git/wt
setup: prefix: (null)
EOF
	test_repo 20/.git/wt


ok 241 - #20.2: in .git/wt

expecting success: 
	cat >20/.git/wt/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/20/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/20/.git/wt/sub
setup: prefix: (null)
EOF
	test_repo 20/.git/wt/sub

ok 242 - #20.2: in .git/wt/sub

expecting success: 
	cat >20/expected <<EOF &&
setup: git_dir: .git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/20
setup: prefix: (null)
EOF
	test_repo 20

ok 243 - #20.2: at root

expecting success: 
	cat >20/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/20/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/20/sub
setup: prefix: (null)
EOF
	test_repo 20/sub

ok 244 - #20.2: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 21 21/sub &&
	cd 21 &&
	git init &&
	git config core.worktree non-existent &&
	GIT_WORK_TREE=non-existent-too &&
	export GIT_WORK_TREE &&
	mkdir .git/wt .git/wt/sub &&
	cd ..
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/21/.git/

ok 245 - #21.1: setup
expecting success: 
	cat >21/.git/expected <<EOF &&
setup: git_dir: .
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/21/.git
setup: prefix: (null)
EOF
	test_repo 21/.git

ok 246 - #21.1: at .git

expecting success: 
	cat >21/.git/wt/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/21/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/21/.git/wt
setup: prefix: (null)
EOF
	test_repo 21/.git/wt

ok 247 - #21.1: in .git/wt

expecting success: 
	cat >21/.git/wt/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/21/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/21/.git/wt/sub
setup: prefix: (null)
EOF
	test_repo 21/.git/wt/sub


ok 248 - #21.1: in .git/wt/sub

expecting success: 
	git config --file="$TRASH_DIRECTORY/21/.git/config" core.bare true


ok 249 - #21.2: setup

expecting success: 
	cat >21/.git/expected <<EOF &&
setup: git_dir: .
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/21/.git
setup: prefix: (null)
EOF
	test_repo 21/.git

ok 250 - #21.2: at .git

expecting success: 
	cat >21/.git/wt/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/21/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/21/.git/wt
setup: prefix: (null)
EOF
	test_repo 21/.git/wt


ok 251 - #21.2: in .git/wt

expecting success: 
	cat >21/.git/wt/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/21/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/21/.git/wt/sub
setup: prefix: (null)
EOF
	test_repo 21/.git/wt/sub


ok 252 - #21.2: in .git/wt/sub

expecting success: 
	cat >21/expected <<EOF &&
setup: git_dir: .git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/21
setup: prefix: (null)
EOF
	test_repo 21


ok 253 - #21.2: at root

expecting success: 
	cat >21/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/21/.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/21/sub
setup: prefix: (null)
EOF
	test_repo 21/sub

ok 254 - #21.2: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 22 &&
	cd 22 &&
	git init &&
	mkdir .git/sub .git/wt .git/wt/sub &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/22/.git/

ok 255 - #22.1: setup

expecting success: 
	cat >22/.git/expected <<EOF &&
setup: git_dir: .
setup: worktree: $TRASH_DIRECTORY/22/.git
setup: cwd: $TRASH_DIRECTORY/22/.git
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22/.git" &&
	test_repo 22/.git .

ok 256 - #22.1: GIT_DIR(rel), core.worktree=. at .git

expecting success: 
	cat >22/.git/expected <<EOF &&
setup: git_dir: .
setup: worktree: $TRASH_DIRECTORY/22/.git
setup: cwd: $TRASH_DIRECTORY/22/.git
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree . &&
	test_repo 22/.git .


ok 257 - #22.1: GIT_DIR(rel), core.worktree=.(rel) at .git

expecting success: 
	cat >22/.git/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22/.git
setup: cwd: $TRASH_DIRECTORY/22/.git
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22/.git" &&
	test_repo 22/.git "$TRASH_DIRECTORY/22/.git"


ok 258 - #22.1: GIT_DIR, core.worktree=. at .git

expecting success: 
	cat >22/.git/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22/.git
setup: cwd: $TRASH_DIRECTORY/22/.git
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree . &&
	test_repo 22/.git "$TRASH_DIRECTORY/22/.git"


ok 259 - #22.1: GIT_DIR, core.worktree=.(rel) at root

expecting success: 
	cat >22/.git/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22/.git
setup: cwd: $TRASH_DIRECTORY/22/.git
setup: prefix: sub/
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22/.git" &&
	test_repo 22/.git/sub ..

ok 260 - #22.1: GIT_DIR(rel), core.worktree=. in .git/sub

expecting success: 
	cat >22/.git/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22/.git
setup: cwd: $TRASH_DIRECTORY/22/.git
setup: prefix: sub/
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree . &&
	test_repo 22/.git/sub/ ..

ok 261 - #22.1: GIT_DIR(rel), core.worktree=.(rel) in .git/sub

expecting success: 
	cat >22/.git/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22/.git
setup: cwd: $TRASH_DIRECTORY/22/.git
setup: prefix: sub/
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22/.git" &&
	test_repo 22/.git/sub "$TRASH_DIRECTORY/22/.git"

ok 262 - #22.1: GIT_DIR, core.worktree=. in .git/sub

expecting success: 
	cat >22/.git/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22/.git
setup: cwd: $TRASH_DIRECTORY/22/.git
setup: prefix: sub/
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree . &&
	test_repo 22/.git/sub "$TRASH_DIRECTORY/22/.git"

ok 263 - #22.1: GIT_DIR, core.worktree=.(rel) in .git/sub

expecting success: 
	cat >22/.git/expected <<EOF &&
setup: git_dir: .
setup: worktree: $TRASH_DIRECTORY/22/.git/wt
setup: cwd: $TRASH_DIRECTORY/22/.git
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22/.git/wt" &&
	test_repo 22/.git .

ok 264 - #22.1: GIT_DIR(rel), core.worktree=wt at .git

expecting success: 
	cat >22/.git/expected <<EOF &&
setup: git_dir: .
setup: worktree: $TRASH_DIRECTORY/22/.git/wt
setup: cwd: $TRASH_DIRECTORY/22/.git
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree wt &&
	test_repo 22/.git .

ok 265 - #22.1: GIT_DIR(rel), core.worktree=wt(rel) at .git

expecting success: 
	cat >22/.git/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22/.git/wt
setup: cwd: $TRASH_DIRECTORY/22/.git
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree wt &&
	test_repo 22/.git "$TRASH_DIRECTORY/22/.git"

ok 266 - #22.1: GIT_DIR, core.worktree=wt(rel) at .git

expecting success: 
	cat >22/.git/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22/.git/wt
setup: cwd: $TRASH_DIRECTORY/22/.git
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22/.git/wt" &&
	test_repo 22/.git "$TRASH_DIRECTORY/22/.git"

ok 267 - #22.1: GIT_DIR, core.worktree=wt at .git

expecting success: 
	cat >22/.git/sub/expected <<EOF &&
setup: git_dir: ..
setup: worktree: $TRASH_DIRECTORY/22/.git/wt
setup: cwd: $TRASH_DIRECTORY/22/.git/sub
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22/.git/wt" &&
	test_repo 22/.git/sub ..

ok 268 - #22.1: GIT_DIR(rel), core.worktree=wt in .git/sub

expecting success: 
	cat >22/.git/sub/expected <<EOF &&
setup: git_dir: ..
setup: worktree: $TRASH_DIRECTORY/22/.git/wt
setup: cwd: $TRASH_DIRECTORY/22/.git/sub
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree wt &&
	test_repo 22/.git/sub ..

ok 269 - #22.1: GIT_DIR(rel), core.worktree=wt(rel) in .git/sub

expecting success: 
	cat >22/.git/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22/.git/wt
setup: cwd: $TRASH_DIRECTORY/22/.git/sub
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree wt &&
	test_repo 22/.git/sub "$TRASH_DIRECTORY/22/.git"

ok 270 - #22.1: GIT_DIR, core.worktree=wt(rel) in .git/sub

expecting success: 
	cat >22/.git/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22/.git/wt
setup: cwd: $TRASH_DIRECTORY/22/.git/sub
setup: prefix: (null)
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22/.git/wt" &&
	test_repo 22/.git/sub "$TRASH_DIRECTORY/22/.git"

ok 271 - #22.1: GIT_DIR, core.worktree=wt in .git/sub

expecting success: 
	cat >22/.git/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22
setup: cwd: $TRASH_DIRECTORY/22
setup: prefix: .git/
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22" &&
	test_repo 22/.git .

ok 272 - #22.1: GIT_DIR(rel), core.worktree=.. at .git

expecting success: 
	cat >22/.git/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22
setup: cwd: $TRASH_DIRECTORY/22
setup: prefix: .git/
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree .. &&
	test_repo 22/.git .

ok 273 - #22.1: GIT_DIR(rel), core.worktree=..(rel) at .git

expecting success: 
	cat >22/.git/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22
setup: cwd: $TRASH_DIRECTORY/22
setup: prefix: .git/
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree .. &&
	test_repo 22/.git "$TRASH_DIRECTORY/22/.git"

ok 274 - #22.1: GIT_DIR, core.worktree=..(rel) at .git

expecting success: 
	cat >22/.git/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22
setup: cwd: $TRASH_DIRECTORY/22
setup: prefix: .git/
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22" &&
	test_repo 22/.git "$TRASH_DIRECTORY/22/.git"


ok 275 - #22.1: GIT_DIR, core.worktree=.. at .git

expecting success: 
	cat >22/.git/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22
setup: cwd: $TRASH_DIRECTORY/22
setup: prefix: .git/sub/
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22" &&
	test_repo 22/.git/sub ..

ok 276 - #22.1: GIT_DIR(rel), core.worktree=.. in .git/sub

expecting success: 
	cat >22/.git/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22
setup: cwd: $TRASH_DIRECTORY/22
setup: prefix: .git/sub/
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree .. &&
	test_repo 22/.git/sub ..

ok 277 - #22.1: GIT_DIR(rel), core.worktree=..(rel) in .git/sub

expecting success: 
	cat >22/.git/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22
setup: cwd: $TRASH_DIRECTORY/22
setup: prefix: .git/sub/
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree .. &&
	test_repo 22/.git/sub "$TRASH_DIRECTORY/22/.git"

ok 278 - #22.1: GIT_DIR, core.worktree=..(rel) in .git/sub

expecting success: 
	cat >22/.git/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/22/.git
setup: worktree: $TRASH_DIRECTORY/22
setup: cwd: $TRASH_DIRECTORY/22
setup: prefix: .git/sub/
EOF
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22" &&
	test_repo 22/.git/sub "$TRASH_DIRECTORY/22/.git"


ok 279 - #22.1: GIT_DIR, core.worktree=.. in .git/sub

expecting success: 
	git config --file="$TRASH_DIRECTORY/22/.git/config" core.bare true


ok 280 - #22.2: setup

expecting success: 
	(
	cd 22/.git &&
	GIT_DIR=. &&
	export GIT_DIR &&
	test_must_fail git symbolic-ref HEAD 2>result &&
	grep "core.bare and core.worktree do not make sense" result
	)

fatal: core.bare and core.worktree do not make sense

ok 281 - #22.2: at .git

expecting success: 
	(
	cd 22 &&
	GIT_DIR=.git &&
	export GIT_DIR &&
	test_must_fail git symbolic-ref HEAD 2>result &&
	grep "core.bare and core.worktree do not make sense" result
	)

fatal: core.bare and core.worktree do not make sense

ok 282 - #22.2: at root

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 23 23/sub 23/sub/sub 23.wt 23.wt/sub 23/wt 23/wt/sub &&
	cd 23 &&
	git init &&
	git config core.bare true &&
	git config core.worktree non-existent &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/23/.git/

ok 283 - #23: setup

expecting success: 
	cat >23/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/23
setup: cwd: $TRASH_DIRECTORY/23
setup: prefix: (null)
EOF
	test_repo 23 .git "$TRASH_DIRECTORY/23"


ok 284 - #23: GIT_DIR(rel), GIT_WORK_TREE=root at root

expecting success: 
	cat >23/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/23
setup: cwd: $TRASH_DIRECTORY/23
setup: prefix: (null)
EOF
	test_repo 23 .git .


ok 285 - #23: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root

expecting success: 
	cat >23/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY/23
setup: cwd: $TRASH_DIRECTORY/23
setup: prefix: (null)
EOF
	test_repo 23 "$TRASH_DIRECTORY/23/.git" "$TRASH_DIRECTORY/23"


ok 286 - #23: GIT_DIR, GIT_WORK_TREE=root at root

expecting success: 
	cat >23/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY/23
setup: cwd: $TRASH_DIRECTORY/23
setup: prefix: (null)
EOF
	test_repo 23 "$TRASH_DIRECTORY/23/.git" .


ok 287 - #23: GIT_DIR, GIT_WORK_TREE=root(rel) at root

expecting success: 
	cat >23/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY/23
setup: cwd: $TRASH_DIRECTORY/23
setup: prefix: sub/sub/
EOF
	test_repo 23/sub/sub ../../.git "$TRASH_DIRECTORY/23"


ok 288 - #23: GIT_DIR(rel), GIT_WORKTREE=root in subdir

expecting success: 
	cat >23/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY/23
setup: cwd: $TRASH_DIRECTORY/23
setup: prefix: sub/sub/
EOF
	test_repo 23/sub/sub ../../.git ../..


ok 289 - #23: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir

expecting success: 
	cat >23/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY/23
setup: cwd: $TRASH_DIRECTORY/23
setup: prefix: sub/
EOF
	test_repo 23/sub "$TRASH_DIRECTORY/23/.git" "$TRASH_DIRECTORY/23"


ok 290 - #23: GIT_DIR, GIT_WORKTREE=root in subdir

expecting success: 
	cat >23/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY/23
setup: cwd: $TRASH_DIRECTORY/23
setup: prefix: sub/sub/
EOF
	test_repo 23/sub/sub "$TRASH_DIRECTORY/23/.git" ../..


ok 291 - #23: GIT_DIR, GIT_WORKTREE=root(rel) in subdir

expecting success: 
	cat >23/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/23/wt
setup: cwd: $TRASH_DIRECTORY/23
setup: prefix: (null)
EOF
	test_repo 23 .git "$TRASH_DIRECTORY/23/wt"


ok 292 - #23: GIT_DIR(rel), GIT_WORK_TREE=wt at root

expecting success: 
	cat >23/expected <<EOF &&
setup: git_dir: .git
setup: worktree: $TRASH_DIRECTORY/23/wt
setup: cwd: $TRASH_DIRECTORY/23
setup: prefix: (null)
EOF
	test_repo 23 .git wt


ok 293 - #23: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root

expecting success: 
	cat >23/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY/23/wt
setup: cwd: $TRASH_DIRECTORY/23
setup: prefix: (null)
EOF
	test_repo 23 "$TRASH_DIRECTORY/23/.git" wt


ok 294 - #23: GIT_DIR, GIT_WORK_TREE=wt(rel) at root

expecting success: 
	cat >23/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY/23/wt
setup: cwd: $TRASH_DIRECTORY/23
setup: prefix: (null)
EOF
	test_repo 23 "$TRASH_DIRECTORY/23/.git" "$TRASH_DIRECTORY/23/wt"


ok 295 - #23: GIT_DIR, GIT_WORK_TREE=wt at root

expecting success: 
	cat >23/sub/sub/expected <<EOF &&
setup: git_dir: ../../.git
setup: worktree: $TRASH_DIRECTORY/23/wt
setup: cwd: $TRASH_DIRECTORY/23/sub/sub
setup: prefix: (null)
EOF
	test_repo 23/sub/sub ../../.git "$TRASH_DIRECTORY/23/wt"


ok 296 - #23: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir

expecting success: 
	cat >23/sub/sub/expected <<EOF &&
setup: git_dir: ../../.git
setup: worktree: $TRASH_DIRECTORY/23/wt
setup: cwd: $TRASH_DIRECTORY/23/sub/sub
setup: prefix: (null)
EOF
	test_repo 23/sub/sub ../../.git ../../wt


ok 297 - #23: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir

expecting success: 
	cat >23/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY/23/wt
setup: cwd: $TRASH_DIRECTORY/23/sub/sub
setup: prefix: (null)
EOF
	test_repo 23/sub/sub "$TRASH_DIRECTORY/23/.git" ../../wt


ok 298 - #23: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir

expecting success: 
	cat >23/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY/23/wt
setup: cwd: $TRASH_DIRECTORY/23/sub/sub
setup: prefix: (null)
EOF
	test_repo 23/sub/sub "$TRASH_DIRECTORY/23/.git" "$TRASH_DIRECTORY/23/wt"


ok 299 - #23: GIT_DIR, GIT_WORK_TREE=wt in subdir

expecting success: 
	cat >23/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 23/
EOF
	test_repo 23 .git "$TRASH_DIRECTORY"


ok 300 - #23: GIT_DIR(rel), GIT_WORK_TREE=.. at root

expecting success: 
	cat >23/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 23/
EOF
	test_repo 23 .git ..


ok 301 - #23: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root

expecting success: 
	cat >23/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 23/
EOF
	test_repo 23 "$TRASH_DIRECTORY/23/.git" ..


ok 302 - #23: GIT_DIR, GIT_WORK_TREE=..(rel) at root

expecting success: 
	cat >23/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 23/
EOF
	test_repo 23 "$TRASH_DIRECTORY/23/.git" "$TRASH_DIRECTORY"


ok 303 - #23: GIT_DIR, GIT_WORK_TREE=.. at root

expecting success: 
	cat >23/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 23/sub/sub/
EOF
	test_repo 23/sub/sub ../../.git "$TRASH_DIRECTORY"


ok 304 - #23: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir

expecting success: 
	cat >23/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 23/sub/sub/
EOF
	test_repo 23/sub/sub ../../.git ../../..


ok 305 - #23: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir

expecting success: 
	cat >23/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 23/sub/sub/
EOF
	test_repo 23/sub/sub "$TRASH_DIRECTORY/23/.git" ../../../


ok 306 - #23: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir

expecting success: 
	cat >23/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/23/.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 23/sub/sub/
EOF
	test_repo 23/sub/sub "$TRASH_DIRECTORY/23/.git" "$TRASH_DIRECTORY"


ok 307 - #23: GIT_DIR, GIT_WORK_TREE=.. in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 24 24/sub &&
	cd 24 &&
	git init &&
	git config core.bare true &&
	mv .git ../24.git &&
	echo gitdir: ../24.git >.git &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/24/.git/

ok 308 - #24: setup

expecting success: 
	cat >24/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/24.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/24
setup: prefix: (null)
EOF
	test_repo 24


ok 309 - #24: at root

expecting success: 
	cat >24/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/24.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/24/sub
setup: prefix: (null)
EOF
	test_repo 24/sub


ok 310 - #24: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 25 25/sub &&
	cd 25 &&
	git init &&
	git config core.bare true &&
	GIT_WORK_TREE=non-existent &&
	export GIT_WORK_TREE &&
	mv .git ../25.git &&
	echo gitdir: ../25.git >.git &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/25/.git/

ok 311 - #25: setup

expecting success: 
	cat >25/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/25.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/25
setup: prefix: (null)
EOF
	test_repo 25


ok 312 - #25: at root

expecting success: 
	cat >25/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/25.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/25/sub
setup: prefix: (null)
EOF
	test_repo 25/sub

ok 313 - #25: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 26 26/sub &&
	cd 26 &&
	git init &&
	git config core.bare true &&
	mv .git ../26.git &&
	echo gitdir: ../26.git >.git &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/26/.git/

ok 314 - #26: setup

expecting success: 
	cat >26/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/26.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/26
setup: prefix: (null)
EOF
	 test_repo 26 .git


ok 315 - #26: (rel) at root

expecting success: 
	cat >26/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/26.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/26
setup: prefix: (null)
EOF
	 test_repo 26 "$TRASH_DIRECTORY/26/.git"


ok 316 - #26: at root

expecting success: 
	cat >26/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/26.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/26/sub
setup: prefix: (null)
EOF
	test_repo 26/sub ../.git


ok 317 - #26: (rel) in subdir

expecting success: 
	cat >26/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/26.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/26/sub
setup: prefix: (null)
EOF
	test_repo 26/sub "$TRASH_DIRECTORY/26/.git"


ok 318 - #26: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 27 27/sub 27/sub/sub 27.wt 27.wt/sub 27/wt 27/wt/sub &&
	cd 27 &&
	git init &&
	git config core.bare true &&
	mv .git ../27.git &&
	echo gitdir: ../27.git >.git &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/27/.git/

ok 319 - #27: setup

expecting success: 
	cat >27/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY/27
setup: cwd: $TRASH_DIRECTORY/27
setup: prefix: (null)
EOF
	test_repo 27 .git "$TRASH_DIRECTORY/27"

ok 320 - #27: GIT_DIR(rel), GIT_WORK_TREE=root at root

expecting success: 
	cat >27/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY/27
setup: cwd: $TRASH_DIRECTORY/27
setup: prefix: (null)
EOF
	test_repo 27 .git .

ok 321 - #27: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root

expecting success: 
	cat >27/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY/27
setup: cwd: $TRASH_DIRECTORY/27
setup: prefix: (null)
EOF
	test_repo 27 "$TRASH_DIRECTORY/27/.git" "$TRASH_DIRECTORY/27"

ok 322 - #27: GIT_DIR, GIT_WORK_TREE=root at root

expecting success: 
	cat >27/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY/27
setup: cwd: $TRASH_DIRECTORY/27
setup: prefix: (null)
EOF
	test_repo 27 "$TRASH_DIRECTORY/27/.git" .

ok 323 - #27: GIT_DIR, GIT_WORK_TREE=root(rel) at root

expecting success: 
	cat >27/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY/27
setup: cwd: $TRASH_DIRECTORY/27
setup: prefix: sub/sub/
EOF
	test_repo 27/sub/sub ../../.git "$TRASH_DIRECTORY/27"

ok 324 - #27: GIT_DIR(rel), GIT_WORKTREE=root in subdir

expecting success: 
	cat >27/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY/27
setup: cwd: $TRASH_DIRECTORY/27
setup: prefix: sub/sub/
EOF
	test_repo 27/sub/sub ../../.git ../..

ok 325 - #27: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir

expecting success: 
	cat >27/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY/27
setup: cwd: $TRASH_DIRECTORY/27
setup: prefix: sub/
EOF
	test_repo 27/sub "$TRASH_DIRECTORY/27/.git" "$TRASH_DIRECTORY/27"

ok 326 - #27: GIT_DIR, GIT_WORKTREE=root in subdir

expecting success: 
	cat >27/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY/27
setup: cwd: $TRASH_DIRECTORY/27
setup: prefix: sub/sub/
EOF
	test_repo 27/sub/sub "$TRASH_DIRECTORY/27/.git" ../..

ok 327 - #27: GIT_DIR, GIT_WORKTREE=root(rel) in subdir

expecting success: 
	cat >27/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY/27/wt
setup: cwd: $TRASH_DIRECTORY/27
setup: prefix: (null)
EOF
	test_repo 27 .git "$TRASH_DIRECTORY/27/wt"

ok 328 - #27: GIT_DIR(rel), GIT_WORK_TREE=wt at root

expecting success: 
	cat >27/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY/27/wt
setup: cwd: $TRASH_DIRECTORY/27
setup: prefix: (null)
EOF
	test_repo 27 .git wt

ok 329 - #27: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root

expecting success: 
	cat >27/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY/27/wt
setup: cwd: $TRASH_DIRECTORY/27
setup: prefix: (null)
EOF
	test_repo 27 "$TRASH_DIRECTORY/27/.git" wt


ok 330 - #27: GIT_DIR, GIT_WORK_TREE=wt(rel) at root

expecting success: 
	cat >27/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY/27/wt
setup: cwd: $TRASH_DIRECTORY/27
setup: prefix: (null)
EOF
	test_repo 27 "$TRASH_DIRECTORY/27/.git" "$TRASH_DIRECTORY/27/wt"


ok 331 - #27: GIT_DIR, GIT_WORK_TREE=wt at root

expecting success: 
	cat >27/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY/27/wt
setup: cwd: $TRASH_DIRECTORY/27/sub/sub
setup: prefix: (null)
EOF
	test_repo 27/sub/sub ../../.git "$TRASH_DIRECTORY/27/wt"

ok 332 - #27: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir

expecting success: 
	cat >27/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY/27/wt
setup: cwd: $TRASH_DIRECTORY/27/sub/sub
setup: prefix: (null)
EOF
	test_repo 27/sub/sub ../../.git ../../wt


ok 333 - #27: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir

expecting success: 
	cat >27/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY/27/wt
setup: cwd: $TRASH_DIRECTORY/27/sub/sub
setup: prefix: (null)
EOF
	test_repo 27/sub/sub "$TRASH_DIRECTORY/27/.git" ../../wt


ok 334 - #27: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir

expecting success: 
	cat >27/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY/27/wt
setup: cwd: $TRASH_DIRECTORY/27/sub/sub
setup: prefix: (null)
EOF
	test_repo 27/sub/sub "$TRASH_DIRECTORY/27/.git" "$TRASH_DIRECTORY/27/wt"


ok 335 - #27: GIT_DIR, GIT_WORK_TREE=wt in subdir

expecting success: 
	cat >27/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 27/
EOF
	test_repo 27 .git "$TRASH_DIRECTORY"

ok 336 - #27: GIT_DIR(rel), GIT_WORK_TREE=.. at root

expecting success: 
	cat >27/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 27/
EOF
	test_repo 27 .git ..


ok 337 - #27: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root

expecting success: 
	cat >27/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 27/
EOF
	test_repo 27 "$TRASH_DIRECTORY/27/.git" ..


ok 338 - #27: GIT_DIR, GIT_WORK_TREE=..(rel) at root

expecting success: 
	cat >27/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 27/
EOF
	test_repo 27 "$TRASH_DIRECTORY/27/.git" "$TRASH_DIRECTORY"

ok 339 - #27: GIT_DIR, GIT_WORK_TREE=.. at root

expecting success: 
	cat >27/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 27/sub/sub/
EOF
	test_repo 27/sub/sub ../../.git "$TRASH_DIRECTORY"


ok 340 - #27: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir

expecting success: 
	cat >27/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 27/sub/sub/
EOF
	test_repo 27/sub/sub ../../.git ../../..


ok 341 - #27: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir

expecting success: 
	cat >27/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 27/sub/sub/
EOF
	test_repo 27/sub/sub "$TRASH_DIRECTORY/27/.git" ../../../


ok 342 - #27: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir

expecting success: 
	cat >27/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/27.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 27/sub/sub/
EOF
	test_repo 27/sub/sub "$TRASH_DIRECTORY/27/.git" "$TRASH_DIRECTORY"

ok 343 - #27: GIT_DIR, GIT_WORK_TREE=.. in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 28 28/sub &&
	cd 28 &&
	git init &&
	git config core.bare true &&
	git config core.worktree non-existent &&
	mv .git ../28.git &&
	echo gitdir: ../28.git >.git &&
	cd ..
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/28/.git/

ok 344 - #28: setup

expecting success: 
	cat >28/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/28.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/28
setup: prefix: (null)
EOF
	test_repo 28


ok 345 - #28: at root

expecting success: 
	cat >28/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/28.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/28/sub
setup: prefix: (null)
EOF
	test_repo 28/sub


ok 346 - #28: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 29 29/sub &&
	cd 29 &&
	git init &&
	git config core.bare true &&
	GIT_WORK_TREE=non-existent &&
	export GIT_WORK_TREE &&
	mv .git ../29.git &&
	echo gitdir: ../29.git >.git &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/29/.git/

ok 347 - #29: setup

expecting success: 
	cat >29/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/29.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/29
setup: prefix: (null)
EOF
	test_repo 29

ok 348 - #29: at root

expecting success: 
	cat >29/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/29.git
setup: worktree: (null)
setup: cwd: $TRASH_DIRECTORY/29/sub
setup: prefix: (null)
EOF
	test_repo 29/sub

ok 349 - #29: in subdir

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 30 &&
	cd 30 &&
	git init &&
	git config core.bare true &&
	git config core.worktree non-existent &&
	mv .git ../30.git &&
	echo gitdir: ../30.git >.git &&
	cd ..
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/30/.git/

ok 350 - #30: setup

expecting success: 
	(
	cd 30 &&
	GIT_DIR=.git &&
	export GIT_DIR &&
	test_must_fail git symbolic-ref HEAD 2>result &&
	grep "core.bare and core.worktree do not make sense" result
	)

fatal: core.bare and core.worktree do not make sense

ok 351 - #30: at root

expecting success: 
	unset GIT_DIR GIT_WORK_TREE &&
	mkdir 31 31/sub 31/sub/sub 31.wt 31.wt/sub 31/wt 31/wt/sub &&
	cd 31 &&
	git init &&
	git config core.bare true &&
	git config core.worktree non-existent &&
	mv .git ../31.git &&
	echo gitdir: ../31.git >.git &&
	cd ..

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1510-repo-setup/31/.git/

ok 352 - #31: setup

expecting success: 
	cat >31/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY/31
setup: cwd: $TRASH_DIRECTORY/31
setup: prefix: (null)
EOF
	test_repo 31 .git "$TRASH_DIRECTORY/31"

ok 353 - #31: GIT_DIR(rel), GIT_WORK_TREE=root at root

expecting success: 
	cat >31/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY/31
setup: cwd: $TRASH_DIRECTORY/31
setup: prefix: (null)
EOF
	test_repo 31 .git .

ok 354 - #31: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root

expecting success: 
	cat >31/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY/31
setup: cwd: $TRASH_DIRECTORY/31
setup: prefix: (null)
EOF
	test_repo 31 "$TRASH_DIRECTORY/31/.git" "$TRASH_DIRECTORY/31"

ok 355 - #31: GIT_DIR, GIT_WORK_TREE=root at root

expecting success: 
	cat >31/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY/31
setup: cwd: $TRASH_DIRECTORY/31
setup: prefix: (null)
EOF
	test_repo 31 "$TRASH_DIRECTORY/31/.git" .

ok 356 - #31: GIT_DIR, GIT_WORK_TREE=root(rel) at root

expecting success: 
	cat >31/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY/31
setup: cwd: $TRASH_DIRECTORY/31
setup: prefix: sub/sub/
EOF
	test_repo 31/sub/sub ../../.git "$TRASH_DIRECTORY/31"


ok 357 - #31: GIT_DIR(rel), GIT_WORKTREE=root in subdir

expecting success: 
	cat >31/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY/31
setup: cwd: $TRASH_DIRECTORY/31
setup: prefix: sub/sub/
EOF
	test_repo 31/sub/sub ../../.git ../..


ok 358 - #31: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir

expecting success: 
	cat >31/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY/31
setup: cwd: $TRASH_DIRECTORY/31
setup: prefix: sub/
EOF
	test_repo 31/sub "$TRASH_DIRECTORY/31/.git" "$TRASH_DIRECTORY/31"

ok 359 - #31: GIT_DIR, GIT_WORKTREE=root in subdir

expecting success: 
	cat >31/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY/31
setup: cwd: $TRASH_DIRECTORY/31
setup: prefix: sub/sub/
EOF
	test_repo 31/sub/sub "$TRASH_DIRECTORY/31/.git" ../..

ok 360 - #31: GIT_DIR, GIT_WORKTREE=root(rel) in subdir

expecting success: 
	cat >31/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY/31/wt
setup: cwd: $TRASH_DIRECTORY/31
setup: prefix: (null)
EOF
	test_repo 31 .git "$TRASH_DIRECTORY/31/wt"

ok 361 - #31: GIT_DIR(rel), GIT_WORK_TREE=wt at root

expecting success: 
	cat >31/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY/31/wt
setup: cwd: $TRASH_DIRECTORY/31
setup: prefix: (null)
EOF
	test_repo 31 .git wt


ok 362 - #31: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root

expecting success: 
	cat >31/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY/31/wt
setup: cwd: $TRASH_DIRECTORY/31
setup: prefix: (null)
EOF
	test_repo 31 "$TRASH_DIRECTORY/31/.git" wt
ok 363 - #31: GIT_DIR, GIT_WORK_TREE=wt(rel) at root

expecting success: 
	cat >31/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY/31/wt
setup: cwd: $TRASH_DIRECTORY/31
setup: prefix: (null)
EOF
	test_repo 31 "$TRASH_DIRECTORY/31/.git" "$TRASH_DIRECTORY/31/wt"

ok 364 - #31: GIT_DIR, GIT_WORK_TREE=wt at root

expecting success: 
	cat >31/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY/31/wt
setup: cwd: $TRASH_DIRECTORY/31/sub/sub
setup: prefix: (null)
EOF
	test_repo 31/sub/sub ../../.git "$TRASH_DIRECTORY/31/wt"


ok 365 - #31: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir

expecting success: 
	cat >31/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY/31/wt
setup: cwd: $TRASH_DIRECTORY/31/sub/sub
setup: prefix: (null)
EOF
	test_repo 31/sub/sub ../../.git ../../wt


ok 366 - #31: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir

expecting success: 
	cat >31/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY/31/wt
setup: cwd: $TRASH_DIRECTORY/31/sub/sub
setup: prefix: (null)
EOF
	test_repo 31/sub/sub "$TRASH_DIRECTORY/31/.git" ../../wt

ok 367 - #31: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir

expecting success: 
	cat >31/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY/31/wt
setup: cwd: $TRASH_DIRECTORY/31/sub/sub
setup: prefix: (null)
EOF
	test_repo 31/sub/sub "$TRASH_DIRECTORY/31/.git" "$TRASH_DIRECTORY/31/wt"


ok 368 - #31: GIT_DIR, GIT_WORK_TREE=wt in subdir

expecting success: 
	cat >31/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 31/
EOF
	test_repo 31 .git "$TRASH_DIRECTORY"


ok 369 - #31: GIT_DIR(rel), GIT_WORK_TREE=.. at root

expecting success: 
	cat >31/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 31/
EOF
	test_repo 31 .git ..


ok 370 - #31: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root

expecting success: 
	cat >31/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 31/
EOF
	test_repo 31 "$TRASH_DIRECTORY/31/.git" ..

ok 371 - #31: GIT_DIR, GIT_WORK_TREE=..(rel) at root

expecting success: 
	cat >31/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 31/
EOF
	test_repo 31 "$TRASH_DIRECTORY/31/.git" "$TRASH_DIRECTORY"

ok 372 - #31: GIT_DIR, GIT_WORK_TREE=.. at root

expecting success: 
	cat >31/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 31/sub/sub/
EOF
	test_repo 31/sub/sub ../../.git "$TRASH_DIRECTORY"

ok 373 - #31: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir

expecting success: 
	cat >31/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 31/sub/sub/
EOF
	test_repo 31/sub/sub ../../.git ../../..


ok 374 - #31: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir

expecting success: 
	cat >31/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 31/sub/sub/
EOF
	test_repo 31/sub/sub "$TRASH_DIRECTORY/31/.git" ../../../

ok 375 - #31: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir

expecting success: 
	cat >31/sub/sub/expected <<EOF &&
setup: git_dir: $TRASH_DIRECTORY/31.git
setup: worktree: $TRASH_DIRECTORY
setup: cwd: $TRASH_DIRECTORY
setup: prefix: 31/sub/sub/
EOF
	test_repo 31/sub/sub "$TRASH_DIRECTORY/31/.git" "$TRASH_DIRECTORY"


ok 376 - #31: GIT_DIR, GIT_WORK_TREE=.. in subdir

# passed all 376 test(s)
1..376
