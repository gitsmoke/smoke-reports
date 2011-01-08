Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7403-submodule-sync/.git/
expecting success: 
	echo file > file &&
	git add file &&
	test_tick &&
	git commit -m upstream &&
	git clone . super &&
	git clone super submodule &&
	(cd super &&
	 git submodule add ../submodule submodule &&
	 test_tick &&
	 git commit -m "submodule"
	) &&
	git clone super super-clone &&
	(cd super-clone && git submodule update --init) &&
	git clone super empty-clone &&
	(cd empty-clone && git submodule init)
[master (root-commit) 0c90624] upstream
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
Cloning into super
done.
Cloning into submodule
done.
Cloning into submodule
done.
[master 3ae95bc] submodule
 Author: A U Thor <author@example.com>
 2 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 .gitmodules
 create mode 160000 submodule
Cloning into super-clone
done.
Submodule 'submodule' (/Users/trast/git-smoke/t/trash directory.t7403-submodule-sync/submodule) registered for path 'submodule'
Cloning into submodule
done.
Submodule path 'submodule': checked out '0c90624ab7f1aaa301d3bb79f60dcfed1ec4897f'
Cloning into empty-clone
done.
Submodule 'submodule' (/Users/trast/git-smoke/t/trash directory.t7403-submodule-sync/submodule) registered for path 'submodule'

ok 1 - setup

expecting success: 
	(cd submodule &&
	 echo second line >> file &&
	 test_tick &&
	 git commit -a -m "change submodule"
	)
[master ceab2a6] change submodule
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 2 - change submodule

expecting success: 
	(cd super &&
	 cd submodule &&
	 git checkout master &&
	 git pull
	) &&
	mv submodule moved-submodule &&
	(cd super &&
	 git config -f .gitmodules submodule.submodule.url ../moved-submodule &&
	 test_tick &&
	 git commit -a -m moved-submodule
	)
Updating 0c90624..ceab2a6
Fast-forward
 file |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
[master b388ae1] moved-submodule
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 2 deletions(-)

ok 3 - change submodule url

expecting success: 
	(cd super-clone &&
	 git pull &&
	 git submodule sync
	) &&
	test -d "$(git config -f super-clone/submodule/.git/config \
	                        remote.origin.url)" &&
	(cd super-clone/submodule &&
	 git checkout master &&
	 git pull
	) &&
	(cd super-clone &&
	 test -d "$(git config submodule.submodule.url)"
	)
Updating 3ae95bc..b388ae1
Fast-forward
 .gitmodules |    2 +-
 submodule   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
Synchronizing submodule url for 'submodule'
Updating 0c90624..ceab2a6
Fast-forward
 file |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 4 - "git submodule sync" should update submodule URLs

expecting success: 
	(cd empty-clone &&
	 git pull &&
	 git submodule sync &&
	 test -d "$(git config submodule.submodule.url)"
	)
Updating 3ae95bc..b388ae1
Fast-forward
 .gitmodules |    2 +-
 submodule   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
Synchronizing submodule url for 'submodule'
ok 5 - "git submodule sync" should update submodule URLs if not yet cloned
# passed all 5 test(s)
1..5
