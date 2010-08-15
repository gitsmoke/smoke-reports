core.worktree = relative path
ok 1 - outside: is-bare-repository
ok 2 - outside: is-inside-git-dir
ok 3 - outside: is-inside-work-tree
ok 4 - inside: is-bare-repository
ok 5 - inside: is-inside-git-dir
ok 6 - inside: is-inside-work-tree
ok 7 - inside: prefix
ok 8 - subdirectory: is-bare-repository
ok 9 - subdirectory: is-inside-git-dir
ok 10 - subdirectory: is-inside-work-tree
ok 11 - subdirectory: prefix
core.worktree = absolute path
ok 12 - outside: is-bare-repository
ok 13 - outside: is-inside-git-dir
ok 14 - outside: is-inside-work-tree
ok 15 - outside2: is-bare-repository
ok 16 - outside2: is-inside-git-dir
ok 17 - outside2: is-inside-work-tree
ok 18 - inside: is-bare-repository
ok 19 - inside: is-inside-git-dir
ok 20 - inside: is-inside-work-tree
ok 21 - inside: prefix
ok 22 - subdirectory: is-bare-repository
ok 23 - subdirectory: is-inside-git-dir
ok 24 - subdirectory: is-inside-work-tree
ok 25 - subdirectory: prefix
GIT_WORK_TREE=relative path (override core.worktree)
ok 26 - outside: is-bare-repository
ok 27 - outside: is-inside-git-dir
ok 28 - outside: is-inside-work-tree
ok 29 - outside: is-bare-repository
ok 30 - outside: is-inside-git-dir
ok 31 - outside: is-inside-work-tree
ok 32 - inside: is-bare-repository
ok 33 - inside: is-inside-git-dir
ok 34 - inside: is-inside-work-tree
ok 35 - inside: prefix
ok 36 - subdirectory: is-bare-repository
ok 37 - subdirectory: is-inside-git-dir
ok 38 - subdirectory: is-inside-work-tree
ok 39 - subdirectory: prefix
GIT_WORK_TREE=absolute path, work tree below git dir
ok 40 - outside: is-bare-repository
ok 41 - outside: is-inside-git-dir
ok 42 - outside: is-inside-work-tree
ok 43 - in repo.git: is-bare-repository
ok 44 - in repo.git: is-inside-git-dir
ok 45 - in repo.git: is-inside-work-tree
ok 46 - in repo.git/objects: is-bare-repository
ok 47 - in repo.git/objects: is-inside-git-dir
ok 48 - in repo.git/objects: is-inside-work-tree
ok 49 - in repo.git/work2: is-bare-repository
ok 50 - in repo.git/work2: is-inside-git-dir
ok 51 - in repo.git/work2: is-inside-work-tree
ok 52 - in repo.git/work: is-bare-repository
ok 53 - in repo.git/work: is-inside-git-dir
ok 54 - in repo.git/work: is-inside-work-tree
ok 55 - in repo.git/work: prefix
ok 56 - in repo.git/sub/dir: is-bare-repository
ok 57 - in repo.git/sub/dir: is-inside-git-dir
ok 58 - in repo.git/sub/dir: is-inside-work-tree
ok 59 - in repo.git/sub/dir: prefix
ok 60 - repo finds its work tree
ok 61 - repo finds its work tree from work tree, too
ok 62 - _gently() groks relative GIT_DIR & GIT_WORK_TREE
ok 63 - git diff-index
ok 64 - git diff-files
ok 65 - git diff
ok 66 - git grep
ok 67 - git commit
ok 68 - absolute pathspec should fail gracefully
ok 69 - make_relative_path handles double slashes in GIT_DIR
# passed all 69 test(s)
1..69
