ok 1 - setup
ok 2 - format-patch --ignore-if-in-upstream
ok 3 - format-patch --ignore-if-in-upstream
ok 4 - format-patch result applies
ok 5 - format-patch --ignore-if-in-upstream result applies
ok 6 - commit did not screw up the log message
ok 7 - format-patch did not screw up the log message
ok 8 - replay did not screw up the log message
ok 9 - extra headers
ok 10 - extra headers without newlines
ok 11 - extra headers with multiple To:s
ok 12 - additional command line cc
ok 13 - command line headers
ok 14 - configuration headers and command line headers
ok 15 - command line To: header
ok 16 - configuration To: header
ok 17 - --no-to overrides config.to
ok 18 - --no-to and --to replaces config.to
ok 19 - --no-cc overrides config.cc
ok 20 - --no-add-headers overrides config.headers
ok 21 - multiple files
ok 22 - no threading
ok 23 - thread
ok 24 - thread in-reply-to
ok 25 - thread cover-letter
ok 26 - thread cover-letter in-reply-to
ok 27 - thread explicit shallow
ok 28 - thread deep
ok 29 - thread deep in-reply-to
ok 30 - thread deep cover-letter
ok 31 - thread deep cover-letter in-reply-to
ok 32 - thread via config
ok 33 - thread deep via config
ok 34 - thread config + override
ok 35 - thread config + --no-thread
ok 36 - excessive subject
ok 37 - cover-letter inherits diff options
ok 38 - shortlog of cover-letter wraps overly-long onelines
ok 39 - format-patch respects -U
ok 40 - format-patch -p suppresses stat
ok 41 - format-patch from a subdirectory (1)
ok 42 - format-patch from a subdirectory (2)
ok 43 - format-patch from a subdirectory (3)
ok 44 - format-patch --in-reply-to
ok 45 - format-patch --signoff
ok 46 - options no longer allowed for format-patch
ok 47 - format-patch --numstat should produce a patch
ok 48 - format-patch -- <path>
ok 49 - format-patch --ignore-if-in-upstream HEAD
not ok - 50 format-patch --signature
#	
#		git format-patch --stdout --signature="my sig" -1 >output &&
#		grep "my sig" output
#	
not ok - 51 format-patch with format.signature config
#	
#		git config format.signature "config sig" &&
#		git format-patch --stdout -1 >output &&
#		grep "config sig" output
#	
not ok - 52 format-patch --signature overrides format.signature
#	
#		git config format.signature "config sig" &&
#		git format-patch --stdout --signature="overrides" -1 >output &&
#		! grep "config sig" output &&
#		grep "overrides" output
#	
not ok - 53 format-patch --no-signature ignores format.signature
#	
#		git config format.signature "config sig" &&
#		git format-patch --stdout --signature="my sig" --no-signature \
#			-1 >output &&
#		! grep "config sig" output &&
#		! grep "my sig" output &&
#		! grep "^-- \$" output
#	
not ok - 54 format-patch --signature --cover-letter
#	
#		git config --unset-all format.signature &&
#		git format-patch --stdout --signature="my sig" --cover-letter \
#			-1 >output &&
#		grep "my sig" output &&
#		test 2 = $(grep "my sig" output | wc -l)
#	
not ok - 55 format.signature="" supresses signatures
#	
#		git config format.signature "" &&
#		git format-patch --stdout -1 >output &&
#		! grep "^-- \$" output
#	
not ok - 56 format-patch --no-signature supresses signatures
#	
#		git config --unset-all format.signature &&
#		git format-patch --stdout --no-signature -1 >output &&
#		! grep "^-- \$" output
#	
not ok - 57 format-patch --signature="" supresses signatures
#	
#		git format-patch --signature="" -1 >output &&
#		! grep "^-- \$" output
#	
# failed 8 among 57 test(s)
1..57
