Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t8001-annotate/.git/
expecting success: echo "1A quick brown fox jumps over the" >file &&
     echo "lazy dog" >>file &&
     git add file &&
     GIT_AUTHOR_NAME="A" GIT_AUTHOR_EMAIL="A@test.git" git commit -a -m "Initial."
[master (root-commit) a6db8d2] Initial.
 Author: A <A@test.git>
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - prepare reference tree

expecting success: check_count A 2

ok 2 - check all lines blamed on A

expecting success: echo "2A quick brown fox jumps over the" >>file &&
     echo "lazy dog" >> file &&
     GIT_AUTHOR_NAME="B" GIT_AUTHOR_EMAIL="B@test.git" git commit -a -m "Second."
[master 02e148e] Second.
 Author: B <B@test.git>
 1 files changed, 2 insertions(+), 0 deletions(-)

ok 3 - Setup new lines blamed on B
expecting success: check_count A 2 B 2
ok 4 - Two lines blamed on A, two on B

expecting success: git checkout -b branch1 master &&
     echo "3A slow green fox jumps into the" >> file &&
     echo "well." >> file &&
     GIT_AUTHOR_NAME="B1" GIT_AUTHOR_EMAIL="B1@test.git" git commit -a -m "Branch1-1"
[branch1 7882c8b] Branch1-1
 Author: B1 <B1@test.git>
 1 files changed, 2 insertions(+), 0 deletions(-)

ok 5 - merge-setup part 1

expecting success: check_count A 2 B 2 B1 2
ok 6 - Two lines blamed on A, two on B, two on B1

expecting success: git checkout -b branch2 master &&
     sed -e "s/2A quick brown/4A quick brown lazy dog/" < file > file.new &&
     mv file.new file &&
     GIT_AUTHOR_NAME="B2" GIT_AUTHOR_EMAIL="B2@test.git" git commit -a -m "Branch2-1"
[branch2 b731b9a] Branch2-1
 Author: B2 <B2@test.git>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 7 - merge-setup part 2

expecting success: check_count A 2 B 1 B2 1
ok 8 - Two lines blamed on A, one on B, one on B2
expecting success: git pull . branch1
Merging:
b731b9a Branch2-1
virtual 7882c8b0c96d4e9083f6178e6db58ee57a1f7e5f
found 1 common ancestor(s):
02e148e Second.
Auto-merging file
Merge made by recursive.
 file |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

ok 9 - merge-setup part 3

expecting success: check_count A 2 B 1 B1 2 B2 1

ok 10 - Two lines blamed on A, one on B, two on B1, one on B2

expecting success: check_count -h master A 2 B 2

ok 11 - Annotating an old revision works

expecting success: check_count -h master^ A 2

ok 12 - Annotating an old revision works

expecting success: echo "evil merge." >>file &&
     git commit -a --amend
[branch2 c003518] Merge branch 'branch1' into branch2
 Author: A U Thor <author@example.com>

ok 13 - merge-setup part 4
expecting success: check_count A 2 B 1 B1 2 B2 1 "A U Thor" 1

ok 14 - Two lines blamed on A, one on B, two on B1, one on B2, one on A U Thor

expecting success: echo "incomplete" | tr -d "\012" >>file &&
    GIT_AUTHOR_NAME="C" GIT_AUTHOR_EMAIL="C@test.git" git commit -a -m "Incomplete"
[branch2 ad70c76] Incomplete
 Author: C <C@test.git>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 15 - an incomplete line added

expecting success: check_count A 2 B 1 B1 2 B2 1 "A U Thor" 1 C 1
ok 16 - With incomplete lines.
expecting success: mv file file.orig &&
    {
	cat file.orig &&
	echo
    } | sed -e "s/^3A/99/" -e "/^1A/d" -e "/^incomplete/d" > file &&
    echo "incomplete" | tr -d "\012" >>file &&
    GIT_AUTHOR_NAME="D" GIT_AUTHOR_EMAIL="D@test.git" git commit -a -m "edit"
[branch2 15634e0] edit
 Author: D <D@test.git>
 1 files changed, 1 insertions(+), 2 deletions(-)

ok 17 - some edit

expecting success: check_count A 1 B 1 B1 1 B2 1 "A U Thor" 1 C 1 D 1

ok 18 - some edit

expecting success: [ $(git annotate file master | awk "{print \$3}" | grep -c "^A$") -eq 2 ] && \
     [ $(git annotate file master | awk "{print \$3}" | grep -c "^B$") -eq 2 ]
ok 19 - Annotating an old revision works
# passed all 19 test(s)
1..19
