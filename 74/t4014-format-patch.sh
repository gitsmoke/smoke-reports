ok 1 - setup
ok 2 - format-patch --ignore-if-in-upstream
ok 3 - format-patch --ignore-if-in-upstream
ok 4 - format-patch doesn't consider merge commits
ok 5 - format-patch result applies
ok 6 - format-patch --ignore-if-in-upstream result applies
ok 7 - commit did not screw up the log message
ok 8 - format-patch did not screw up the log message
ok 9 - replay did not screw up the log message
ok 10 - extra headers
ok 11 - extra headers without newlines
ok 12 - extra headers with multiple To:s
ok 13 - additional command line cc
ok 14 - command line headers
ok 15 - configuration headers and command line headers
ok 16 - command line To: header
ok 17 - configuration To: header
ok 18 - --no-to overrides config.to
ok 19 - --no-to and --to replaces config.to
ok 20 - --no-cc overrides config.cc
ok 21 - --no-add-headers overrides config.headers
ok 22 - multiple files
ok 23 - no threading
ok 24 - thread
ok 25 - thread in-reply-to
ok 26 - thread cover-letter
ok 27 - thread cover-letter in-reply-to
ok 28 - thread explicit shallow
ok 29 - thread deep
ok 30 - thread deep in-reply-to
ok 31 - thread deep cover-letter
ok 32 - thread deep cover-letter in-reply-to
ok 33 - thread via config
ok 34 - thread deep via config
ok 35 - thread config + override
ok 36 - thread config + --no-thread
ok 37 - excessive subject
ok 38 - cover-letter inherits diff options
ok 39 - shortlog of cover-letter wraps overly-long onelines
ok 40 - format-patch respects -U
ok 41 - format-patch -p suppresses stat
ok 42 - format-patch from a subdirectory (1)
ok 43 - format-patch from a subdirectory (2)
ok 44 - format-patch from a subdirectory (3)
ok 45 - format-patch --in-reply-to
ok 46 - format-patch --signoff
ok 47 - options no longer allowed for format-patch
ok 48 - format-patch --numstat should produce a patch
ok 49 - format-patch -- <path>
ok 50 - format-patch --ignore-if-in-upstream HEAD
ok 51 - format-patch --signature
ok 52 - format-patch with format.signature config
ok 53 - format-patch --signature overrides format.signature
ok 54 - format-patch --no-signature ignores format.signature
ok 55 - format-patch --signature --cover-letter
ok 56 - format.signature="" supresses signatures
ok 57 - format-patch --no-signature supresses signatures
ok 58 - format-patch --signature="" supresses signatures
# passed all 58 test(s)
1..58
