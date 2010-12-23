Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1302-repo-version/.git/
expecting success: 
	cat >test.patch <<-\EOF &&
	diff --git a/test.txt b/test.txt
	new file mode 100644
	--- /dev/null
	+++ b/test.txt
	@@ -0,0 +1 @@
	+123
	EOF

	test_create_repo "test" &&
	test_create_repo "test2" &&
	GIT_CONFIG=test2/.git/config git config core.repositoryformatversion 99
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1302-repo-version/test/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1302-repo-version/test2/.git/

ok 1 - setup

expecting success: 
	echo 0 >expect &&
	git config core.repositoryformatversion >actual &&
	(
		cd test &&
		git config core.repositoryformatversion >../actual2
	) &&
	test_cmp expect actual &&
	test_cmp expect actual2

ok 2 - gitdir selection on normal repos

expecting success: 
	# Make sure it would stop at test2, not trash
	echo 99 >expect &&
	(
		cd test2 &&
		git config core.repositoryformatversion >../actual
	) &&
	test_cmp expect actual
ok 3 - gitdir selection on unsupported repo
expecting success: 
	git apply --stat test.patch &&
	(
		cd test &&
		git apply --stat ../test.patch
	) &&
	(
		cd test2 &&
		git apply --stat ../test.patch
	)
 test.txt |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 test.txt |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 test.txt |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
ok 4 - gitdir not required mode
expecting success: 
	git apply --check --index test.patch &&
	(
		cd test &&
		git apply --check --index ../test.patch
	) &&
	(
		cd test2 &&
		test_must_fail git apply --check --index ../test.patch
	)

ok 5 - gitdir required mode

# passed all 5 test(s)
1..5
