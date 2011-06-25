ok 1 - setup
ok 2 - set up fuzz_conflict() helper
ok 3 - Merge after setting text=auto
ok 4 - Merge addition of text=auto
ok 5 - Detect CRLF/LF conflict after setting text=auto
ok 6 - Detect LF/CRLF conflict from addition of text=auto
not ok 7 - checkout -m after setting text=auto # TODO known breakage
not ok 8 - checkout -m addition of text=auto # TODO known breakage
not ok 9 - cherry-pick patch from after text=auto was added # TODO known breakage
ok 10 - Test delete/normalize conflict
# still have 3 known breakage(s)
# passed all remaining 7 test(s)
1..10
