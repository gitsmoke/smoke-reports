ok 1 - #0: nonbare repo, no explicit configuration
ok 2 - #1: GIT_WORK_TREE without explicit GIT_DIR is accepted
ok 3 - #2: worktree defaults to cwd with explicit GIT_DIR
ok 4 - #2b: relative GIT_DIR
ok 5 - #3: setup
ok 6 - #3: explicit GIT_WORK_TREE and GIT_DIR at toplevel
ok 7 - #3: explicit GIT_WORK_TREE and GIT_DIR in subdir
ok 8 - #3: explicit GIT_WORK_TREE from parent of worktree
ok 9 - #3: explicit GIT_WORK_TREE from nephew of worktree
ok 10 - #3: chdir_to_toplevel uses worktree, not git dir
ok 11 - #3: chdir_to_toplevel uses worktree (from subdir)
ok 12 - #4: core.worktree without GIT_DIR set is accepted
ok 13 - #5: core.worktree + GIT_WORK_TREE is accepted
ok 14 - #6: setting GIT_DIR brings core.worktree to life
ok 15 - #6b: GIT_DIR set, core.worktree relative
ok 16 - #6c: GIT_DIR set, core.worktree=../wt (absolute)
ok 17 - #6d: GIT_DIR set, core.worktree=../wt (relative)
ok 18 - #6e: GIT_DIR set, core.worktree=../.. (absolute)
ok 19 - #6f: GIT_DIR set, core.worktree=../.. (relative)
ok 20 - #7: setup
ok 21 - #7: explicit GIT_WORK_TREE and GIT_DIR at toplevel
ok 22 - #7: explicit GIT_WORK_TREE and GIT_DIR in subdir
ok 23 - #7: explicit GIT_WORK_TREE from parent of worktree
ok 24 - #7: explicit GIT_WORK_TREE from nephew of worktree
ok 25 - #7: chdir_to_toplevel uses worktree, not git dir
ok 26 - #7: chdir_to_toplevel uses worktree (from subdir)
ok 27 - #8: gitfile, easy case
ok 28 - #9: GIT_WORK_TREE accepted with gitfile
ok 29 - #10: GIT_DIR can point to gitfile
ok 30 - #10b: relative GIT_DIR can point to gitfile
ok 31 - #11: setup
ok 32 - #11: explicit GIT_WORK_TREE and GIT_DIR at toplevel
ok 33 - #11: explicit GIT_WORK_TREE and GIT_DIR in subdir
ok 34 - #11: explicit GIT_WORK_TREE from parent of worktree
ok 35 - #11: explicit GIT_WORK_TREE from nephew of worktree
ok 36 - #11: chdir_to_toplevel uses worktree, not git dir
ok 37 - #11: chdir_to_toplevel uses worktree (from subdir)
ok 38 - #12: core.worktree with gitfile is accepted
ok 39 - #13: core.worktree+GIT_WORK_TREE accepted (with gitfile)
ok 40 - #14: core.worktree with GIT_DIR pointing to gitfile
ok 41 - #14b: core.worktree is relative to actual git dir
ok 42 - #15: setup
ok 43 - #15: explicit GIT_WORK_TREE and GIT_DIR at toplevel
ok 44 - #15: explicit GIT_WORK_TREE and GIT_DIR in subdir
ok 45 - #15: explicit GIT_WORK_TREE from parent of worktree
ok 46 - #15: explicit GIT_WORK_TREE from nephew of worktree
ok 47 - #15: chdir_to_toplevel uses worktree, not git dir
ok 48 - #15: chdir_to_toplevel uses worktree (from subdir)
ok 49 - #16a: implicitly bare repo (cwd inside .git dir)
ok 50 - #16b: bare .git (cwd inside .git dir)
ok 51 - #16c: bare .git has no worktree
ok 52 - #17: GIT_WORK_TREE without explicit GIT_DIR is accepted (bare case)
ok 53 - #18: bare .git named by GIT_DIR has no worktree
ok 54 - #19: setup
ok 55 - #19: explicit GIT_WORK_TREE and GIT_DIR at toplevel
ok 56 - #19: explicit GIT_WORK_TREE and GIT_DIR in subdir
ok 57 - #19: explicit GIT_WORK_TREE from parent of worktree
ok 58 - #19: explicit GIT_WORK_TREE from nephew of worktree
ok 59 - #19: chdir_to_toplevel uses worktree, not git dir
ok 60 - #19: chdir_to_toplevel uses worktree (from subdir)
ok 61 - #20a: core.worktree without GIT_DIR accepted (inside .git)
ok 62 - #20b/c: core.worktree and core.bare conflict
ok 63 - #21: setup, core.worktree warns before overriding core.bare
ok 64 - #21: explicit GIT_WORK_TREE and GIT_DIR at toplevel
ok 65 - #21: explicit GIT_WORK_TREE and GIT_DIR in subdir
ok 66 - #21: explicit GIT_WORK_TREE from parent of worktree
ok 67 - #21: explicit GIT_WORK_TREE from nephew of worktree
ok 68 - #21: chdir_to_toplevel uses worktree, not git dir
ok 69 - #21: chdir_to_toplevel uses worktree (from subdir)
ok 70 - #22a: core.worktree = GIT_DIR = .git dir
ok 71 - #22b: core.worktree child of .git, GIT_DIR=.git
ok 72 - #22c: core.worktree = .git/.., GIT_DIR=.git
ok 73 - #22.2: core.worktree and core.bare conflict
ok 74 - #23: setup
ok 75 - #23: explicit GIT_WORK_TREE and GIT_DIR at toplevel
ok 76 - #23: explicit GIT_WORK_TREE and GIT_DIR in subdir
ok 77 - #23: explicit GIT_WORK_TREE from parent of worktree
ok 78 - #23: explicit GIT_WORK_TREE from nephew of worktree
ok 79 - #23: chdir_to_toplevel uses worktree, not git dir
ok 80 - #23: chdir_to_toplevel uses worktree (from subdir)
ok 81 - #24: bare repo has no worktree (gitfile case)
ok 82 - #25: GIT_WORK_TREE accepted if GIT_DIR unset (bare gitfile case)
ok 83 - #26: bare repo has no worktree (GIT_DIR -> gitfile case)
ok 84 - #27: setup
ok 85 - #27: explicit GIT_WORK_TREE and GIT_DIR at toplevel
ok 86 - #27: explicit GIT_WORK_TREE and GIT_DIR in subdir
ok 87 - #27: explicit GIT_WORK_TREE from parent of worktree
ok 88 - #27: explicit GIT_WORK_TREE from nephew of worktree
ok 89 - #27: chdir_to_toplevel uses worktree, not git dir
ok 90 - #27: chdir_to_toplevel uses worktree (from subdir)
ok 91 - #28: core.worktree and core.bare conflict (gitfile case)
ok 92 - #29: setup
ok 93 - #29: explicit GIT_WORK_TREE and GIT_DIR at toplevel
ok 94 - #29: explicit GIT_WORK_TREE and GIT_DIR in subdir
ok 95 - #29: explicit GIT_WORK_TREE from parent of worktree
ok 96 - #29: explicit GIT_WORK_TREE from nephew of worktree
ok 97 - #29: chdir_to_toplevel uses worktree, not git dir
ok 98 - #29: chdir_to_toplevel uses worktree (from subdir)
ok 99 - #30: core.worktree and core.bare conflict (gitfile version)
ok 100 - #31: setup
ok 101 - #31: explicit GIT_WORK_TREE and GIT_DIR at toplevel
ok 102 - #31: explicit GIT_WORK_TREE and GIT_DIR in subdir
ok 103 - #31: explicit GIT_WORK_TREE from parent of worktree
ok 104 - #31: explicit GIT_WORK_TREE from nephew of worktree
ok 105 - #31: chdir_to_toplevel uses worktree, not git dir
ok 106 - #31: chdir_to_toplevel uses worktree (from subdir)
# passed all 106 test(s)
1..106
