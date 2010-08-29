ok 1 - setup
ok 2 - nothing recorded without rerere
ok 3 - activate rerere, old style (conflicting merge)
ok 4 - rerere.enabled works, too
ok 5 - set up rr-cache
ok 6 - rr-cache looks sane
ok 7 - rerere diff
ok 8 - rerere status
ok 9 - first postimage wins
not ok - 10 rerere updates postimage timestamp
#	
#		newmtimepost=$(test-chmtime -v +0 $rr/postimage | cut -f 1) &&
#		test $oldmtimepost -lt $newmtimepost
#	
ok 11 - rerere clear
ok 12 - set up for garbage collection tests
not ok - 13 gc preserves young or recently used records
#	
#		git rerere gc &&
#		test -f $rr/preimage &&
#		test -f $rr2/preimage
#	
ok 14 - old records rest in peace
ok 15 - setup: file2 added differently in two branches
ok 16 - resolution was recorded properly
ok 17 - rerere.autoupdate
ok 18 - merge --rerere-autoupdate
ok 19 - merge --no-rerere-autoupdate
ok 20 - set up an unresolved merge
ok 21 - explicit rerere
ok 22 - explicit rerere with autoupdate
not ok - 23 explicit rerere --rerere-autoupdate overrides
#	
#		git config rerere.autoupdate false &&
#		git rm -fr --cached . &&
#		git update-index --index-info <failedmerge &&
#		cp file3.conflict file3 &&
#		git rerere &&
#		git ls-files -u >actual1 &&
#	
#		git rm -fr --cached . &&
#		git update-index --index-info <failedmerge &&
#		cp file3.conflict file3 &&
#		git rerere --rerere-autoupdate &&
#		git update-index --refresh &&
#	
#		git rm -fr --cached . &&
#		git update-index --index-info <failedmerge &&
#		cp file3.conflict file3 &&
#		git rerere --rerere-autoupdate --no-rerere-autoupdate &&
#		git ls-files -u >actual2 &&
#	
#		git rm -fr --cached . &&
#		git update-index --index-info <failedmerge &&
#		cp file3.conflict file3 &&
#		git rerere --rerere-autoupdate --no-rerere-autoupdate --rerere-autoupdate &&
#		git update-index --refresh &&
#	
#		test_cmp expected.unresolved actual1 &&
#		test_cmp expected.unresolved actual2
#	
ok 24 - rerere --no-no-rerere-autoupdate
not ok - 25 rerere -h
#	
#		test_must_fail git rerere -h >help &&
#		grep [Uu]sage help
#	
# failed 4 among 25 test(s)
1..25
