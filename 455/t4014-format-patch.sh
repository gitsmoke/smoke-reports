ok 1 - set up terminal for tests
ok 2 - setup
ok 3 - format-patch --ignore-if-in-upstream
ok 4 - format-patch --ignore-if-in-upstream
ok 5 - format-patch doesn't consider merge commits
ok 6 - format-patch result applies
ok 7 - format-patch --ignore-if-in-upstream result applies
ok 8 - commit did not screw up the log message
ok 9 - format-patch did not screw up the log message
ok 10 - replay did not screw up the log message
ok 11 - extra headers
ok 12 - extra headers without newlines
ok 13 - extra headers with multiple To:s
ok 14 - additional command line cc
ok 15 - command line headers
ok 16 - configuration headers and command line headers
ok 17 - command line To: header
ok 18 - configuration To: header
ok 19 - --no-to overrides config.to
ok 20 - --no-to and --to replaces config.to
ok 21 - --no-cc overrides config.cc
ok 22 - --no-add-headers overrides config.headers
ok 23 - multiple files
ok 24 - no threading
ok 25 - thread
ok 26 - thread in-reply-to
ok 27 - thread cover-letter
ok 28 - thread cover-letter in-reply-to
ok 29 - thread explicit shallow
ok 30 - thread deep
ok 31 - thread deep in-reply-to
ok 32 - thread deep cover-letter
ok 33 - thread deep cover-letter in-reply-to
ok 34 - thread via config
ok 35 - thread deep via config
ok 36 - thread config + override
ok 37 - thread config + --no-thread
ok 38 - excessive subject
ok 39 - cover-letter inherits diff options
ok 40 - shortlog of cover-letter wraps overly-long onelines
ok 41 - format-patch respects -U
ok 42 - format-patch -p suppresses stat
ok 43 - format-patch from a subdirectory (1)
ok 44 - format-patch from a subdirectory (2)
ok 45 - format-patch from a subdirectory (3)
ok 46 - format-patch --in-reply-to
ok 47 - format-patch --signoff
ok 48 - options no longer allowed for format-patch
ok 49 - format-patch --numstat should produce a patch
ok 50 - format-patch -- <path>
ok 51 - format-patch --ignore-if-in-upstream HEAD
ok 52 - format-patch --signature
ok 53 - format-patch with format.signature config
ok 54 - format-patch --signature overrides format.signature
ok 55 - format-patch --no-signature ignores format.signature
ok 56 - format-patch --signature --cover-letter
ok 57 - format.signature="" supresses signatures
ok 58 - format-patch --no-signature supresses signatures
ok 59 - format-patch --signature="" supresses signatures
ok 60 # skip format-patch --stdout paginates (missing TTY)
ok 61 # skip format-patch --stdout pagination can be disabled (missing TTY)
# passed all 61 test(s)
1..61
