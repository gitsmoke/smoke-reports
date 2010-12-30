Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6027-merge-binary/.git/
expecting success: 

	cat "$TEST_DIRECTORY"/test4012.png >m &&
	git add m &&
	git ls-files -s | sed -e "s/ 0	/ 1	/" >E1 &&
	test_tick &&
	git commit -m "initial" &&

	git branch side &&
	echo frotz >a &&
	git add a &&
	echo nitfol >>m &&
	git add a m &&
	git ls-files -s a >E0 &&
	git ls-files -s m | sed -e "s/ 0	/ 3	/" >E3 &&
	test_tick &&
	git commit -m "master adds some" &&

	git checkout side &&
	echo rezrov >>m &&
	git add m &&
	git ls-files -s m | sed -e "s/ 0	/ 2	/" >E2 &&
	test_tick &&
	git commit -m "side modifies" &&

	git tag anchor &&

	cat E0 E1 E2 E3 >expect
[master (root-commit) f315366] initial
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 m
[master a142ea1] master adds some
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 a
[side 020cbcd] side modifies
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 

	rm -f a* m* &&
	git reset --hard anchor &&

	if git merge -s resolve master
	then
		echo Oops, should not have succeeded
		false
	else
		git ls-files -s >current
		test_cmp current expect
	fi

HEAD is now at 020cbcd side modifies
Trying really trivial in-index merge...
Nope.
Trying simple merge.
Simple merge failed, trying Automatic merge.
Auto-merging m
ERROR: content conflict in m
Automatic merge failed; fix conflicts and then commit the result.

ok 2 - resolve

expecting success: 

	rm -f a* m* &&
	git reset --hard anchor &&

	if git merge -s recursive master
	then
		echo Oops, should not have succeeded
		false
	else
		git ls-files -s >current
		test_cmp current expect
	fi

HEAD is now at 020cbcd side modifies
Merging:
020cbcd side modifies
virtual master
found 1 common ancestor(s):
f315366 initial
Auto-merging m
CONFLICT (content): Merge conflict in m
Automatic merge failed; fix conflicts and then commit the result.

ok 3 - recursive

# passed all 3 test(s)
1..3
