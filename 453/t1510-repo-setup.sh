ok 1 - #0: setup
not ok - 2 #0: at root
#	
#		cat >0/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/0
#	setup: cwd: $here/0
#	setup: prefix: (null)
#	EOF
#		test_repo 0
#	
not ok - 3 #0: in subdir
#	
#		cat >0/sub/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/0
#	setup: cwd: $here/0
#	setup: prefix: sub/
#	EOF
#		test_repo 0/sub
#	
ok 4 - #1: setup
not ok - 5 #1: at root
#	
#		cat >1/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/1
#	setup: cwd: $here/1
#	setup: prefix: (null)
#	EOF
#		test_repo 1
#	
not ok - 6 #1: in subdir
#	
#		cat >1/sub/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/1
#	setup: cwd: $here/1
#	setup: prefix: sub/
#	EOF
#		test_repo 1/sub
#	
ok 7 - #2: setup
not ok - 8 #2: at root
#	
#		cat >2/expected <<EOF &&
#	setup: git_dir: $here/2/.git
#	setup: worktree: $here/2
#	setup: cwd: $here/2
#	setup: prefix: (null)
#	EOF
#		test_repo 2 "$here/2/.git"
#	
not ok - 9 #2: in subdir
#	
#		cat >2/sub/expected <<EOF &&
#	setup: git_dir: $here/2/.git
#	setup: worktree: $here/2/sub
#	setup: cwd: $here/2/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 2/sub "$here/2/.git"
#	
not ok - 10 #2: relative GIT_DIR at root
#	
#		cat >2/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/2
#	setup: cwd: $here/2
#	setup: prefix: (null)
#	EOF
#		test_repo 2 .git
#	
not ok - 11 #2: relative GIT_DIR in subdir
#	
#		cat >2/sub/expected <<EOF &&
#	setup: git_dir: ../.git
#	setup: worktree: $here/2/sub
#	setup: cwd: $here/2/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 2/sub ../.git
#	
ok 12 - #3: setup
not ok - 13 #3: GIT_DIR(rel), GIT_WORK_TREE=root at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/3
#	setup: cwd: $here/3
#	setup: prefix: (null)
#	EOF
#		test_repo 3 .git "$here/3"
#	
not ok - 14 #3: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/3
#	setup: cwd: $here/3
#	setup: prefix: (null)
#	EOF
#		test_repo 3 .git .
#	
not ok - 15 #3: GIT_DIR, GIT_WORK_TREE=root at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here/3
#	setup: cwd: $here/3
#	setup: prefix: (null)
#	EOF
#		test_repo 3 "$here/3/.git" "$here/3"
#	
not ok - 16 #3: GIT_DIR, GIT_WORK_TREE=root(rel) at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here/3
#	setup: cwd: $here/3
#	setup: prefix: (null)
#	EOF
#		test_repo 3 "$here/3/.git" .
#	
not ok - 17 #3: GIT_DIR(rel), GIT_WORKTREE=root in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here/3
#	setup: cwd: $here/3
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 3/sub/sub ../../.git "$here/3"
#	
not ok - 18 #3: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here/3
#	setup: cwd: $here/3
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 3/sub/sub ../../.git ../..
#	
not ok - 19 #3: GIT_DIR, GIT_WORKTREE=root in subdir
#	
#		cat >3/sub/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here/3
#	setup: cwd: $here/3
#	setup: prefix: sub/
#	EOF
#		test_repo 3/sub "$here/3/.git" "$here/3"
#	
not ok - 20 #3: GIT_DIR, GIT_WORKTREE=root(rel) in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here/3
#	setup: cwd: $here/3
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 3/sub/sub "$here/3/.git" ../..
#	
not ok - 21 #3: GIT_DIR(rel), GIT_WORK_TREE=wt at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/3/wt
#	setup: cwd: $here/3
#	setup: prefix: (null)
#	EOF
#		test_repo 3 .git "$here/3/wt"
#	
not ok - 22 #3: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/3/wt
#	setup: cwd: $here/3
#	setup: prefix: (null)
#	EOF
#		test_repo 3 .git wt
#	
not ok - 23 #3: GIT_DIR, GIT_WORK_TREE=wt(rel) at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here/3/wt
#	setup: cwd: $here/3
#	setup: prefix: (null)
#	EOF
#		test_repo 3 "$here/3/.git" wt
#	
not ok - 24 #3: GIT_DIR, GIT_WORK_TREE=wt at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here/3/wt
#	setup: cwd: $here/3
#	setup: prefix: (null)
#	EOF
#		test_repo 3 "$here/3/.git" "$here/3/wt"
#	
not ok - 25 #3: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $here/3/wt
#	setup: cwd: $here/3/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 3/sub/sub ../../.git "$here/3/wt"
#	
not ok - 26 #3: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $here/3/wt
#	setup: cwd: $here/3/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 3/sub/sub ../../.git ../../wt
#	
not ok - 27 #3: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here/3/wt
#	setup: cwd: $here/3/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 3/sub/sub "$here/3/.git" ../../wt
#	
not ok - 28 #3: GIT_DIR, GIT_WORK_TREE=wt in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here/3/wt
#	setup: cwd: $here/3/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 3/sub/sub "$here/3/.git" "$here/3/wt"
#	
not ok - 29 #3: GIT_DIR(rel), GIT_WORK_TREE=.. at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 3/
#	EOF
#		test_repo 3 .git "$here"
#	
not ok - 30 #3: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 3/
#	EOF
#		test_repo 3 .git ..
#	
not ok - 31 #3: GIT_DIR, GIT_WORK_TREE=..(rel) at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 3/
#	EOF
#		test_repo 3 "$here/3/.git" ..
#	
not ok - 32 #3: GIT_DIR, GIT_WORK_TREE=.. at root
#	
#		cat >3/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 3/
#	EOF
#		test_repo 3 "$here/3/.git" "$here"
#	
not ok - 33 #3: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 3/sub/sub/
#	EOF
#		test_repo 3/sub/sub ../../.git "$here"
#	
not ok - 34 #3: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 3/sub/sub/
#	EOF
#		test_repo 3/sub/sub ../../.git ../../..
#	
not ok - 35 #3: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 3/sub/sub/
#	EOF
#		test_repo 3/sub/sub "$here/3/.git" ../../../
#	
not ok - 36 #3: GIT_DIR, GIT_WORK_TREE=.. in subdir
#	
#		cat >3/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/3/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 3/sub/sub/
#	EOF
#		test_repo 3/sub/sub "$here/3/.git" "$here"
#	
ok 37 - #4: setup
not ok - 38 #4: at root
#	
#		cat >4/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/4
#	setup: cwd: $here/4
#	setup: prefix: (null)
#	EOF
#		test_repo 4
#	
not ok - 39 #4: in subdir
#	
#		cat >4/sub/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/4
#	setup: cwd: $here/4
#	setup: prefix: sub/
#	EOF
#		test_repo 4/sub
#	
ok 40 - #5: setup
not ok - 41 #5: at root
#	
#		cat >5/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/5
#	setup: cwd: $here/5
#	setup: prefix: (null)
#	EOF
#		test_repo 5
#	
not ok - 42 #5: in subdir
#	
#		cat >5/sub/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/5
#	setup: cwd: $here/5
#	setup: prefix: sub/
#	EOF
#		test_repo 5/sub
#	
ok 43 - #6: setup
not ok - 44 #6: GIT_DIR(rel), core.worktree=.. at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/6
#	setup: cwd: $here/6
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/6/.git/config" core.worktree "$here/6" &&
#		test_repo 6 .git
#	
not ok - 45 #6: GIT_DIR(rel), core.worktree=..(rel) at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/6
#	setup: cwd: $here/6
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/6/.git/config" core.worktree .. &&
#		test_repo 6 .git
#	
not ok - 46 #6: GIT_DIR, core.worktree=.. at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here/6
#	setup: cwd: $here/6
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/6/.git/config" core.worktree "$here/6" &&
#		test_repo 6 "$here/6/.git"
#	
not ok - 47 #6: GIT_DIR, core.worktree=..(rel) at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here/6
#	setup: cwd: $here/6
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/6/.git/config" core.worktree .. &&
#		test_repo 6 "$here/6/.git"
#	
not ok - 48 #6: GIT_DIR(rel), core.worktree=.. in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here/6
#	setup: cwd: $here/6
#	setup: prefix: sub/sub/
#	EOF
#		git config --file="$here/6/.git/config" core.worktree "$here/6" &&
#		test_repo 6/sub/sub ../../.git
#	
not ok - 49 #6: GIT_DIR(rel), core.worktree=..(rel) in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here/6
#	setup: cwd: $here/6
#	setup: prefix: sub/sub/
#	EOF
#		git config --file="$here/6/.git/config" core.worktree .. &&
#		test_repo 6/sub/sub ../../.git
#	
not ok - 50 #6: GIT_DIR, core.worktree=.. in subdir
#	
#		cat >6/sub/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here/6
#	setup: cwd: $here/6
#	setup: prefix: sub/
#	EOF
#		git config --file="$here/6/.git/config" core.worktree "$here/6" &&
#		test_repo 6/sub "$here/6/.git"
#	
not ok - 51 #6: GIT_DIR, core.worktree=..(rel) in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here/6
#	setup: cwd: $here/6
#	setup: prefix: sub/sub/
#	EOF
#		git config --file="$here/6/.git/config" core.worktree .. &&
#		test_repo 6/sub/sub "$here/6/.git"
#	
not ok - 52 #6: GIT_DIR(rel), core.worktree=../wt at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/6/wt
#	setup: cwd: $here/6
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/6/.git/config" core.worktree "$here/6/wt" &&
#		test_repo 6 .git
#	
not ok - 53 #6: GIT_DIR(rel), core.worktree=../wt(rel) at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/6/wt
#	setup: cwd: $here/6
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/6/.git/config" core.worktree ../wt &&
#		test_repo 6 .git
#	
not ok - 54 #6: GIT_DIR, core.worktree=../wt(rel) at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here/6/wt
#	setup: cwd: $here/6
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/6/.git/config" core.worktree ../wt &&
#		test_repo 6 "$here/6/.git"
#	
not ok - 55 #6: GIT_DIR, core.worktree=../wt at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here/6/wt
#	setup: cwd: $here/6
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/6/.git/config" core.worktree "$here/6/wt" &&
#		test_repo 6 "$here/6/.git"
#	
not ok - 56 #6: GIT_DIR(rel), core.worktree=../wt in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $here/6/wt
#	setup: cwd: $here/6/sub/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/6/.git/config" core.worktree "$here/6/wt" &&
#		test_repo 6/sub/sub ../../.git
#	
not ok - 57 #6: GIT_DIR(rel), core.worktree=../wt(rel) in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $here/6/wt
#	setup: cwd: $here/6/sub/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/6/.git/config" core.worktree ../wt &&
#		test_repo 6/sub/sub ../../.git
#	
not ok - 58 #6: GIT_DIR, core.worktree=../wt(rel) in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here/6/wt
#	setup: cwd: $here/6/sub/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/6/.git/config" core.worktree ../wt &&
#		test_repo 6/sub/sub "$here/6/.git"
#	
not ok - 59 #6: GIT_DIR, core.worktree=../wt in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here/6/wt
#	setup: cwd: $here/6/sub/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/6/.git/config" core.worktree "$here/6/wt" &&
#		test_repo 6/sub/sub "$here/6/.git"
#	
not ok - 60 #6: GIT_DIR(rel), core.worktree=../.. at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 6/
#	EOF
#		git config --file="$here/6/.git/config" core.worktree "$here" &&
#		test_repo 6 .git
#	
not ok - 61 #6: GIT_DIR(rel), core.worktree=../..(rel) at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 6/
#	EOF
#		git config --file="$here/6/.git/config" core.worktree ../../ &&
#		test_repo 6 .git
#	
not ok - 62 #6: GIT_DIR, core.worktree=../..(rel) at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 6/
#	EOF
#		git config --file="$here/6/.git/config" core.worktree ../../ &&
#		test_repo 6 "$here/6/.git"
#	
not ok - 63 #6: GIT_DIR, core.worktree=../.. at root
#	
#		cat >6/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 6/
#	EOF
#		git config --file="$here/6/.git/config" core.worktree "$here" &&
#		test_repo 6 "$here/6/.git"
#	
not ok - 64 #6: GIT_DIR(rel), core.worktree=../.. in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 6/sub/sub/
#	EOF
#		git config --file="$here/6/.git/config" core.worktree "$here" &&
#		test_repo 6/sub/sub ../../.git
#	
not ok - 65 #6: GIT_DIR(rel), core.worktree=../..(rel) in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 6/sub/sub/
#	EOF
#		git config --file="$here/6/.git/config" core.worktree ../.. &&
#		test_repo 6/sub/sub ../../.git
#	
not ok - 66 #6: GIT_DIR, core.worktree=../..(rel) in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 6/sub/sub/
#	EOF
#		git config --file="$here/6/.git/config" core.worktree ../.. &&
#		test_repo 6/sub/sub "$here/6/.git"
#	
not ok - 67 #6: GIT_DIR, core.worktree=../.. in subdir
#	
#		cat >6/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/6/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 6/sub/sub/
#	EOF
#		git config --file="$here/6/.git/config" core.worktree "$here" &&
#		test_repo 6/sub/sub "$here/6/.git"
#	
ok 68 - #7: setup
not ok - 69 #7: GIT_DIR(rel), GIT_WORK_TREE=root at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/7
#	setup: cwd: $here/7
#	setup: prefix: (null)
#	EOF
#		test_repo 7 .git "$here/7"
#	
not ok - 70 #7: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/7
#	setup: cwd: $here/7
#	setup: prefix: (null)
#	EOF
#		test_repo 7 .git .
#	
not ok - 71 #7: GIT_DIR, GIT_WORK_TREE=root at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here/7
#	setup: cwd: $here/7
#	setup: prefix: (null)
#	EOF
#		test_repo 7 "$here/7/.git" "$here/7"
#	
not ok - 72 #7: GIT_DIR, GIT_WORK_TREE=root(rel) at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here/7
#	setup: cwd: $here/7
#	setup: prefix: (null)
#	EOF
#		test_repo 7 "$here/7/.git" .
#	
not ok - 73 #7: GIT_DIR(rel), GIT_WORKTREE=root in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here/7
#	setup: cwd: $here/7
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 7/sub/sub ../../.git "$here/7"
#	
not ok - 74 #7: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here/7
#	setup: cwd: $here/7
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 7/sub/sub ../../.git ../..
#	
not ok - 75 #7: GIT_DIR, GIT_WORKTREE=root in subdir
#	
#		cat >7/sub/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here/7
#	setup: cwd: $here/7
#	setup: prefix: sub/
#	EOF
#		test_repo 7/sub "$here/7/.git" "$here/7"
#	
not ok - 76 #7: GIT_DIR, GIT_WORKTREE=root(rel) in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here/7
#	setup: cwd: $here/7
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 7/sub/sub "$here/7/.git" ../..
#	
not ok - 77 #7: GIT_DIR(rel), GIT_WORK_TREE=wt at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/7/wt
#	setup: cwd: $here/7
#	setup: prefix: (null)
#	EOF
#		test_repo 7 .git "$here/7/wt"
#	
not ok - 78 #7: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/7/wt
#	setup: cwd: $here/7
#	setup: prefix: (null)
#	EOF
#		test_repo 7 .git wt
#	
not ok - 79 #7: GIT_DIR, GIT_WORK_TREE=wt(rel) at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here/7/wt
#	setup: cwd: $here/7
#	setup: prefix: (null)
#	EOF
#		test_repo 7 "$here/7/.git" wt
#	
not ok - 80 #7: GIT_DIR, GIT_WORK_TREE=wt at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here/7/wt
#	setup: cwd: $here/7
#	setup: prefix: (null)
#	EOF
#		test_repo 7 "$here/7/.git" "$here/7/wt"
#	
not ok - 81 #7: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $here/7/wt
#	setup: cwd: $here/7/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 7/sub/sub ../../.git "$here/7/wt"
#	
not ok - 82 #7: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $here/7/wt
#	setup: cwd: $here/7/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 7/sub/sub ../../.git ../../wt
#	
not ok - 83 #7: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here/7/wt
#	setup: cwd: $here/7/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 7/sub/sub "$here/7/.git" ../../wt
#	
not ok - 84 #7: GIT_DIR, GIT_WORK_TREE=wt in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here/7/wt
#	setup: cwd: $here/7/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 7/sub/sub "$here/7/.git" "$here/7/wt"
#	
not ok - 85 #7: GIT_DIR(rel), GIT_WORK_TREE=.. at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 7/
#	EOF
#		test_repo 7 .git "$here"
#	
not ok - 86 #7: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 7/
#	EOF
#		test_repo 7 .git ..
#	
not ok - 87 #7: GIT_DIR, GIT_WORK_TREE=..(rel) at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 7/
#	EOF
#		test_repo 7 "$here/7/.git" ..
#	
not ok - 88 #7: GIT_DIR, GIT_WORK_TREE=.. at root
#	
#		cat >7/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 7/
#	EOF
#		test_repo 7 "$here/7/.git" "$here"
#	
not ok - 89 #7: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 7/sub/sub/
#	EOF
#		test_repo 7/sub/sub ../../.git "$here"
#	
not ok - 90 #7: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 7/sub/sub/
#	EOF
#		test_repo 7/sub/sub ../../.git ../../..
#	
not ok - 91 #7: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 7/sub/sub/
#	EOF
#		test_repo 7/sub/sub "$here/7/.git" ../../../
#	
not ok - 92 #7: GIT_DIR, GIT_WORK_TREE=.. in subdir
#	
#		cat >7/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/7/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 7/sub/sub/
#	EOF
#		test_repo 7/sub/sub "$here/7/.git" "$here"
#	
ok 93 - #8: setup
not ok - 94 #8: at root
#	
#		cat >8/expected <<EOF &&
#	setup: git_dir: $here/8.git
#	setup: worktree: $here/8
#	setup: cwd: $here/8
#	setup: prefix: (null)
#	EOF
#		test_repo 8
#	
not ok - 95 #8: in subdir
#	
#		cat >8/sub/expected <<EOF &&
#	setup: git_dir: $here/8.git
#	setup: worktree: $here/8
#	setup: cwd: $here/8
#	setup: prefix: sub/
#	EOF
#		test_repo 8/sub
#	
ok 96 - #9: setup
not ok - 97 #9: at root
#	
#		cat >9/expected <<EOF &&
#	setup: git_dir: $here/9.git
#	setup: worktree: $here/9
#	setup: cwd: $here/9
#	setup: prefix: (null)
#	EOF
#		test_repo 9
#	
not ok - 98 #9: in subdir
#	
#		cat >9/sub/expected <<EOF &&
#	setup: git_dir: $here/9.git
#	setup: worktree: $here/9
#	setup: cwd: $here/9
#	setup: prefix: sub/
#	EOF
#		test_repo 9/sub
#	
ok 99 - #10: setup
not ok - 100 #10: at root
#	
#		cat >10/expected <<EOF &&
#	setup: git_dir: $here/10.git
#	setup: worktree: $here/10
#	setup: cwd: $here/10
#	setup: prefix: (null)
#	EOF
#		test_repo 10 "$here/10/.git"
#	
not ok - 101 #10: in subdir
#	
#		cat >10/sub/expected <<EOF &&
#	setup: git_dir: $here/10.git
#	setup: worktree: $here/10/sub
#	setup: cwd: $here/10/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 10/sub "$here/10/.git"
#	
not ok - 102 #10: relative GIT_DIR at root
#	
#		cat >10/expected <<EOF &&
#	setup: git_dir: $here/10.git
#	setup: worktree: $here/10
#	setup: cwd: $here/10
#	setup: prefix: (null)
#	EOF
#		test_repo 10 .git
#	
not ok - 103 #10: relative GIT_DIR in subdir
#	
#		cat >10/sub/expected <<EOF &&
#	setup: git_dir: $here/10.git
#	setup: worktree: $here/10/sub
#	setup: cwd: $here/10/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 10/sub ../.git
#	
ok 104 - #11: setup
not ok - 105 #11: GIT_DIR(rel), GIT_WORK_TREE=root at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here/11
#	setup: cwd: $here/11
#	setup: prefix: (null)
#	EOF
#		test_repo 11 .git "$here/11"
#	
not ok - 106 #11: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here/11
#	setup: cwd: $here/11
#	setup: prefix: (null)
#	EOF
#		test_repo 11 .git .
#	
not ok - 107 #11: GIT_DIR, GIT_WORK_TREE=root at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here/11
#	setup: cwd: $here/11
#	setup: prefix: (null)
#	EOF
#		test_repo 11 "$here/11/.git" "$here/11"
#	
not ok - 108 #11: GIT_DIR, GIT_WORK_TREE=root(rel) at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here/11
#	setup: cwd: $here/11
#	setup: prefix: (null)
#	EOF
#		test_repo 11 "$here/11/.git" .
#	
not ok - 109 #11: GIT_DIR(rel), GIT_WORKTREE=root in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here/11
#	setup: cwd: $here/11
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 11/sub/sub ../../.git "$here/11"
#	
not ok - 110 #11: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here/11
#	setup: cwd: $here/11
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 11/sub/sub ../../.git ../..
#	
not ok - 111 #11: GIT_DIR, GIT_WORKTREE=root in subdir
#	
#		cat >11/sub/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here/11
#	setup: cwd: $here/11
#	setup: prefix: sub/
#	EOF
#		test_repo 11/sub "$here/11/.git" "$here/11"
#	
not ok - 112 #11: GIT_DIR, GIT_WORKTREE=root(rel) in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here/11
#	setup: cwd: $here/11
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 11/sub/sub "$here/11/.git" ../..
#	
not ok - 113 #11: GIT_DIR(rel), GIT_WORK_TREE=wt at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here/11/wt
#	setup: cwd: $here/11
#	setup: prefix: (null)
#	EOF
#		test_repo 11 .git "$here/11/wt"
#	
not ok - 114 #11: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here/11/wt
#	setup: cwd: $here/11
#	setup: prefix: (null)
#	EOF
#		test_repo 11 .git wt
#	
not ok - 115 #11: GIT_DIR, GIT_WORK_TREE=wt(rel) at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here/11/wt
#	setup: cwd: $here/11
#	setup: prefix: (null)
#	EOF
#		test_repo 11 "$here/11/.git" wt
#	
not ok - 116 #11: GIT_DIR, GIT_WORK_TREE=wt at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here/11/wt
#	setup: cwd: $here/11
#	setup: prefix: (null)
#	EOF
#		test_repo 11 "$here/11/.git" "$here/11/wt"
#	
not ok - 117 #11: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here/11/wt
#	setup: cwd: $here/11/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 11/sub/sub ../../.git "$here/11/wt"
#	
not ok - 118 #11: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here/11/wt
#	setup: cwd: $here/11/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 11/sub/sub ../../.git ../../wt
#	
not ok - 119 #11: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here/11/wt
#	setup: cwd: $here/11/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 11/sub/sub "$here/11/.git" ../../wt
#	
not ok - 120 #11: GIT_DIR, GIT_WORK_TREE=wt in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here/11/wt
#	setup: cwd: $here/11/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 11/sub/sub "$here/11/.git" "$here/11/wt"
#	
not ok - 121 #11: GIT_DIR(rel), GIT_WORK_TREE=.. at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 11/
#	EOF
#		test_repo 11 .git "$here"
#	
not ok - 122 #11: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 11/
#	EOF
#		test_repo 11 .git ..
#	
not ok - 123 #11: GIT_DIR, GIT_WORK_TREE=..(rel) at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 11/
#	EOF
#		test_repo 11 "$here/11/.git" ..
#	
not ok - 124 #11: GIT_DIR, GIT_WORK_TREE=.. at root
#	
#		cat >11/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 11/
#	EOF
#		test_repo 11 "$here/11/.git" "$here"
#	
not ok - 125 #11: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 11/sub/sub/
#	EOF
#		test_repo 11/sub/sub ../../.git "$here"
#	
not ok - 126 #11: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 11/sub/sub/
#	EOF
#		test_repo 11/sub/sub ../../.git ../../..
#	
not ok - 127 #11: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 11/sub/sub/
#	EOF
#		test_repo 11/sub/sub "$here/11/.git" ../../../
#	
not ok - 128 #11: GIT_DIR, GIT_WORK_TREE=.. in subdir
#	
#		cat >11/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/11.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 11/sub/sub/
#	EOF
#		test_repo 11/sub/sub "$here/11/.git" "$here"
#	
ok 129 - #12: setup
not ok - 130 #12: at root
#	
#		cat >12/expected <<EOF &&
#	setup: git_dir: $here/12.git
#	setup: worktree: $here/12
#	setup: cwd: $here/12
#	setup: prefix: (null)
#	EOF
#		test_repo 12
#	
not ok - 131 #12: in subdir
#	
#		cat >12/sub/expected <<EOF &&
#	setup: git_dir: $here/12.git
#	setup: worktree: $here/12
#	setup: cwd: $here/12
#	setup: prefix: sub/
#	EOF
#		test_repo 12/sub
#	
ok 132 - #13: setup
not ok - 133 #13: at root
#	
#		cat >13/expected <<EOF &&
#	setup: git_dir: $here/13.git
#	setup: worktree: $here/13
#	setup: cwd: $here/13
#	setup: prefix: (null)
#	EOF
#		test_repo 13
#	
not ok - 134 #13: in subdir
#	
#		cat >13/sub/expected <<EOF &&
#	setup: git_dir: $here/13.git
#	setup: worktree: $here/13
#	setup: cwd: $here/13
#	setup: prefix: sub/
#	EOF
#		test_repo 13/sub
#	
ok 135 - #14: setup
not ok - 136 #14: GIT_DIR(rel), core.worktree=../14 at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here/14
#	setup: cwd: $here/14
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/14.git/config" core.worktree "$here/14" &&
#		test_repo 14 .git
#	
not ok - 137 #14: GIT_DIR(rel), core.worktree=../14(rel) at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here/14
#	setup: cwd: $here/14
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/14.git/config" core.worktree ../14 &&
#		test_repo 14 .git
#	
not ok - 138 #14: GIT_DIR, core.worktree=../14 at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here/14
#	setup: cwd: $here/14
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/14.git/config" core.worktree "$here/14" &&
#		test_repo 14 "$here/14/.git"
#	
not ok - 139 #14: GIT_DIR, core.worktree=../14(rel) at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here/14
#	setup: cwd: $here/14
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/14.git/config" core.worktree ../14 &&
#		test_repo 14 "$here/14/.git"
#	
not ok - 140 #14: GIT_DIR(rel), core.worktree=../14 in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here/14
#	setup: cwd: $here/14
#	setup: prefix: sub/sub/
#	EOF
#		git config --file="$here/14.git/config" core.worktree "$here/14" &&
#		test_repo 14/sub/sub ../../.git
#	
not ok - 141 #14: GIT_DIR(rel), core.worktree=../14(rel) in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here/14
#	setup: cwd: $here/14
#	setup: prefix: sub/sub/
#	EOF
#		git config --file="$here/14.git/config" core.worktree ../14 &&
#		test_repo 14/sub/sub ../../.git
#	
not ok - 142 #14: GIT_DIR, core.worktree=../14 in subdir
#	
#		cat >14/sub/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here/14
#	setup: cwd: $here/14
#	setup: prefix: sub/
#	EOF
#		git config --file="$here/14.git/config" core.worktree "$here/14" &&
#		test_repo 14/sub "$here/14/.git"
#	
not ok - 143 #14: GIT_DIR, core.worktree=../14(rel) in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here/14
#	setup: cwd: $here/14
#	setup: prefix: sub/sub/
#	EOF
#		git config --file="$here/14.git/config" core.worktree ../14 &&
#		test_repo 14/sub/sub "$here/14/.git"
#	
not ok - 144 #14: GIT_DIR(rel), core.worktree=../14/wt at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here/14/wt
#	setup: cwd: $here/14
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/14.git/config" core.worktree "$here/14/wt" &&
#		test_repo 14 .git
#	
not ok - 145 #14: GIT_DIR(rel), core.worktree=../14/wt(rel) at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here/14/wt
#	setup: cwd: $here/14
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/14.git/config" core.worktree ../14/wt &&
#		test_repo 14 .git
#	
not ok - 146 #14: GIT_DIR, core.worktree=../14/wt(rel) at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here/14/wt
#	setup: cwd: $here/14
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/14.git/config" core.worktree ../14/wt &&
#		test_repo 14 "$here/14/.git"
#	
not ok - 147 #14: GIT_DIR, core.worktree=../14/wt at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here/14/wt
#	setup: cwd: $here/14
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/14.git/config" core.worktree "$here/14/wt" &&
#		test_repo 14 "$here/14/.git"
#	
not ok - 148 #14: GIT_DIR(rel), core.worktree=../14/wt in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here/14/wt
#	setup: cwd: $here/14/sub/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/14.git/config" core.worktree "$here/14/wt" &&
#		test_repo 14/sub/sub ../../.git
#	
not ok - 149 #14: GIT_DIR(rel), core.worktree=../14/wt(rel) in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here/14/wt
#	setup: cwd: $here/14/sub/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/14.git/config" core.worktree ../14/wt &&
#		test_repo 14/sub/sub ../../.git
#	
not ok - 150 #14: GIT_DIR, core.worktree=../14/wt(rel) in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here/14/wt
#	setup: cwd: $here/14/sub/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/14.git/config" core.worktree ../14/wt &&
#		test_repo 14/sub/sub "$here/14/.git"
#	
not ok - 151 #14: GIT_DIR, core.worktree=../14/wt in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here/14/wt
#	setup: cwd: $here/14/sub/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/14.git/config" core.worktree "$here/14/wt" &&
#		test_repo 14/sub/sub "$here/14/.git"
#	
not ok - 152 #14: GIT_DIR(rel), core.worktree=.. at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 14/
#	EOF
#		git config --file="$here/14.git/config" core.worktree "$here" &&
#		test_repo 14 .git
#	
not ok - 153 #14: GIT_DIR(rel), core.worktree=..(rel) at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 14/
#	EOF
#		git config --file="$here/14.git/config" core.worktree .. &&
#		test_repo 14 .git
#	
not ok - 154 #14: GIT_DIR, core.worktree=..(rel) at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 14/
#	EOF
#		git config --file="$here/14.git/config" core.worktree .. &&
#		test_repo 14 "$here/14/.git"
#	
not ok - 155 #14: GIT_DIR, core.worktree=.. at root
#	
#		cat >14/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 14/
#	EOF
#		git config --file="$here/14.git/config" core.worktree "$here" &&
#		test_repo 14 "$here/14/.git"
#	
not ok - 156 #14: GIT_DIR(rel), core.worktree=.. in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 14/sub/sub/
#	EOF
#		git config --file="$here/14.git/config" core.worktree "$here" &&
#		test_repo 14/sub/sub ../../.git
#	
not ok - 157 #14: GIT_DIR(rel), core.worktree=..(rel) in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 14/sub/sub/
#	EOF
#		git config --file="$here/14.git/config" core.worktree .. &&
#		test_repo 14/sub/sub ../../.git
#	
not ok - 158 #14: GIT_DIR, core.worktree=..(rel) in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 14/sub/sub/
#	EOF
#		git config --file="$here/14.git/config" core.worktree .. &&
#		test_repo 14/sub/sub "$here/14/.git"
#	
not ok - 159 #14: GIT_DIR, core.worktree=.. in subdir
#	
#		cat >14/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/14.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 14/sub/sub/
#	EOF
#		git config --file="$here/14.git/config" core.worktree "$here" &&
#		test_repo 14/sub/sub "$here/14/.git"
#	
ok 160 - #15: setup
not ok - 161 #15: GIT_DIR(rel), GIT_WORK_TREE=root at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here/15
#	setup: cwd: $here/15
#	setup: prefix: (null)
#	EOF
#		test_repo 15 .git "$here/15"
#	
not ok - 162 #15: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here/15
#	setup: cwd: $here/15
#	setup: prefix: (null)
#	EOF
#		test_repo 15 .git .
#	
not ok - 163 #15: GIT_DIR, GIT_WORK_TREE=root at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here/15
#	setup: cwd: $here/15
#	setup: prefix: (null)
#	EOF
#		test_repo 15 "$here/15/.git" "$here/15"
#	
not ok - 164 #15: GIT_DIR, GIT_WORK_TREE=root(rel) at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here/15
#	setup: cwd: $here/15
#	setup: prefix: (null)
#	EOF
#		test_repo 15 "$here/15/.git" .
#	
not ok - 165 #15: GIT_DIR(rel), GIT_WORKTREE=root in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here/15
#	setup: cwd: $here/15
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 15/sub/sub ../../.git "$here/15"
#	
not ok - 166 #15: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here/15
#	setup: cwd: $here/15
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 15/sub/sub ../../.git ../..
#	
not ok - 167 #15: GIT_DIR, GIT_WORKTREE=root in subdir
#	
#		cat >15/sub/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here/15
#	setup: cwd: $here/15
#	setup: prefix: sub/
#	EOF
#		test_repo 15/sub "$here/15/.git" "$here/15"
#	
not ok - 168 #15: GIT_DIR, GIT_WORKTREE=root(rel) in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here/15
#	setup: cwd: $here/15
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 15/sub/sub "$here/15/.git" ../..
#	
not ok - 169 #15: GIT_DIR(rel), GIT_WORK_TREE=wt at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here/15/wt
#	setup: cwd: $here/15
#	setup: prefix: (null)
#	EOF
#		test_repo 15 .git "$here/15/wt"
#	
not ok - 170 #15: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here/15/wt
#	setup: cwd: $here/15
#	setup: prefix: (null)
#	EOF
#		test_repo 15 .git wt
#	
not ok - 171 #15: GIT_DIR, GIT_WORK_TREE=wt(rel) at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here/15/wt
#	setup: cwd: $here/15
#	setup: prefix: (null)
#	EOF
#		test_repo 15 "$here/15/.git" wt
#	
not ok - 172 #15: GIT_DIR, GIT_WORK_TREE=wt at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here/15/wt
#	setup: cwd: $here/15
#	setup: prefix: (null)
#	EOF
#		test_repo 15 "$here/15/.git" "$here/15/wt"
#	
not ok - 173 #15: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here/15/wt
#	setup: cwd: $here/15/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 15/sub/sub ../../.git "$here/15/wt"
#	
not ok - 174 #15: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here/15/wt
#	setup: cwd: $here/15/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 15/sub/sub ../../.git ../../wt
#	
not ok - 175 #15: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here/15/wt
#	setup: cwd: $here/15/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 15/sub/sub "$here/15/.git" ../../wt
#	
not ok - 176 #15: GIT_DIR, GIT_WORK_TREE=wt in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here/15/wt
#	setup: cwd: $here/15/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 15/sub/sub "$here/15/.git" "$here/15/wt"
#	
not ok - 177 #15: GIT_DIR(rel), GIT_WORK_TREE=.. at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 15/
#	EOF
#		test_repo 15 .git "$here"
#	
not ok - 178 #15: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 15/
#	EOF
#		test_repo 15 .git ..
#	
not ok - 179 #15: GIT_DIR, GIT_WORK_TREE=..(rel) at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 15/
#	EOF
#		test_repo 15 "$here/15/.git" ..
#	
not ok - 180 #15: GIT_DIR, GIT_WORK_TREE=.. at root
#	
#		cat >15/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 15/
#	EOF
#		test_repo 15 "$here/15/.git" "$here"
#	
not ok - 181 #15: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 15/sub/sub/
#	EOF
#		test_repo 15/sub/sub ../../.git "$here"
#	
not ok - 182 #15: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 15/sub/sub/
#	EOF
#		test_repo 15/sub/sub ../../.git ../../..
#	
not ok - 183 #15: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 15/sub/sub/
#	EOF
#		test_repo 15/sub/sub "$here/15/.git" ../../../
#	
not ok - 184 #15: GIT_DIR, GIT_WORK_TREE=.. in subdir
#	
#		cat >15/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/15.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 15/sub/sub/
#	EOF
#		test_repo 15/sub/sub "$here/15/.git" "$here"
#	
ok 185 - #16.1: setup
not ok - 186 #16.1: at .git
#	
#		cat >16/.git/expected <<EOF &&
#	setup: git_dir: .
#	setup: worktree: (null)
#	setup: cwd: $here/16/.git
#	setup: prefix: (null)
#	EOF
#		test_repo 16/.git
#	
not ok - 187 #16.1: in .git/wt
#	
#		cat >16/.git/wt/expected <<EOF &&
#	setup: git_dir: $here/16/.git
#	setup: worktree: (null)
#	setup: cwd: $here/16/.git/wt
#	setup: prefix: (null)
#	EOF
#		test_repo 16/.git/wt
#	
not ok - 188 #16.1: in .git/wt/sub
#	
#		cat >16/.git/wt/sub/expected <<EOF &&
#	setup: git_dir: $here/16/.git
#	setup: worktree: (null)
#	setup: cwd: $here/16/.git/wt/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 16/.git/wt/sub
#	
ok 189 - #16.2: setup
not ok - 190 #16.2: at .git
#	
#		cat >16/.git/expected <<EOF &&
#	setup: git_dir: .
#	setup: worktree: (null)
#	setup: cwd: $here/16/.git
#	setup: prefix: (null)
#	EOF
#		test_repo 16/.git
#	
not ok - 191 #16.2: in .git/wt
#	
#		cat >16/.git/wt/expected <<EOF &&
#	setup: git_dir: $here/16/.git
#	setup: worktree: (null)
#	setup: cwd: $here/16/.git/wt
#	setup: prefix: (null)
#	EOF
#		test_repo 16/.git/wt
#	
not ok - 192 #16.2: in .git/wt/sub
#	
#		cat >16/.git/wt/sub/expected <<EOF &&
#	setup: git_dir: $here/16/.git
#	setup: worktree: (null)
#	setup: cwd: $here/16/.git/wt/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 16/.git/wt/sub
#	
not ok - 193 #16.2: at root
#	
#		cat >16/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: (null)
#	setup: cwd: $here/16
#	setup: prefix: (null)
#	EOF
#		test_repo 16
#	
not ok - 194 #16.2: in subdir
#	
#		cat >16/sub/expected <<EOF &&
#	setup: git_dir: $here/16/.git
#	setup: worktree: (null)
#	setup: cwd: $here/16/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 16/sub
#	
ok 195 - #17.1: setup
not ok - 196 #17.1: at .git
#	
#		cat >17/.git/expected <<EOF &&
#	setup: git_dir: .
#	setup: worktree: (null)
#	setup: cwd: $here/17/.git
#	setup: prefix: (null)
#	EOF
#		test_repo 17/.git
#	
not ok - 197 #17.1: in .git/wt
#	
#		cat >17/.git/wt/expected <<EOF &&
#	setup: git_dir: $here/17/.git
#	setup: worktree: (null)
#	setup: cwd: $here/17/.git/wt
#	setup: prefix: (null)
#	EOF
#		test_repo 17/.git/wt
#	
not ok - 198 #17.1: in .git/wt/sub
#	
#		cat >17/.git/wt/sub/expected <<EOF &&
#	setup: git_dir: $here/17/.git
#	setup: worktree: (null)
#	setup: cwd: $here/17/.git/wt/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 17/.git/wt/sub
#	
ok 199 - #17.2: setup
not ok - 200 #17.2: at .git
#	
#		cat >17/.git/expected <<EOF &&
#	setup: git_dir: .
#	setup: worktree: (null)
#	setup: cwd: $here/17/.git
#	setup: prefix: (null)
#	EOF
#		test_repo 17/.git
#	
not ok - 201 #17.2: in .git/wt
#	
#		cat >17/.git/wt/expected <<EOF &&
#	setup: git_dir: $here/17/.git
#	setup: worktree: (null)
#	setup: cwd: $here/17/.git/wt
#	setup: prefix: (null)
#	EOF
#		test_repo 17/.git/wt
#	
not ok - 202 #17.2: in .git/wt/sub
#	
#		cat >17/.git/wt/sub/expected <<EOF &&
#	setup: git_dir: $here/17/.git
#	setup: worktree: (null)
#	setup: cwd: $here/17/.git/wt/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 17/.git/wt/sub
#	
not ok - 203 #17.2: at root
#	
#		cat >17/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: (null)
#	setup: cwd: $here/17
#	setup: prefix: (null)
#	EOF
#		test_repo 17
#	
not ok - 204 #17.2: in subdir
#	
#		cat >17/sub/expected <<EOF &&
#	setup: git_dir: $here/17/.git
#	setup: worktree: (null)
#	setup: cwd: $here/17/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 17/sub
#	
ok 205 - #18: setup
not ok - 206 #18: (rel) at root
#	
#		cat >18/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: (null)
#	setup: cwd: $here/18
#	setup: prefix: (null)
#	EOF
#		 test_repo 18 .git
#	
not ok - 207 #18: at root
#	
#		cat >18/expected <<EOF &&
#	setup: git_dir: $here/18/.git
#	setup: worktree: (null)
#	setup: cwd: $here/18
#	setup: prefix: (null)
#	EOF
#		 test_repo 18 "$here/18/.git"
#	
not ok - 208 #18: (rel) in subdir
#	
#		cat >18/sub/expected <<EOF &&
#	setup: git_dir: ../.git
#	setup: worktree: (null)
#	setup: cwd: $here/18/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 18/sub ../.git
#	
not ok - 209 #18: in subdir
#	
#		cat >18/sub/expected <<EOF &&
#	setup: git_dir: $here/18/.git
#	setup: worktree: (null)
#	setup: cwd: $here/18/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 18/sub "$here/18/.git"
#	
ok 210 - #19: setup
not ok - 211 #19: GIT_DIR(rel), GIT_WORK_TREE=root at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/19
#	setup: cwd: $here/19
#	setup: prefix: (null)
#	EOF
#		test_repo 19 .git "$here/19"
#	
not ok - 212 #19: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/19
#	setup: cwd: $here/19
#	setup: prefix: (null)
#	EOF
#		test_repo 19 .git .
#	
not ok - 213 #19: GIT_DIR, GIT_WORK_TREE=root at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here/19
#	setup: cwd: $here/19
#	setup: prefix: (null)
#	EOF
#		test_repo 19 "$here/19/.git" "$here/19"
#	
not ok - 214 #19: GIT_DIR, GIT_WORK_TREE=root(rel) at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here/19
#	setup: cwd: $here/19
#	setup: prefix: (null)
#	EOF
#		test_repo 19 "$here/19/.git" .
#	
not ok - 215 #19: GIT_DIR(rel), GIT_WORKTREE=root in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here/19
#	setup: cwd: $here/19
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 19/sub/sub ../../.git "$here/19"
#	
not ok - 216 #19: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here/19
#	setup: cwd: $here/19
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 19/sub/sub ../../.git ../..
#	
not ok - 217 #19: GIT_DIR, GIT_WORKTREE=root in subdir
#	
#		cat >19/sub/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here/19
#	setup: cwd: $here/19
#	setup: prefix: sub/
#	EOF
#		test_repo 19/sub "$here/19/.git" "$here/19"
#	
not ok - 218 #19: GIT_DIR, GIT_WORKTREE=root(rel) in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here/19
#	setup: cwd: $here/19
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 19/sub/sub "$here/19/.git" ../..
#	
not ok - 219 #19: GIT_DIR(rel), GIT_WORK_TREE=wt at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/19/wt
#	setup: cwd: $here/19
#	setup: prefix: (null)
#	EOF
#		test_repo 19 .git "$here/19/wt"
#	
not ok - 220 #19: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/19/wt
#	setup: cwd: $here/19
#	setup: prefix: (null)
#	EOF
#		test_repo 19 .git wt
#	
not ok - 221 #19: GIT_DIR, GIT_WORK_TREE=wt(rel) at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here/19/wt
#	setup: cwd: $here/19
#	setup: prefix: (null)
#	EOF
#		test_repo 19 "$here/19/.git" wt
#	
not ok - 222 #19: GIT_DIR, GIT_WORK_TREE=wt at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here/19/wt
#	setup: cwd: $here/19
#	setup: prefix: (null)
#	EOF
#		test_repo 19 "$here/19/.git" "$here/19/wt"
#	
not ok - 223 #19: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $here/19/wt
#	setup: cwd: $here/19/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 19/sub/sub ../../.git "$here/19/wt"
#	
not ok - 224 #19: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $here/19/wt
#	setup: cwd: $here/19/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 19/sub/sub ../../.git ../../wt
#	
not ok - 225 #19: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here/19/wt
#	setup: cwd: $here/19/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 19/sub/sub "$here/19/.git" ../../wt
#	
not ok - 226 #19: GIT_DIR, GIT_WORK_TREE=wt in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here/19/wt
#	setup: cwd: $here/19/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 19/sub/sub "$here/19/.git" "$here/19/wt"
#	
not ok - 227 #19: GIT_DIR(rel), GIT_WORK_TREE=.. at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 19/
#	EOF
#		test_repo 19 .git "$here"
#	
not ok - 228 #19: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 19/
#	EOF
#		test_repo 19 .git ..
#	
not ok - 229 #19: GIT_DIR, GIT_WORK_TREE=..(rel) at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 19/
#	EOF
#		test_repo 19 "$here/19/.git" ..
#	
not ok - 230 #19: GIT_DIR, GIT_WORK_TREE=.. at root
#	
#		cat >19/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 19/
#	EOF
#		test_repo 19 "$here/19/.git" "$here"
#	
not ok - 231 #19: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 19/sub/sub/
#	EOF
#		test_repo 19/sub/sub ../../.git "$here"
#	
not ok - 232 #19: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 19/sub/sub/
#	EOF
#		test_repo 19/sub/sub ../../.git ../../..
#	
not ok - 233 #19: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 19/sub/sub/
#	EOF
#		test_repo 19/sub/sub "$here/19/.git" ../../../
#	
not ok - 234 #19: GIT_DIR, GIT_WORK_TREE=.. in subdir
#	
#		cat >19/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/19/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 19/sub/sub/
#	EOF
#		test_repo 19/sub/sub "$here/19/.git" "$here"
#	
ok 235 - #20.1: setup
not ok - 236 #20.1: at .git
#	
#		cat >20/.git/expected <<EOF &&
#	setup: git_dir: .
#	setup: worktree: (null)
#	setup: cwd: $here/20/.git
#	setup: prefix: (null)
#	EOF
#		test_repo 20/.git
#	
not ok - 237 #20.1: in .git/wt
#	
#		cat >20/.git/wt/expected <<EOF &&
#	setup: git_dir: $here/20/.git
#	setup: worktree: (null)
#	setup: cwd: $here/20/.git/wt
#	setup: prefix: (null)
#	EOF
#		test_repo 20/.git/wt
#	
not ok - 238 #20.1: in .git/wt/sub
#	
#		cat >20/.git/wt/sub/expected <<EOF &&
#	setup: git_dir: $here/20/.git
#	setup: worktree: (null)
#	setup: cwd: $here/20/.git/wt/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 20/.git/wt/sub
#	
ok 239 - #20.2: setup
not ok - 240 #20.2: at .git
#	
#		cat >20/.git/expected <<EOF &&
#	setup: git_dir: .
#	setup: worktree: (null)
#	setup: cwd: $here/20/.git
#	setup: prefix: (null)
#	EOF
#		test_repo 20/.git
#	
not ok - 241 #20.2: in .git/wt
#	
#		cat >20/.git/wt/expected <<EOF &&
#	setup: git_dir: $here/20/.git
#	setup: worktree: (null)
#	setup: cwd: $here/20/.git/wt
#	setup: prefix: (null)
#	EOF
#		test_repo 20/.git/wt
#	
not ok - 242 #20.2: in .git/wt/sub
#	
#		cat >20/.git/wt/sub/expected <<EOF &&
#	setup: git_dir: $here/20/.git
#	setup: worktree: (null)
#	setup: cwd: $here/20/.git/wt/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 20/.git/wt/sub
#	
not ok - 243 #20.2: at root
#	
#		cat >20/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: (null)
#	setup: cwd: $here/20
#	setup: prefix: (null)
#	EOF
#		test_repo 20
#	
not ok - 244 #20.2: in subdir
#	
#		cat >20/sub/expected <<EOF &&
#	setup: git_dir: $here/20/.git
#	setup: worktree: (null)
#	setup: cwd: $here/20/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 20/sub
#	
ok 245 - #21.1: setup
not ok - 246 #21.1: at .git
#	
#		cat >21/.git/expected <<EOF &&
#	setup: git_dir: .
#	setup: worktree: (null)
#	setup: cwd: $here/21/.git
#	setup: prefix: (null)
#	EOF
#		test_repo 21/.git
#	
not ok - 247 #21.1: in .git/wt
#	
#		cat >21/.git/wt/expected <<EOF &&
#	setup: git_dir: $here/21/.git
#	setup: worktree: (null)
#	setup: cwd: $here/21/.git/wt
#	setup: prefix: (null)
#	EOF
#		test_repo 21/.git/wt
#	
not ok - 248 #21.1: in .git/wt/sub
#	
#		cat >21/.git/wt/sub/expected <<EOF &&
#	setup: git_dir: $here/21/.git
#	setup: worktree: (null)
#	setup: cwd: $here/21/.git/wt/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 21/.git/wt/sub
#	
ok 249 - #21.2: setup
not ok - 250 #21.2: at .git
#	
#		cat >21/.git/expected <<EOF &&
#	setup: git_dir: .
#	setup: worktree: (null)
#	setup: cwd: $here/21/.git
#	setup: prefix: (null)
#	EOF
#		test_repo 21/.git
#	
not ok - 251 #21.2: in .git/wt
#	
#		cat >21/.git/wt/expected <<EOF &&
#	setup: git_dir: $here/21/.git
#	setup: worktree: (null)
#	setup: cwd: $here/21/.git/wt
#	setup: prefix: (null)
#	EOF
#		test_repo 21/.git/wt
#	
not ok - 252 #21.2: in .git/wt/sub
#	
#		cat >21/.git/wt/sub/expected <<EOF &&
#	setup: git_dir: $here/21/.git
#	setup: worktree: (null)
#	setup: cwd: $here/21/.git/wt/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 21/.git/wt/sub
#	
not ok - 253 #21.2: at root
#	
#		cat >21/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: (null)
#	setup: cwd: $here/21
#	setup: prefix: (null)
#	EOF
#		test_repo 21
#	
not ok - 254 #21.2: in subdir
#	
#		cat >21/sub/expected <<EOF &&
#	setup: git_dir: $here/21/.git
#	setup: worktree: (null)
#	setup: cwd: $here/21/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 21/sub
#	
ok 255 - #22.1: setup
not ok - 256 #22.1: GIT_DIR(rel), core.worktree=. at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: .
#	setup: worktree: $here/22/.git
#	setup: cwd: $here/22/.git
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/22/.git/config" core.worktree "$here/22/.git" &&
#		test_repo 22/.git .
#	
not ok - 257 #22.1: GIT_DIR(rel), core.worktree=.(rel) at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: .
#	setup: worktree: $here/22/.git
#	setup: cwd: $here/22/.git
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/22/.git/config" core.worktree . &&
#		test_repo 22/.git .
#	
not ok - 258 #22.1: GIT_DIR, core.worktree=. at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22/.git
#	setup: cwd: $here/22/.git
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/22/.git/config" core.worktree "$here/22/.git" &&
#		test_repo 22/.git "$here/22/.git"
#	
not ok - 259 #22.1: GIT_DIR, core.worktree=.(rel) at root
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22/.git
#	setup: cwd: $here/22/.git
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/22/.git/config" core.worktree . &&
#		test_repo 22/.git "$here/22/.git"
#	
not ok - 260 #22.1: GIT_DIR(rel), core.worktree=. in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22/.git
#	setup: cwd: $here/22/.git
#	setup: prefix: sub/
#	EOF
#		git config --file="$here/22/.git/config" core.worktree "$here/22/.git" &&
#		test_repo 22/.git/sub ..
#	
not ok - 261 #22.1: GIT_DIR(rel), core.worktree=.(rel) in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22/.git
#	setup: cwd: $here/22/.git
#	setup: prefix: sub/
#	EOF
#		git config --file="$here/22/.git/config" core.worktree . &&
#		test_repo 22/.git/sub/ ..
#	
not ok - 262 #22.1: GIT_DIR, core.worktree=. in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22/.git
#	setup: cwd: $here/22/.git
#	setup: prefix: sub/
#	EOF
#		git config --file="$here/22/.git/config" core.worktree "$here/22/.git" &&
#		test_repo 22/.git/sub "$here/22/.git"
#	
not ok - 263 #22.1: GIT_DIR, core.worktree=.(rel) in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22/.git
#	setup: cwd: $here/22/.git
#	setup: prefix: sub/
#	EOF
#		git config --file="$here/22/.git/config" core.worktree . &&
#		test_repo 22/.git/sub "$here/22/.git"
#	
not ok - 264 #22.1: GIT_DIR(rel), core.worktree=wt at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: .
#	setup: worktree: $here/22/.git/wt
#	setup: cwd: $here/22/.git
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/22/.git/config" core.worktree "$here/22/.git/wt" &&
#		test_repo 22/.git .
#	
not ok - 265 #22.1: GIT_DIR(rel), core.worktree=wt(rel) at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: .
#	setup: worktree: $here/22/.git/wt
#	setup: cwd: $here/22/.git
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/22/.git/config" core.worktree wt &&
#		test_repo 22/.git .
#	
not ok - 266 #22.1: GIT_DIR, core.worktree=wt(rel) at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22/.git/wt
#	setup: cwd: $here/22/.git
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/22/.git/config" core.worktree wt &&
#		test_repo 22/.git "$here/22/.git"
#	
not ok - 267 #22.1: GIT_DIR, core.worktree=wt at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22/.git/wt
#	setup: cwd: $here/22/.git
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/22/.git/config" core.worktree "$here/22/.git/wt" &&
#		test_repo 22/.git "$here/22/.git"
#	
not ok - 268 #22.1: GIT_DIR(rel), core.worktree=wt in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: ..
#	setup: worktree: $here/22/.git/wt
#	setup: cwd: $here/22/.git/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/22/.git/config" core.worktree "$here/22/.git/wt" &&
#		test_repo 22/.git/sub ..
#	
not ok - 269 #22.1: GIT_DIR(rel), core.worktree=wt(rel) in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: ..
#	setup: worktree: $here/22/.git/wt
#	setup: cwd: $here/22/.git/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/22/.git/config" core.worktree wt &&
#		test_repo 22/.git/sub ..
#	
not ok - 270 #22.1: GIT_DIR, core.worktree=wt(rel) in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22/.git/wt
#	setup: cwd: $here/22/.git/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/22/.git/config" core.worktree wt &&
#		test_repo 22/.git/sub "$here/22/.git"
#	
not ok - 271 #22.1: GIT_DIR, core.worktree=wt in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22/.git/wt
#	setup: cwd: $here/22/.git/sub
#	setup: prefix: (null)
#	EOF
#		git config --file="$here/22/.git/config" core.worktree "$here/22/.git/wt" &&
#		test_repo 22/.git/sub "$here/22/.git"
#	
not ok - 272 #22.1: GIT_DIR(rel), core.worktree=.. at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22
#	setup: cwd: $here/22
#	setup: prefix: .git/
#	EOF
#		git config --file="$here/22/.git/config" core.worktree "$here/22" &&
#		test_repo 22/.git .
#	
not ok - 273 #22.1: GIT_DIR(rel), core.worktree=..(rel) at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22
#	setup: cwd: $here/22
#	setup: prefix: .git/
#	EOF
#		git config --file="$here/22/.git/config" core.worktree .. &&
#		test_repo 22/.git .
#	
not ok - 274 #22.1: GIT_DIR, core.worktree=..(rel) at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22
#	setup: cwd: $here/22
#	setup: prefix: .git/
#	EOF
#		git config --file="$here/22/.git/config" core.worktree .. &&
#		test_repo 22/.git "$here/22/.git"
#	
not ok - 275 #22.1: GIT_DIR, core.worktree=.. at .git
#	
#		cat >22/.git/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22
#	setup: cwd: $here/22
#	setup: prefix: .git/
#	EOF
#		git config --file="$here/22/.git/config" core.worktree "$here/22" &&
#		test_repo 22/.git "$here/22/.git"
#	
not ok - 276 #22.1: GIT_DIR(rel), core.worktree=.. in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22
#	setup: cwd: $here/22
#	setup: prefix: .git/sub/
#	EOF
#		git config --file="$here/22/.git/config" core.worktree "$here/22" &&
#		test_repo 22/.git/sub ..
#	
not ok - 277 #22.1: GIT_DIR(rel), core.worktree=..(rel) in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22
#	setup: cwd: $here/22
#	setup: prefix: .git/sub/
#	EOF
#		git config --file="$here/22/.git/config" core.worktree .. &&
#		test_repo 22/.git/sub ..
#	
not ok - 278 #22.1: GIT_DIR, core.worktree=..(rel) in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22
#	setup: cwd: $here/22
#	setup: prefix: .git/sub/
#	EOF
#		git config --file="$here/22/.git/config" core.worktree .. &&
#		test_repo 22/.git/sub "$here/22/.git"
#	
not ok - 279 #22.1: GIT_DIR, core.worktree=.. in .git/sub
#	
#		cat >22/.git/sub/expected <<EOF &&
#	setup: git_dir: $here/22/.git
#	setup: worktree: $here/22
#	setup: cwd: $here/22
#	setup: prefix: .git/sub/
#	EOF
#		git config --file="$here/22/.git/config" core.worktree "$here/22" &&
#		test_repo 22/.git/sub "$here/22/.git"
#	
ok 280 - #22.2: setup
not ok - 281 #22.2: at .git
#	
#		(
#		cd 22/.git &&
#		GIT_DIR=. &&
#		export GIT_DIR &&
#		test_must_fail git symbolic-ref HEAD 2>result &&
#		grep "core.bare and core.worktree do not make sense" result
#		)
#	
not ok - 282 #22.2: at root
#	
#		(
#		cd 22 &&
#		GIT_DIR=.git &&
#		export GIT_DIR &&
#		test_must_fail git symbolic-ref HEAD 2>result &&
#		grep "core.bare and core.worktree do not make sense" result
#		)
#	
ok 283 - #23: setup
not ok - 284 #23: GIT_DIR(rel), GIT_WORK_TREE=root at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/23
#	setup: cwd: $here/23
#	setup: prefix: (null)
#	EOF
#		test_repo 23 .git "$here/23"
#	
not ok - 285 #23: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/23
#	setup: cwd: $here/23
#	setup: prefix: (null)
#	EOF
#		test_repo 23 .git .
#	
not ok - 286 #23: GIT_DIR, GIT_WORK_TREE=root at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here/23
#	setup: cwd: $here/23
#	setup: prefix: (null)
#	EOF
#		test_repo 23 "$here/23/.git" "$here/23"
#	
not ok - 287 #23: GIT_DIR, GIT_WORK_TREE=root(rel) at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here/23
#	setup: cwd: $here/23
#	setup: prefix: (null)
#	EOF
#		test_repo 23 "$here/23/.git" .
#	
not ok - 288 #23: GIT_DIR(rel), GIT_WORKTREE=root in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here/23
#	setup: cwd: $here/23
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 23/sub/sub ../../.git "$here/23"
#	
not ok - 289 #23: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here/23
#	setup: cwd: $here/23
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 23/sub/sub ../../.git ../..
#	
not ok - 290 #23: GIT_DIR, GIT_WORKTREE=root in subdir
#	
#		cat >23/sub/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here/23
#	setup: cwd: $here/23
#	setup: prefix: sub/
#	EOF
#		test_repo 23/sub "$here/23/.git" "$here/23"
#	
not ok - 291 #23: GIT_DIR, GIT_WORKTREE=root(rel) in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here/23
#	setup: cwd: $here/23
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 23/sub/sub "$here/23/.git" ../..
#	
not ok - 292 #23: GIT_DIR(rel), GIT_WORK_TREE=wt at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/23/wt
#	setup: cwd: $here/23
#	setup: prefix: (null)
#	EOF
#		test_repo 23 .git "$here/23/wt"
#	
not ok - 293 #23: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: .git
#	setup: worktree: $here/23/wt
#	setup: cwd: $here/23
#	setup: prefix: (null)
#	EOF
#		test_repo 23 .git wt
#	
not ok - 294 #23: GIT_DIR, GIT_WORK_TREE=wt(rel) at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here/23/wt
#	setup: cwd: $here/23
#	setup: prefix: (null)
#	EOF
#		test_repo 23 "$here/23/.git" wt
#	
not ok - 295 #23: GIT_DIR, GIT_WORK_TREE=wt at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here/23/wt
#	setup: cwd: $here/23
#	setup: prefix: (null)
#	EOF
#		test_repo 23 "$here/23/.git" "$here/23/wt"
#	
not ok - 296 #23: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $here/23/wt
#	setup: cwd: $here/23/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 23/sub/sub ../../.git "$here/23/wt"
#	
not ok - 297 #23: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: ../../.git
#	setup: worktree: $here/23/wt
#	setup: cwd: $here/23/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 23/sub/sub ../../.git ../../wt
#	
not ok - 298 #23: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here/23/wt
#	setup: cwd: $here/23/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 23/sub/sub "$here/23/.git" ../../wt
#	
not ok - 299 #23: GIT_DIR, GIT_WORK_TREE=wt in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here/23/wt
#	setup: cwd: $here/23/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 23/sub/sub "$here/23/.git" "$here/23/wt"
#	
not ok - 300 #23: GIT_DIR(rel), GIT_WORK_TREE=.. at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 23/
#	EOF
#		test_repo 23 .git "$here"
#	
not ok - 301 #23: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 23/
#	EOF
#		test_repo 23 .git ..
#	
not ok - 302 #23: GIT_DIR, GIT_WORK_TREE=..(rel) at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 23/
#	EOF
#		test_repo 23 "$here/23/.git" ..
#	
not ok - 303 #23: GIT_DIR, GIT_WORK_TREE=.. at root
#	
#		cat >23/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 23/
#	EOF
#		test_repo 23 "$here/23/.git" "$here"
#	
not ok - 304 #23: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 23/sub/sub/
#	EOF
#		test_repo 23/sub/sub ../../.git "$here"
#	
not ok - 305 #23: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 23/sub/sub/
#	EOF
#		test_repo 23/sub/sub ../../.git ../../..
#	
not ok - 306 #23: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 23/sub/sub/
#	EOF
#		test_repo 23/sub/sub "$here/23/.git" ../../../
#	
not ok - 307 #23: GIT_DIR, GIT_WORK_TREE=.. in subdir
#	
#		cat >23/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/23/.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 23/sub/sub/
#	EOF
#		test_repo 23/sub/sub "$here/23/.git" "$here"
#	
ok 308 - #24: setup
not ok - 309 #24: at root
#	
#		cat >24/expected <<EOF &&
#	setup: git_dir: $here/24.git
#	setup: worktree: (null)
#	setup: cwd: $here/24
#	setup: prefix: (null)
#	EOF
#		test_repo 24
#	
not ok - 310 #24: in subdir
#	
#		cat >24/sub/expected <<EOF &&
#	setup: git_dir: $here/24.git
#	setup: worktree: (null)
#	setup: cwd: $here/24/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 24/sub
#	
ok 311 - #25: setup
not ok - 312 #25: at root
#	
#		cat >25/expected <<EOF &&
#	setup: git_dir: $here/25.git
#	setup: worktree: (null)
#	setup: cwd: $here/25
#	setup: prefix: (null)
#	EOF
#		test_repo 25
#	
not ok - 313 #25: in subdir
#	
#		cat >25/sub/expected <<EOF &&
#	setup: git_dir: $here/25.git
#	setup: worktree: (null)
#	setup: cwd: $here/25/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 25/sub
#	
ok 314 - #26: setup
not ok - 315 #26: (rel) at root
#	
#		cat >26/expected <<EOF &&
#	setup: git_dir: $here/26.git
#	setup: worktree: (null)
#	setup: cwd: $here/26
#	setup: prefix: (null)
#	EOF
#		 test_repo 26 .git
#	
not ok - 316 #26: at root
#	
#		cat >26/expected <<EOF &&
#	setup: git_dir: $here/26.git
#	setup: worktree: (null)
#	setup: cwd: $here/26
#	setup: prefix: (null)
#	EOF
#		 test_repo 26 "$here/26/.git"
#	
not ok - 317 #26: (rel) in subdir
#	
#		cat >26/sub/expected <<EOF &&
#	setup: git_dir: $here/26.git
#	setup: worktree: (null)
#	setup: cwd: $here/26/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 26/sub ../.git
#	
not ok - 318 #26: in subdir
#	
#		cat >26/sub/expected <<EOF &&
#	setup: git_dir: $here/26.git
#	setup: worktree: (null)
#	setup: cwd: $here/26/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 26/sub "$here/26/.git"
#	
ok 319 - #27: setup
not ok - 320 #27: GIT_DIR(rel), GIT_WORK_TREE=root at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here/27
#	setup: cwd: $here/27
#	setup: prefix: (null)
#	EOF
#		test_repo 27 .git "$here/27"
#	
not ok - 321 #27: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here/27
#	setup: cwd: $here/27
#	setup: prefix: (null)
#	EOF
#		test_repo 27 .git .
#	
not ok - 322 #27: GIT_DIR, GIT_WORK_TREE=root at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here/27
#	setup: cwd: $here/27
#	setup: prefix: (null)
#	EOF
#		test_repo 27 "$here/27/.git" "$here/27"
#	
not ok - 323 #27: GIT_DIR, GIT_WORK_TREE=root(rel) at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here/27
#	setup: cwd: $here/27
#	setup: prefix: (null)
#	EOF
#		test_repo 27 "$here/27/.git" .
#	
not ok - 324 #27: GIT_DIR(rel), GIT_WORKTREE=root in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here/27
#	setup: cwd: $here/27
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 27/sub/sub ../../.git "$here/27"
#	
not ok - 325 #27: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here/27
#	setup: cwd: $here/27
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 27/sub/sub ../../.git ../..
#	
not ok - 326 #27: GIT_DIR, GIT_WORKTREE=root in subdir
#	
#		cat >27/sub/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here/27
#	setup: cwd: $here/27
#	setup: prefix: sub/
#	EOF
#		test_repo 27/sub "$here/27/.git" "$here/27"
#	
not ok - 327 #27: GIT_DIR, GIT_WORKTREE=root(rel) in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here/27
#	setup: cwd: $here/27
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 27/sub/sub "$here/27/.git" ../..
#	
not ok - 328 #27: GIT_DIR(rel), GIT_WORK_TREE=wt at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here/27/wt
#	setup: cwd: $here/27
#	setup: prefix: (null)
#	EOF
#		test_repo 27 .git "$here/27/wt"
#	
not ok - 329 #27: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here/27/wt
#	setup: cwd: $here/27
#	setup: prefix: (null)
#	EOF
#		test_repo 27 .git wt
#	
not ok - 330 #27: GIT_DIR, GIT_WORK_TREE=wt(rel) at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here/27/wt
#	setup: cwd: $here/27
#	setup: prefix: (null)
#	EOF
#		test_repo 27 "$here/27/.git" wt
#	
not ok - 331 #27: GIT_DIR, GIT_WORK_TREE=wt at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here/27/wt
#	setup: cwd: $here/27
#	setup: prefix: (null)
#	EOF
#		test_repo 27 "$here/27/.git" "$here/27/wt"
#	
not ok - 332 #27: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here/27/wt
#	setup: cwd: $here/27/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 27/sub/sub ../../.git "$here/27/wt"
#	
not ok - 333 #27: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here/27/wt
#	setup: cwd: $here/27/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 27/sub/sub ../../.git ../../wt
#	
not ok - 334 #27: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here/27/wt
#	setup: cwd: $here/27/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 27/sub/sub "$here/27/.git" ../../wt
#	
not ok - 335 #27: GIT_DIR, GIT_WORK_TREE=wt in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here/27/wt
#	setup: cwd: $here/27/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 27/sub/sub "$here/27/.git" "$here/27/wt"
#	
not ok - 336 #27: GIT_DIR(rel), GIT_WORK_TREE=.. at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 27/
#	EOF
#		test_repo 27 .git "$here"
#	
not ok - 337 #27: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 27/
#	EOF
#		test_repo 27 .git ..
#	
not ok - 338 #27: GIT_DIR, GIT_WORK_TREE=..(rel) at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 27/
#	EOF
#		test_repo 27 "$here/27/.git" ..
#	
not ok - 339 #27: GIT_DIR, GIT_WORK_TREE=.. at root
#	
#		cat >27/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 27/
#	EOF
#		test_repo 27 "$here/27/.git" "$here"
#	
not ok - 340 #27: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 27/sub/sub/
#	EOF
#		test_repo 27/sub/sub ../../.git "$here"
#	
not ok - 341 #27: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 27/sub/sub/
#	EOF
#		test_repo 27/sub/sub ../../.git ../../..
#	
not ok - 342 #27: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 27/sub/sub/
#	EOF
#		test_repo 27/sub/sub "$here/27/.git" ../../../
#	
not ok - 343 #27: GIT_DIR, GIT_WORK_TREE=.. in subdir
#	
#		cat >27/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/27.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 27/sub/sub/
#	EOF
#		test_repo 27/sub/sub "$here/27/.git" "$here"
#	
ok 344 - #28: setup
not ok - 345 #28: at root
#	
#		cat >28/expected <<EOF &&
#	setup: git_dir: $here/28.git
#	setup: worktree: (null)
#	setup: cwd: $here/28
#	setup: prefix: (null)
#	EOF
#		test_repo 28
#	
not ok - 346 #28: in subdir
#	
#		cat >28/sub/expected <<EOF &&
#	setup: git_dir: $here/28.git
#	setup: worktree: (null)
#	setup: cwd: $here/28/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 28/sub
#	
ok 347 - #29: setup
not ok - 348 #29: at root
#	
#		cat >29/expected <<EOF &&
#	setup: git_dir: $here/29.git
#	setup: worktree: (null)
#	setup: cwd: $here/29
#	setup: prefix: (null)
#	EOF
#		test_repo 29
#	
not ok - 349 #29: in subdir
#	
#		cat >29/sub/expected <<EOF &&
#	setup: git_dir: $here/29.git
#	setup: worktree: (null)
#	setup: cwd: $here/29/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 29/sub
#	
ok 350 - #30: setup
not ok - 351 #30: at root
#	
#		(
#		cd 30 &&
#		GIT_DIR=.git &&
#		export GIT_DIR &&
#		test_must_fail git symbolic-ref HEAD 2>result &&
#		grep "core.bare and core.worktree do not make sense" result
#		)
#	
ok 352 - #31: setup
not ok - 353 #31: GIT_DIR(rel), GIT_WORK_TREE=root at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here/31
#	setup: cwd: $here/31
#	setup: prefix: (null)
#	EOF
#		test_repo 31 .git "$here/31"
#	
not ok - 354 #31: GIT_DIR(rel), GIT_WORK_TREE=root(rel) at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here/31
#	setup: cwd: $here/31
#	setup: prefix: (null)
#	EOF
#		test_repo 31 .git .
#	
not ok - 355 #31: GIT_DIR, GIT_WORK_TREE=root at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here/31
#	setup: cwd: $here/31
#	setup: prefix: (null)
#	EOF
#		test_repo 31 "$here/31/.git" "$here/31"
#	
not ok - 356 #31: GIT_DIR, GIT_WORK_TREE=root(rel) at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here/31
#	setup: cwd: $here/31
#	setup: prefix: (null)
#	EOF
#		test_repo 31 "$here/31/.git" .
#	
not ok - 357 #31: GIT_DIR(rel), GIT_WORKTREE=root in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here/31
#	setup: cwd: $here/31
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 31/sub/sub ../../.git "$here/31"
#	
not ok - 358 #31: GIT_DIR(rel), GIT_WORKTREE=root(rel) in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here/31
#	setup: cwd: $here/31
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 31/sub/sub ../../.git ../..
#	
not ok - 359 #31: GIT_DIR, GIT_WORKTREE=root in subdir
#	
#		cat >31/sub/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here/31
#	setup: cwd: $here/31
#	setup: prefix: sub/
#	EOF
#		test_repo 31/sub "$here/31/.git" "$here/31"
#	
not ok - 360 #31: GIT_DIR, GIT_WORKTREE=root(rel) in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here/31
#	setup: cwd: $here/31
#	setup: prefix: sub/sub/
#	EOF
#		test_repo 31/sub/sub "$here/31/.git" ../..
#	
not ok - 361 #31: GIT_DIR(rel), GIT_WORK_TREE=wt at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here/31/wt
#	setup: cwd: $here/31
#	setup: prefix: (null)
#	EOF
#		test_repo 31 .git "$here/31/wt"
#	
not ok - 362 #31: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here/31/wt
#	setup: cwd: $here/31
#	setup: prefix: (null)
#	EOF
#		test_repo 31 .git wt
#	
not ok - 363 #31: GIT_DIR, GIT_WORK_TREE=wt(rel) at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here/31/wt
#	setup: cwd: $here/31
#	setup: prefix: (null)
#	EOF
#		test_repo 31 "$here/31/.git" wt
#	
not ok - 364 #31: GIT_DIR, GIT_WORK_TREE=wt at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here/31/wt
#	setup: cwd: $here/31
#	setup: prefix: (null)
#	EOF
#		test_repo 31 "$here/31/.git" "$here/31/wt"
#	
not ok - 365 #31: GIT_DIR(rel), GIT_WORK_TREE=wt in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here/31/wt
#	setup: cwd: $here/31/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 31/sub/sub ../../.git "$here/31/wt"
#	
not ok - 366 #31: GIT_DIR(rel), GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here/31/wt
#	setup: cwd: $here/31/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 31/sub/sub ../../.git ../../wt
#	
not ok - 367 #31: GIT_DIR, GIT_WORK_TREE=wt(rel) in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here/31/wt
#	setup: cwd: $here/31/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 31/sub/sub "$here/31/.git" ../../wt
#	
not ok - 368 #31: GIT_DIR, GIT_WORK_TREE=wt in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here/31/wt
#	setup: cwd: $here/31/sub/sub
#	setup: prefix: (null)
#	EOF
#		test_repo 31/sub/sub "$here/31/.git" "$here/31/wt"
#	
not ok - 369 #31: GIT_DIR(rel), GIT_WORK_TREE=.. at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 31/
#	EOF
#		test_repo 31 .git "$here"
#	
not ok - 370 #31: GIT_DIR(rel), GIT_WORK_TREE=..(rel) at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 31/
#	EOF
#		test_repo 31 .git ..
#	
not ok - 371 #31: GIT_DIR, GIT_WORK_TREE=..(rel) at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 31/
#	EOF
#		test_repo 31 "$here/31/.git" ..
#	
not ok - 372 #31: GIT_DIR, GIT_WORK_TREE=.. at root
#	
#		cat >31/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 31/
#	EOF
#		test_repo 31 "$here/31/.git" "$here"
#	
not ok - 373 #31: GIT_DIR(rel), GIT_WORK_TREE=.. in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 31/sub/sub/
#	EOF
#		test_repo 31/sub/sub ../../.git "$here"
#	
not ok - 374 #31: GIT_DIR(rel), GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 31/sub/sub/
#	EOF
#		test_repo 31/sub/sub ../../.git ../../..
#	
not ok - 375 #31: GIT_DIR, GIT_WORK_TREE=..(rel) in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 31/sub/sub/
#	EOF
#		test_repo 31/sub/sub "$here/31/.git" ../../../
#	
not ok - 376 #31: GIT_DIR, GIT_WORK_TREE=.. in subdir
#	
#		cat >31/sub/sub/expected <<EOF &&
#	setup: git_dir: $here/31.git
#	setup: worktree: $here
#	setup: cwd: $here
#	setup: prefix: 31/sub/sub/
#	EOF
#		test_repo 31/sub/sub "$here/31/.git" "$here"
#	
# failed 339 among 376 test(s)
1..376
