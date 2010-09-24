ok 1 - setup repository with dos files
ok 2 - am with dos files without --keep-cr
ok 3 - am with dos files with --keep-cr
ok 4 - am with dos files config am.keepcr
ok 5 - am with dos files config am.keepcr overriden by --no-keep-cr
ok 6 - am with dos files with --keep-cr continue
not ok - 7 am with unix files config am.keepcr overriden by --no-keep-cr
#	
#		git config am.keepcr 1 &&
#		git checkout -b unixfiles-conf-keepcr-override initial &&
#		cp -f file1 file &&
#		git commit -m "line ending to unix" file &&
#		git format-patch -k initial..master &&
#		git am -k -3 --no-keep-cr 000*.patch &&
#		git diff --exit-code -w master
#	
# failed 1 among 7 test(s)
1..7
