Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6013-rev-list-reverse-parents/.git/
expecting success: 
	commit one &&
	git tag root &&
	commit two &&
	git checkout -b side HEAD^ &&
	commit three &&
	git checkout master &&
	git merge -s ours side &&
	commit five
	
[master (root-commit) 86412ff] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master 4931c53] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[side 0fcb03e] three
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Merge made by ours.
[master 2ed4a76] five
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - set up --reverse example
expecting success: 
	git rev-list --parents --full-history master -- foo |
		perl -e "print reverse <>" > expected &&
	git rev-list --reverse --parents --full-history master -- foo \
		> actual &&
	test_cmp actual expected
	

ok 2 - --reverse --parents --full-history combines correctly

expecting success: 
	git rev-list --boundary --parents --full-history master ^root -- foo |
		perl -e "print reverse <>" > expected &&
	git rev-list --boundary --reverse --parents --full-history \
		master ^root -- foo > actual &&
	test_cmp actual expected
	

ok 3 - --boundary does too

# passed all 3 test(s)
1..3
