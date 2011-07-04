ok 1 - Initialize repository
ok 2 - Setup rename across paths each below D/F conflicts
ok 3 - Cherry-pick succeeds with rename across D/F conflicts
ok 4 - Setup rename with file on one side matching directory name on other
ok 5 - Cherry-pick succeeds with was_a_dir/file -> was_a_dir (resolve)
ok 6 - Cherry-pick succeeds with was_a_dir/file -> was_a_dir (recursive)
ok 7 - Setup rename with file on one side matching different dirname on other
ok 8 - Cherry-pick with rename to different D/F conflict succeeds (resolve)
ok 9 - Cherry-pick with rename to different D/F conflict succeeds (recursive)
# passed all 9 test(s)
1..9
