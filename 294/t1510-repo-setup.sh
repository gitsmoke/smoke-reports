ok 1 - #0: setup
ok 2 - #0: at root
ok 3 - #0: in subdir
ok 4 - #1: setup
ok 5 - #1: at root
ok 6 - #1: in subdir
ok 7 - #2: setup
not ok - 8 #2: at root
#	
#		cat >2/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/2/.git
#	setup: worktree: $TRASH_DIRECTORY/2
#	setup: cwd: $TRASH_DIRECTORY/2
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/2/.git" test_repo 2
#	
not ok - 9 #2: in subdir
#	
#		cat >2/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/2/.git
#	setup: worktree: $TRASH_DIRECTORY/2/sub
#	setup: cwd: $TRASH_DIRECTORY/2/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/2/.git" test_repo 2/sub
#	
ok 10 - #2: relative GIT_DIR at root
not ok - 11 #2: relative GIT_DIR in subdir
#	
#		cat >2/sub/expected <<EOF &&
#	setup: git_dir: ../.git
#	setup: worktree: $TRASH_DIRECTORY/2/sub
#	setup: cwd: $TRASH_DIRECTORY/2/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../.git test_repo 2/sub
#	
ok 12 - #3: setup
ok 13 - #3: GIT_DIR(rel), GIT_WORK_TREE=root at root
ok 14 - #3: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root
not ok - 15 #3: GIT_DIR, GIT_WORK_TREE=root at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY/3
#	setup: cwd: $TRASH_DIRECTORY/3
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/3/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/3" test_repo 3
#	
not ok - 16 #3: GIT_DIR, GIT_WORK_TREE=root(rel) at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY/3
#	setup: cwd: $TRASH_DIRECTORY/3
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/3/.git" GIT_WORK_TREE=. test_repo 3
#	
not ok - 17 #3: GIT_DIR(rel), GIT_WORKTREE=root in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY/3
#	setup: cwd: $TRASH_DIRECTORY/3
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY/3" test_repo 3/sub/sub
#	
not ok - 18 #3: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY/3
#	setup: cwd: $TRASH_DIRECTORY/3
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../.. test_repo 3/sub/sub
#	
not ok - 19 #3: GIT_DIR, GIT_WORKTREE=root in subdir
#	
#		cat >3/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY/3
#	setup: cwd: $TRASH_DIRECTORY/3
#	setup: prefix: sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/3/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/3" test_repo 3/sub
#	
not ok - 20 #3: GIT_DIR, GIT_WORKTREE=root(rel) in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY/3
#	setup: cwd: $TRASH_DIRECTORY/3
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/3/.git" GIT_WORK_TREE=../.. test_repo 3/sub/sub
#	
not ok - 21 #3: GIT_DIR(rel), GIT_WORK_TREE=wt at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $TRASH_DIRECTORY/3/wt
#	setup: cwd: $TRASH_DIRECTORY/3
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY/3/wt" test_repo 3
#	
not ok - 22 #3: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $TRASH_DIRECTORY/3/wt
#	setup: cwd: $TRASH_DIRECTORY/3
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=wt test_repo 3
#	
not ok - 23 #3: GIT_DIR, GIT_WORK_TREE=wt(rel) at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY/3/wt
#	setup: cwd: $TRASH_DIRECTORY/3
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/3/.git" GIT_WORK_TREE=wt test_repo 3
#	
not ok - 24 #3: GIT_DIR, GIT_WORK_TREE=wt at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY/3/wt
#	setup: cwd: $TRASH_DIRECTORY/3
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/3/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/3/wt" test_repo 3
#	
not ok - 25 #3: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $TRASH_DIRECTORY/3/wt
#	setup: cwd: $TRASH_DIRECTORY/3/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY/3/wt" test_repo 3/sub/sub
#	
not ok - 26 #3: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $TRASH_DIRECTORY/3/wt
#	setup: cwd: $TRASH_DIRECTORY/3/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../../wt test_repo 3/sub/sub
#	
not ok - 27 #3: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY/3/wt
#	setup: cwd: $TRASH_DIRECTORY/3/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/3/.git" GIT_WORK_TREE=../../wt test_repo 3/sub/sub
#	
not ok - 28 #3: GIT_DIR, GIT_WORK_TREE=wt in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY/3/wt
#	setup: cwd: $TRASH_DIRECTORY/3/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/3/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/3/wt" test_repo 3/sub/sub
#	
not ok - 29 #3: GIT_DIR(rel), GIT_WORK_TREE=.. at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 3/
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 3
#	
not ok - 30 #3: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 3/
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=.. test_repo 3
#	
not ok - 31 #3: GIT_DIR, GIT_WORK_TREE=..(rel) at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 3/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/3/.git" GIT_WORK_TREE=.. test_repo 3
#	
not ok - 32 #3: GIT_DIR, GIT_WORK_TREE=.. at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 3/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/3/.git" GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 3
#	
not ok - 33 #3: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 3/sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 3/sub/sub
#	
not ok - 34 #3: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 3/sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../../.. test_repo 3/sub/sub
#	
not ok - 35 #3: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 3/sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/3/.git" GIT_WORK_TREE=../../../ test_repo 3/sub/sub
#	
not ok - 36 #3: GIT_DIR, GIT_WORK_TREE=.. in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/3/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 3/sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/3/.git" GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 3/sub/sub
#	
ok 37 - #4: setup
ok 38 - #4: at root
ok 39 - #4: in subdir
ok 40 - #5: setup
ok 41 - #5: at root
ok 42 - #5: in subdir
ok 43 - #6: setup
ok 44 - #6: GIT_DIR(rel), core.worktree=.. at root
ok 45 - #6: GIT_DIR(rel), core.worktree=..(rel) at root
not ok - 46 #6: GIT_DIR, core.worktree=.. at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY/6
#	setup: cwd: $TRASH_DIRECTORY/6
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY/6" &&
#		GIT_DIR="$TRASH_DIRECTORY/6/.git" test_repo 6
#	
not ok - 47 #6: GIT_DIR, core.worktree=..(rel) at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY/6
#	setup: cwd: $TRASH_DIRECTORY/6
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree .. &&
#		GIT_DIR="$TRASH_DIRECTORY/6/.git" test_repo 6
#	
not ok - 48 #6: GIT_DIR(rel), core.worktree=.. in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY/6
#	setup: cwd: $TRASH_DIRECTORY/6
#	setup: prefix: sub/sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY/6" &&
#		GIT_DIR=../../.git test_repo 6/sub/sub
#	
not ok - 49 #6: GIT_DIR(rel), core.worktree=..(rel) in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY/6
#	setup: cwd: $TRASH_DIRECTORY/6
#	setup: prefix: sub/sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree .. &&
#		GIT_DIR=../../.git test_repo 6/sub/sub
#	
not ok - 50 #6: GIT_DIR, core.worktree=.. in subdir
#	
#		cat >6/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY/6
#	setup: cwd: $TRASH_DIRECTORY/6
#	setup: prefix: sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY/6" &&
#		GIT_DIR="$TRASH_DIRECTORY/6/.git" test_repo 6/sub
#	
not ok - 51 #6: GIT_DIR, core.worktree=..(rel) in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY/6
#	setup: cwd: $TRASH_DIRECTORY/6
#	setup: prefix: sub/sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree .. &&
#		GIT_DIR="$TRASH_DIRECTORY/6/.git" test_repo 6/sub/sub
#	
not ok - 52 #6: GIT_DIR(rel), core.worktree=../wt at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $TRASH_DIRECTORY/6/wt
#	setup: cwd: $TRASH_DIRECTORY/6
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY/6/wt" &&
#		GIT_DIR=.git test_repo 6
#	
not ok - 53 #6: GIT_DIR(rel), core.worktree=../wt(rel) at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $TRASH_DIRECTORY/6/wt
#	setup: cwd: $TRASH_DIRECTORY/6
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree ../wt &&
#		GIT_DIR=.git test_repo 6
#	
not ok - 54 #6: GIT_DIR, core.worktree=../wt(rel) at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY/6/wt
#	setup: cwd: $TRASH_DIRECTORY/6
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree ../wt &&
#		GIT_DIR="$TRASH_DIRECTORY/6/.git" test_repo 6
#	
not ok - 55 #6: GIT_DIR, core.worktree=../wt at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY/6/wt
#	setup: cwd: $TRASH_DIRECTORY/6
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY/6/wt" &&
#		GIT_DIR="$TRASH_DIRECTORY/6/.git" test_repo 6
#	
not ok - 56 #6: GIT_DIR(rel), core.worktree=../wt in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $TRASH_DIRECTORY/6/wt
#	setup: cwd: $TRASH_DIRECTORY/6/sub/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY/6/wt" &&
#		GIT_DIR=../../.git test_repo 6/sub/sub
#	
not ok - 57 #6: GIT_DIR(rel), core.worktree=../wt(rel) in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $TRASH_DIRECTORY/6/wt
#	setup: cwd: $TRASH_DIRECTORY/6/sub/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree ../wt &&
#		GIT_DIR=../../.git test_repo 6/sub/sub
#	
not ok - 58 #6: GIT_DIR, core.worktree=../wt(rel) in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY/6/wt
#	setup: cwd: $TRASH_DIRECTORY/6/sub/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree ../wt &&
#		GIT_DIR="$TRASH_DIRECTORY/6/.git" test_repo 6/sub/sub
#	
not ok - 59 #6: GIT_DIR, core.worktree=../wt in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY/6/wt
#	setup: cwd: $TRASH_DIRECTORY/6/sub/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY/6/wt" &&
#		GIT_DIR="$TRASH_DIRECTORY/6/.git" test_repo 6/sub/sub
#	
not ok - 60 #6: GIT_DIR(rel), core.worktree=../.. at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 6/
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY" &&
#		GIT_DIR=.git test_repo 6
#	
not ok - 61 #6: GIT_DIR(rel), core.worktree=../..(rel) at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 6/
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree ../../ &&
#		GIT_DIR=.git test_repo 6
#	
not ok - 62 #6: GIT_DIR, core.worktree=../..(rel) at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 6/
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree ../../ &&
#		GIT_DIR="$TRASH_DIRECTORY/6/.git" test_repo 6
#	
not ok - 63 #6: GIT_DIR, core.worktree=../.. at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 6/
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY" &&
#		GIT_DIR="$TRASH_DIRECTORY/6/.git" test_repo 6
#	
not ok - 64 #6: GIT_DIR(rel), core.worktree=../.. in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 6/sub/sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY" &&
#		GIT_DIR=../../.git test_repo 6/sub/sub
#	
not ok - 65 #6: GIT_DIR(rel), core.worktree=../..(rel) in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 6/sub/sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree ../.. &&
#		GIT_DIR=../../.git test_repo 6/sub/sub
#	
not ok - 66 #6: GIT_DIR, core.worktree=../..(rel) in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 6/sub/sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree ../.. &&
#		GIT_DIR="$TRASH_DIRECTORY/6/.git" test_repo 6/sub/sub
#	
not ok - 67 #6: GIT_DIR, core.worktree=../.. in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/6/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 6/sub/sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/6/.git/config" core.worktree "$TRASH_DIRECTORY" &&
#		GIT_DIR="$TRASH_DIRECTORY/6/.git" test_repo 6/sub/sub
#	
ok 68 - #7: setup
ok 69 - #7: GIT_DIR(rel), GIT_WORK_TREE=root at root
ok 70 - #7: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root
not ok - 71 #7: GIT_DIR, GIT_WORK_TREE=root at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY/7
#	setup: cwd: $TRASH_DIRECTORY/7
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/7/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/7" test_repo 7
#	
not ok - 72 #7: GIT_DIR, GIT_WORK_TREE=root(rel) at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY/7
#	setup: cwd: $TRASH_DIRECTORY/7
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/7/.git" GIT_WORK_TREE=. test_repo 7
#	
not ok - 73 #7: GIT_DIR(rel), GIT_WORKTREE=root in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY/7
#	setup: cwd: $TRASH_DIRECTORY/7
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY/7" test_repo 7/sub/sub
#	
not ok - 74 #7: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY/7
#	setup: cwd: $TRASH_DIRECTORY/7
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../.. test_repo 7/sub/sub
#	
not ok - 75 #7: GIT_DIR, GIT_WORKTREE=root in subdir
#	
#		cat >7/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY/7
#	setup: cwd: $TRASH_DIRECTORY/7
#	setup: prefix: sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/7/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/7" test_repo 7/sub
#	
not ok - 76 #7: GIT_DIR, GIT_WORKTREE=root(rel) in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY/7
#	setup: cwd: $TRASH_DIRECTORY/7
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/7/.git" GIT_WORK_TREE=../.. test_repo 7/sub/sub
#	
not ok - 77 #7: GIT_DIR(rel), GIT_WORK_TREE=wt at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $TRASH_DIRECTORY/7/wt
#	setup: cwd: $TRASH_DIRECTORY/7
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY/7/wt" test_repo 7
#	
not ok - 78 #7: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $TRASH_DIRECTORY/7/wt
#	setup: cwd: $TRASH_DIRECTORY/7
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=wt test_repo 7
#	
not ok - 79 #7: GIT_DIR, GIT_WORK_TREE=wt(rel) at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY/7/wt
#	setup: cwd: $TRASH_DIRECTORY/7
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/7/.git" GIT_WORK_TREE=wt test_repo 7
#	
not ok - 80 #7: GIT_DIR, GIT_WORK_TREE=wt at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY/7/wt
#	setup: cwd: $TRASH_DIRECTORY/7
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/7/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/7/wt" test_repo 7
#	
not ok - 81 #7: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $TRASH_DIRECTORY/7/wt
#	setup: cwd: $TRASH_DIRECTORY/7/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY/7/wt" test_repo 7/sub/sub
#	
not ok - 82 #7: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $TRASH_DIRECTORY/7/wt
#	setup: cwd: $TRASH_DIRECTORY/7/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../../wt test_repo 7/sub/sub
#	
not ok - 83 #7: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY/7/wt
#	setup: cwd: $TRASH_DIRECTORY/7/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/7/.git" GIT_WORK_TREE=../../wt test_repo 7/sub/sub
#	
not ok - 84 #7: GIT_DIR, GIT_WORK_TREE=wt in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY/7/wt
#	setup: cwd: $TRASH_DIRECTORY/7/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/7/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/7/wt" test_repo 7/sub/sub
#	
not ok - 85 #7: GIT_DIR(rel), GIT_WORK_TREE=.. at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 7/
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 7
#	
not ok - 86 #7: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 7/
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=.. test_repo 7
#	
not ok - 87 #7: GIT_DIR, GIT_WORK_TREE=..(rel) at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 7/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/7/.git" GIT_WORK_TREE=.. test_repo 7
#	
not ok - 88 #7: GIT_DIR, GIT_WORK_TREE=.. at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 7/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/7/.git" GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 7
#	
not ok - 89 #7: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 7/sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 7/sub/sub
#	
not ok - 90 #7: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 7/sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../../.. test_repo 7/sub/sub
#	
not ok - 91 #7: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 7/sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/7/.git" GIT_WORK_TREE=../../../ test_repo 7/sub/sub
#	
not ok - 92 #7: GIT_DIR, GIT_WORK_TREE=.. in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/7/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 7/sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/7/.git" GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 7/sub/sub
#	
ok 93 - #8: setup
ok 94 - #8: at root
ok 95 - #8: in subdir
ok 96 - #9: setup
ok 97 - #9: at root
ok 98 - #9: in subdir
ok 99 - #10: setup
ok 100 - #10: at root
not ok - 101 #10: in subdir
#	
#		cat >10/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/10.git
#	setup: worktree: $TRASH_DIRECTORY/10/sub
#	setup: cwd: $TRASH_DIRECTORY/10/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/10/.git" test_repo 10/sub
#	
ok 102 - #10: relative GIT_DIR at root
not ok - 103 #10: relative GIT_DIR in subdir
#	
#		cat >10/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/10.git
#	setup: worktree: $TRASH_DIRECTORY/10/sub
#	setup: cwd: $TRASH_DIRECTORY/10/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../.git test_repo 10/sub
#	
ok 104 - #11: setup
ok 105 - #11: GIT_DIR(rel), GIT_WORK_TREE=root at root
ok 106 - #11: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root
ok 107 - #11: GIT_DIR, GIT_WORK_TREE=root at root
ok 108 - #11: GIT_DIR, GIT_WORK_TREE=root(rel) at root
ok 109 - #11: GIT_DIR(rel), GIT_WORKTREE=root in subdir
ok 110 - #11: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir
ok 111 - #11: GIT_DIR, GIT_WORKTREE=root in subdir
ok 112 - #11: GIT_DIR, GIT_WORKTREE=root(rel) in subdir
not ok - 113 #11: GIT_DIR(rel), GIT_WORK_TREE=wt at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/11.git
#	setup: worktree: $TRASH_DIRECTORY/11/wt
#	setup: cwd: $TRASH_DIRECTORY/11
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY/11/wt" test_repo 11
#	
not ok - 114 #11: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/11.git
#	setup: worktree: $TRASH_DIRECTORY/11/wt
#	setup: cwd: $TRASH_DIRECTORY/11
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=wt test_repo 11
#	
not ok - 115 #11: GIT_DIR, GIT_WORK_TREE=wt(rel) at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/11.git
#	setup: worktree: $TRASH_DIRECTORY/11/wt
#	setup: cwd: $TRASH_DIRECTORY/11
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/11/.git" GIT_WORK_TREE=wt test_repo 11
#	
not ok - 116 #11: GIT_DIR, GIT_WORK_TREE=wt at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/11.git
#	setup: worktree: $TRASH_DIRECTORY/11/wt
#	setup: cwd: $TRASH_DIRECTORY/11
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/11/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/11/wt" test_repo 11
#	
not ok - 117 #11: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/11.git
#	setup: worktree: $TRASH_DIRECTORY/11/wt
#	setup: cwd: $TRASH_DIRECTORY/11/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY/11/wt" test_repo 11/sub/sub
#	
not ok - 118 #11: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/11.git
#	setup: worktree: $TRASH_DIRECTORY/11/wt
#	setup: cwd: $TRASH_DIRECTORY/11/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../../wt test_repo 11/sub/sub
#	
not ok - 119 #11: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/11.git
#	setup: worktree: $TRASH_DIRECTORY/11/wt
#	setup: cwd: $TRASH_DIRECTORY/11/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/11/.git" GIT_WORK_TREE=../../wt test_repo 11/sub/sub
#	
not ok - 120 #11: GIT_DIR, GIT_WORK_TREE=wt in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/11.git
#	setup: worktree: $TRASH_DIRECTORY/11/wt
#	setup: cwd: $TRASH_DIRECTORY/11/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/11/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/11/wt" test_repo 11/sub/sub
#	
not ok - 121 #11: GIT_DIR(rel), GIT_WORK_TREE=.. at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/11.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 11/
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 11
#	
not ok - 122 #11: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/11.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 11/
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=.. test_repo 11
#	
not ok - 123 #11: GIT_DIR, GIT_WORK_TREE=..(rel) at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/11.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 11/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/11/.git" GIT_WORK_TREE=.. test_repo 11
#	
not ok - 124 #11: GIT_DIR, GIT_WORK_TREE=.. at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/11.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 11/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/11/.git" GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 11
#	
not ok - 125 #11: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/11.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 11/sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 11/sub/sub
#	
not ok - 126 #11: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/11.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 11/sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../../.. test_repo 11/sub/sub
#	
not ok - 127 #11: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/11.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 11/sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/11/.git" GIT_WORK_TREE=../../../ test_repo 11/sub/sub
#	
not ok - 128 #11: GIT_DIR, GIT_WORK_TREE=.. in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/11.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 11/sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/11/.git" GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 11/sub/sub
#	
ok 129 - #12: setup
ok 130 - #12: at root
ok 131 - #12: in subdir
ok 132 - #13: setup
ok 133 - #13: at root
ok 134 - #13: in subdir
ok 135 - #14: setup
ok 136 - #14: GIT_DIR(rel), core.worktree=../14 at root
ok 137 - #14: GIT_DIR(rel), core.worktree=../14(rel) at root
ok 138 - #14: GIT_DIR, core.worktree=../14 at root
ok 139 - #14: GIT_DIR, core.worktree=../14(rel) at root
ok 140 - #14: GIT_DIR(rel), core.worktree=../14 in subdir
ok 141 - #14: GIT_DIR(rel), core.worktree=../14(rel) in subdir
ok 142 - #14: GIT_DIR, core.worktree=../14 in subdir
ok 143 - #14: GIT_DIR, core.worktree=../14(rel) in subdir
not ok - 144 #14: GIT_DIR(rel), core.worktree=../14/wt at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/14.git
#	setup: worktree: $TRASH_DIRECTORY/14/wt
#	setup: cwd: $TRASH_DIRECTORY/14
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY/14/wt" &&
#		GIT_DIR=.git test_repo 14
#	
not ok - 145 #14: GIT_DIR(rel), core.worktree=../14/wt(rel) at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/14.git
#	setup: worktree: $TRASH_DIRECTORY/14/wt
#	setup: cwd: $TRASH_DIRECTORY/14
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree ../14/wt &&
#		GIT_DIR=.git test_repo 14
#	
not ok - 146 #14: GIT_DIR, core.worktree=../14/wt(rel) at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/14.git
#	setup: worktree: $TRASH_DIRECTORY/14/wt
#	setup: cwd: $TRASH_DIRECTORY/14
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree ../14/wt &&
#		GIT_DIR="$TRASH_DIRECTORY/14/.git" test_repo 14
#	
not ok - 147 #14: GIT_DIR, core.worktree=../14/wt at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/14.git
#	setup: worktree: $TRASH_DIRECTORY/14/wt
#	setup: cwd: $TRASH_DIRECTORY/14
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY/14/wt" &&
#		GIT_DIR="$TRASH_DIRECTORY/14/.git" test_repo 14
#	
not ok - 148 #14: GIT_DIR(rel), core.worktree=../14/wt in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/14.git
#	setup: worktree: $TRASH_DIRECTORY/14/wt
#	setup: cwd: $TRASH_DIRECTORY/14/sub/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY/14/wt" &&
#		GIT_DIR=../../.git test_repo 14/sub/sub
#	
not ok - 149 #14: GIT_DIR(rel), core.worktree=../14/wt(rel) in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/14.git
#	setup: worktree: $TRASH_DIRECTORY/14/wt
#	setup: cwd: $TRASH_DIRECTORY/14/sub/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree ../14/wt &&
#		GIT_DIR=../../.git test_repo 14/sub/sub
#	
not ok - 150 #14: GIT_DIR, core.worktree=../14/wt(rel) in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/14.git
#	setup: worktree: $TRASH_DIRECTORY/14/wt
#	setup: cwd: $TRASH_DIRECTORY/14/sub/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree ../14/wt &&
#		GIT_DIR="$TRASH_DIRECTORY/14/.git" test_repo 14/sub/sub
#	
not ok - 151 #14: GIT_DIR, core.worktree=../14/wt in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/14.git
#	setup: worktree: $TRASH_DIRECTORY/14/wt
#	setup: cwd: $TRASH_DIRECTORY/14/sub/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY/14/wt" &&
#		GIT_DIR="$TRASH_DIRECTORY/14/.git" test_repo 14/sub/sub
#	
not ok - 152 #14: GIT_DIR(rel), core.worktree=.. at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/14.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 14/
#	EOF
#		git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY" &&
#		GIT_DIR=.git test_repo 14
#	
not ok - 153 #14: GIT_DIR(rel), core.worktree=..(rel) at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/14.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 14/
#	EOF
#		git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree .. &&
#		GIT_DIR=.git test_repo 14
#	
not ok - 154 #14: GIT_DIR, core.worktree=..(rel) at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/14.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 14/
#	EOF
#		git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree .. &&
#		GIT_DIR="$TRASH_DIRECTORY/14/.git" test_repo 14
#	
not ok - 155 #14: GIT_DIR, core.worktree=.. at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/14.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 14/
#	EOF
#		git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY" &&
#		GIT_DIR="$TRASH_DIRECTORY/14/.git" test_repo 14
#	
not ok - 156 #14: GIT_DIR(rel), core.worktree=.. in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/14.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 14/sub/sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY" &&
#		GIT_DIR=../../.git test_repo 14/sub/sub
#	
not ok - 157 #14: GIT_DIR(rel), core.worktree=..(rel) in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/14.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 14/sub/sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree .. &&
#		GIT_DIR=../../.git test_repo 14/sub/sub
#	
not ok - 158 #14: GIT_DIR, core.worktree=..(rel) in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/14.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 14/sub/sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree .. &&
#		GIT_DIR="$TRASH_DIRECTORY/14/.git" test_repo 14/sub/sub
#	
not ok - 159 #14: GIT_DIR, core.worktree=.. in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/14.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 14/sub/sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/14.git/config" core.worktree "$TRASH_DIRECTORY" &&
#		GIT_DIR="$TRASH_DIRECTORY/14/.git" test_repo 14/sub/sub
#	
ok 160 - #15: setup
ok 161 - #15: GIT_DIR(rel), GIT_WORK_TREE=root at root
ok 162 - #15: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root
ok 163 - #15: GIT_DIR, GIT_WORK_TREE=root at root
ok 164 - #15: GIT_DIR, GIT_WORK_TREE=root(rel) at root
ok 165 - #15: GIT_DIR(rel), GIT_WORKTREE=root in subdir
ok 166 - #15: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir
ok 167 - #15: GIT_DIR, GIT_WORKTREE=root in subdir
ok 168 - #15: GIT_DIR, GIT_WORKTREE=root(rel) in subdir
not ok - 169 #15: GIT_DIR(rel), GIT_WORK_TREE=wt at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/15.git
#	setup: worktree: $TRASH_DIRECTORY/15/wt
#	setup: cwd: $TRASH_DIRECTORY/15
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY/15/wt" test_repo 15
#	
not ok - 170 #15: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/15.git
#	setup: worktree: $TRASH_DIRECTORY/15/wt
#	setup: cwd: $TRASH_DIRECTORY/15
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=wt test_repo 15
#	
not ok - 171 #15: GIT_DIR, GIT_WORK_TREE=wt(rel) at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/15.git
#	setup: worktree: $TRASH_DIRECTORY/15/wt
#	setup: cwd: $TRASH_DIRECTORY/15
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/15/.git" GIT_WORK_TREE=wt test_repo 15
#	
not ok - 172 #15: GIT_DIR, GIT_WORK_TREE=wt at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/15.git
#	setup: worktree: $TRASH_DIRECTORY/15/wt
#	setup: cwd: $TRASH_DIRECTORY/15
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/15/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/15/wt" test_repo 15
#	
not ok - 173 #15: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/15.git
#	setup: worktree: $TRASH_DIRECTORY/15/wt
#	setup: cwd: $TRASH_DIRECTORY/15/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY/15/wt" test_repo 15/sub/sub
#	
not ok - 174 #15: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/15.git
#	setup: worktree: $TRASH_DIRECTORY/15/wt
#	setup: cwd: $TRASH_DIRECTORY/15/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../../wt test_repo 15/sub/sub
#	
not ok - 175 #15: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/15.git
#	setup: worktree: $TRASH_DIRECTORY/15/wt
#	setup: cwd: $TRASH_DIRECTORY/15/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/15/.git" GIT_WORK_TREE=../../wt test_repo 15/sub/sub
#	
not ok - 176 #15: GIT_DIR, GIT_WORK_TREE=wt in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/15.git
#	setup: worktree: $TRASH_DIRECTORY/15/wt
#	setup: cwd: $TRASH_DIRECTORY/15/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/15/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/15/wt" test_repo 15/sub/sub
#	
not ok - 177 #15: GIT_DIR(rel), GIT_WORK_TREE=.. at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/15.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 15/
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 15
#	
not ok - 178 #15: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/15.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 15/
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=.. test_repo 15
#	
not ok - 179 #15: GIT_DIR, GIT_WORK_TREE=..(rel) at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/15.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 15/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/15/.git" GIT_WORK_TREE=.. test_repo 15
#	
not ok - 180 #15: GIT_DIR, GIT_WORK_TREE=.. at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/15.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 15/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/15/.git" GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 15
#	
not ok - 181 #15: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/15.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 15/sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 15/sub/sub
#	
not ok - 182 #15: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/15.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 15/sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../../.. test_repo 15/sub/sub
#	
not ok - 183 #15: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/15.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 15/sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/15/.git" GIT_WORK_TREE=../../../ test_repo 15/sub/sub
#	
not ok - 184 #15: GIT_DIR, GIT_WORK_TREE=.. in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/15.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 15/sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/15/.git" GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 15/sub/sub
#	
ok 185 - #16.1: setup
ok 186 - #16.1: at .git
ok 187 - #16.1: in .git/wt
ok 188 - #16.1: in .git/wt/sub
ok 189 - #16.2: setup
ok 190 - #16.2: at .git
ok 191 - #16.2: in .git/wt
ok 192 - #16.2: in .git/wt/sub
ok 193 - #16.2: at root
ok 194 - #16.2: in subdir
ok 195 - #17.1: setup
ok 196 - #17.1: at .git
ok 197 - #17.1: in .git/wt
ok 198 - #17.1: in .git/wt/sub
ok 199 - #17.2: setup
ok 200 - #17.2: at .git
ok 201 - #17.2: in .git/wt
ok 202 - #17.2: in .git/wt/sub
ok 203 - #17.2: at root
ok 204 - #17.2: in subdir
ok 205 - #18: setup
ok 206 - #18: (rel) at root
not ok - 207 #18: at root
#	
#		cat >18/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/18/.git
#	setup: worktree: (null)
#	setup: cwd: $TRASH_DIRECTORY/18
#	setup: prefix: (null)
#	EOF
#		 GIT_DIR="$TRASH_DIRECTORY/18/.git" test_repo 18
#	
not ok - 208 #18: (rel) in subdir
#	
#		cat >18/sub/expected <<EOF &&
#	setup: git_dir: ../.git
#	setup: worktree: (null)
#	setup: cwd: $TRASH_DIRECTORY/18/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../.git test_repo 18/sub
#	
ok 209 - #18: in subdir
ok 210 - #19: setup
not ok - 211 #19: GIT_DIR(rel), GIT_WORK_TREE=root at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $TRASH_DIRECTORY/19
#	setup: cwd: $TRASH_DIRECTORY/19
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY/19" test_repo 19
#	
not ok - 212 #19: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $TRASH_DIRECTORY/19
#	setup: cwd: $TRASH_DIRECTORY/19
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=. test_repo 19
#	
not ok - 213 #19: GIT_DIR, GIT_WORK_TREE=root at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY/19
#	setup: cwd: $TRASH_DIRECTORY/19
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/19/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/19" test_repo 19
#	
not ok - 214 #19: GIT_DIR, GIT_WORK_TREE=root(rel) at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY/19
#	setup: cwd: $TRASH_DIRECTORY/19
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/19/.git" GIT_WORK_TREE=. test_repo 19
#	
not ok - 215 #19: GIT_DIR(rel), GIT_WORKTREE=root in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY/19
#	setup: cwd: $TRASH_DIRECTORY/19
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY/19" test_repo 19/sub/sub
#	
not ok - 216 #19: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY/19
#	setup: cwd: $TRASH_DIRECTORY/19
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../.. test_repo 19/sub/sub
#	
not ok - 217 #19: GIT_DIR, GIT_WORKTREE=root in subdir
#	
#		cat >19/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY/19
#	setup: cwd: $TRASH_DIRECTORY/19
#	setup: prefix: sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/19/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/19" test_repo 19/sub
#	
not ok - 218 #19: GIT_DIR, GIT_WORKTREE=root(rel) in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY/19
#	setup: cwd: $TRASH_DIRECTORY/19
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/19/.git" GIT_WORK_TREE=../.. test_repo 19/sub/sub
#	
not ok - 219 #19: GIT_DIR(rel), GIT_WORK_TREE=wt at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $TRASH_DIRECTORY/19/wt
#	setup: cwd: $TRASH_DIRECTORY/19
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY/19/wt" test_repo 19
#	
not ok - 220 #19: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $TRASH_DIRECTORY/19/wt
#	setup: cwd: $TRASH_DIRECTORY/19
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=wt test_repo 19
#	
not ok - 221 #19: GIT_DIR, GIT_WORK_TREE=wt(rel) at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY/19/wt
#	setup: cwd: $TRASH_DIRECTORY/19
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/19/.git" GIT_WORK_TREE=wt test_repo 19
#	
not ok - 222 #19: GIT_DIR, GIT_WORK_TREE=wt at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY/19/wt
#	setup: cwd: $TRASH_DIRECTORY/19
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/19/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/19/wt" test_repo 19
#	
not ok - 223 #19: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $TRASH_DIRECTORY/19/wt
#	setup: cwd: $TRASH_DIRECTORY/19/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY/19/wt" test_repo 19/sub/sub
#	
not ok - 224 #19: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $TRASH_DIRECTORY/19/wt
#	setup: cwd: $TRASH_DIRECTORY/19/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../../wt test_repo 19/sub/sub
#	
not ok - 225 #19: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY/19/wt
#	setup: cwd: $TRASH_DIRECTORY/19/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/19/.git" GIT_WORK_TREE=../../wt test_repo 19/sub/sub
#	
not ok - 226 #19: GIT_DIR, GIT_WORK_TREE=wt in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY/19/wt
#	setup: cwd: $TRASH_DIRECTORY/19/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/19/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/19/wt" test_repo 19/sub/sub
#	
not ok - 227 #19: GIT_DIR(rel), GIT_WORK_TREE=.. at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 19/
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 19
#	
not ok - 228 #19: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 19/
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=.. test_repo 19
#	
not ok - 229 #19: GIT_DIR, GIT_WORK_TREE=..(rel) at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 19/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/19/.git" GIT_WORK_TREE=.. test_repo 19
#	
not ok - 230 #19: GIT_DIR, GIT_WORK_TREE=.. at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 19/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/19/.git" GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 19
#	
not ok - 231 #19: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 19/sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 19/sub/sub
#	
not ok - 232 #19: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 19/sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../../.. test_repo 19/sub/sub
#	
not ok - 233 #19: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 19/sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/19/.git" GIT_WORK_TREE=../../../ test_repo 19/sub/sub
#	
not ok - 234 #19: GIT_DIR, GIT_WORK_TREE=.. in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/19/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 19/sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/19/.git" GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 19/sub/sub
#	
ok 235 - #20.1: setup
ok 236 - #20.1: at .git
ok 237 - #20.1: in .git/wt
ok 238 - #20.1: in .git/wt/sub
ok 239 - #20.2: setup
ok 240 - #20.2: at .git
ok 241 - #20.2: in .git/wt
ok 242 - #20.2: in .git/wt/sub
ok 243 - #20.2: at root
ok 244 - #20.2: in subdir
ok 245 - #21.1: setup
ok 246 - #21.1: at .git
ok 247 - #21.1: in .git/wt
ok 248 - #21.1: in .git/wt/sub
ok 249 - #21.2: setup
ok 250 - #21.2: at .git
ok 251 - #21.2: in .git/wt
ok 252 - #21.2: in .git/wt/sub
ok 253 - #21.2: at root
ok 254 - #21.2: in subdir
ok 255 - #22.1: setup
not ok - 256 #22.1: GIT_DIR(rel), core.worktree=. at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: .
#	setup: worktree: $TRASH_DIRECTORY/22/.git
#	setup: cwd: $TRASH_DIRECTORY/22/.git
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22/.git" &&
#		GIT_DIR=. test_repo 22/.git
#	
not ok - 257 #22.1: GIT_DIR(rel), core.worktree=.(rel) at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: .
#	setup: worktree: $TRASH_DIRECTORY/22/.git
#	setup: cwd: $TRASH_DIRECTORY/22/.git
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree . &&
#		GIT_DIR=. test_repo 22/.git
#	
not ok - 258 #22.1: GIT_DIR, core.worktree=. at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22/.git
#	setup: cwd: $TRASH_DIRECTORY/22/.git
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22/.git" &&
#		GIT_DIR="$TRASH_DIRECTORY/22/.git" test_repo 22/.git
#	
not ok - 259 #22.1: GIT_DIR, core.worktree=.(rel) at root
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22/.git
#	setup: cwd: $TRASH_DIRECTORY/22/.git
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree . &&
#		GIT_DIR="$TRASH_DIRECTORY/22/.git" test_repo 22/.git
#	
not ok - 260 #22.1: GIT_DIR(rel), core.worktree=. in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22/.git
#	setup: cwd: $TRASH_DIRECTORY/22/.git
#	setup: prefix: sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22/.git" &&
#		GIT_DIR=.. test_repo 22/.git/sub
#	
not ok - 261 #22.1: GIT_DIR(rel), core.worktree=.(rel) in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22/.git
#	setup: cwd: $TRASH_DIRECTORY/22/.git
#	setup: prefix: sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree . &&
#		GIT_DIR=.. test_repo 22/.git/sub/
#	
not ok - 262 #22.1: GIT_DIR, core.worktree=. in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22/.git
#	setup: cwd: $TRASH_DIRECTORY/22/.git
#	setup: prefix: sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22/.git" &&
#		GIT_DIR="$TRASH_DIRECTORY/22/.git" test_repo 22/.git/sub
#	
not ok - 263 #22.1: GIT_DIR, core.worktree=.(rel) in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22/.git
#	setup: cwd: $TRASH_DIRECTORY/22/.git
#	setup: prefix: sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree . &&
#		GIT_DIR="$TRASH_DIRECTORY/22/.git" test_repo 22/.git/sub
#	
not ok - 264 #22.1: GIT_DIR(rel), core.worktree=wt at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: .
#	setup: worktree: $TRASH_DIRECTORY/22/.git/wt
#	setup: cwd: $TRASH_DIRECTORY/22/.git
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22/.git/wt" &&
#		GIT_DIR=. test_repo 22/.git
#	
not ok - 265 #22.1: GIT_DIR(rel), core.worktree=wt(rel) at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: .
#	setup: worktree: $TRASH_DIRECTORY/22/.git/wt
#	setup: cwd: $TRASH_DIRECTORY/22/.git
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree wt &&
#		GIT_DIR=. test_repo 22/.git
#	
not ok - 266 #22.1: GIT_DIR, core.worktree=wt(rel) at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22/.git/wt
#	setup: cwd: $TRASH_DIRECTORY/22/.git
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree wt &&
#		GIT_DIR="$TRASH_DIRECTORY/22/.git" test_repo 22/.git
#	
not ok - 267 #22.1: GIT_DIR, core.worktree=wt at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22/.git/wt
#	setup: cwd: $TRASH_DIRECTORY/22/.git
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22/.git/wt" &&
#		GIT_DIR="$TRASH_DIRECTORY/22/.git" test_repo 22/.git
#	
not ok - 268 #22.1: GIT_DIR(rel), core.worktree=wt in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: ..
#	setup: worktree: $TRASH_DIRECTORY/22/.git/wt
#	setup: cwd: $TRASH_DIRECTORY/22/.git/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22/.git/wt" &&
#		GIT_DIR=.. test_repo 22/.git/sub
#	
not ok - 269 #22.1: GIT_DIR(rel), core.worktree=wt(rel) in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: ..
#	setup: worktree: $TRASH_DIRECTORY/22/.git/wt
#	setup: cwd: $TRASH_DIRECTORY/22/.git/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree wt &&
#		GIT_DIR=.. test_repo 22/.git/sub
#	
not ok - 270 #22.1: GIT_DIR, core.worktree=wt(rel) in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22/.git/wt
#	setup: cwd: $TRASH_DIRECTORY/22/.git/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree wt &&
#		GIT_DIR="$TRASH_DIRECTORY/22/.git" test_repo 22/.git/sub
#	
not ok - 271 #22.1: GIT_DIR, core.worktree=wt in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22/.git/wt
#	setup: cwd: $TRASH_DIRECTORY/22/.git/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22/.git/wt" &&
#		GIT_DIR="$TRASH_DIRECTORY/22/.git" test_repo 22/.git/sub
#	
not ok - 272 #22.1: GIT_DIR(rel), core.worktree=.. at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22
#	setup: cwd: $TRASH_DIRECTORY/22
#	setup: prefix: .git/
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22" &&
#		GIT_DIR=. test_repo 22/.git
#	
not ok - 273 #22.1: GIT_DIR(rel), core.worktree=..(rel) at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22
#	setup: cwd: $TRASH_DIRECTORY/22
#	setup: prefix: .git/
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree .. &&
#		GIT_DIR=. test_repo 22/.git
#	
not ok - 274 #22.1: GIT_DIR, core.worktree=..(rel) at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22
#	setup: cwd: $TRASH_DIRECTORY/22
#	setup: prefix: .git/
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree .. &&
#		GIT_DIR="$TRASH_DIRECTORY/22/.git" test_repo 22/.git
#	
not ok - 275 #22.1: GIT_DIR, core.worktree=.. at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22
#	setup: cwd: $TRASH_DIRECTORY/22
#	setup: prefix: .git/
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22" &&
#		GIT_DIR="$TRASH_DIRECTORY/22/.git" test_repo 22/.git
#	
not ok - 276 #22.1: GIT_DIR(rel), core.worktree=.. in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22
#	setup: cwd: $TRASH_DIRECTORY/22
#	setup: prefix: .git/sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22" &&
#		GIT_DIR=.. test_repo 22/.git/sub
#	
not ok - 277 #22.1: GIT_DIR(rel), core.worktree=..(rel) in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22
#	setup: cwd: $TRASH_DIRECTORY/22
#	setup: prefix: .git/sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree .. &&
#		GIT_DIR=.. test_repo 22/.git/sub
#	
not ok - 278 #22.1: GIT_DIR, core.worktree=..(rel) in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22
#	setup: cwd: $TRASH_DIRECTORY/22
#	setup: prefix: .git/sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree .. &&
#		GIT_DIR="$TRASH_DIRECTORY/22/.git" test_repo 22/.git/sub
#	
not ok - 279 #22.1: GIT_DIR, core.worktree=.. in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/22/.git
#	setup: worktree: $TRASH_DIRECTORY/22
#	setup: cwd: $TRASH_DIRECTORY/22
#	setup: prefix: .git/sub/
#	EOF
#		git config --file="$TRASH_DIRECTORY/22/.git/config" core.worktree "$TRASH_DIRECTORY/22" &&
#		GIT_DIR="$TRASH_DIRECTORY/22/.git" test_repo 22/.git/sub
#	
ok 280 - #22.2: setup
not ok - 281 #22.2: at .git
#	
#		(
#		cd 22/.git &&
#		GIT_DIR=. test_must_fail git symbolic-ref HEAD 2>result &&
#		grep "core.bare and core.worktree do not make sense" result
#		)
#	
not ok - 282 #22.2: at root
#	
#		(
#		cd 22 &&
#		GIT_DIR=.git test_must_fail git symbolic-ref HEAD 2>result &&
#		grep "core.bare and core.worktree do not make sense" result
#		)
#	
ok 283 - #23: setup
not ok - 284 #23: GIT_DIR(rel), GIT_WORK_TREE=root at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $TRASH_DIRECTORY/23
#	setup: cwd: $TRASH_DIRECTORY/23
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY/23" test_repo 23
#	
not ok - 285 #23: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $TRASH_DIRECTORY/23
#	setup: cwd: $TRASH_DIRECTORY/23
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=. test_repo 23
#	
not ok - 286 #23: GIT_DIR, GIT_WORK_TREE=root at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY/23
#	setup: cwd: $TRASH_DIRECTORY/23
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/23/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/23" test_repo 23
#	
not ok - 287 #23: GIT_DIR, GIT_WORK_TREE=root(rel) at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY/23
#	setup: cwd: $TRASH_DIRECTORY/23
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/23/.git" GIT_WORK_TREE=. test_repo 23
#	
not ok - 288 #23: GIT_DIR(rel), GIT_WORKTREE=root in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY/23
#	setup: cwd: $TRASH_DIRECTORY/23
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY/23" test_repo 23/sub/sub
#	
not ok - 289 #23: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY/23
#	setup: cwd: $TRASH_DIRECTORY/23
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../.. test_repo 23/sub/sub
#	
not ok - 290 #23: GIT_DIR, GIT_WORKTREE=root in subdir
#	
#		cat >23/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY/23
#	setup: cwd: $TRASH_DIRECTORY/23
#	setup: prefix: sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/23/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/23" test_repo 23/sub
#	
not ok - 291 #23: GIT_DIR, GIT_WORKTREE=root(rel) in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY/23
#	setup: cwd: $TRASH_DIRECTORY/23
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/23/.git" GIT_WORK_TREE=../.. test_repo 23/sub/sub
#	
not ok - 292 #23: GIT_DIR(rel), GIT_WORK_TREE=wt at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $TRASH_DIRECTORY/23/wt
#	setup: cwd: $TRASH_DIRECTORY/23
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY/23/wt" test_repo 23
#	
not ok - 293 #23: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $TRASH_DIRECTORY/23/wt
#	setup: cwd: $TRASH_DIRECTORY/23
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=wt test_repo 23
#	
not ok - 294 #23: GIT_DIR, GIT_WORK_TREE=wt(rel) at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY/23/wt
#	setup: cwd: $TRASH_DIRECTORY/23
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/23/.git" GIT_WORK_TREE=wt test_repo 23
#	
not ok - 295 #23: GIT_DIR, GIT_WORK_TREE=wt at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY/23/wt
#	setup: cwd: $TRASH_DIRECTORY/23
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/23/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/23/wt" test_repo 23
#	
not ok - 296 #23: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $TRASH_DIRECTORY/23/wt
#	setup: cwd: $TRASH_DIRECTORY/23/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY/23/wt" test_repo 23/sub/sub
#	
not ok - 297 #23: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $TRASH_DIRECTORY/23/wt
#	setup: cwd: $TRASH_DIRECTORY/23/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../../wt test_repo 23/sub/sub
#	
not ok - 298 #23: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY/23/wt
#	setup: cwd: $TRASH_DIRECTORY/23/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/23/.git" GIT_WORK_TREE=../../wt test_repo 23/sub/sub
#	
not ok - 299 #23: GIT_DIR, GIT_WORK_TREE=wt in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY/23/wt
#	setup: cwd: $TRASH_DIRECTORY/23/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/23/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/23/wt" test_repo 23/sub/sub
#	
not ok - 300 #23: GIT_DIR(rel), GIT_WORK_TREE=.. at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 23/
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 23
#	
not ok - 301 #23: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 23/
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=.. test_repo 23
#	
not ok - 302 #23: GIT_DIR, GIT_WORK_TREE=..(rel) at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 23/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/23/.git" GIT_WORK_TREE=.. test_repo 23
#	
not ok - 303 #23: GIT_DIR, GIT_WORK_TREE=.. at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 23/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/23/.git" GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 23
#	
not ok - 304 #23: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 23/sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 23/sub/sub
#	
not ok - 305 #23: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 23/sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../../.. test_repo 23/sub/sub
#	
not ok - 306 #23: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 23/sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/23/.git" GIT_WORK_TREE=../../../ test_repo 23/sub/sub
#	
not ok - 307 #23: GIT_DIR, GIT_WORK_TREE=.. in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/23/.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 23/sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/23/.git" GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 23/sub/sub
#	
ok 308 - #24: setup
ok 309 - #24: at root
ok 310 - #24: in subdir
ok 311 - #25: setup
ok 312 - #25: at root
ok 313 - #25: in subdir
ok 314 - #26: setup
ok 315 - #26: (rel) at root
ok 316 - #26: at root
ok 317 - #26: (rel) in subdir
ok 318 - #26: in subdir
ok 319 - #27: setup
not ok - 320 #27: GIT_DIR(rel), GIT_WORK_TREE=root at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY/27
#	setup: cwd: $TRASH_DIRECTORY/27
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY/27" test_repo 27
#	
not ok - 321 #27: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY/27
#	setup: cwd: $TRASH_DIRECTORY/27
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=. test_repo 27
#	
not ok - 322 #27: GIT_DIR, GIT_WORK_TREE=root at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY/27
#	setup: cwd: $TRASH_DIRECTORY/27
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/27/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/27" test_repo 27
#	
not ok - 323 #27: GIT_DIR, GIT_WORK_TREE=root(rel) at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY/27
#	setup: cwd: $TRASH_DIRECTORY/27
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/27/.git" GIT_WORK_TREE=. test_repo 27
#	
not ok - 324 #27: GIT_DIR(rel), GIT_WORKTREE=root in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY/27
#	setup: cwd: $TRASH_DIRECTORY/27
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY/27" test_repo 27/sub/sub
#	
not ok - 325 #27: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY/27
#	setup: cwd: $TRASH_DIRECTORY/27
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../.. test_repo 27/sub/sub
#	
not ok - 326 #27: GIT_DIR, GIT_WORKTREE=root in subdir
#	
#		cat >27/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY/27
#	setup: cwd: $TRASH_DIRECTORY/27
#	setup: prefix: sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/27/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/27" test_repo 27/sub
#	
not ok - 327 #27: GIT_DIR, GIT_WORKTREE=root(rel) in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY/27
#	setup: cwd: $TRASH_DIRECTORY/27
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/27/.git" GIT_WORK_TREE=../.. test_repo 27/sub/sub
#	
not ok - 328 #27: GIT_DIR(rel), GIT_WORK_TREE=wt at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY/27/wt
#	setup: cwd: $TRASH_DIRECTORY/27
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY/27/wt" test_repo 27
#	
not ok - 329 #27: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY/27/wt
#	setup: cwd: $TRASH_DIRECTORY/27
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=wt test_repo 27
#	
not ok - 330 #27: GIT_DIR, GIT_WORK_TREE=wt(rel) at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY/27/wt
#	setup: cwd: $TRASH_DIRECTORY/27
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/27/.git" GIT_WORK_TREE=wt test_repo 27
#	
not ok - 331 #27: GIT_DIR, GIT_WORK_TREE=wt at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY/27/wt
#	setup: cwd: $TRASH_DIRECTORY/27
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/27/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/27/wt" test_repo 27
#	
not ok - 332 #27: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY/27/wt
#	setup: cwd: $TRASH_DIRECTORY/27/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY/27/wt" test_repo 27/sub/sub
#	
not ok - 333 #27: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY/27/wt
#	setup: cwd: $TRASH_DIRECTORY/27/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../../wt test_repo 27/sub/sub
#	
not ok - 334 #27: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY/27/wt
#	setup: cwd: $TRASH_DIRECTORY/27/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/27/.git" GIT_WORK_TREE=../../wt test_repo 27/sub/sub
#	
not ok - 335 #27: GIT_DIR, GIT_WORK_TREE=wt in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY/27/wt
#	setup: cwd: $TRASH_DIRECTORY/27/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/27/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/27/wt" test_repo 27/sub/sub
#	
not ok - 336 #27: GIT_DIR(rel), GIT_WORK_TREE=.. at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 27/
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 27
#	
not ok - 337 #27: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 27/
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=.. test_repo 27
#	
not ok - 338 #27: GIT_DIR, GIT_WORK_TREE=..(rel) at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 27/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/27/.git" GIT_WORK_TREE=.. test_repo 27
#	
not ok - 339 #27: GIT_DIR, GIT_WORK_TREE=.. at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 27/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/27/.git" GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 27
#	
not ok - 340 #27: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 27/sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 27/sub/sub
#	
not ok - 341 #27: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 27/sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../../.. test_repo 27/sub/sub
#	
not ok - 342 #27: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 27/sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/27/.git" GIT_WORK_TREE=../../../ test_repo 27/sub/sub
#	
not ok - 343 #27: GIT_DIR, GIT_WORK_TREE=.. in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/27.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 27/sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/27/.git" GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 27/sub/sub
#	
ok 344 - #28: setup
ok 345 - #28: at root
ok 346 - #28: in subdir
ok 347 - #29: setup
ok 348 - #29: at root
ok 349 - #29: in subdir
ok 350 - #30: setup
not ok - 351 #30: at root
#	
#		(
#		cd 30 &&
#		GIT_DIR=.git test_must_fail git symbolic-ref HEAD 2>result &&
#		grep "core.bare and core.worktree do not make sense" result
#		)
#	
ok 352 - #31: setup
not ok - 353 #31: GIT_DIR(rel), GIT_WORK_TREE=root at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY/31
#	setup: cwd: $TRASH_DIRECTORY/31
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY/31" test_repo 31
#	
not ok - 354 #31: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY/31
#	setup: cwd: $TRASH_DIRECTORY/31
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=. test_repo 31
#	
not ok - 355 #31: GIT_DIR, GIT_WORK_TREE=root at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY/31
#	setup: cwd: $TRASH_DIRECTORY/31
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/31/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/31" test_repo 31
#	
not ok - 356 #31: GIT_DIR, GIT_WORK_TREE=root(rel) at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY/31
#	setup: cwd: $TRASH_DIRECTORY/31
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/31/.git" GIT_WORK_TREE=. test_repo 31
#	
not ok - 357 #31: GIT_DIR(rel), GIT_WORKTREE=root in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY/31
#	setup: cwd: $TRASH_DIRECTORY/31
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY/31" test_repo 31/sub/sub
#	
not ok - 358 #31: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY/31
#	setup: cwd: $TRASH_DIRECTORY/31
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../.. test_repo 31/sub/sub
#	
not ok - 359 #31: GIT_DIR, GIT_WORKTREE=root in subdir
#	
#		cat >31/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY/31
#	setup: cwd: $TRASH_DIRECTORY/31
#	setup: prefix: sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/31/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/31" test_repo 31/sub
#	
not ok - 360 #31: GIT_DIR, GIT_WORKTREE=root(rel) in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY/31
#	setup: cwd: $TRASH_DIRECTORY/31
#	setup: prefix: sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/31/.git" GIT_WORK_TREE=../.. test_repo 31/sub/sub
#	
not ok - 361 #31: GIT_DIR(rel), GIT_WORK_TREE=wt at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY/31/wt
#	setup: cwd: $TRASH_DIRECTORY/31
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY/31/wt" test_repo 31
#	
not ok - 362 #31: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY/31/wt
#	setup: cwd: $TRASH_DIRECTORY/31
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=wt test_repo 31
#	
not ok - 363 #31: GIT_DIR, GIT_WORK_TREE=wt(rel) at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY/31/wt
#	setup: cwd: $TRASH_DIRECTORY/31
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/31/.git" GIT_WORK_TREE=wt test_repo 31
#	
not ok - 364 #31: GIT_DIR, GIT_WORK_TREE=wt at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY/31/wt
#	setup: cwd: $TRASH_DIRECTORY/31
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/31/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/31/wt" test_repo 31
#	
not ok - 365 #31: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY/31/wt
#	setup: cwd: $TRASH_DIRECTORY/31/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY/31/wt" test_repo 31/sub/sub
#	
not ok - 366 #31: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY/31/wt
#	setup: cwd: $TRASH_DIRECTORY/31/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../../wt test_repo 31/sub/sub
#	
not ok - 367 #31: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY/31/wt
#	setup: cwd: $TRASH_DIRECTORY/31/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/31/.git" GIT_WORK_TREE=../../wt test_repo 31/sub/sub
#	
not ok - 368 #31: GIT_DIR, GIT_WORK_TREE=wt in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY/31/wt
#	setup: cwd: $TRASH_DIRECTORY/31/sub/sub
#	setup: prefix: (null)
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/31/.git" GIT_WORK_TREE="$TRASH_DIRECTORY/31/wt" test_repo 31/sub/sub
#	
not ok - 369 #31: GIT_DIR(rel), GIT_WORK_TREE=.. at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 31/
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 31
#	
not ok - 370 #31: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 31/
#	EOF
#		GIT_DIR=.git GIT_WORK_TREE=.. test_repo 31
#	
not ok - 371 #31: GIT_DIR, GIT_WORK_TREE=..(rel) at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 31/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/31/.git" GIT_WORK_TREE=.. test_repo 31
#	
not ok - 372 #31: GIT_DIR, GIT_WORK_TREE=.. at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 31/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/31/.git" GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 31
#	
not ok - 373 #31: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 31/sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 31/sub/sub
#	
not ok - 374 #31: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 31/sub/sub/
#	EOF
#		GIT_DIR=../../.git GIT_WORK_TREE=../../.. test_repo 31/sub/sub
#	
not ok - 375 #31: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 31/sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/31/.git" GIT_WORK_TREE=../../../ test_repo 31/sub/sub
#	
not ok - 376 #31: GIT_DIR, GIT_WORK_TREE=.. in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $TRASH_DIRECTORY/31.git
#	setup: worktree: $TRASH_DIRECTORY
#	setup: cwd: $TRASH_DIRECTORY
#	setup: prefix: 31/sub/sub/
#	EOF
#		GIT_DIR="$TRASH_DIRECTORY/31/.git" GIT_WORK_TREE="$TRASH_DIRECTORY" test_repo 31/sub/sub
#	
# failed 244 among 376 test(s)
1..376
