ok 1 - setup
ok 2 - failed cherry-pick does not advance HEAD
not ok - 3 advice from failed cherry-pick
#	
#		git checkout -f initial^0 &&
#		git read-tree -u --reset HEAD &&
#		git clean -d -f -f -q -x &&
#	
#		git update-index --refresh &&
#		git diff-index --exit-code HEAD &&
#	
#		picked=$(git rev-parse --short picked) &&
#		cat <<-EOF >expected &&
#		error: could not apply $picked... picked
#		hint: after resolving the conflicts, mark the corrected paths
#		hint: with 'git add <paths>' or 'git rm <paths>'
#		hint: and commit the result with 'git commit -c $picked'
#		EOF
#		test_must_fail git cherry-pick picked 2>actual &&
#	
#		test_cmp expected actual
#	
ok 4 - failed cherry-pick produces dirty index
ok 5 - failed cherry-pick registers participants in index
ok 6 - failed cherry-pick describes conflict in work tree
ok 7 - diff3 -m style
ok 8 - revert also handles conflicts sanely
ok 9 - revert conflict, diff3 -m style
# failed 1 among 9 test(s)
1..9
