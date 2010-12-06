ok 1 - setup
ok 2 - snapshot: full sha1
ok 3 - snapshot: shortened sha1
ok 4 - snapshot: almost full sha1
ok 5 - snapshot: HEAD
ok 6 - snapshot: short branch name (master)
ok 7 - snapshot: short tag name (first)
ok 8 - snapshot: full branch name (refs/heads/master)
ok 9 - snapshot: full tag name (refs/tags/first)
ok 10 - snapshot: hierarchical branch name (xx/test)
ok 11 - setup for caching tests (utf8 patch, binary file)
ok 12 - enable caching
not ok - 13 caching enabled, plain text (utf8) output, generating cache
#	
#			gitweb_run "p=.git;a=patch" &&
#			mv gitweb.body cache.txt &&
#			test_cmp no_cache.txt cache.txt
#		
ok 14 - caching enabled, plain text (utf8) output, cached version
not ok - 15 caching enabled, binary output (raw), generating cache
#	
#			gitweb_run "p=.git;a=blob_plain;f=image.png" &&
#			mv gitweb.body cache.png &&
#			cmp no_cache.png cache.png
#		
ok 16 - caching enabled, binary output (raw), cached version
# failed 2 among 16 test(s)
1..16
