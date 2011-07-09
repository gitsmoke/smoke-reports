ok 1 - setup a submodule tree
ok 2 - test basic "submodule foreach" usage
ok 3 - setup nested submodules
ok 4 - use "submodule foreach" to checkout 2nd level submodule
ok 5 - use "foreach --recursive" to checkout all submodules
ok 6 - test messages from "foreach --recursive"
ok 7 - test "foreach --quiet --recursive"
ok 8 - use "update --recursive" to checkout all submodules
ok 9 - test "status --recursive"
ok 10 - ensure "status --cached --recursive" preserves the --cached flag
ok 11 - use "git clone --recursive" to checkout all submodules
ok 12 - test "update --recursive" with a flag with spaces
ok 13 - use "update --recursive nested1" to checkout all submodules rooted in nested1
ok 14 - command passed to foreach retains notion of stdin
ok 15 - command passed to foreach --recursive retains notion of stdin
# passed all 15 test(s)
1..15
