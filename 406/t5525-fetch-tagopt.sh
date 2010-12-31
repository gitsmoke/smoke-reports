Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5525-fetch-tagopt/.git/
expecting success: 
	test_commit test &&
	setup_clone one &&
	git config remote.remote_one.tagopt --no-tags &&
	setup_clone two &&
	git config remote.remote_two.tagopt --tags
	
[master (root-commit) 14f901a] test
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 test.t
Cloning into bare repository one...
done.
Cloning into bare repository two...
done.

ok 1 - setup

expecting success: 
	git fetch remote_one &&
	test_must_fail git show-ref tag_one
	

ok 2 - fetch with tagopt=--no-tags does not get tag

expecting success: 
	git fetch --tags remote_one &&
	git show-ref tag_one
	
14f901a95ebae912feb4805f40ef68f15b0192c2 refs/tags/tag_one

ok 3 - fetch --tags with tagopt=--no-tags gets tag
expecting success: 
	git fetch --no-tags remote_two &&
	test_must_fail git show-ref tag_two
	

ok 4 - fetch --no-tags with tagopt=--tags does not get tag

expecting success: 
	git fetch remote_two &&
	git show-ref tag_two
	
14f901a95ebae912feb4805f40ef68f15b0192c2 refs/tags/tag_two

ok 5 - fetch with tagopt=--tags gets tag

# passed all 5 test(s)
1..5
