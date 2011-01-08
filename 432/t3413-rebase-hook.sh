Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3413-rebase-hook/.git/
expecting success: 
	echo hello >file &&
	git add file &&
	test_tick &&
	git commit -m initial &&
	echo goodbye >file &&
	git add file &&
	test_tick &&
	git commit -m second &&
	git checkout -b side HEAD^ &&
	echo world >git &&
	git add git &&
	test_tick &&
	git commit -m side &&
	git checkout master &&
	git log --pretty=oneline --abbrev-commit --graph --all &&
	git branch test side

[master (root-commit) 6637599] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 20a11a4] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[side c847452] side
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 git
* c847452 side
| * 20a11a4 second
|/  
* 6637599 initial

ok 1 - setup
expecting success: 
	git checkout test &&
	git reset --hard side &&
	git rebase master &&
	test "z$(cat git)" = zworld
HEAD is now at c847452 side
First, rewinding head to replay your work on top of it...
Applying: side
ok 2 - rebase
expecting success: 
	git checkout test &&
	git reset --hard side &&
	EDITOR=true git rebase -i master &&
	test "z$(cat git)" = zworld
HEAD is now at c847452 side
Rebasing (1/1)
ok 3 - rebase -i

expecting success: 
	mkdir -p .git/hooks &&
	cat >.git/hooks/pre-rebase <<EOF &&
#!$SHELL_PATH
echo "\$1,\$2" >.git/PRE-REBASE-INPUT
EOF
	chmod +x .git/hooks/pre-rebase


ok 4 - setup pre-rebase hook

expecting success: 
	git checkout test &&
	git reset --hard side &&
	git rebase master &&
	test "z$(cat git)" = zworld &&
	test "z$(cat .git/PRE-REBASE-INPUT)" = zmaster,


HEAD is now at c847452 side
First, rewinding head to replay your work on top of it...
Applying: side

ok 5 - pre-rebase hook gets correct input (1)

expecting success: 
	git checkout test &&
	git reset --hard side &&
	git rebase master test &&
	test "z$(cat git)" = zworld &&
	test "z$(cat .git/PRE-REBASE-INPUT)" = zmaster,test

HEAD is now at c847452 side
First, rewinding head to replay your work on top of it...
Applying: side

ok 6 - pre-rebase hook gets correct input (2)

expecting success: 
	git checkout test &&
	git reset --hard side &&
	git checkout master &&
	git rebase master test &&
	test "z$(cat git)" = zworld &&
	test "z$(cat .git/PRE-REBASE-INPUT)" = zmaster,test

HEAD is now at c847452 side
First, rewinding head to replay your work on top of it...
Applying: side

ok 7 - pre-rebase hook gets correct input (3)

expecting success: 
	git checkout test &&
	git reset --hard side &&
	EDITOR=true git rebase -i master &&
	test "z$(cat git)" = zworld &&
	test "z$(cat .git/PRE-REBASE-INPUT)" = zmaster,


HEAD is now at c847452 side
Rebasing (1/1)
ok 8 - pre-rebase hook gets correct input (4)

expecting success: 
	git checkout test &&
	git reset --hard side &&
	EDITOR=true git rebase -i master test &&
	test "z$(cat git)" = zworld &&
	test "z$(cat .git/PRE-REBASE-INPUT)" = zmaster,test

HEAD is now at c847452 side
Rebasing (1/1)
ok 9 - pre-rebase hook gets correct input (5)

expecting success: 
	git checkout test &&
	git reset --hard side &&
	git checkout master &&
	EDITOR=true git rebase -i master test &&
	test "z$(cat git)" = zworld &&
	test "z$(cat .git/PRE-REBASE-INPUT)" = zmaster,test
HEAD is now at c847452 side
Rebasing (1/1)
ok 10 - pre-rebase hook gets correct input (6)

expecting success: 
	mkdir -p .git/hooks &&
	cat >.git/hooks/pre-rebase <<EOF &&
#!$SHELL_PATH
false
EOF
	chmod +x .git/hooks/pre-rebase

ok 11 - setup pre-rebase hook that fails

expecting success: 
	git checkout test &&
	git reset --hard side &&
	test_must_fail git rebase master &&
	test "z$(git symbolic-ref HEAD)" = zrefs/heads/test &&
	test 0 = $(git rev-list HEAD...side | wc -l)

HEAD is now at c847452 side

ok 12 - pre-rebase hook stops rebase (1)

expecting success: 
	git checkout test &&
	git reset --hard side &&
	(
		EDITOR=:
		export EDITOR
		test_must_fail git rebase -i master
	) &&
	test "z$(git symbolic-ref HEAD)" = zrefs/heads/test &&
	test 0 = $(git rev-list HEAD...side | wc -l)

HEAD is now at c847452 side

ok 13 - pre-rebase hook stops rebase (2)

expecting success: 
	git checkout test &&
	git reset --hard side &&
	git rebase --no-verify master &&
	test "z$(git symbolic-ref HEAD)" = zrefs/heads/test &&
	test "z$(cat git)" = zworld

HEAD is now at c847452 side
First, rewinding head to replay your work on top of it...
Applying: side

ok 14 - rebase --no-verify overrides pre-rebase (1)

expecting success: 
	git checkout test &&
	git reset --hard side &&
	EDITOR=true git rebase --no-verify -i master &&
	test "z$(git symbolic-ref HEAD)" = zrefs/heads/test &&
	test "z$(cat git)" = zworld

HEAD is now at c847452 side
Rebasing (1/1)
ok 15 - rebase --no-verify overrides pre-rebase (2)

# passed all 15 test(s)
1..15
