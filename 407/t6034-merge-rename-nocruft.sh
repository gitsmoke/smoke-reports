Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6034-merge-rename-nocruft/.git/
expecting success: 
cat >A <<\EOF &&
a aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
b bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
c cccccccccccccccccccccccccccccccccccccccccccccccc
d dddddddddddddddddddddddddddddddddddddddddddddddd
e eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
f ffffffffffffffffffffffffffffffffffffffffffffffff
g gggggggggggggggggggggggggggggggggggggggggggggggg
h hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
i iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
j jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj
k kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
l llllllllllllllllllllllllllllllllllllllllllllllll
m mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
n nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
o oooooooooooooooooooooooooooooooooooooooooooooooo
EOF

cat >M <<\EOF &&
A AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
B BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
C CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
D DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
E EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
F FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
G GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
H HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
I IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
J JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
K KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK
L LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
M MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
N NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
O OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
EOF

git add A M &&
git commit -m "initial has A and M" &&
git branch white &&
git branch red &&
git branch blue &&

git checkout white &&
sed -e "/^g /s/.*/g : white changes a line/" <A >B &&
sed -e "/^G /s/.*/G : colored branch changes a line/" <M >N &&
rm -f A M &&
git update-index --add --remove A B M N &&
git commit -m "white renames A->B, M->N" &&

git checkout red &&
echo created by red >R &&
git update-index --add R &&
git commit -m "red creates R" &&

git checkout blue &&
sed -e "/^o /s/.*/g : blue changes a line/" <A >B &&
rm -f A &&
mv B A &&
git update-index A &&
git commit -m "blue modify A" &&

git checkout master
[master (root-commit) 23cf48c] initial has A and M
 Author: A U Thor <author@example.com>
 2 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 A
 create mode 100644 M
[white 69b9c5c] white renames A->B, M->N
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename A => B (93%)
 rename M => N (93%)
[red c4583a1] red creates R
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 R
[blue 7cb5b09] blue modify A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
	git checkout -b red-white red &&
	git merge white &&
	git write-tree >/dev/null || {
		echo "BAD: merge did not complete"
		return 1
	}

	test -f B || {
		echo "BAD: B does not exist in working directory"
		return 1
	}
	test -f N || {
		echo "BAD: N does not exist in working directory"
		return 1
	}
	test -f R || {
		echo "BAD: R does not exist in working directory"
		return 1
	}

	test -f A && {
		echo "BAD: A still exists in working directory"
		return 1
	}
	test -f M && {
		echo "BAD: M still exists in working directory"
		return 1
	}
	return 0

Merging:
c4583a1 red creates R
virtual white
found 1 common ancestor(s):
23cf48c initial has A and M
Auto-merging B
Auto-merging N
Merge made by recursive.
 A => B |    2 +-
 M => N |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename A => B (93%)
 rename M => N (93%)
ok 2 - merge white into red (A->B,M->N)

expecting success: 
	git checkout -b white-blue white &&
	echo dirty >A &&
	git merge blue &&
	git write-tree >/dev/null || {
		echo "BAD: merge did not complete"
		return 1
	}

	test -f A || {
		echo "BAD: A does not exist in working directory"
		return 1
	}
	test `cat A` = dirty || {
		echo "BAD: A content is wrong"
		return 1
	}
	test -f B || {
		echo "BAD: B does not exist in working directory"
		return 1
	}
	test -f N || {
		echo "BAD: N does not exist in working directory"
		return 1
	}
	test -f M && {
		echo "BAD: M still exists in working directory"
		return 1
	}
	return 0
Merging:
69b9c5c white renames A->B, M->N
virtual blue
found 1 common ancestor(s):
23cf48c initial has A and M
Auto-merging B
Skipped N (merged same as existing)
Merge made by recursive.
 B |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
ok 3 - merge blue into white (A->B, mod A, A untracked)

# passed all 3 test(s)
1..3
