ok 1 - status -h in broken repository
ok 2 - commit -h in broken repository
ok 3 - setup
ok 4 - status (1)
ok 5 - status (2)
ok 6 - status (advice.statusHints false)
ok 7 - status -s
ok 8 - status with gitignore
ok 9 - status with gitignore (nothing untracked)
ok 10 - status -s -b
ok 11 - setup dir3
ok 12 - status -uno
ok 13 - status (status.showUntrackedFiles no)
ok 14 - status -uno (advice.statusHints false)
ok 15 - status -s -uno
ok 16 - status -s (status.showUntrackedFiles no)
ok 17 - status -unormal
ok 18 - status (status.showUntrackedFiles normal)
ok 19 - status -s -unormal
ok 20 - status -s (status.showUntrackedFiles normal)
ok 21 - status -uall
ok 22 - status (status.showUntrackedFiles all)
ok 23 - teardown dir3
ok 24 - status -s -uall
ok 25 - status -s (status.showUntrackedFiles all)
ok 26 - status with relative paths
ok 27 - status -s with relative paths
ok 28 - status --porcelain ignores relative paths setting
ok 29 - setup unique colors
ok 30 - status with color.ui
ok 31 - status with color.status
ok 32 - status -s with color.ui
ok 33 - status -s with color.status
ok 34 - status -s -b with color.status
ok 35 - status --porcelain ignores color.ui
ok 36 - status --porcelain ignores color.status
ok 37 - status --porcelain ignores -b
ok 38 - status without relative paths
ok 39 - status -s without relative paths
ok 40 - dry-run of partial commit excluding new file in index
ok 41 - status refreshes the index
ok 42 - setup status submodule summary
ok 43 - status submodule summary is disabled by default
ok 44 - status --untracked-files=all does not show submodule
ok 45 - status -s submodule summary is disabled by default
ok 46 - status -s --untracked-files=all does not show submodule
ok 47 - status submodule summary
ok 48 - status -s submodule summary
ok 49 - status submodule summary (clean submodule): commit
ok 50 - status -s submodule summary (clean submodule)
ok 51 - status -z implies porcelain
ok 52 - commit --dry-run submodule summary (--amend)
ok 53 - status succeeds in a read-only repository
ok 54 - --ignore-submodules=untracked suppresses submodules with untracked content
ok 55 - .gitmodules ignore=untracked suppresses submodules with untracked content
ok 56 - .git/config ignore=untracked suppresses submodules with untracked content
ok 57 - --ignore-submodules=dirty suppresses submodules with untracked content
ok 58 - .gitmodules ignore=dirty suppresses submodules with untracked content
ok 59 - .git/config ignore=dirty suppresses submodules with untracked content
ok 60 - --ignore-submodules=dirty suppresses submodules with modified content
ok 61 - .gitmodules ignore=dirty suppresses submodules with modified content
ok 62 - .git/config ignore=dirty suppresses submodules with modified content
ok 63 - --ignore-submodules=untracked doesn't suppress submodules with modified content
ok 64 - .gitmodules ignore=untracked doesn't suppress submodules with modified content
ok 65 - .git/config ignore=untracked doesn't suppress submodules with modified content
ok 66 - --ignore-submodules=untracked doesn't suppress submodule summary
ok 67 - .gitmodules ignore=untracked doesn't suppress submodule summary
ok 68 - .git/config ignore=untracked doesn't suppress submodule summary
ok 69 - --ignore-submodules=dirty doesn't suppress submodule summary
ok 70 - .gitmodules ignore=dirty doesn't suppress submodule summary
ok 71 - .git/config ignore=dirty doesn't suppress submodule summary
ok 72 - --ignore-submodules=all suppresses submodule summary
not ok 73 - .gitmodules ignore=all suppresses submodule summary # TODO known breakage
not ok 74 - .git/config ignore=all suppresses submodule summary # TODO known breakage
# still have 2 known breakage(s)
# passed all remaining 72 test(s)
1..74
