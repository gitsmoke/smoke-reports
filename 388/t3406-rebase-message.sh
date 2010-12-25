Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3406-rebase-message/.git/
expecting success: 
	quick_one O &&
	git branch topic &&
	quick_one X &&
	quick_one A &&
	quick_one B &&
	quick_one Y &&

	git checkout topic &&
	quick_one A &&
	quick_one B &&
	quick_one Z &&
	git tag start


[master (root-commit) 3749684] O
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileO
[master a2df67f] X
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileX
[master 9491ce3] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileA
[master 83a6553] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileB
[master 545b0d0] Y
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileY
[topic 3729d39] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileA
[topic 85d7b9e] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileB
[topic 341b972] Z
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileZ

ok 1 - setup

expecting success: 

	git rebase -m master >report &&
	sed -n -e "/^Already applied: /p" \
		-e "/^Committed: /p" report >actual &&
	test_cmp expect actual

ok 2 - rebase -m

expecting success: 
	git reset --hard start &&
        git rebase --stat master >diffstat.txt &&
        grep "^ fileX |  *1 +$" diffstat.txt

HEAD is now at 341b972 Z
 fileX |    1 +

ok 3 - rebase --stat

expecting success: 
	git reset --hard start &&
        git config rebase.stat true &&
        git rebase master >diffstat.txt &&
        grep "^ fileX |  *1 +$" diffstat.txt
HEAD is now at 341b972 Z
 fileX |    1 +
ok 4 - rebase w/config rebase.stat
expecting success: 
	git reset --hard start &&
        git config rebase.stat true &&
        git rebase -n master >diffstat.txt &&
        ! grep "^ fileX |  *1 +$" diffstat.txt
HEAD is now at 341b972 Z
ok 5 - rebase -n overrides config rebase.stat config

# passed all 5 test(s)
1..5
