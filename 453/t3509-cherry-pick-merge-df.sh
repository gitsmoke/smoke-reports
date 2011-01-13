ok 1 - Setup rename across paths each below D/F conflicts
ok 2 - Cherry-pick succeeds with rename across D/F conflicts
ok 3 - Setup rename with file on one side matching directory name on other
ok 4 - Cherry-pick succeeds with was_a_dir/file -> was_a_dir (resolve)
not ok - 5 Cherry-pick succeeds with was_a_dir/file -> was_a_dir (recursive)
#	
#		git reset --hard &&
#		git checkout -q nick-testcase^0 &&
#		git cherry-pick --strategy=recursive simple
#	
ok 6 - Setup rename with file on one side matching different dirname on other
ok 7 - Cherry-pick with rename to different D/F conflict succeeds (resolve)
not ok - 8 Cherry-pick with rename to different D/F conflict succeeds (recursive)
#	
#		git reset --hard &&
#		git checkout -q newhead^0 &&
#		git cherry-pick --strategy=recursive mergeme
#	
# failed 2 among 8 test(s)
1..8
