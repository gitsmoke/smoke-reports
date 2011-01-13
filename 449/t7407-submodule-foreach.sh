Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/.git/
expecting success: 
	echo file > file &&
	git add file &&
	test_tick &&
	git commit -m upstream &&
	git clone . super &&
	git clone super submodule &&
	(
		cd super &&
		git submodule add ../submodule sub1 &&
		git submodule add ../submodule sub2 &&
		git submodule add ../submodule sub3 &&
		git config -f .gitmodules --rename-section \
			submodule.sub1 submodule.foo1 &&
		git config -f .gitmodules --rename-section \
			submodule.sub2 submodule.foo2 &&
		git config -f .gitmodules --rename-section \
			submodule.sub3 submodule.foo3 &&
		git add .gitmodules &&
		test_tick &&
		git commit -m "submodules" &&
		git submodule init sub1 &&
		git submodule init sub2 &&
		git submodule init sub3
	) &&
	(
		cd submodule &&
		echo different > file &&
		git add file &&
		test_tick &&
		git commit -m "different"
	) &&
	(
		cd super &&
		(
			cd sub3 &&
			git pull
		) &&
		git add sub3 &&
		test_tick &&
		git commit -m "update sub3"
	)

[master (root-commit) 0c90624] upstream
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
Cloning into super
done.
Cloning into submodule
done.
Cloning into sub1
done.
Cloning into sub2
done.
Cloning into sub3
done.
[master 33b977a] submodules
 Author: A U Thor <author@example.com>
 4 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 .gitmodules
 create mode 160000 sub1
 create mode 160000 sub2
 create mode 160000 sub3
Submodule 'foo1' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub1'
Submodule 'foo2' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub2'
Submodule 'foo3' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub3'
[master 509f622] different
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Updating 0c90624..509f622
Fast-forward
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
[master ed2a820] update sub3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup a submodule tree
expecting success: 
	git clone super clone &&
	(
		cd clone &&
		git submodule update --init -- sub1 sub3 &&
		git submodule foreach "echo \$toplevel-\$name-\$path-\$sha1" > ../actual &&
		git config foo.bar zar &&
		git submodule foreach "git config --file \"\$toplevel/.git/config\" foo.bar"
	) &&
	test_cmp expect actual
Cloning into clone
done.
Submodule 'foo1' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub1'
Submodule 'foo3' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub3'
Cloning into sub1
done.
Submodule path 'sub1': checked out '0c90624ab7f1aaa301d3bb79f60dcfed1ec4897f'
Cloning into sub3
done.
Submodule path 'sub3': checked out '509f622a4f36a3e472affcf28fa959174f3dd5b5'
Entering 'sub1'
zar
Entering 'sub3'
zar

ok 2 - test basic "submodule foreach" usage

expecting success: 
	git clone submodule nested1 &&
	git clone submodule nested2 &&
	git clone submodule nested3 &&
	(
		cd nested3 &&
		git submodule add ../submodule submodule &&
		test_tick &&
		git commit -m "submodule" &&
		git submodule init submodule
	) &&
	(
		cd nested2 &&
		git submodule add ../nested3 nested3 &&
		test_tick &&
		git commit -m "nested3" &&
		git submodule init nested3
	) &&
	(
		cd nested1 &&
		git submodule add ../nested2 nested2 &&
		test_tick &&
		git commit -m "nested2" &&
		git submodule init nested2
	) &&
	(
		cd super &&
		git submodule add ../nested1 nested1 &&
		test_tick &&
		git commit -m "nested1" &&
		git submodule init nested1
	)
Cloning into nested1
done.
Cloning into nested2
done.
Cloning into nested3
done.
Cloning into submodule
done.
[master 5ec8351] submodule
 Author: A U Thor <author@example.com>
 2 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 .gitmodules
 create mode 160000 submodule
Submodule 'submodule' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'submodule'
Cloning into nested3
done.
[master 2e69c85] nested3
 Author: A U Thor <author@example.com>
 2 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 .gitmodules
 create mode 160000 nested3
Submodule 'nested3' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested3) registered for path 'nested3'
Cloning into nested2
done.
[master b23f134] nested2
 Author: A U Thor <author@example.com>
 2 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 .gitmodules
 create mode 160000 nested2
Submodule 'nested2' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested2) registered for path 'nested2'
Cloning into nested1
done.
[master 427ccd0] nested1
 Author: A U Thor <author@example.com>
 2 files changed, 4 insertions(+), 0 deletions(-)
 create mode 160000 nested1
Submodule 'nested1' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested1) registered for path 'nested1'

ok 3 - setup nested submodules

expecting success: 
	git clone super clone2 &&
	(
		cd clone2 &&
		test ! -d sub1/.git &&
		test ! -d sub2/.git &&
		test ! -d sub3/.git &&
		test ! -d nested1/.git &&
		git submodule update --init &&
		test -d sub1/.git &&
		test -d sub2/.git &&
		test -d sub3/.git &&
		test -d nested1/.git &&
		test ! -d nested1/nested2/.git &&
		git submodule foreach "git submodule update --init" &&
		test -d nested1/nested2/.git &&
		test ! -d nested1/nested2/nested3/.git
	)
Cloning into clone2
done.
Submodule 'nested1' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested1) registered for path 'nested1'
Submodule 'foo1' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub1'
Submodule 'foo2' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub2'
Submodule 'foo3' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub3'
Cloning into nested1
done.
Submodule path 'nested1': checked out 'b23f134787d96fae589a6b76da41f4db112fc8db'
Cloning into sub1
done.
Submodule path 'sub1': checked out '0c90624ab7f1aaa301d3bb79f60dcfed1ec4897f'
Cloning into sub2
done.
Submodule path 'sub2': checked out '0c90624ab7f1aaa301d3bb79f60dcfed1ec4897f'
Cloning into sub3
done.
Submodule path 'sub3': checked out '509f622a4f36a3e472affcf28fa959174f3dd5b5'
Entering 'nested1'
Submodule 'nested2' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested2) registered for path 'nested2'
Cloning into nested2
done.
Submodule path 'nested2': checked out '2e69c85de92bf5f316f3c67b5e492f287f5a6542'
Entering 'sub1'
Entering 'sub2'
Entering 'sub3'
ok 4 - use "submodule foreach" to checkout 2nd level submodule
expecting success: 
	(
		cd clone2 &&
		git submodule foreach --recursive "git submodule update --init" &&
		test -d nested1/nested2/nested3/.git &&
		test -d nested1/nested2/nested3/submodule/.git
	)
Entering 'nested1'
Entering 'nested1/nested2'
Submodule 'nested3' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested3) registered for path 'nested3'
Cloning into nested3
done.
Submodule path 'nested3': checked out '5ec83512b76a0b8170b899f8e643913c3e9b72d9'
Entering 'nested1/nested2/nested3'
Submodule 'submodule' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'submodule'
Cloning into submodule
done.
Submodule path 'submodule': checked out '509f622a4f36a3e472affcf28fa959174f3dd5b5'
Entering 'nested1/nested2/nested3/submodule'
Entering 'sub1'
Entering 'sub2'
Entering 'sub3'
ok 5 - use "foreach --recursive" to checkout all submodules
expecting success: 
	(
		cd clone2 &&
		git submodule foreach --recursive "true" > ../actual
	) &&
	test_cmp expect actual

ok 6 - test messages from "foreach --recursive"
expecting success: 
	(
		cd clone2 &&
		git submodule foreach -q --recursive "echo \$name-\$path" > ../actual
	) &&
	test_cmp expect actual

ok 7 - test "foreach --quiet --recursive"
expecting success: 
	git clone super clone3 &&
	(
		cd clone3 &&
		test ! -d sub1/.git &&
		test ! -d sub2/.git &&
		test ! -d sub3/.git &&
		test ! -d nested1/.git &&
		git submodule update --init --recursive &&
		test -d sub1/.git &&
		test -d sub2/.git &&
		test -d sub3/.git &&
		test -d nested1/.git &&
		test -d nested1/nested2/.git &&
		test -d nested1/nested2/nested3/.git &&
		test -d nested1/nested2/nested3/submodule/.git
	)
Cloning into clone3
done.
Submodule 'nested1' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested1) registered for path 'nested1'
Submodule 'foo1' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub1'
Submodule 'foo2' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub2'
Submodule 'foo3' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub3'
Cloning into nested1
done.
Submodule path 'nested1': checked out 'b23f134787d96fae589a6b76da41f4db112fc8db'
Submodule 'nested2' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested2) registered for path 'nested2'
Cloning into nested2
done.
Submodule path 'nested2': checked out '2e69c85de92bf5f316f3c67b5e492f287f5a6542'
Submodule 'nested3' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested3) registered for path 'nested3'
Cloning into nested3
done.
Submodule path 'nested3': checked out '5ec83512b76a0b8170b899f8e643913c3e9b72d9'
Submodule 'submodule' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'submodule'
Cloning into submodule
done.
Submodule path 'submodule': checked out '509f622a4f36a3e472affcf28fa959174f3dd5b5'
Cloning into sub1
done.
Submodule path 'sub1': checked out '0c90624ab7f1aaa301d3bb79f60dcfed1ec4897f'
Cloning into sub2
done.
Submodule path 'sub2': checked out '0c90624ab7f1aaa301d3bb79f60dcfed1ec4897f'
Cloning into sub3
done.
Submodule path 'sub3': checked out '509f622a4f36a3e472affcf28fa959174f3dd5b5'
ok 8 - use "update --recursive" to checkout all submodules
expecting success: 
	(
		cd clone3 &&
		git submodule status --recursive > ../actual
	) &&
	test_cmp expect actual

ok 9 - test "status --recursive"

expecting success: 
	(
		cd clone3 &&
		(
			cd nested1 &&
			test_commit file2
		) &&
		git submodule status --cached --recursive -- nested1 > ../actual
	) &&
	test_cmp expect actual
[detached HEAD 575769d] file2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2.t

ok 10 - ensure "status --cached --recursive" preserves the --cached flag

expecting success: 
	git clone --recursive super clone4 &&
	test -d clone4/.git &&
	test -d clone4/sub1/.git &&
	test -d clone4/sub2/.git &&
	test -d clone4/sub3/.git &&
	test -d clone4/nested1/.git &&
	test -d clone4/nested1/nested2/.git &&
	test -d clone4/nested1/nested2/nested3/.git &&
	test -d clone4/nested1/nested2/nested3/submodule/.git
Cloning into clone4
done.
Submodule 'nested1' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested1) registered for path 'nested1'
Submodule 'foo1' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub1'
Submodule 'foo2' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub2'
Submodule 'foo3' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub3'
Cloning into nested1
done.
Submodule path 'nested1': checked out 'b23f134787d96fae589a6b76da41f4db112fc8db'
Submodule 'nested2' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested2) registered for path 'nested2'
Cloning into nested2
done.
Submodule path 'nested2': checked out '2e69c85de92bf5f316f3c67b5e492f287f5a6542'
Submodule 'nested3' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested3) registered for path 'nested3'
Cloning into nested3
done.
Submodule path 'nested3': checked out '5ec83512b76a0b8170b899f8e643913c3e9b72d9'
Submodule 'submodule' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'submodule'
Cloning into submodule
done.
Submodule path 'submodule': checked out '509f622a4f36a3e472affcf28fa959174f3dd5b5'
Cloning into sub1
done.
Submodule path 'sub1': checked out '0c90624ab7f1aaa301d3bb79f60dcfed1ec4897f'
Cloning into sub2
done.
Submodule path 'sub2': checked out '0c90624ab7f1aaa301d3bb79f60dcfed1ec4897f'
Cloning into sub3
done.
Submodule path 'sub3': checked out '509f622a4f36a3e472affcf28fa959174f3dd5b5'

ok 11 - use "git clone --recursive" to checkout all submodules

expecting success: 
	git clone super "common objects" &&
	git clone super clone5 &&
	(
		cd clone5 &&
		test ! -d nested1/.git &&
		git submodule update --init --recursive --reference="$(dirname "$PWD")/common objects" &&
		test -d nested1/.git &&
		test -d nested1/nested2/.git &&
		test -d nested1/nested2/nested3/.git &&
		test -f nested1/.git/objects/info/alternates &&
		test -f nested1/nested2/.git/objects/info/alternates &&
		test -f nested1/nested2/nested3/.git/objects/info/alternates
	)
Cloning into common objects
done.
Cloning into clone5
done.
Submodule 'nested1' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested1) registered for path 'nested1'
Submodule 'foo1' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub1'
Submodule 'foo2' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub2'
Submodule 'foo3' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'sub3'
Cloning into nested1
done.
Submodule path 'nested1': checked out 'b23f134787d96fae589a6b76da41f4db112fc8db'
Submodule 'nested2' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested2) registered for path 'nested2'
Cloning into nested2
done.
Submodule path 'nested2': checked out '2e69c85de92bf5f316f3c67b5e492f287f5a6542'
Submodule 'nested3' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested3) registered for path 'nested3'
Cloning into nested3
done.
Submodule path 'nested3': checked out '5ec83512b76a0b8170b899f8e643913c3e9b72d9'
Submodule 'submodule' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'submodule'
Cloning into submodule
done.
Submodule path 'submodule': checked out '509f622a4f36a3e472affcf28fa959174f3dd5b5'
Cloning into sub1
done.
Submodule path 'sub1': checked out '0c90624ab7f1aaa301d3bb79f60dcfed1ec4897f'
Cloning into sub2
done.
Submodule path 'sub2': checked out '0c90624ab7f1aaa301d3bb79f60dcfed1ec4897f'
Cloning into sub3
done.
Submodule path 'sub3': checked out '509f622a4f36a3e472affcf28fa959174f3dd5b5'
ok 12 - test "update --recursive" with a flag with spaces
expecting success: 
	git clone super clone6 &&
	(
		cd clone6 &&
		test ! -d sub1/.git &&
		test ! -d sub2/.git &&
		test ! -d sub3/.git &&
		test ! -d nested1/.git &&
		git submodule update --init --recursive -- nested1 &&
		test ! -d sub1/.git &&
		test ! -d sub2/.git &&
		test ! -d sub3/.git &&
		test -d nested1/.git &&
		test -d nested1/nested2/.git &&
		test -d nested1/nested2/nested3/.git &&
		test -d nested1/nested2/nested3/submodule/.git
	)
Cloning into clone6
done.
Submodule 'nested1' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested1) registered for path 'nested1'
Cloning into nested1
done.
Submodule path 'nested1': checked out 'b23f134787d96fae589a6b76da41f4db112fc8db'
Submodule 'nested2' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested2) registered for path 'nested2'
Cloning into nested2
done.
Submodule path 'nested2': checked out '2e69c85de92bf5f316f3c67b5e492f287f5a6542'
Submodule 'nested3' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/nested3) registered for path 'nested3'
Cloning into nested3
done.
Submodule path 'nested3': checked out '5ec83512b76a0b8170b899f8e643913c3e9b72d9'
Submodule 'submodule' (/Users/trast/git-smoke/t/trash directory.t7407-submodule-foreach/submodule) registered for path 'submodule'
Cloning into submodule
done.
Submodule path 'submodule': checked out '509f622a4f36a3e472affcf28fa959174f3dd5b5'

ok 13 - use "update --recursive nested1" to checkout all submodules rooted in nested1

# passed all 13 test(s)
1..13
