ok 1 - setup
ok 2 - status (1)
ok 3 - status (2)
ok 4 - status (advice.statusHints false)
ok 5 - status -s
ok 6 - status -s -b
ok 7 - status -uno
ok 8 - status (status.showUntrackedFiles no)
ok 9 - status -uno (advice.statusHints false)
ok 10 - status -s -uno
ok 11 - status -s (status.showUntrackedFiles no)
ok 12 - status -unormal
ok 13 - status (status.showUntrackedFiles normal)
ok 14 - status -s -unormal
ok 15 - status -s (status.showUntrackedFiles normal)
ok 16 - status -uall
ok 17 - status (status.showUntrackedFiles all)
ok 18 - status -s -uall
ok 19 - status -s (status.showUntrackedFiles all)
ok 20 - status with relative paths
ok 21 - status -s with relative paths
ok 22 - status --porcelain ignores relative paths setting
ok 23 - setup unique colors
ok 24 - status with color.ui
ok 25 - status with color.status
ok 26 - status -s with color.ui
ok 27 - status -s with color.status
ok 28 - status -s -b with color.status
ok 29 - status --porcelain ignores color.ui
ok 30 - status --porcelain ignores color.status
ok 31 - status --porcelain ignores -b
ok 32 - status without relative paths
ok 33 - status -s without relative paths
ok 34 - dry-run of partial commit excluding new file in index
ok 35 - status refreshes the index
ok 36 - setup status submodule summary
ok 37 - status submodule summary is disabled by default
ok 38 - status --untracked-files=all does not show submodule
ok 39 - status -s submodule summary is disabled by default
ok 40 - status -s --untracked-files=all does not show submodule
ok 41 - status submodule summary
ok 42 - status -s submodule summary
ok 43 - status submodule summary (clean submodule)
ok 44 - status -s submodule summary (clean submodule)
ok 45 - commit --dry-run submodule summary (--amend)
ok 46 - status succeeds in a read-only repository
ok 47 - --ignore-submodules=untracked suppresses submodules with untracked content
ok 48 - --ignore-submodules=dirty suppresses submodules with untracked content
ok 49 - --ignore-submodules=dirty suppresses submodules with modified content
ok 50 - --ignore-submodules=untracked doesn't suppress submodules with modified content
ok 51 - --ignore-submodules=untracked doesn't suppress submodule summary
ok 52 - --ignore-submodules=dirty doesn't suppress submodule summary
ok 53 - --ignore-submodules=all suppresses submodule summary
# passed all 53 test(s)
1..53
