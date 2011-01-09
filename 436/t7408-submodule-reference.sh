Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7408-submodule-reference/.git/
expecting success: test_create_repo A && cd A &&
echo first > file1 &&
git add file1 &&
git commit -m A-initial
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7408-submodule-reference/A/.git/
[master (root-commit) d2e4d73] A-initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1

ok 1 - preparing first repository

expecting success: git clone A B && cd B &&
echo second > file2 &&
git add file2 &&
git commit -m B-addition &&
git repack -a -d &&
git prune
Cloning into B
done.
[master fabf447] B-addition
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2

ok 2 - preparing second repository

expecting success: test_create_repo super && cd super &&
echo file > file &&
git add file &&
git commit -m B-super-initial
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7408-submodule-reference/super/.git/
[master (root-commit) dcb6329] B-super-initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
ok 3 - preparing supermodule
expecting success: cd super && git submodule add --reference ../B "file://$base_dir/A" sub &&
git commit -m B-super-added
Cloning into sub
[master c3fecd1] B-super-added
 Author: A U Thor <author@example.com>
 2 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 .gitmodules
 create mode 160000 sub

ok 4 - submodule add --reference

expecting success: test `wc -l <super/sub/.git/objects/info/alternates` = 1

ok 5 - after add: existence of info/alternates

expecting success: cd super/sub &&
echo "0 objects, 0 kilobytes" > expected &&
git count-objects > current &&
diff expected current

ok 6 - that reference gets used with add

expecting success: git clone super super-clone
Cloning into super-clone
done.

ok 7 - cloning supermodule

expecting success: cd super-clone && git submodule update --init --reference ../B
Submodule 'sub' (file:///Users/trast/git-smoke/t/trash directory.t7408-submodule-reference/A) registered for path 'sub'
Cloning into sub
Submodule path 'sub': checked out 'd2e4d735a241a16bc16d439f60809be546bdcac0'

ok 8 - update with reference

expecting success: test `wc -l <super-clone/sub/.git/objects/info/alternates` = 1

ok 9 - after update: existence of info/alternates
expecting success: cd super-clone/sub &&
echo "0 objects, 0 kilobytes" > expected &&
git count-objects > current &&
diff expected current

ok 10 - that reference gets used with update

# passed all 10 test(s)
1..10
