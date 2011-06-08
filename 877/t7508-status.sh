ok 1 - status -h in broken repository
ok 2 - commit -h in broken repository
ok 3 - setup
ok 4 - status (1)
ok 5 - status (2)
ok 6 - status (advice.statusHints false)
ok 7 - status -s
ok 8 - status -s -b
ok 9 - setup dir3
ok 10 - status -uno
ok 11 - status (status.showUntrackedFiles no)
ok 12 - status -uno (advice.statusHints false)
ok 13 - status -s -uno
ok 14 - status -s (status.showUntrackedFiles no)
ok 15 - status -unormal
ok 16 - status (status.showUntrackedFiles normal)
ok 17 - status -s -unormal
ok 18 - status -s (status.showUntrackedFiles normal)
ok 19 - status -uall
ok 20 - status (status.showUntrackedFiles all)
ok 21 - teardown dir3
ok 22 - status -s -uall
ok 23 - status -s (status.showUntrackedFiles all)
ok 24 - status with relative paths
ok 25 - status -s with relative paths
ok 26 - status --porcelain ignores relative paths setting
ok 27 - setup unique colors
ok 28 - status with color.ui
ok 29 - status with color.status
ok 30 - status -s with color.ui
ok 31 - status -s with color.status
ok 32 - status -s -b with color.status
ok 33 - status --porcelain ignores color.ui
ok 34 - status --porcelain ignores color.status
ok 35 - status --porcelain ignores -b
ok 36 - status without relative paths
ok 37 - status -s without relative paths
ok 38 - dry-run of partial commit excluding new file in index
ok 39 - status refreshes the index
ok 40 - setup status submodule summary
ok 41 - status submodule summary is disabled by default
ok 42 - status --untracked-files=all does not show submodule
ok 43 - status -s submodule summary is disabled by default
ok 44 - status -s --untracked-files=all does not show submodule
ok 45 - status submodule summary
ok 46 - status -s submodule summary
ok 47 - status submodule summary (clean submodule): commit
ok 48 - status -s submodule summary (clean submodule)
ok 49 - status -z implies porcelain
ok 50 - commit --dry-run submodule summary (--amend)
ok 51 - status succeeds in a read-only repository
ok 52 - --ignore-submodules=untracked suppresses submodules with untracked content
ok 53 - .gitmodules ignore=untracked suppresses submodules with untracked content
ok 54 - .git/config ignore=untracked suppresses submodules with untracked content
ok 55 - --ignore-submodules=dirty suppresses submodules with untracked content
ok 56 - .gitmodules ignore=dirty suppresses submodules with untracked content
ok 57 - .git/config ignore=dirty suppresses submodules with untracked content
ok 58 - --ignore-submodules=dirty suppresses submodules with modified content
ok 59 - .gitmodules ignore=dirty suppresses submodules with modified content
ok 60 - .git/config ignore=dirty suppresses submodules with modified content
ok 61 - --ignore-submodules=untracked doesn't suppress submodules with modified content
ok 62 - .gitmodules ignore=untracked doesn't suppress submodules with modified content
ok 63 - .git/config ignore=untracked doesn't suppress submodules with modified content
ok 64 - --ignore-submodules=untracked doesn't suppress submodule summary
ok 65 - .gitmodules ignore=untracked doesn't suppress submodule summary
ok 66 - .git/config ignore=untracked doesn't suppress submodule summary
ok 67 - --ignore-submodules=dirty doesn't suppress submodule summary
ok 68 - .gitmodules ignore=dirty doesn't suppress submodule summary
ok 69 - .git/config ignore=dirty doesn't suppress submodule summary
ok 70 - --ignore-submodules=all suppresses submodule summary
not ok 71 - .gitmodules ignore=all suppresses submodule summary # TODO known breakage
not ok 72 - .git/config ignore=all suppresses submodule summary # TODO known breakage
# still have 2 known breakage(s)
# passed all remaining 70 test(s)
1..72
