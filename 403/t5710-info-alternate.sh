Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5710-info-alternate/.git/
expecting success: test_create_repo A && cd A &&
echo "Hello World" > file1 &&
git add file1 &&
git commit -m "Initial commit" file1 &&
git repack -a -d &&
git prune
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5710-info-alternate/A/.git/
[master (root-commit) 59c0aeb] Initial commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1

ok 1 - preparing first repository

expecting success: git clone -l -s A B && cd B &&
echo "foo bar" > file2 &&
git add file2 &&
git commit -m "next commit" file2 &&
git repack -a -d -l &&
git prune
Cloning into B...
done.
[master 7a648df] next commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2

ok 2 - preparing second repository

expecting success: git clone -l -s B C && cd C &&
echo "Goodbye, cruel world" > file3 &&
git add file3 &&
git commit -m "one more" file3 &&
git repack -a -d -l &&
git prune
Cloning into C...
done.
[master 06ab67e] one more
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file3

ok 3 - preparing third repository
expecting success: git clone -l -s C D &&
git clone -l -s D E &&
git clone -l -s E F &&
git clone -l -s F G &&
git clone -l -s G H
Cloning into D...
done.
Cloning into E...
done.
Cloning into F...
done.
Cloning into G...
done.
Cloning into H...
done.

ok 4 - creating too deep nesting
expecting success: cd H && {
	test_valid_repo
	test $? -ne 0
}

ok 5 - invalidity of deepest repository

expecting success: cd C &&
test_valid_repo

ok 6 - validity of third repository

expecting success: cd D &&
test_valid_repo

ok 7 - validity of fourth repository

expecting success: echo "$base_dir"/B/.git/objects >> "$base_dir"/A/.git/objects/info/alternates&&
cd C &&
test_valid_repo

ok 8 - breaking of loops

expecting success: cd C &&
rm -f .git/objects/info/alternates &&
! (test_valid_repo)

ok 9 - that info/alternates is necessary

expecting success: cd C &&
echo "../../../B/.git/objects" > .git/objects/info/alternates &&
test_valid_repo

ok 10 - that relative alternate is possible for current dir

expecting success: 
    cd D &&
    ! (test_valid_repo)


ok 11 - that relative alternate is only possible for current dir

# passed all 11 test(s)
1..11
