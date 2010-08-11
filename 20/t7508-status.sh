ok 1 - setup
ok 2 - status (1)
ok 3 - status (2)
ok 4 - status (advice.statusHints false)
ok 5 - status -s
ok 6 - status -s -b
ok 7 - set up dir3 for untracked files tests
ok 8 - status -uno
ok 9 - status (status.showUntrackedFiles no)
ok 10 - status -uno (advice.statusHints false)
ok 11 - setup: status -s -uno expected output
ok 12 - status -s -uno
ok 13 - status -s (status.showUntrackedFiles no)
ok 14 - setup: status -unormal expected output
ok 15 - status -unormal
ok 16 - status (status.showUntrackedFiles normal)
ok 17 - setup: status -s -unormal expected output
ok 18 - status -s -unormal
ok 19 - status -s (status.showUntrackedFiles normal)
ok 20 - setup: status -uall expected output
ok 21 - status -uall
ok 22 - status (status.showUntrackedFiles all)
ok 23 - setup: status -s -uall expected output
ok 24 - status -s -uall
ok 25 - status -s (status.showUntrackedFiles all)
ok 26 - setup: done with dir3
ok 27 - status with relative paths
ok 28 - status -s with relative paths
ok 29 - status --porcelain ignores relative paths setting
ok 30 - setup: unique colors
ok 31 - setup: expect colorful output
ok 32 - status with color.ui
ok 33 - status with color.status
ok 34 - setup: expected colorful short output
ok 35 - status -s with color.ui
ok 36 - status -s with color.status
ok 37 - status -s -b with color.status
ok 38 - setup: expect uncolorful status --porcelain output
ok 39 - status --porcelain ignores color.ui
ok 40 - status --porcelain ignores color.status
ok 41 - setup: recover unconditionally from color tests
ok 42 - status --porcelain ignores -b
ok 43 - status without relative paths
ok 44 - status -s without relative paths
ok 45 - dry-run of partial commit excluding new file in index
ok 46 - status refreshes the index
ok 47 - setup status submodule summary
ok 48 - status submodule summary is disabled by default
ok 49 - status --untracked-files=all does not show submodule
ok 50 - setup status -s submodule summary
ok 51 - status -s submodule summary is disabled by default
ok 52 - status -s --untracked-files=all does not show submodule
ok 53 - setup: save head
ok 54 - status submodule summary
ok 55 - status -s submodule summary
ok 56 - status submodule summary (clean submodule)
ok 57 - status -s submodule summary (clean submodule)
ok 58 - commit --dry-run submodule summary (--amend)
ok 59 - status succeeds in a read-only repository
ok 60 - setup: status --ignore-submodules
ok 61 - --ignore-submodules=untracked suppresses submodules with untracked content
ok 62 - --ignore-submodules=dirty suppresses submodules with untracked content
ok 63 - --ignore-submodules=dirty suppresses submodules with modified content
ok 64 - --ignore-submodules=untracked doesn't suppress submodules with modified content
ok 65 - setup
ok 66 - --ignore-submodules=untracked doesn't suppress submodule summary
ok 67 - --ignore-submodules=dirty doesn't suppress submodule summary
ok 68 - --ignore-submodules=all suppresses submodule summary
# passed all 68 test(s)
1..68
