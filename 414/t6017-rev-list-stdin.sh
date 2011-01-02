Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6017-rev-list-stdin/.git/
expecting success: 
	(
		for i in 0 $them
		do
			for j in $them
			do
				echo $i.$j >file-$j &&
				git add file-$j || exit
			done &&
			test_tick &&
			git commit -m $i || exit
		done &&
		for i in $them
		do
			git checkout -b side-$i master~$i &&
			echo updated $i >file-$i &&
			git add file-$i &&
			test_tick &&
			git commit -m side-$i || exit
		done
	)
[master (root-commit) b2718df] 0
 Author: A U Thor <author@example.com>
 7 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 file-1
 create mode 100644 file-2
 create mode 100644 file-3
 create mode 100644 file-4
 create mode 100644 file-5
 create mode 100644 file-6
 create mode 100644 file-7
[master 4c7c799] 1
 Author: A U Thor <author@example.com>
 7 files changed, 7 insertions(+), 7 deletions(-)
[master a24e200] 2
 Author: A U Thor <author@example.com>
 7 files changed, 7 insertions(+), 7 deletions(-)
[master 72c7eca] 3
 Author: A U Thor <author@example.com>
 7 files changed, 7 insertions(+), 7 deletions(-)
[master 680e5c3] 4
 Author: A U Thor <author@example.com>
 7 files changed, 7 insertions(+), 7 deletions(-)
[master 496e2a9] 5
 Author: A U Thor <author@example.com>
 7 files changed, 7 insertions(+), 7 deletions(-)
[master c5757f4] 6
 Author: A U Thor <author@example.com>
 7 files changed, 7 insertions(+), 7 deletions(-)
[master a21e804] 7
 Author: A U Thor <author@example.com>
 7 files changed, 7 insertions(+), 7 deletions(-)
[side-1 c52bcff] side-1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[side-2 fe893aa] side-2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[side-3 48694b2] side-3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[side-4 e31c210] side-4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[side-5 5786a4a] side-5
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[side-6 6879e94] side-6
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[side-7 a65952b] side-7
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
			git $cmd $(cat input) >expect &&
			git $cmd --stdin <input >actual &&
			sed -e "s/^/input /" input &&
			sed -e "s/^/output /" expect &&
			test_cmp expect actual
		
input master
output a21e80422823d665efde155c070bfdfb97c997e8
output c5757f4c5b3e9d8ed81f0ef337de57e6bef4e611
output 496e2a9cb78c7f1f05c123ba68719cbb2850d28b
output 680e5c39478a7f99f59d423c9d29c54c4cf23f21
output 72c7ecae8123b34f77d6ec686c9dc4d38558e420
output a24e2002dc3e76acd7262fac9934308ed5876528
output 4c7c79994a10176d26cb379d2f480e705687de5f
output b2718dfcca09d482353ed124d94698c230076ecb

ok 2 - check rev-list master

expecting success: 
			git $cmd $(cat input) >expect &&
			git $cmd --stdin <input >actual &&
			sed -e "s/^/input /" input &&
			sed -e "s/^/output /" expect &&
			test_cmp expect actual
		
input master
output commit a21e80422823d665efde155c070bfdfb97c997e8
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:20:13 2005 -0700
output 
output     7
output 
output  file-1 |    2 +-
output  file-2 |    2 +-
output  file-3 |    2 +-
output  file-4 |    2 +-
output  file-5 |    2 +-
output  file-6 |    2 +-
output  file-7 |    2 +-
output  7 files changed, 7 insertions(+), 7 deletions(-)
output 
output commit c5757f4c5b3e9d8ed81f0ef337de57e6bef4e611
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:19:13 2005 -0700
output 
output     6
output 
output  file-1 |    2 +-
output  file-2 |    2 +-
output  file-3 |    2 +-
output  file-4 |    2 +-
output  file-5 |    2 +-
output  file-6 |    2 +-
output  file-7 |    2 +-
output  7 files changed, 7 insertions(+), 7 deletions(-)
output 
output commit 496e2a9cb78c7f1f05c123ba68719cbb2850d28b
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:18:13 2005 -0700
output 
output     5
output 
output  file-1 |    2 +-
output  file-2 |    2 +-
output  file-3 |    2 +-
output  file-4 |    2 +-
output  file-5 |    2 +-
output  file-6 |    2 +-
output  file-7 |    2 +-
output  7 files changed, 7 insertions(+), 7 deletions(-)
output 
output commit 680e5c39478a7f99f59d423c9d29c54c4cf23f21
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:17:13 2005 -0700
output 
output     4
output 
output  file-1 |    2 +-
output  file-2 |    2 +-
output  file-3 |    2 +-
output  file-4 |    2 +-
output  file-5 |    2 +-
output  file-6 |    2 +-
output  file-7 |    2 +-
output  7 files changed, 7 insertions(+), 7 deletions(-)
output 
output commit 72c7ecae8123b34f77d6ec686c9dc4d38558e420
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:16:13 2005 -0700
output 
output     3
output 
output  file-1 |    2 +-
output  file-2 |    2 +-
output  file-3 |    2 +-
output  file-4 |    2 +-
output  file-5 |    2 +-
output  file-6 |    2 +-
output  file-7 |    2 +-
output  7 files changed, 7 insertions(+), 7 deletions(-)
output 
output commit a24e2002dc3e76acd7262fac9934308ed5876528
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:15:13 2005 -0700
output 
output     2
output 
output  file-1 |    2 +-
output  file-2 |    2 +-
output  file-3 |    2 +-
output  file-4 |    2 +-
output  file-5 |    2 +-
output  file-6 |    2 +-
output  file-7 |    2 +-
output  7 files changed, 7 insertions(+), 7 deletions(-)
output 
output commit 4c7c79994a10176d26cb379d2f480e705687de5f
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:14:13 2005 -0700
output 
output     1
output 
output  file-1 |    2 +-
output  file-2 |    2 +-
output  file-3 |    2 +-
output  file-4 |    2 +-
output  file-5 |    2 +-
output  file-6 |    2 +-
output  file-7 |    2 +-
output  7 files changed, 7 insertions(+), 7 deletions(-)
output 
output commit b2718dfcca09d482353ed124d94698c230076ecb
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:13:13 2005 -0700
output 
output     0
output 
output  file-1 |    1 +
output  file-2 |    1 +
output  file-3 |    1 +
output  file-4 |    1 +
output  file-5 |    1 +
output  file-6 |    1 +
output  file-7 |    1 +
output  7 files changed, 7 insertions(+), 0 deletions(-)

ok 3 - check log --stat master

expecting success: 
			git $cmd $(cat input) >expect &&
			git $cmd --stdin <input >actual &&
			sed -e "s/^/input /" input &&
			sed -e "s/^/output /" expect &&
			test_cmp expect actual
		
input side-1
input ^side-4
output c52bcff3af5ff0d662f1e767ea6739034b17f0ea
output c5757f4c5b3e9d8ed81f0ef337de57e6bef4e611
output 496e2a9cb78c7f1f05c123ba68719cbb2850d28b
output 680e5c39478a7f99f59d423c9d29c54c4cf23f21

ok 4 - check rev-list side-1 ^side-4
expecting success: 
			git $cmd $(cat input) >expect &&
			git $cmd --stdin <input >actual &&
			sed -e "s/^/input /" input &&
			sed -e "s/^/output /" expect &&
			test_cmp expect actual
		
input side-1
input ^side-4
output commit c52bcff3af5ff0d662f1e767ea6739034b17f0ea
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:21:13 2005 -0700
output 
output     side-1
output 
output  file-1 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)
output 
output commit c5757f4c5b3e9d8ed81f0ef337de57e6bef4e611
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:19:13 2005 -0700
output 
output     6
output 
output  file-1 |    2 +-
output  file-2 |    2 +-
output  file-3 |    2 +-
output  file-4 |    2 +-
output  file-5 |    2 +-
output  file-6 |    2 +-
output  file-7 |    2 +-
output  7 files changed, 7 insertions(+), 7 deletions(-)
output 
output commit 496e2a9cb78c7f1f05c123ba68719cbb2850d28b
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:18:13 2005 -0700
output 
output     5
output 
output  file-1 |    2 +-
output  file-2 |    2 +-
output  file-3 |    2 +-
output  file-4 |    2 +-
output  file-5 |    2 +-
output  file-6 |    2 +-
output  file-7 |    2 +-
output  7 files changed, 7 insertions(+), 7 deletions(-)
output 
output commit 680e5c39478a7f99f59d423c9d29c54c4cf23f21
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:17:13 2005 -0700
output 
output     4
output 
output  file-1 |    2 +-
output  file-2 |    2 +-
output  file-3 |    2 +-
output  file-4 |    2 +-
output  file-5 |    2 +-
output  file-6 |    2 +-
output  file-7 |    2 +-
output  7 files changed, 7 insertions(+), 7 deletions(-)

ok 5 - check log --stat side-1 ^side-4

expecting success: 
			git $cmd $(cat input) >expect &&
			git $cmd --stdin <input >actual &&
			sed -e "s/^/input /" input &&
			sed -e "s/^/output /" expect &&
			test_cmp expect actual
		
input side-1
input ^side-7
input --
output c52bcff3af5ff0d662f1e767ea6739034b17f0ea
output c5757f4c5b3e9d8ed81f0ef337de57e6bef4e611
output 496e2a9cb78c7f1f05c123ba68719cbb2850d28b
output 680e5c39478a7f99f59d423c9d29c54c4cf23f21
output 72c7ecae8123b34f77d6ec686c9dc4d38558e420
output a24e2002dc3e76acd7262fac9934308ed5876528
output 4c7c79994a10176d26cb379d2f480e705687de5f

ok 6 - check rev-list side-1 ^side-7 --

expecting success: 
			git $cmd $(cat input) >expect &&
			git $cmd --stdin <input >actual &&
			sed -e "s/^/input /" input &&
			sed -e "s/^/output /" expect &&
			test_cmp expect actual
		
input side-1
input ^side-7
input --
output commit c52bcff3af5ff0d662f1e767ea6739034b17f0ea
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:21:13 2005 -0700
output 
output     side-1
output 
output  file-1 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)
output 
output commit c5757f4c5b3e9d8ed81f0ef337de57e6bef4e611
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:19:13 2005 -0700
output 
output     6
output 
output  file-1 |    2 +-
output  file-2 |    2 +-
output  file-3 |    2 +-
output  file-4 |    2 +-
output  file-5 |    2 +-
output  file-6 |    2 +-
output  file-7 |    2 +-
output  7 files changed, 7 insertions(+), 7 deletions(-)
output 
output commit 496e2a9cb78c7f1f05c123ba68719cbb2850d28b
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:18:13 2005 -0700
output 
output     5
output 
output  file-1 |    2 +-
output  file-2 |    2 +-
output  file-3 |    2 +-
output  file-4 |    2 +-
output  file-5 |    2 +-
output  file-6 |    2 +-
output  file-7 |    2 +-
output  7 files changed, 7 insertions(+), 7 deletions(-)
output 
output commit 680e5c39478a7f99f59d423c9d29c54c4cf23f21
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:17:13 2005 -0700
output 
output     4
output 
output  file-1 |    2 +-
output  file-2 |    2 +-
output  file-3 |    2 +-
output  file-4 |    2 +-
output  file-5 |    2 +-
output  file-6 |    2 +-
output  file-7 |    2 +-
output  7 files changed, 7 insertions(+), 7 deletions(-)
output 
output commit 72c7ecae8123b34f77d6ec686c9dc4d38558e420
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:16:13 2005 -0700
output 
output     3
output 
output  file-1 |    2 +-
output  file-2 |    2 +-
output  file-3 |    2 +-
output  file-4 |    2 +-
output  file-5 |    2 +-
output  file-6 |    2 +-
output  file-7 |    2 +-
output  7 files changed, 7 insertions(+), 7 deletions(-)
output 
output commit a24e2002dc3e76acd7262fac9934308ed5876528
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:15:13 2005 -0700
output 
output     2
output 
output  file-1 |    2 +-
output  file-2 |    2 +-
output  file-3 |    2 +-
output  file-4 |    2 +-
output  file-5 |    2 +-
output  file-6 |    2 +-
output  file-7 |    2 +-
output  7 files changed, 7 insertions(+), 7 deletions(-)
output 
output commit 4c7c79994a10176d26cb379d2f480e705687de5f
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:14:13 2005 -0700
output 
output     1
output 
output  file-1 |    2 +-
output  file-2 |    2 +-
output  file-3 |    2 +-
output  file-4 |    2 +-
output  file-5 |    2 +-
output  file-6 |    2 +-
output  file-7 |    2 +-
output  7 files changed, 7 insertions(+), 7 deletions(-)

ok 7 - check log --stat side-1 ^side-7 --

expecting success: 
			git $cmd $(cat input) >expect &&
			git $cmd --stdin <input >actual &&
			sed -e "s/^/input /" input &&
			sed -e "s/^/output /" expect &&
			test_cmp expect actual
		
input side-1
input ^side-7
input --
input file-1
output c52bcff3af5ff0d662f1e767ea6739034b17f0ea
output c5757f4c5b3e9d8ed81f0ef337de57e6bef4e611
output 496e2a9cb78c7f1f05c123ba68719cbb2850d28b
output 680e5c39478a7f99f59d423c9d29c54c4cf23f21
output 72c7ecae8123b34f77d6ec686c9dc4d38558e420
output a24e2002dc3e76acd7262fac9934308ed5876528
output 4c7c79994a10176d26cb379d2f480e705687de5f

ok 8 - check rev-list side-1 ^side-7 -- file-1

expecting success: 
			git $cmd $(cat input) >expect &&
			git $cmd --stdin <input >actual &&
			sed -e "s/^/input /" input &&
			sed -e "s/^/output /" expect &&
			test_cmp expect actual
		
input side-1
input ^side-7
input --
input file-1
output commit c52bcff3af5ff0d662f1e767ea6739034b17f0ea
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:21:13 2005 -0700
output 
output     side-1
output 
output  file-1 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)
output 
output commit c5757f4c5b3e9d8ed81f0ef337de57e6bef4e611
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:19:13 2005 -0700
output 
output     6
output 
output  file-1 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)
output 
output commit 496e2a9cb78c7f1f05c123ba68719cbb2850d28b
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:18:13 2005 -0700
output 
output     5
output 
output  file-1 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)
output 
output commit 680e5c39478a7f99f59d423c9d29c54c4cf23f21
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:17:13 2005 -0700
output 
output     4
output 
output  file-1 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)
output 
output commit 72c7ecae8123b34f77d6ec686c9dc4d38558e420
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:16:13 2005 -0700
output 
output     3
output 
output  file-1 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)
output 
output commit a24e2002dc3e76acd7262fac9934308ed5876528
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:15:13 2005 -0700
output 
output     2
output 
output  file-1 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)
output 
output commit 4c7c79994a10176d26cb379d2f480e705687de5f
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:14:13 2005 -0700
output 
output     1
output 
output  file-1 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)

ok 9 - check log --stat side-1 ^side-7 -- file-1

expecting success: 
			git $cmd $(cat input) >expect &&
			git $cmd --stdin <input >actual &&
			sed -e "s/^/input /" input &&
			sed -e "s/^/output /" expect &&
			test_cmp expect actual
		
input side-1
input ^side-7
input --
input file-2
output c5757f4c5b3e9d8ed81f0ef337de57e6bef4e611
output 496e2a9cb78c7f1f05c123ba68719cbb2850d28b
output 680e5c39478a7f99f59d423c9d29c54c4cf23f21
output 72c7ecae8123b34f77d6ec686c9dc4d38558e420
output a24e2002dc3e76acd7262fac9934308ed5876528
output 4c7c79994a10176d26cb379d2f480e705687de5f

ok 10 - check rev-list side-1 ^side-7 -- file-2

expecting success: 
			git $cmd $(cat input) >expect &&
			git $cmd --stdin <input >actual &&
			sed -e "s/^/input /" input &&
			sed -e "s/^/output /" expect &&
			test_cmp expect actual
		
input side-1
input ^side-7
input --
input file-2
output commit c5757f4c5b3e9d8ed81f0ef337de57e6bef4e611
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:19:13 2005 -0700
output 
output     6
output 
output  file-2 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)
output 
output commit 496e2a9cb78c7f1f05c123ba68719cbb2850d28b
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:18:13 2005 -0700
output 
output     5
output 
output  file-2 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)
output 
output commit 680e5c39478a7f99f59d423c9d29c54c4cf23f21
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:17:13 2005 -0700
output 
output     4
output 
output  file-2 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)
output 
output commit 72c7ecae8123b34f77d6ec686c9dc4d38558e420
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:16:13 2005 -0700
output 
output     3
output 
output  file-2 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)
output 
output commit a24e2002dc3e76acd7262fac9934308ed5876528
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:15:13 2005 -0700
output 
output     2
output 
output  file-2 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)
output 
output commit 4c7c79994a10176d26cb379d2f480e705687de5f
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:14:13 2005 -0700
output 
output     1
output 
output  file-2 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)

ok 11 - check log --stat side-1 ^side-7 -- file-2

expecting success: 
			git $cmd $(cat input) >expect &&
			git $cmd --stdin <input >actual &&
			sed -e "s/^/input /" input &&
			sed -e "s/^/output /" expect &&
			test_cmp expect actual
		
input side-3
input ^side-4
input --
input file-3
output 48694b20de8c3a7d2a1cac0c842191d9a9f1dc4f
output 680e5c39478a7f99f59d423c9d29c54c4cf23f21

ok 12 - check rev-list side-3 ^side-4 -- file-3

expecting success: 
			git $cmd $(cat input) >expect &&
			git $cmd --stdin <input >actual &&
			sed -e "s/^/input /" input &&
			sed -e "s/^/output /" expect &&
			test_cmp expect actual
		
input side-3
input ^side-4
input --
input file-3
output commit 48694b20de8c3a7d2a1cac0c842191d9a9f1dc4f
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:23:13 2005 -0700
output 
output     side-3
output 
output  file-3 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)
output 
output commit 680e5c39478a7f99f59d423c9d29c54c4cf23f21
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:17:13 2005 -0700
output 
output     4
output 
output  file-3 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)

ok 13 - check log --stat side-3 ^side-4 -- file-3

expecting success: 
			git $cmd $(cat input) >expect &&
			git $cmd --stdin <input >actual &&
			sed -e "s/^/input /" input &&
			sed -e "s/^/output /" expect &&
			test_cmp expect actual
		
input side-3
input ^side-2
output 48694b20de8c3a7d2a1cac0c842191d9a9f1dc4f

ok 14 - check rev-list side-3 ^side-2

expecting success: 
			git $cmd $(cat input) >expect &&
			git $cmd --stdin <input >actual &&
			sed -e "s/^/input /" input &&
			sed -e "s/^/output /" expect &&
			test_cmp expect actual
		
input side-3
input ^side-2
output commit 48694b20de8c3a7d2a1cac0c842191d9a9f1dc4f
output Author: A U Thor <author@example.com>
output Date:   Thu Apr 7 15:23:13 2005 -0700
output 
output     side-3
output 
output  file-3 |    2 +-
output  1 files changed, 1 insertions(+), 1 deletions(-)

ok 15 - check log --stat side-3 ^side-2

expecting success: 
			git $cmd $(cat input) >expect &&
			git $cmd --stdin <input >actual &&
			sed -e "s/^/input /" input &&
			sed -e "s/^/output /" expect &&
			test_cmp expect actual
		
input side-3
input ^side-2
input --
input file-1

ok 16 - check rev-list side-3 ^side-2 -- file-1

expecting success: 
			git $cmd $(cat input) >expect &&
			git $cmd --stdin <input >actual &&
			sed -e "s/^/input /" input &&
			sed -e "s/^/output /" expect &&
			test_cmp expect actual
		
input side-3
input ^side-2
input --
input file-1

ok 17 - check log --stat side-3 ^side-2 -- file-1

# passed all 17 test(s)
1..17
