Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6200-fmt-merge-msg/.git/
expecting success: 
	echo one >one &&
	git add one &&
	test_tick &&
	git commit -m "Initial" &&

	git clone . remote &&

	echo uno >one &&
	echo dos >two &&
	git add two &&
	test_tick &&
	git commit -a -m "Second" &&

	git checkout -b left &&

	echo "c1" >one &&
	test_tick &&
	git commit -a -m "Common #1" &&

	echo "c2" >one &&
	test_tick &&
	git commit -a -m "Common #2" &&

	git branch right &&

	echo "l3" >two &&
	test_tick &&
	git commit -a -m "Left #3" &&

	echo "l4" >two &&
	test_tick &&
	git commit -a -m "Left #4" &&

	echo "l5" >two &&
	test_tick &&
	git commit -a -m "Left #5" &&
	git tag tag-l5 &&

	git checkout right &&

	echo "r3" >three &&
	git add three &&
	test_tick &&
	git commit -a -m "Right #3" &&
	git tag tag-r3 &&

	echo "r4" >three &&
	test_tick &&
	git commit -a -m "Right #4" &&

	echo "r5" >three &&
	test_tick &&
	git commit -a -m "Right #5" &&

	git checkout -b long &&
	i=0 &&
	while test $i -lt 30
	do
		test_commit $i one &&
		i=$(($i+1))
	done &&

	git show-branch &&

	apos="'"
[master (root-commit) 883c9d3] Initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 one
Cloning into remote...
done.
[master 2935695] Second
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 1 deletions(-)
 create mode 100644 two
[left b86daf8] Common #1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[left 9f2fd7e] Common #2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[left 70b6fc0] Left #3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[left df5da52] Left #4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[left 2f11338] Left #5
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[right 00c8e89] Right #3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 three
[right ef8635d] Right #4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[right 2d2f597] Right #5
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long d6a0cbe] 0
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long e56a64b] 1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 8fc7bcd] 2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long b5605fc] 3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 35000b2] 4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 3c4f1c6] 5
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long bf0bc37] 6
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long e0e9a85] 7
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long eb8c9f5] 8
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 99409c7] 9
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 0ce96e0] 10
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 8377914] 11
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 85798ed] 12
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long f75d7f4] 13
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long f56cc6e] 14
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 3dc0dbd] 15
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 56d0ffb] 16
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 4c19426] 17
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 5342a39] 18
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 0753e7e] 19
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 72baa93] 20
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 494d039] 21
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 543e615] 22
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 41d12df] 23
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 8b77407] 24
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long 12fecbe] 25
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long f709339] 26
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long c90ce26] 27
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long cf03e3f] 28
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[long f343514] 29
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
! [left] Left #5
 * [long] 29
  ! [master] Second
   ! [right] Right #5
----
 *   [long] 29
 *   [long^] 28
 *   [long~2] 27
 *   [long~3] 26
 *   [long~4] 25
 *   [long~5] 24
 *   [long~6] 23
 *   [long~7] 22
 *   [long~8] 21
 *   [long~9] 20
 *   [long~10] 19
 *   [long~11] 18
 *   [long~12] 17
 *   [long~13] 16
 *   [long~14] 15
 *   [long~15] 14
 *   [long~16] 13
 *   [long~17] 12
 *   [long~18] 11
 *   [long~19] 10
 *   [long~20] 9
 *   [long~21] 8
 *   [long~22] 7
 *   [long~23] 6
 *   [long~24] 5
 *   [long~25] 4
 *   [long~26] 3
 *   [long~27] 2
 *   [long~28] 1
 *   [long~29] 0
 * + [right] Right #5
 * + [right^] Right #4
 * + [right~2] Right #3
+    [left] Left #5
+    [left^] Left #4
+    [left~2] Left #3
+* + [right~3] Common #2
+* + [right~4] Common #1
+*++ [master] Second

ok 1 - setup

expecting success: 
	echo "Merge branch ${apos}left${apos}" >expected &&

	git checkout master &&
	git fetch . left &&

	git fmt-merge-msg <.git/FETCH_HEAD >actual &&
	test_cmp expected actual


ok 2 - message for merging local branch

expecting success: 
	echo "Merge branch ${apos}left${apos} of $(pwd)" >expected &&

	git checkout master &&
	git fetch "$(pwd)" left &&

	git fmt-merge-msg <.git/FETCH_HEAD >actual &&
	test_cmp expected actual


ok 3 - message for merging external branch

expecting success: 
	cat >expected <<-EOF &&
	Merge branch ${apos}left${apos}

	* left:
	  Left #5
	  Left #4
	  Left #3
	  Common #2
	  Common #1
	EOF

	git config merge.log true &&
	test_might_fail git config --unset-all merge.summary &&

	git checkout master &&
	test_tick &&
	git fetch . left &&

	git fmt-merge-msg <.git/FETCH_HEAD >actual1 &&

	test_might_fail git config --unset-all merge.log &&
	git config merge.summary true &&

	git checkout master &&
	test_tick &&
	git fetch . left &&

	git fmt-merge-msg <.git/FETCH_HEAD >actual2 &&

	test_cmp expected actual1 &&
	test_cmp expected actual2

ok 4 - [merge] summary/log configuration

expecting success: 
	test_might_fail git config --unset-all merge.log &&
	test_might_fail git config --unset-all merge.summary


ok 5 - setup: clear [merge] configuration

expecting success: 
	git checkout master &&
	test_tick &&
	git fetch . left
ok 6 - setup FETCH_HEAD

expecting success: 
	cat >expected <<-EOF &&
	Merge branch ${apos}left${apos}

	* left: (5 commits)
	  Left #5
	  Left #4
	  Left #3
	  ...
	EOF

	git -c merge.log=3 fmt-merge-msg <.git/FETCH_HEAD >actual &&
	test_cmp expected actual

ok 7 - merge.log=3 limits shortlog length

expecting success: 
	cat >expected <<-EOF &&
	Merge branch ${apos}left${apos}

	* left:
	  Left #5
	  Left #4
	  Left #3
	  Common #2
	  Common #1
	EOF

	git -c merge.log=5 fmt-merge-msg <.git/FETCH_HEAD >actual &&
	test_cmp expected actual


ok 8 - merge.log=5 shows all 5 commits

expecting success: 
	echo "Merge branch ${apos}left${apos}" >expected
	git -c merge.log=0 fmt-merge-msg <.git/FETCH_HEAD >actual &&
	test_cmp expected actual


ok 9 - merge.log=0 disables shortlog

expecting success: 
	cat >expected <<-EOF &&
	Merge branch ${apos}left${apos}

	* left: (5 commits)
	  Left #5
	  Left #4
	  Left #3
	  ...
	EOF

	git fmt-merge-msg --log=3 <.git/FETCH_HEAD >actual &&
	test_cmp expected actual


ok 10 - --log=3 limits shortlog length

expecting success: 
	cat >expected <<-EOF &&
	Merge branch ${apos}left${apos}

	* left:
	  Left #5
	  Left #4
	  Left #3
	  Common #2
	  Common #1
	EOF

	git fmt-merge-msg --log=5 <.git/FETCH_HEAD >actual &&
	test_cmp expected actual


ok 11 - --log=5 shows all 5 commits

expecting success: 
	echo "Merge branch ${apos}left${apos}" >expected &&
	git fmt-merge-msg --no-log <.git/FETCH_HEAD >actual &&
	test_cmp expected actual


ok 12 - --no-log disables shortlog
expecting success: 
	echo "Merge branch ${apos}left${apos}" >expected &&
	git fmt-merge-msg --no-log <.git/FETCH_HEAD >actual &&
	test_cmp expected actual


ok 13 - --log=0 disables shortlog

expecting success: 
	echo "Sync with left" >expected &&
	cat >expected.log <<-EOF &&
	Sync with left

	* ${apos}left${apos} of $(pwd):
	  Left #5
	  Left #4
	  Left #3
	  Common #2
	  Common #1
	EOF

	test_might_fail git config --unset merge.log &&
	test_might_fail git config --unset merge.summary &&
	git checkout master &&
	git fetch "$(pwd)" left &&
	git fmt-merge-msg -m "Sync with left" <.git/FETCH_HEAD >actual &&
	git fmt-merge-msg --log -m "Sync with left" \
					<.git/FETCH_HEAD >actual.log &&
	git config merge.log true &&
	git fmt-merge-msg -m "Sync with left" \
					<.git/FETCH_HEAD >actual.log-config &&
	git fmt-merge-msg --no-log -m "Sync with left" \
					<.git/FETCH_HEAD >actual.nolog &&

	test_cmp expected actual &&
	test_cmp expected.log actual.log &&
	test_cmp expected.log actual.log-config &&
	test_cmp expected actual.nolog
ok 14 - fmt-merge-msg -m
expecting success: 
	cat >expected <<-EOF
	Merge branches ${apos}left${apos} and ${apos}right${apos}

	* left:
	  Left #5
	  Left #4
	  Left #3
	  Common #2
	  Common #1

	* right:
	  Right #5
	  Right #4
	  Right #3
	  Common #2
	  Common #1
	EOF

ok 15 - setup: expected shortlog for two branches

expecting success: 
	git config merge.log true &&
	test_might_fail git config --unset-all merge.summary &&
	git checkout master &&
	test_tick &&
	git fetch . left right &&
	git fmt-merge-msg <.git/FETCH_HEAD >actual1 &&

	test_might_fail git config --unset-all merge.log &&
	git config merge.summary true &&
	git checkout master &&
	test_tick &&
	git fetch . left right &&
	git fmt-merge-msg <.git/FETCH_HEAD >actual2 &&

	git config merge.log yes &&
	test_might_fail git config --unset-all merge.summary &&
	git checkout master &&
	test_tick &&
	git fetch . left right &&
	git fmt-merge-msg <.git/FETCH_HEAD >actual3 &&

	test_might_fail git config --unset-all merge.log &&
	git config merge.summary yes &&
	git checkout master &&
	test_tick &&
	git fetch . left right &&
	git fmt-merge-msg <.git/FETCH_HEAD >actual4 &&

	test_cmp expected actual1 &&
	test_cmp expected actual2 &&
	test_cmp expected actual3 &&
	test_cmp expected actual4
ok 16 - shortlog for two branches

expecting success: 
	test_might_fail git config --unset-all merge.log &&
	git config merge.summary yes &&
	git checkout master &&
	test_tick &&
	git fetch . left right &&
	git fmt-merge-msg -F .git/FETCH_HEAD >actual &&
	test_cmp expected actual
ok 17 - merge-msg -F

expecting success: 
	test_might_fail git config --unset-all merge.log &&
	git config merge.summary yes &&
	git checkout master &&
	test_tick &&
	git fetch . left right &&
	mkdir sub &&
	cp .git/FETCH_HEAD sub/FETCH_HEAD &&
	(
		cd sub &&
		git fmt-merge-msg -F FETCH_HEAD >../actual
	) &&
	test_cmp expected actual
ok 18 - merge-msg -F in subdirectory
expecting success: 
	test_might_fail git config --unset-all merge.log &&
	git config merge.summary yes &&

	>empty &&

	(
		cd remote &&
		git checkout -b unrelated &&
		test_tick &&
		git fetch origin &&
		git fmt-merge-msg <.git/FETCH_HEAD >../actual
	) &&

	test_cmp empty actual

ok 19 - merge-msg with nothing to merge

expecting success: 
	cat >expected <<-EOF &&
	Merge tag ${apos}tag-r3${apos}

	* tag ${apos}tag-r3${apos}:
	  Right #3
	  Common #2
	  Common #1
	EOF

	test_might_fail git config --unset-all merge.log &&
	git config merge.summary yes &&

	git checkout master &&
	test_tick &&
	git fetch . tag tag-r3 &&

	git fmt-merge-msg <.git/FETCH_HEAD >actual &&
	test_cmp expected actual


ok 20 - merge-msg tag

expecting success: 
	cat >expected <<-EOF &&
	Merge tags ${apos}tag-r3${apos} and ${apos}tag-l5${apos}

	* tag ${apos}tag-r3${apos}:
	  Right #3
	  Common #2
	  Common #1

	* tag ${apos}tag-l5${apos}:
	  Left #5
	  Left #4
	  Left #3
	  Common #2
	  Common #1
	EOF

	test_might_fail git config --unset-all merge.log &&
	git config merge.summary yes &&

	git checkout master &&
	test_tick &&
	git fetch . tag tag-r3 tag tag-l5 &&

	git fmt-merge-msg <.git/FETCH_HEAD >actual &&
	test_cmp expected actual


ok 21 - merge-msg two tags

expecting success: 
	cat >expected <<-EOF &&
	Merge branch ${apos}left${apos}, tag ${apos}tag-r3${apos}

	* tag ${apos}tag-r3${apos}:
	  Right #3
	  Common #2
	  Common #1

	* left:
	  Left #5
	  Left #4
	  Left #3
	  Common #2
	  Common #1
	EOF

	test_might_fail git config --unset-all merge.log &&
	git config merge.summary yes &&

	git checkout master &&
	test_tick &&
	git fetch . tag tag-r3 left &&

	git fmt-merge-msg <.git/FETCH_HEAD >actual &&
	test_cmp expected actual


ok 22 - merge-msg tag and branch

expecting success: 
	{
		cat <<-EOF &&
		Merge branch ${apos}long${apos}

		* long: (35 commits)
		EOF

		i=29 &&
		while test $i -gt 9
		do
			echo "  $i" &&
			i=$(($i-1))
		done &&
		echo "  ..."
	} >expected &&

	git checkout master &&
	test_tick &&
	git fetch . long &&

	git fmt-merge-msg <.git/FETCH_HEAD >actual &&
	test_cmp expected actual


ok 23 - merge-msg lots of commits

# passed all 23 test(s)
1..23
