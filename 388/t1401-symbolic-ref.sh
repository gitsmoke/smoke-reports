Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1401-symbolic-ref/.git/
expecting success: 
	git symbolic-ref HEAD refs/heads/foo &&
	echo ref: refs/heads/foo >expect &&
	test_cmp expect .git/HEAD

ok 1 - symbolic-ref writes HEAD
expecting success: 
	echo refs/heads/foo >expect &&
	git symbolic-ref HEAD >actual &&
	test_cmp expect actual

ok 2 - symbolic-ref reads HEAD
expecting success: 
	test_must_fail git symbolic-ref HEAD foo
ok 3 - symbolic-ref refuses non-ref for HEAD
expecting success: 
	echo content >file && git add file && git commit -m one &&
	test_must_fail git symbolic-ref HEAD `git rev-parse HEAD`
[foo (root-commit) f16b484] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
ok 4 - symbolic-ref refuses bare sha1

# passed all 4 test(s)
1..4
