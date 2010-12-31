Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1508-at-combinations/.git/
expecting success: 
	test_commit master-one &&
	test_commit master-two &&
	git checkout -b upstream-branch &&
	test_commit upstream-one &&
	test_commit upstream-two &&
	git checkout -b old-branch &&
	test_commit old-one &&
	test_commit old-two &&
	git checkout -b new-branch &&
	test_commit new-one &&
	test_commit new-two &&
	git config branch.old-branch.remote . &&
	git config branch.old-branch.merge refs/heads/master &&
	git config branch.new-branch.remote . &&
	git config branch.new-branch.merge refs/heads/upstream-branch
[master (root-commit) 8ff5a25] master-one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 master-one.t
[master 8164ab4] master-two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 master-two.t
[upstream-branch 101729d] upstream-one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 upstream-one.t
[upstream-branch 77f4b7f] upstream-two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 upstream-two.t
[old-branch 4e4e7fa] old-one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 old-one.t
[old-branch 3273d4d] old-two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 old-two.t
[new-branch e49ce93] new-one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 new-one.t
[new-branch c493e4b] new-two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 new-two.t

ok 1 - setup

expecting success: 
	echo 'new-two' >expect &&
	git log -1 --format=%s 'HEAD' >actual &&
	test_cmp expect actual

ok 2 - HEAD = new-two

expecting success: 
	echo 'new-one' >expect &&
	git log -1 --format=%s '@{1}' >actual &&
	test_cmp expect actual

ok 3 - @{1} = new-one

expecting success: 
	echo 'old-two' >expect &&
	git log -1 --format=%s '@{-1}' >actual &&
	test_cmp expect actual


ok 4 - @{-1} = old-two

expecting success: 
	echo 'old-one' >expect &&
	git log -1 --format=%s '@{-1}@{1}' >actual &&
	test_cmp expect actual

ok 5 - @{-1}@{1} = old-one

expecting success: 
	echo 'upstream-two' >expect &&
	git log -1 --format=%s '@{u}' >actual &&
	test_cmp expect actual

ok 6 - @{u} = upstream-two

expecting success: 
	echo 'upstream-one' >expect &&
	git log -1 --format=%s '@{u}@{1}' >actual &&
	test_cmp expect actual

ok 7 - @{u}@{1} = upstream-one

expecting success: 
	echo 'master-two' >expect &&
	git log -1 --format=%s '@{-1}@{u}' >actual &&
	test_cmp expect actual

ok 8 - @{-1}@{u} = master-two

expecting success: 
	echo 'master-one' >expect &&
	git log -1 --format=%s '@{-1}@{u}@{1}' >actual &&
	test_cmp expect actual


ok 9 - @{-1}@{u}@{1} = master-one

expecting success: 
	test_must_fail git log -1 '@{u}@{-1}'

ok 10 - @{u}@{-1} is nonsensical

expecting success: 
	test_must_fail git log -1 '@{1}@{u}'
ok 11 - @{1}@{u} is nonsensical
# passed all 11 test(s)
1..11
