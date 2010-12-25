Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5524-pull-msg/.git/
expecting success: 
	test_commit initial afile original &&
	git clone . cloned &&
	(
		cd cloned &&
		echo added >bfile &&
		git add bfile &&
		test_tick &&
		git commit -m "add bfile"
	) &&
	test_tick && test_tick &&
	echo "original $dollar" >afile &&
	git add afile &&
	git commit -m "do not clobber $dollar signs"

[master (root-commit) f176df3] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 afile
Cloning into cloned...
done.
[master 1facbb5] add bfile
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 bfile
[master bcd3034] do not clobber $Dollar signs
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup
expecting success: 
(
	cd cloned &&
	git pull --log &&
	git log -2 &&
	git cat-file commit HEAD >result &&
	grep Dollar result
)

Merging:
1facbb5 add bfile
virtual bcd30347290437c1617d7f6e4ca5a100b755ed5d
found 1 common ancestor(s):
f176df3 initial
Merge made by recursive.
 afile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
commit 558dd7cc7cd18eff7c7732f07e7b9abfd4a1c120
Merge: 1facbb5 bcd3034
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:15:13 2005 -0700

    Merge branch 'master' of /Users/trast/git-smoke/t/trash directory.t5524-pull-msg/.
    
    * 'master' of /Users/trast/git-smoke/t/trash directory.t5524-pull-msg/.:
      do not clobber $Dollar signs

commit bcd30347290437c1617d7f6e4ca5a100b755ed5d
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:15:13 2005 -0700

    do not clobber $Dollar signs
  do not clobber $Dollar signs

ok 2 - pull

# passed all 2 test(s)
1..2
