Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3415-rebase-autosquash/.git/
expecting success: 
	echo 0 >file0 &&
	git add . &&
	test_tick &&
	git commit -m "initial commit" &&
	echo 0 >file1 &&
	echo 2 >file2 &&
	git add . &&
	test_tick &&
	git commit -m "first commit" &&
	git tag first-commit &&
	echo 3 >file3 &&
	git add . &&
	test_tick &&
	git commit -m "second commit" &&
	git tag base

[master (root-commit) d78c915] initial commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file0
[master 244a0fe] first commit
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
[master f0c2a7e] second commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file3

ok 1 - setup

expecting success: 
	test_auto_fixup final-fixup-option --autosquash

HEAD is now at f0c2a7e second commit
[master e17f730] fixup! first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/3)[detached HEAD 9252710] first commit
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
Rebasing (3/3)
ok 2 - auto fixup (option)

expecting success: 
	git config rebase.autosquash true &&
	test_auto_fixup final-fixup-config-true &&
	test_must_fail test_auto_fixup fixup-config-true-no --no-autosquash &&
	git config rebase.autosquash false &&
	test_must_fail test_auto_fixup final-fixup-config-false

HEAD is now at f0c2a7e second commit
[master f84b6d6] fixup! first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/3)[detached HEAD 48456c1] first commit
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
Rebasing (3/3)HEAD is now at f0c2a7e second commit
[master 03041cb] fixup! first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (3/3)HEAD is now at f0c2a7e second commit
[master bee11d3] fixup! first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (3/3)
ok 3 - auto fixup (config)

expecting success: 
	test_auto_squash final-squash --autosquash
HEAD is now at f0c2a7e second commit
[master 19ce186] squash! first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/3)[detached HEAD 9064ef2] first commit
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
Rebasing (3/3)
ok 4 - auto squash (option)

expecting success: 
	git config rebase.autosquash true &&
	test_auto_squash final-squash-config-true &&
	test_must_fail test_auto_squash squash-config-true-no --no-autosquash &&
	git config rebase.autosquash false &&
	test_must_fail test_auto_squash final-squash-config-false

HEAD is now at f0c2a7e second commit
[master a95a906] squash! first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/3)[detached HEAD 46676fa] first commit
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
Rebasing (3/3)HEAD is now at f0c2a7e second commit
[master fc8ff6e] squash! first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (3/3)HEAD is now at f0c2a7e second commit
[master 336ee2b] squash! first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (3/3)
ok 5 - auto squash (config)

expecting success: 
	git reset --hard base &&
	echo 1 >file1 &&
	git add -u &&
	test_tick &&
	git commit -m "squash! forst" &&
	git tag final-missquash &&
	test_tick &&
	git rebase --autosquash -i HEAD^^^ &&
	git log --oneline >actual &&
	test 4 = $(wc -l <actual) &&
	git diff --exit-code final-missquash &&
	test 0 = $(git rev-list final-missquash...HEAD | wc -l)

HEAD is now at f0c2a7e second commit
[master bdc406a] squash! forst
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (3/3)
ok 6 - misspelled auto squash

expecting success: 
	git reset --hard base &&
	echo 4 >file4 &&
	git add file4 &&
	test_tick &&
	git commit -m "first new commit" &&
	echo 1 >file1 &&
	git add -u &&
	test_tick &&
	git commit -m "squash! first" &&
	git tag final-multisquash &&
	test_tick &&
	git rebase --autosquash -i HEAD~4 &&
	git log --oneline >actual &&
	test 4 = $(wc -l <actual) &&
	git diff --exit-code final-multisquash &&
	test 1 = "$(git cat-file blob HEAD^^:file1)" &&
	test 2 = $(git cat-file commit HEAD^^ | grep first | wc -l) &&
	test 1 = $(git cat-file commit HEAD | grep first | wc -l)
HEAD is now at f0c2a7e second commit
[master 671d0de] first new commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file4
[master 1cded01] squash! first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/4)[detached HEAD 8cc2a0e] first commit
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
Rebasing (3/4)Rebasing (4/4)
ok 7 - auto squash that matches 2 commits

expecting success: 
	git reset --hard base &&
	echo 1 >file1 &&
	git add -u &&
	test_tick &&
	git commit -m "squash! third" &&
	echo 4 >file4 &&
	git add file4 &&
	test_tick &&
	git commit -m "third commit" &&
	git tag final-presquash &&
	test_tick &&
	git rebase --autosquash -i HEAD~4 &&
	git log --oneline >actual &&
	test 5 = $(wc -l <actual) &&
	git diff --exit-code final-presquash &&
	test 0 = "$(git cat-file blob HEAD^^:file1)" &&
	test 1 = "$(git cat-file blob HEAD^:file1)" &&
	test 1 = $(git cat-file commit HEAD | grep third | wc -l) &&
	test 1 = $(git cat-file commit HEAD^ | grep third | wc -l)

HEAD is now at f0c2a7e second commit
[master 3a205cd] squash! third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 76ae28b] third commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file4
Rebasing (4/4)
ok 8 - auto squash that matches a commit after the squash

expecting success: 
	git reset --hard base &&
	echo 1 >file1 &&
	git add -u &&
	test_tick &&
	git commit -m "squash! $(git rev-parse --short HEAD^)" &&
	git tag final-shasquash &&
	test_tick &&
	git rebase --autosquash -i HEAD^^^ &&
	git log --oneline >actual &&
	test 3 = $(wc -l <actual) &&
	git diff --exit-code final-shasquash &&
	test 1 = "$(git cat-file blob HEAD^:file1)" &&
	test 1 = $(git cat-file commit HEAD^ | grep squash | wc -l)
HEAD is now at f0c2a7e second commit
[master 2592f98] squash! 244a0fe
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/3)[detached HEAD ba6c8cf] first commit
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
Rebasing (3/3)
ok 9 - auto squash that matches a sha1

expecting success: 
	git reset --hard base &&
	echo 1 >file1 &&
	git add -u &&
	test_tick &&
	git commit -m "squash! $(git rev-parse --short=11 HEAD^)" &&
	git tag final-longshasquash &&
	test_tick &&
	git rebase --autosquash -i HEAD^^^ &&
	git log --oneline >actual &&
	test 3 = $(wc -l <actual) &&
	git diff --exit-code final-longshasquash &&
	test 1 = "$(git cat-file blob HEAD^:file1)" &&
	test 1 = $(git cat-file commit HEAD^ | grep squash | wc -l)
HEAD is now at f0c2a7e second commit
[master 358ddef] squash! 244a0fe611d
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/3)[detached HEAD 2fb404b] first commit
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
Rebasing (3/3)
ok 10 - auto squash that matches longer sha1

expecting success: 
	test_auto_commit_flags fixup 1
HEAD is now at f0c2a7e second commit
[master ec3ac31] fixup! first commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/3)[detached HEAD 04a6f94] first commit
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
Rebasing (3/3)
ok 11 - use commit --fixup

expecting success: 
	test_auto_commit_flags squash 2
HEAD is now at f0c2a7e second commit
[master 56a0d48] squash! first commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rebasing (2/3)[detached HEAD ca39a78] first commit
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
Rebasing (3/3)
ok 12 - use commit --squash

# passed all 12 test(s)
1..12
