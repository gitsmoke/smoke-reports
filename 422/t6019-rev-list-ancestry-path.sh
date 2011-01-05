Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6019-rev-list-ancestry-path/.git/
expecting success: 
	test_commit A &&
	test_commit B &&
	test_commit C &&
	test_commit D &&
	test_commit E &&
	test_commit F &&
	git reset --hard C &&
	test_commit G &&
	test_merge E H &&
	test_commit I &&
	test_merge F J &&
	git reset --hard A &&
	test_commit K &&
	test_merge J L &&
	test_commit M
[master (root-commit) 0ddfaf1] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A.t
[master d9df450] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B.t
[master 35a8500] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C.t
[master be8f64f] D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 D.t
[master ee2ad00] E
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 E.t
[master 5374d8c] F
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 F.t
HEAD is now at 35a8500 C
[master fa55005] G
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 G.t
Merge made by ours.
[master 4e719b9] I
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 I.t
Merge made by ours.
HEAD is now at 0ddfaf1 A
[master 0f470b0] K
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 K.t
Merge made by ours.
[master bcafe1b] M
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 M.t

ok 1 - setup

expecting success: 
	for c in E F G H I J K L M; do echo $c; done >expect &&
	git rev-list --format=%s D..M |
	sed -e "/^commit /d" |
	sort >actual &&
	test_cmp expect actual

ok 2 - rev-list D..M

expecting success: 
	for c in E F H I J L M; do echo $c; done >expect &&
	git rev-list --ancestry-path --format=%s D..M |
	sed -e "/^commit /d" |
	sort >actual &&
	test_cmp expect actual

ok 3 - rev-list --ancestry-path D..M

expecting success: 
	echo M >expect &&
	git rev-list --format=%s D..M -- M.t |
	sed -e "/^commit /d" >actual &&
	test_cmp expect actual


ok 4 - rev-list D..M -- M.t

expecting success: 
	echo M >expect &&
	git rev-list --ancestry-path --format=%s D..M -- M.t |
	sed -e "/^commit /d" >actual &&
	test_cmp expect actual


ok 5 - rev-list --ancestry-patch D..M -- M.t

# passed all 5 test(s)
1..5
