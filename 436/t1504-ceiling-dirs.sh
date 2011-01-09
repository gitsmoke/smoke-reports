Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1504-ceiling-dirs/.git/
expecting success: test '' = "$(git rev-parse --show-prefix)"

ok 1 - no_ceil

expecting success: test '' = "$(git rev-parse --show-prefix)"

ok 2 - ceil_empty

expecting success: test '' = "$(git rev-parse --show-prefix)"

ok 3 - ceil_at_parent

expecting success: test '' = "$(git rev-parse --show-prefix)"

ok 4 - ceil_at_parent_slash
expecting success: test '' = "$(git rev-parse --show-prefix)"
ok 5 - ceil_at_trash
expecting success: test '' = "$(git rev-parse --show-prefix)"
ok 6 - ceil_at_trash_slash
expecting success: test '' = "$(git rev-parse --show-prefix)"
ok 7 - ceil_at_sub
expecting success: test '' = "$(git rev-parse --show-prefix)"

ok 8 - ceil_at_sub_slash

expecting success: test 'sub/dir/' = "$(git rev-parse --show-prefix)"

ok 9 - subdir_no_ceil
expecting success: test 'sub/dir/' = "$(git rev-parse --show-prefix)"
ok 10 - subdir_ceil_empty
expecting success: 
		test_expect_code 128 git rev-parse --show-prefix
	
ok 11 - subdir_ceil_at_trash: prefix
expecting success: 
		test_expect_code 128 git rev-parse --show-prefix
	
ok 12 - subdir_ceil_at_trash_slash: prefix
expecting success: 
		test_expect_code 128 git rev-parse --show-prefix
	

ok 13 - subdir_ceil_at_sub: prefix

expecting success: 
		test_expect_code 128 git rev-parse --show-prefix
	
ok 14 - subdir_ceil_at_sub_slash: prefix

expecting success: test 'sub/dir/' = "$(git rev-parse --show-prefix)"
ok 15 - subdir_ceil_at_subdir

expecting success: test 'sub/dir/' = "$(git rev-parse --show-prefix)"

ok 16 - subdir_ceil_at_subdir_slash
expecting success: test 'sub/dir/' = "$(git rev-parse --show-prefix)"
ok 17 - subdir_ceil_at_su
expecting success: test 'sub/dir/' = "$(git rev-parse --show-prefix)"
ok 18 - subdir_ceil_at_su_slash
expecting success: test 'sub/dir/' = "$(git rev-parse --show-prefix)"

ok 19 - subdir_ceil_at_sub_di

expecting success: test 'sub/dir/' = "$(git rev-parse --show-prefix)"

ok 20 - subdir_ceil_at_sub_di_slash

expecting success: test 'sub/dir/' = "$(git rev-parse --show-prefix)"

ok 21 - subdir_ceil_at_subdi

expecting success: test 'sub/dir/' = "$(git rev-parse --show-prefix)"

ok 22 - subdir_ceil_at_subdi_slash

expecting success: 
		test_expect_code 128 git rev-parse --show-prefix
	

ok 23 - second_of_two: prefix

expecting success: 
		test_expect_code 128 git rev-parse --show-prefix
	

ok 24 - first_of_two: prefix

expecting success: 
		test_expect_code 128 git rev-parse --show-prefix
	

ok 25 - second_of_three: prefix

expecting success: test '' = "$(git rev-parse --show-prefix)"
ok 26 - git_dir_specified
expecting success: test 's/d/' = "$(git rev-parse --show-prefix)"
ok 27 - sd_no_ceil
expecting success: test 's/d/' = "$(git rev-parse --show-prefix)"
ok 28 - sd_ceil_empty
expecting success: 
		test_expect_code 128 git rev-parse --show-prefix
	
ok 29 - sd_ceil_at_trash: prefix
expecting success: 
		test_expect_code 128 git rev-parse --show-prefix
	
ok 30 - sd_ceil_at_trash_slash: prefix
expecting success: 
		test_expect_code 128 git rev-parse --show-prefix
	
ok 31 - sd_ceil_at_s: prefix
expecting success: 
		test_expect_code 128 git rev-parse --show-prefix
	
ok 32 - sd_ceil_at_s_slash: prefix
expecting success: test 's/d/' = "$(git rev-parse --show-prefix)"
ok 33 - sd_ceil_at_sd
expecting success: test 's/d/' = "$(git rev-parse --show-prefix)"
ok 34 - sd_ceil_at_sd_slash
expecting success: test 's/d/' = "$(git rev-parse --show-prefix)"
ok 35 - sd_ceil_at_su
expecting success: test 's/d/' = "$(git rev-parse --show-prefix)"

ok 36 - sd_ceil_at_su_slash

expecting success: test 's/d/' = "$(git rev-parse --show-prefix)"

ok 37 - sd_ceil_at_s_di

expecting success: test 's/d/' = "$(git rev-parse --show-prefix)"

ok 38 - sd_ceil_at_s_di_slash

expecting success: test 's/d/' = "$(git rev-parse --show-prefix)"

ok 39 - sd_ceil_at_sdi

expecting success: test 's/d/' = "$(git rev-parse --show-prefix)"

ok 40 - sd_ceil_at_sdi_slash

# passed all 40 test(s)
1..40
