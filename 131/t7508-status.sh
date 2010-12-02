ok 1 - setup
ok 2 - status (1)
ok 3 - status (2)
ok 4 - status (advice.statusHints false)
ok 5 - status -s
ok 6 - status -s -b
ok 7 - setup dir3
ok 8 - status -uno
ok 9 - status (status.showUntrackedFiles no)
ok 10 - status -uno (advice.statusHints false)
ok 11 - status -s -uno
ok 12 - status -s (status.showUntrackedFiles no)
ok 13 - status -unormal
ok 14 - status (status.showUntrackedFiles normal)
ok 15 - status -s -unormal
ok 16 - status -s (status.showUntrackedFiles normal)
ok 17 - status -uall
ok 18 - status (status.showUntrackedFiles all)
ok 19 - teardown dir3
ok 20 - status -s -uall
ok 21 - status -s (status.showUntrackedFiles all)
ok 22 - status with relative paths
ok 23 - status -s with relative paths
ok 24 - status --porcelain ignores relative paths setting
ok 25 - setup unique colors
ok 26 - status with color.ui
ok 27 - status with color.status
ok 28 - status -s with color.ui
ok 29 - status -s with color.status
ok 30 - status -s -b with color.status
ok 31 - status --porcelain ignores color.ui
ok 32 - status --porcelain ignores color.status
ok 33 - status --porcelain ignores -b
ok 34 - status without relative paths
ok 35 - status -s without relative paths
ok 36 - dry-run of partial commit excluding new file in index
ok 37 - dry-run of partial commit excluding new file in index: output
ok 38 - status refreshes the index
ok 39 - setup status submodule summary
ok 40 - status submodule summary is disabled by default
ok 41 - status --untracked-files=all does not show submodule
ok 42 - status -s submodule summary is disabled by default
ok 43 - status -s --untracked-files=all does not show submodule
ok 44 - status submodule summary
ok 45 - status -s submodule summary
ok 46 - status submodule summary (clean submodule): commit
ok 47 - status submodule summary (clean submodule): output
ok 48 - status -s submodule summary (clean submodule)
ok 49 - commit --dry-run submodule summary (--amend)
ok 50 - status succeeds in a read-only repository
ok 51 - --ignore-submodules=untracked suppresses submodules with untracked content
ok 52 - .gitmodules ignore=untracked suppresses submodules with untracked content
ok 53 - .git/config ignore=untracked suppresses submodules with untracked content
ok 54 - --ignore-submodules=dirty suppresses submodules with untracked content
ok 55 - .gitmodules ignore=dirty suppresses submodules with untracked content
ok 56 - .git/config ignore=dirty suppresses submodules with untracked content
ok 57 - --ignore-submodules=dirty suppresses submodules with modified content
ok 58 - .gitmodules ignore=dirty suppresses submodules with modified content
ok 59 - .git/config ignore=dirty suppresses submodules with modified content
ok 60 - --ignore-submodules=untracked doesn't suppress submodules with modified content
ok 61 - .gitmodules ignore=untracked doesn't suppress submodules with modified content
ok 62 - .git/config ignore=untracked doesn't suppress submodules with modified content
ok 63 - --ignore-submodules=untracked doesn't suppress submodule summary
ok 64 - .gitmodules ignore=untracked doesn't suppress submodule summary
ok 65 - .git/config ignore=untracked doesn't suppress submodule summary
ok 66 - --ignore-submodules=dirty doesn't suppress submodule summary
ok 67 - .gitmodules ignore=dirty doesn't suppress submodule summary
ok 68 - .git/config ignore=dirty doesn't suppress submodule summary
ok 69 - --ignore-submodules=all suppresses submodule summary
not ok 70 - .gitmodules ignore=all suppresses submodule summary # TODO known breakage
not ok 71 - .git/config ignore=all suppresses submodule summary # TODO known breakage
# still have 2 known breakage(s)
# passed all remaining 69 test(s)
1..71
