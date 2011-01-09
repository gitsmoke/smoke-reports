Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7610-mergetool/.git/
expecting success: 
    git config rerere.enabled true &&
    echo master >file1 &&
    mkdir subdir &&
    echo master sub >subdir/file3 &&
    git add file1 subdir/file3 &&
    git commit -m "added file1" &&

    git checkout -b branch1 master &&
    echo branch1 change >file1 &&
    echo branch1 newfile >file2 &&
    echo branch1 sub >subdir/file3 &&
    git add file1 file2 subdir/file3 &&
    git commit -m "branch1 changes" &&

    git checkout master &&
    echo master updated >file1 &&
    echo master new >file2 &&
    echo master new sub >subdir/file3 &&
    git add file1 file2 subdir/file3 &&
    git commit -m "master updates" &&

    git config merge.tool mytool &&
    git config mergetool.mytool.cmd "cat \"\$REMOTE\" >\"\$MERGED\"" &&
    git config mergetool.mytool.trustExitCode true
[master (root-commit) 089eab9] added file1
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 subdir/file3
[branch1 ff7a2df] branch1 changes
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 2 deletions(-)
 create mode 100644 file2
[master 3a04a2e] master updates
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 2 deletions(-)
 create mode 100644 file2

ok 1 - setup

expecting success: 
    git checkout -b test1 branch1 &&
    test_must_fail git merge master >/dev/null 2>&1 &&
    ( yes "" | git mergetool file1 >/dev/null 2>&1 ) &&
    ( yes "" | git mergetool file2 >/dev/null 2>&1 ) &&
    ( yes "" | git mergetool subdir/file3 >/dev/null 2>&1 ) &&
    test "$(cat file1)" = "master updated" &&
    test "$(cat file2)" = "master new" &&
    test "$(cat subdir/file3)" = "master new sub" &&
    git commit -m "branch1 resolved with mergetool"
[test1 2707044] branch1 resolved with mergetool
 Author: A U Thor <author@example.com>

ok 2 - custom mergetool

expecting success: 
    git config core.autocrlf true &&
    git checkout -b test2 branch1 &&
    test_must_fail git merge master >/dev/null 2>&1 &&
    ( yes "" | git mergetool file1 >/dev/null 2>&1 ) &&
    ( yes "" | git mergetool file2 >/dev/null 2>&1 ) &&
    ( yes "" | git mergetool subdir/file3 >/dev/null 2>&1 ) &&
    test "$(printf x | cat file1 -)" = "$(printf "master updated
x")" &&
    test "$(printf x | cat file2 -)" = "$(printf "master new
x")" &&
    test "$(printf x | cat subdir/file3 -)" = "$(printf "master new sub
x")" &&
    git commit -m "branch1 resolved with mergetool - autocrlf" &&
    git config core.autocrlf false &&
    git reset --hard
[test2 ce79b32] branch1 resolved with mergetool - autocrlf
 Author: A U Thor <author@example.com>
HEAD is now at ce79b32 branch1 resolved with mergetool - autocrlf

ok 3 - mergetool crlf

expecting success: 
    git checkout -b test3 branch1 &&
    (
	cd subdir &&
	test_must_fail git merge master >/dev/null 2>&1 &&
	( yes "" | git mergetool file3 >/dev/null 2>&1 ) &&
	test "$(cat file3)" = "master new sub"
    )
ok 4 - mergetool in subdir
expecting success: 
    (
	cd subdir &&
	( yes "" | git mergetool ../file1 >/dev/null 2>&1 ) &&
	( yes "" | git mergetool ../file2 >/dev/null 2>&1 ) &&
	test "$(cat ../file1)" = "master updated" &&
	test "$(cat ../file2)" = "master new" &&
	git commit -m "branch1 resolved with mergetool - subdir"
    )
[test3 7507608] branch1 resolved with mergetool - subdir
 Author: A U Thor <author@example.com>

ok 5 - mergetool on file in parent dir

expecting success: 
    git checkout -b test4 branch1 &&
    test_must_fail git merge master &&
    test -n "$(git ls-files -u)" &&
    output="$(git mergetool --no-prompt)" &&
    test "$output" = "No files need merging" &&
    git reset --hard
Merging:
ff7a2df branch1 changes
virtual master
found 1 common ancestor(s):
089eab9 added file1
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Auto-merging file2
CONFLICT (add/add): Merge conflict in file2
Auto-merging subdir/file3
CONFLICT (content): Merge conflict in subdir/file3
Automatic merge failed; fix conflicts and then commit the result.
HEAD is now at ff7a2df branch1 changes

ok 6 - mergetool skips autoresolved

expecting success: 
    (
	cd subdir &&
	git config rerere.enabled false &&
	test_must_fail git merge master &&
	git mergetool --no-prompt &&
	test "$(cat ../file1)" = "master updated" &&
	test "$(cat ../file2)" = "master new" &&
	test "$(cat file3)" = "master new sub" &&
	git add ../file1 ../file2 file3 &&
	git commit -m "branch2 resolved by mergetool from subdir"
    )
Merging:
ff7a2df branch1 changes
virtual master
found 1 common ancestor(s):
089eab9 added file1
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Auto-merging file2
CONFLICT (add/add): Merge conflict in file2
Auto-merging subdir/file3
CONFLICT (content): Merge conflict in subdir/file3
Automatic merge failed; fix conflicts and then commit the result.
Merging:
file1
file2
subdir/file3
Normal merge conflict for 'file1':
  {local}: modified
  {remote}: modified
Normal merge conflict for 'file2':
  {local}: created
  {remote}: created

Normal merge conflict for 'subdir/file3':
  {local}: modified
  {remote}: modified
[test4 0be4ee3] branch2 resolved by mergetool from subdir
 Author: A U Thor <author@example.com>

ok 7 - mergetool merges all from subdir

# passed all 7 test(s)
1..7
