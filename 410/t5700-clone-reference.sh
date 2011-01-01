Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5700-clone-reference/.git/
expecting success: test_create_repo A && cd A &&
echo first > file1 &&
git add file1 &&
git commit -m initial
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5700-clone-reference/A/.git/
[master (root-commit) 66f4a50] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1

ok 1 - preparing first repository

expecting success: git clone A B && cd B &&
echo second > file2 &&
git add file2 &&
git commit -m addition &&
git repack -a -d &&
git prune
Cloning into B...
done.
[master 2fde01e] addition
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2

ok 2 - preparing second repository

expecting success: git clone -l -s --reference B A C
Cloning into C...
done.

ok 3 - cloning with reference (-l -s)

expecting success: test `wc -l <C/.git/objects/info/alternates` = 2

ok 4 - existence of info/alternates

expecting success: cd C &&
git pull ../B master
Updating 66f4a50..2fde01e
Fast-forward
 file2 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2

ok 5 - pulling from reference

expecting success: cd C &&
echo "0 objects, 0 kilobytes" > expected &&
git count-objects > current &&
test_cmp expected current
ok 6 - that reference gets used
expecting success: GIT_DEBUG_SEND_PACK=3 git clone --reference B "file://$(pwd)/A" D 3>"$U"
Cloning into D...
ok 7 - cloning with reference (no -l -s)
expecting success: ! grep "^want" "$U"
ok 8 - fetched no objects
expecting success: test `wc -l <D/.git/objects/info/alternates` = 1
ok 9 - existence of info/alternates
expecting success: cd D && git pull ../B master
Updating 66f4a50..2fde01e
Fast-forward
 file2 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2

ok 10 - pulling from reference

expecting success: cd D && echo "0 objects, 0 kilobytes" > expected &&
git count-objects > current &&
test_cmp expected current

ok 11 - that reference gets used

expecting success: cd A &&
echo third > file3 &&
git add file3 &&
git commit -m update &&
git repack -a -d &&
git prune
[master 6fb3e35] update
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file3

ok 12 - updating origin

expecting success: cd C &&
git pull origin
Merging:
2fde01e addition
virtual 6fb3e350db9ce641415c725a687780879a111bfd
found 1 common ancestor(s):
66f4a50 initial
Merge made by recursive.
 file3 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file3

ok 13 - pulling changes from origin

expecting success: cd C &&
echo "2 objects" > expected &&
git count-objects | cut -d, -f1 > current &&
test_cmp expected current

ok 14 - that alternate to origin gets used

expecting success: cd D &&
git pull origin
Merging:
2fde01e addition
virtual 6fb3e350db9ce641415c725a687780879a111bfd
found 1 common ancestor(s):
66f4a50 initial
Merge made by recursive.
 file3 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file3

ok 15 - pulling changes from origin

expecting success: cd D &&
echo "5 objects" > expected &&
git count-objects | cut -d, -f1 > current &&
test_cmp expected current

ok 16 - check objects expected to exist locally

expecting success: test_create_repo F && cd F &&
echo first > file1 &&
git add file1 &&
git commit -m initial
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5700-clone-reference/F/.git/
[master (root-commit) 3914797] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1

ok 17 - preparing alternate repository #1

expecting success: git clone F G && cd F &&
echo second > file2 &&
git add file2 &&
git commit -m addition
Cloning into G...
done.
[master e90e1b5] addition
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2

ok 18 - cloning alternate repo #2 and adding changes to repo #1

expecting success: git clone --reference G F H
Cloning into H...
done.

ok 19 - cloning alternate repo #1, using #2 as reference

expecting success: git clone -l -s --reference A B E
Cloning into E...
done.
ok 20 - cloning with reference being subset of source (-l -s)
# passed all 20 test(s)
1..20
