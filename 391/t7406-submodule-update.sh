Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7406-submodule-update/.git/
expecting success: 
	echo file > file &&
	git add file &&
	test_tick &&
	git commit -m upstream &&
	git clone . super &&
	git clone super submodule &&
	git clone super rebasing &&
	git clone super merging &&
	(cd super &&
	 git submodule add ../submodule submodule &&
	 test_tick &&
	 git commit -m "submodule" &&
	 git submodule init submodule
	) &&
	(cd submodule &&
	echo "line2" > file &&
	git add file &&
	git commit -m "Commit 2"
	) &&
	(cd super &&
	 (cd submodule &&
	  git pull --rebase origin
	 ) &&
	 git add submodule &&
	 git commit -m "submodule update"
	) &&
	(cd super &&
	 git submodule add ../rebasing rebasing &&
	 test_tick &&
	 git commit -m "rebasing"
	) &&
	(cd super &&
	 git submodule add ../merging merging &&
	 test_tick &&
	 git commit -m "rebasing"
	)
[master (root-commit) 0c90624] upstream
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
Cloning into super...
done.
Cloning into submodule...
done.
Cloning into rebasing...
done.
Cloning into merging...
done.
Cloning into submodule...
done.
[master 3ae95bc] submodule
 Author: A U Thor <author@example.com>
 2 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 .gitmodules
 create mode 160000 submodule
Submodule 'submodule' (/Users/trast/git-smoke/t/trash directory.t7406-submodule-update/submodule) registered for path 'submodule'
[master 4301fd3] Commit 2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to 4301fd3e4110d3b6212c19aed3094150392545b9.
[master fed7cea] submodule update
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Cloning into rebasing...
done.
[master 5366fa1] rebasing
 Author: A U Thor <author@example.com>
 2 files changed, 4 insertions(+), 0 deletions(-)
 create mode 160000 rebasing
Cloning into merging...
done.
[master 7cb8417] rebasing
 Author: A U Thor <author@example.com>
 2 files changed, 4 insertions(+), 0 deletions(-)
 create mode 160000 merging

ok 1 - setup a submodule tree
expecting success: 
	(cd super/submodule &&
	 git reset --hard HEAD~1
	) &&
	(cd super &&
	 (cd submodule &&
	  compare_head
	 ) &&
	 git submodule update submodule &&
	 cd submodule &&
	 ! compare_head
	)
HEAD is now at 0c90624 upstream
Submodule path 'submodule': checked out '4301fd3e4110d3b6212c19aed3094150392545b9'

ok 2 - submodule update detaching the HEAD 

expecting success: 
	(cd super/submodule &&
	  git checkout master
	) &&
	(cd super &&
	 (cd submodule &&
	  compare_head
	 ) &&
	 git submodule update --rebase submodule &&
	 cd submodule &&
	 compare_head
	)

Your branch is behind 'origin/master' by 1 commit, and can be fast-forwarded.
First, rewinding head to replay your work on top of it...
Fast-forwarded master to 4301fd3e4110d3b6212c19aed3094150392545b9.
Submodule path 'submodule': rebased onto '4301fd3e4110d3b6212c19aed3094150392545b9'

ok 3 - submodule update --rebase staying on master

expecting success: 
	(cd super/submodule &&
	  git reset --hard HEAD~1
	) &&
	(cd super &&
	 (cd submodule &&
	  compare_head
	 ) &&
	 git submodule update --merge submodule &&
	 cd submodule &&
	 compare_head
	)
HEAD is now at 0c90624 upstream
Updating 0c90624..4301fd3
Fast-forward
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
Submodule path 'submodule': merged in '4301fd3e4110d3b6212c19aed3094150392545b9'
ok 4 - submodule update --merge staying on master
expecting success: 
	(cd super &&
	 git config submodule.submodule.update rebase
	) &&
	(cd super/submodule &&
	  git reset --hard HEAD~1
	) &&
	(cd super &&
	 (cd submodule &&
	  compare_head
	 ) &&
	 git submodule update submodule &&
	 cd submodule &&
	 compare_head
	)
HEAD is now at 0c90624 upstream
First, rewinding head to replay your work on top of it...
Fast-forwarded master to 4301fd3e4110d3b6212c19aed3094150392545b9.
Submodule path 'submodule': rebased onto '4301fd3e4110d3b6212c19aed3094150392545b9'

ok 5 - submodule update - rebase in .git/config

expecting success: 
	(cd super &&
	 git config submodule.submodule.update checkout
	) &&
	(cd super/submodule &&
	  git reset --hard HEAD~1
	) &&
	(cd super &&
	 (cd submodule &&
	  compare_head
	 ) &&
	 git submodule update --rebase submodule &&
	 cd submodule &&
	 compare_head
	)

HEAD is now at 0c90624 upstream
First, rewinding head to replay your work on top of it...
Fast-forwarded master to 4301fd3e4110d3b6212c19aed3094150392545b9.
Submodule path 'submodule': rebased onto '4301fd3e4110d3b6212c19aed3094150392545b9'
ok 6 - submodule update - checkout in .git/config but --rebase given
expecting success: 
	(cd super &&
	 git config submodule.submodule.update merge
	) &&
	(cd super/submodule &&
	  git reset --hard HEAD~1
	) &&
	(cd super &&
	 (cd submodule &&
	  compare_head
	 ) &&
	 git submodule update submodule &&
	 cd submodule &&
	 compare_head
	)
HEAD is now at 0c90624 upstream
Updating 0c90624..4301fd3
Fast-forward
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
Submodule path 'submodule': merged in '4301fd3e4110d3b6212c19aed3094150392545b9'

ok 7 - submodule update - merge in .git/config

expecting success: 
	(cd super &&
	 git config submodule.submodule.update checkout
	) &&
	(cd super/submodule &&
	  git reset --hard HEAD~1
	) &&
	(cd super &&
	 (cd submodule &&
	  compare_head
	 ) &&
	 git submodule update --merge submodule &&
	 cd submodule &&
	 compare_head
	)

HEAD is now at 0c90624 upstream
Updating 0c90624..4301fd3
Fast-forward
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
Submodule path 'submodule': merged in '4301fd3e4110d3b6212c19aed3094150392545b9'
ok 8 - submodule update - checkout in .git/config but --merge given
expecting success: 
	(cd super &&
	 git config submodule.submodule.update checkout
	) &&
	(cd super/submodule &&
	  git reset --hard HEAD^
	) &&
	(cd super &&
	 (cd submodule &&
	  compare_head
	 ) &&
	 git submodule update submodule &&
	 cd submodule &&
	 ! compare_head
	)
HEAD is now at 0c90624 upstream
Submodule path 'submodule': checked out '4301fd3e4110d3b6212c19aed3094150392545b9'

ok 9 - submodule update - checkout in .git/config

expecting success: 
	(cd super &&
	 git config -f .gitmodules submodule.rebasing.update rebase &&
	 git submodule init rebasing &&
	 test "rebase" = "$(git config submodule.rebasing.update)"
	)

Submodule 'rebasing' (/Users/trast/git-smoke/t/trash directory.t7406-submodule-update/rebasing) registered for path 'rebasing'

ok 10 - submodule init picks up rebase

expecting success: 
	(cd super &&
	 git config -f .gitmodules submodule.merging.update merge &&
	 git submodule init merging &&
	 test "merge" = "$(git config submodule.merging.update)"
	)

Submodule 'merging' (/Users/trast/git-smoke/t/trash directory.t7406-submodule-update/merging) registered for path 'merging'

ok 11 - submodule init picks up merge

# passed all 11 test(s)
1..11
