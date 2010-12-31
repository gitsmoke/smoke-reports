Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1500-rev-parse/.git/
expecting success: test 'false' = "$(git rev-parse --is-bare-repository)"

ok 1 - toplevel: is-bare-repository
expecting success: test 'false' = "$(git rev-parse --is-inside-git-dir)"
ok 2 - toplevel: is-inside-git-dir
expecting success: test 'true' = "$(git rev-parse --is-inside-work-tree)"
ok 3 - toplevel: is-inside-work-tree
expecting success: test '' = "$(git rev-parse --show-prefix)"
ok 4 - toplevel: prefix
expecting success: test '.git' = "$(git rev-parse --git-dir)"
ok 5 - toplevel: git-dir
expecting success: test 'false' = "$(git rev-parse --is-bare-repository)"
ok 6 - .git/: is-bare-repository
expecting success: test 'true' = "$(git rev-parse --is-inside-git-dir)"
ok 7 - .git/: is-inside-git-dir
expecting success: test 'false' = "$(git rev-parse --is-inside-work-tree)"
ok 8 - .git/: is-inside-work-tree
expecting success: test '' = "$(git rev-parse --show-prefix)"

ok 9 - .git/: prefix

expecting success: test '.' = "$(git rev-parse --git-dir)"

ok 10 - .git/: git-dir

expecting success: test 'false' = "$(git rev-parse --is-bare-repository)"

ok 11 - .git/objects/: is-bare-repository

expecting success: test 'true' = "$(git rev-parse --is-inside-git-dir)"

ok 12 - .git/objects/: is-inside-git-dir

expecting success: test 'false' = "$(git rev-parse --is-inside-work-tree)"

ok 13 - .git/objects/: is-inside-work-tree

expecting success: test '' = "$(git rev-parse --show-prefix)"

ok 14 - .git/objects/: prefix

expecting success: test '/Users/trast/git-smoke/t/trash directory.t1500-rev-parse/.git' = "$(git rev-parse --git-dir)"

ok 15 - .git/objects/: git-dir

expecting success: test 'false' = "$(git rev-parse --is-bare-repository)"

ok 16 - subdirectory: is-bare-repository

expecting success: test 'false' = "$(git rev-parse --is-inside-git-dir)"

ok 17 - subdirectory: is-inside-git-dir
expecting success: test 'true' = "$(git rev-parse --is-inside-work-tree)"
ok 18 - subdirectory: is-inside-work-tree
expecting success: test 'sub/dir/' = "$(git rev-parse --show-prefix)"

ok 19 - subdirectory: prefix
expecting success: test '/Users/trast/git-smoke/t/trash directory.t1500-rev-parse/.git' = "$(git rev-parse --git-dir)"
ok 20 - subdirectory: git-dir
expecting success: test 'true' = "$(git rev-parse --is-bare-repository)"
ok 21 - core.bare = true: is-bare-repository
expecting success: test 'false' = "$(git rev-parse --is-inside-git-dir)"
ok 22 - core.bare = true: is-inside-git-dir
expecting success: test 'false' = "$(git rev-parse --is-inside-work-tree)"

ok 23 - core.bare = true: is-inside-work-tree
expecting success: test 'false' = "$(git rev-parse --is-bare-repository)"
ok 24 - core.bare undefined: is-bare-repository
expecting success: test 'false' = "$(git rev-parse --is-inside-git-dir)"
ok 25 - core.bare undefined: is-inside-git-dir
expecting success: test 'true' = "$(git rev-parse --is-inside-work-tree)"
ok 26 - core.bare undefined: is-inside-work-tree
expecting success: test 'false' = "$(git rev-parse --is-bare-repository)"
ok 27 - GIT_DIR=../.git, core.bare = false: is-bare-repository
expecting success: test 'false' = "$(git rev-parse --is-inside-git-dir)"
ok 28 - GIT_DIR=../.git, core.bare = false: is-inside-git-dir
expecting success: test 'true' = "$(git rev-parse --is-inside-work-tree)"

ok 29 - GIT_DIR=../.git, core.bare = false: is-inside-work-tree

expecting success: test '' = "$(git rev-parse --show-prefix)"

ok 30 - GIT_DIR=../.git, core.bare = false: prefix

expecting success: test 'true' = "$(git rev-parse --is-bare-repository)"

ok 31 - GIT_DIR=../.git, core.bare = true: is-bare-repository

expecting success: test 'false' = "$(git rev-parse --is-inside-git-dir)"

ok 32 - GIT_DIR=../.git, core.bare = true: is-inside-git-dir

expecting success: test 'false' = "$(git rev-parse --is-inside-work-tree)"

ok 33 - GIT_DIR=../.git, core.bare = true: is-inside-work-tree

expecting success: test '' = "$(git rev-parse --show-prefix)"

ok 34 - GIT_DIR=../.git, core.bare = true: prefix
expecting success: test 'false' = "$(git rev-parse --is-bare-repository)"
ok 35 - GIT_DIR=../.git, core.bare undefined: is-bare-repository
expecting success: test 'false' = "$(git rev-parse --is-inside-git-dir)"
ok 36 - GIT_DIR=../.git, core.bare undefined: is-inside-git-dir
expecting success: test 'true' = "$(git rev-parse --is-inside-work-tree)"
ok 37 - GIT_DIR=../.git, core.bare undefined: is-inside-work-tree
expecting success: test '' = "$(git rev-parse --show-prefix)"
ok 38 - GIT_DIR=../.git, core.bare undefined: prefix
expecting success: test 'false' = "$(git rev-parse --is-bare-repository)"
ok 39 - GIT_DIR=../repo.git, core.bare = false: is-bare-repository
expecting success: test 'false' = "$(git rev-parse --is-inside-git-dir)"
ok 40 - GIT_DIR=../repo.git, core.bare = false: is-inside-git-dir
expecting success: test 'true' = "$(git rev-parse --is-inside-work-tree)"
ok 41 - GIT_DIR=../repo.git, core.bare = false: is-inside-work-tree
expecting success: test '' = "$(git rev-parse --show-prefix)"

ok 42 - GIT_DIR=../repo.git, core.bare = false: prefix
expecting success: test 'true' = "$(git rev-parse --is-bare-repository)"
ok 43 - GIT_DIR=../repo.git, core.bare = true: is-bare-repository
expecting success: test 'false' = "$(git rev-parse --is-inside-git-dir)"
ok 44 - GIT_DIR=../repo.git, core.bare = true: is-inside-git-dir
expecting success: test 'false' = "$(git rev-parse --is-inside-work-tree)"
ok 45 - GIT_DIR=../repo.git, core.bare = true: is-inside-work-tree
expecting success: test '' = "$(git rev-parse --show-prefix)"
ok 46 - GIT_DIR=../repo.git, core.bare = true: prefix
expecting success: test 'false' = "$(git rev-parse --is-bare-repository)"
ok 47 - GIT_DIR=../repo.git, core.bare undefined: is-bare-repository
expecting success: test 'false' = "$(git rev-parse --is-inside-git-dir)"
ok 48 - GIT_DIR=../repo.git, core.bare undefined: is-inside-git-dir
expecting success: test 'true' = "$(git rev-parse --is-inside-work-tree)"
ok 49 - GIT_DIR=../repo.git, core.bare undefined: is-inside-work-tree
expecting success: test '' = "$(git rev-parse --show-prefix)"
ok 50 - GIT_DIR=../repo.git, core.bare undefined: prefix
# passed all 50 test(s)
1..50
