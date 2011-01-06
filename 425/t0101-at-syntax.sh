Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0101-at-syntax/.git/
expecting success: 
	test_commit one &&
	test_commit two
[master (root-commit) d79ce16] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 one.t
[master 139b20d] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 two.t

ok 1 - setup
expecting success: 
	check_at @{0} two

ok 2 - @{0} shows current

expecting success: 
	check_at @{1} one


ok 3 - @{1} shows old

expecting success: 
	check_at @{now} two


ok 4 - @{now} shows current

expecting success: 
	check_at @{2001-09-17} one

ok 5 - @{2001-09-17} (before the first commit) shows old

expecting success: 
	check_at @{3.hot.dogs.on.2001-09-17} one


ok 6 - silly approxidates work

expecting success: 
	test_must_fail git log -1 --format=%s @{usptream}

ok 7 - notice misspelled upstream

expecting success: 
	test_must_fail git log -1 --format=%s @{utter.bogosity}


ok 8 - complain about total nonsense

# passed all 8 test(s)
1..8
