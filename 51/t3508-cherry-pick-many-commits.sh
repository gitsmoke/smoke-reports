ok 1 - setup
not ok - 2 cherry-pick first..fourth works
#	
#		cat <<-\EOF >expected &&
#		[master OBJID] second
#		 Author: A U Thor <author@example.com>
#		 1 files changed, 1 insertions(+), 0 deletions(-)
#		[master OBJID] third
#		 Author: A U Thor <author@example.com>
#		 1 files changed, 1 insertions(+), 0 deletions(-)
#		[master OBJID] fourth
#		 Author: A U Thor <author@example.com>
#		 1 files changed, 1 insertions(+), 0 deletions(-)
#		EOF
#	
#		git checkout -f master &&
#		git reset --hard first &&
#		test_tick &&
#		git cherry-pick first..fourth >actual &&
#		git diff --quiet other &&
#		git diff --quiet HEAD other &&
#	
#		sed -e "s/$_x05[0-9a-f][0-9a-f]/OBJID/" <actual >actual.fuzzy &&
#		test_cmp expected actual.fuzzy &&
#		check_head_differs_from fourth
#	
not ok - 3 cherry-pick --strategy resolve first..fourth works
#	
#		cat <<-\EOF >expected &&
#		Trying simple merge.
#		[master OBJID] second
#		 Author: A U Thor <author@example.com>
#		 1 files changed, 1 insertions(+), 0 deletions(-)
#		Trying simple merge.
#		[master OBJID] third
#		 Author: A U Thor <author@example.com>
#		 1 files changed, 1 insertions(+), 0 deletions(-)
#		Trying simple merge.
#		[master OBJID] fourth
#		 Author: A U Thor <author@example.com>
#		 1 files changed, 1 insertions(+), 0 deletions(-)
#		EOF
#	
#		git checkout -f master &&
#		git reset --hard first &&
#		test_tick &&
#		git cherry-pick --strategy resolve first..fourth >actual &&
#		git diff --quiet other &&
#		git diff --quiet HEAD other &&
#		sed -e "s/$_x05[0-9a-f][0-9a-f]/OBJID/" <actual >actual.fuzzy &&
#		test_cmp expected actual.fuzzy &&
#		check_head_differs_from fourth
#	
not ok - 4 cherry-pick --ff first..fourth works
#	
#		git checkout -f master &&
#		git reset --hard first &&
#		test_tick &&
#		git cherry-pick --ff first..fourth &&
#		git diff --quiet other &&
#		git diff --quiet HEAD other &&
#		check_head_equals fourth
#	
not ok - 5 cherry-pick -n first..fourth works
#	
#		git checkout -f master &&
#		git reset --hard first &&
#		test_tick &&
#		git cherry-pick -n first..fourth &&
#		git diff --quiet other &&
#		git diff --cached --quiet other &&
#		git diff --quiet HEAD first
#	
not ok - 6 revert first..fourth works
#	
#		git checkout -f master &&
#		git reset --hard fourth &&
#		test_tick &&
#		git revert first..fourth &&
#		git diff --quiet first &&
#		git diff --cached --quiet first &&
#		git diff --quiet HEAD first
#	
not ok - 7 revert ^first fourth works
#	
#		git checkout -f master &&
#		git reset --hard fourth &&
#		test_tick &&
#		git revert ^first fourth &&
#		git diff --quiet first &&
#		git diff --cached --quiet first &&
#		git diff --quiet HEAD first
#	
not ok - 8 revert fourth fourth~1 fourth~2 works
#	
#		git checkout -f master &&
#		git reset --hard fourth &&
#		test_tick &&
#		git revert fourth fourth~1 fourth~2 &&
#		git diff --quiet first &&
#		git diff --cached --quiet first &&
#		git diff --quiet HEAD first
#	
not ok - 9 cherry-pick -3 fourth works
#	
#		git checkout -f master &&
#		git reset --hard first &&
#		test_tick &&
#		git cherry-pick -3 fourth &&
#		git diff --quiet other &&
#		git diff --quiet HEAD other &&
#		check_head_differs_from fourth
#	
not ok - 10 cherry-pick --stdin works
#	
#		git checkout -f master &&
#		git reset --hard first &&
#		test_tick &&
#		git rev-list --reverse first..fourth | git cherry-pick --stdin &&
#		git diff --quiet other &&
#		git diff --quiet HEAD other &&
#		check_head_differs_from fourth
#	
# failed 9 among 10 test(s)
1..10
