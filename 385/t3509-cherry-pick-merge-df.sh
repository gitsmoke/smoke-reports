Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3509-cherry-pick-merge-df/.git/
expecting success: 
	mkdir a &&
	>a/f &&
	git add a &&
	git commit -m a &&

	mkdir b &&
	ln -s ../a b/a &&
	git add b &&
	git commit -m b &&

	git checkout -b branch &&
	rm b/a &&
	mv a b/a &&
	ln -s b/a a &&
	git add . &&
	git commit -m swap &&

	>f1 &&
	git add f1 &&
	git commit -m f1
[master (root-commit) fe766ba] a
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a/f
[master 53dcd47] b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 120000 b/a
[branch 8fc5c93] swap
 Author: A U Thor <author@example.com>
 3 files changed, 1 insertions(+), 1 deletions(-)
 create mode 120000 a
 delete mode 120000 b/a
 rename {a => b/a}/f (100%)
[branch a96c78d] f1
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 f1

ok 1 - Setup rename across paths each below D/F conflicts

expecting success: 
	git reset --hard &&
	git checkout master^0 &&
	git cherry-pick branch

HEAD is now at a96c78d f1
Removing b/a to make room for subdirectory; may re-add later.
Skipped a/f (merged same as existing)
Adding b/a
[detached HEAD baa8ac2] f1
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 f1

ok 2 - Cherry-pick succeeds with rename across D/F conflicts

expecting success: 
	git checkout --orphan nick-testcase &&
	git rm -rf . &&

	>empty &&
	git add empty &&
	git commit -m "Empty file" &&

	git checkout -b simple &&
	mv empty file &&
	mkdir empty &&
	mv file empty &&
	git add empty/file &&
	git commit -m "Empty file under empty dir" &&

	echo content >newfile &&
	git add newfile &&
	git commit -m "New file"

rm 'a/f'
rm 'b/a'
rm 'f1'
[nick-testcase (root-commit) a7213a2] Empty file
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 empty
[simple 8811367] Empty file under empty dir
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename empty => empty/file (100%)
[simple 4acc725] New file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 newfile

ok 3 - Setup rename with file on one side matching directory name on other

expecting success: 
	git reset --hard &&
	git checkout -q nick-testcase^0 &&
	git cherry-pick --strategy=resolve simple

HEAD is now at 4acc725 New file
Trying simple merge.
Simple merge failed, trying Automatic merge.
[detached HEAD 033293b] New file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 newfile

ok 4 - Cherry-pick succeeds with was_a_dir/file -> was_a_dir (resolve)

expecting success: 
	git reset --hard &&
	git checkout -q nick-testcase^0 &&
	git cherry-pick --strategy=recursive simple

HEAD is now at 033293b New file
Removing empty to make room for subdirectory; may re-add later.
Skipped empty (merged same as existing)
[detached HEAD 033293b] New file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 newfile

ok 5 - Cherry-pick succeeds with was_a_dir/file -> was_a_dir (recursive)

expecting success: 
	git reset --hard &&
	git checkout --orphan mergeme &&
	git rm -rf . &&

	mkdir sub &&
	mkdir othersub &&
	echo content > sub/file &&
	echo foo > othersub/whatever &&
	git add -A &&
	git commit -m "Common commmit" &&

	git rm -rf othersub &&
	git mv sub/file othersub &&
	git commit -m "Commit to merge" &&

	git checkout -b newhead mergeme~1 &&
	>independent-change &&
	git add independent-change &&
	git commit -m "Completely unrelated change"

HEAD is now at 033293b New file
rm 'empty'
rm 'newfile'
[mergeme (root-commit) 6001f3c] Common commmit
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 othersub/whatever
 create mode 100644 sub/file
rm 'othersub/whatever'
[mergeme 28beb30] Commit to merge
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 1 deletions(-)
 rename sub/file => othersub (100%)
 delete mode 100644 othersub/whatever
[newhead 20e981a] Completely unrelated change
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 independent-change

ok 6 - Setup rename with file on one side matching different dirname on other

expecting success: 
	git reset --hard &&
	git checkout -q newhead^0 &&
	git cherry-pick --strategy=resolve mergeme
HEAD is now at 20e981a Completely unrelated change
Trying simple merge.
Simple merge failed, trying Automatic merge.
Adding othersub
[detached HEAD 486e082] Commit to merge
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 1 deletions(-)
 rename sub/file => othersub (100%)
 delete mode 100644 othersub/whatever

ok 7 - Cherry-pick with rename to different D/F conflict succeeds (resolve)

expecting success: 
	git reset --hard &&
	git checkout -q newhead^0 &&
	git cherry-pick --strategy=recursive mergeme

HEAD is now at 486e082 Commit to merge
Removing othersub/whatever
Skipped othersub (merged same as existing)
[detached HEAD 97fd538] Commit to merge
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 1 deletions(-)
 rename sub/file => othersub (100%)
 delete mode 100644 othersub/whatever

ok 8 - Cherry-pick with rename to different D/F conflict succeeds (recursive)

# passed all 8 test(s)
1..8
