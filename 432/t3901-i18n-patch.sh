Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3901-i18n-patch/.git/
expecting success: 
	git config i18n.commitencoding UTF-8 &&

	# use UTF-8 in author and committer name to match the
	# i18n.commitencoding settings
	. "$TEST_DIRECTORY"/t3901-utf8.txt &&

	test_tick &&
	echo "$GIT_AUTHOR_NAME" >mine &&
	git add mine &&
	git commit -s -m "Initial commit" &&

	test_tick &&
	echo Hello world >mine &&
	git add mine &&
	git commit -s -m "Second on main" &&

	# the first commit on the side branch is UTF-8
	test_tick &&
	git checkout -b side master^ &&
	echo Another file >yours &&
	git add yours &&
	git commit -s -m "Second on side" &&

	# the second one on the side branch is ISO-8859-1
	git config i18n.commitencoding ISO8859-1 &&
	# use author and committer name in ISO-8859-1 to match it.
	. "$TEST_DIRECTORY"/t3901-8859-1.txt &&
	test_tick &&
	echo Yet another >theirs &&
	git add theirs &&
	git commit -s -m "Third on side" &&

	# Back to default
	git config i18n.commitencoding UTF-8

[master (root-commit) a751cb4] Initial commit
 Author: √Å√©√≠ √≥√∫ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 mine
[master 1abbfe5] Second on main
 Author: √Å√©√≠ √≥√∫ <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[side 907dc52] Second on side
 Author: √Å√©√≠ √≥√∫ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 yours
[side 717f610] Third on side
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 theirs

ok 1 - setup

expecting success: 
	git config i18n.logoutputencoding ISO8859-1 &&

	git format-patch --stdout master..HEAD^ >out-l1 &&
	git format-patch --stdout HEAD^ >out-l2 &&
	grep "^Content-Type: text/plain; charset=ISO8859-1" out-l1 &&
	grep "^From: =?ISO8859-1?q?=C1=E9=ED=20=F3=FA?=" out-l1 &&
	grep "^Content-Type: text/plain; charset=ISO8859-1" out-l2 &&
	grep "^From: =?ISO8859-1?q?=C1=E9=ED=20=F3=FA?=" out-l2

Content-Type: text/plain; charset=ISO8859-1
From: =?ISO8859-1?q?=C1=E9=ED=20=F3=FA?= <author@example.com>
Content-Type: text/plain; charset=ISO8859-1
From: =?ISO8859-1?q?=C1=E9=ED=20=F3=FA?= <author@example.com>

ok 2 - format-patch output (ISO-8859-1)

expecting success: 
	git config i18n.logoutputencoding UTF-8 &&

	git format-patch --stdout master..HEAD^ >out-u1 &&
	git format-patch --stdout HEAD^ >out-u2 &&
	grep "^Content-Type: text/plain; charset=UTF-8" out-u1 &&
	grep "^From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?=" out-u1 &&
	grep "^Content-Type: text/plain; charset=UTF-8" out-u2 &&
	grep "^From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?=" out-u2

Content-Type: text/plain; charset=UTF-8
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
Content-Type: text/plain; charset=UTF-8
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>

ok 3 - format-patch output (UTF-8)

expecting success: 
	# We want the result of rebase in UTF-8
	git config i18n.commitencoding UTF-8 &&

	# The test is about logoutputencoding not affecting the
	# final outcome -- it is used internally to generate the
	# patch and the log.

	git config i18n.logoutputencoding UTF-8 &&

	# The result will be committed by GIT_COMMITTER_NAME --
	# we want UTF-8 encoded name.
	. "$TEST_DIRECTORY"/t3901-utf8.txt &&
	git checkout -b test &&
	git rebase master &&

	check_encoding 2

First, rewinding head to replay your work on top of it...
Applying: Second on side
Applying: Third on side
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>

ok 4 - rebase (U/U)

expecting success: 
	git config i18n.commitencoding UTF-8 &&
	git config i18n.logoutputencoding ISO8859-1 &&
	. "$TEST_DIRECTORY"/t3901-utf8.txt &&

	git reset --hard side &&
	git rebase master &&

	check_encoding 2

HEAD is now at 717f610 Third on side
First, rewinding head to replay your work on top of it...
Applying: Second on side
Applying: Third on side
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>

ok 5 - rebase (U/L)

expecting success: 
	# In this test we want ISO-8859-1 encoded commits as the result
	git config i18n.commitencoding ISO8859-1 &&
	git config i18n.logoutputencoding ISO8859-1 &&
	. "$TEST_DIRECTORY"/t3901-8859-1.txt &&

	git reset --hard side &&
	git rebase master &&

	check_encoding 2 8859
HEAD is now at 717f610 Third on side
First, rewinding head to replay your work on top of it...
Applying: Second on side
Applying: Third on side
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
encoding ISO8859-1
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
encoding ISO8859-1

ok 6 - rebase (L/L)

expecting success: 
	# This is pathological -- use UTF-8 as intermediate form
	# to get ISO-8859-1 results.
	git config i18n.commitencoding ISO8859-1 &&
	git config i18n.logoutputencoding UTF-8 &&
	. "$TEST_DIRECTORY"/t3901-8859-1.txt &&

	git reset --hard side &&
	git rebase master &&

	check_encoding 2 8859
HEAD is now at 717f610 Third on side
First, rewinding head to replay your work on top of it...
Applying: Second on side
Applying: Third on side
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
encoding ISO8859-1
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
encoding ISO8859-1

ok 7 - rebase (L/U)

expecting success: 
	# Both the commitencoding and logoutputencoding is set to UTF-8.

	git config i18n.commitencoding UTF-8 &&
	git config i18n.logoutputencoding UTF-8 &&
	. "$TEST_DIRECTORY"/t3901-utf8.txt &&

	git reset --hard master &&
	git cherry-pick side^ &&
	git cherry-pick side &&
	git revert HEAD &&

	check_encoding 3

HEAD is now at 1abbfe5 Second on main
[test 226e420] Second on side
 Author: √Å√©√≠ √≥√∫ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 yours
[test 0c82aa3] Third on side
 Author: √Å√©√≠ √≥√∫ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 theirs
Removing theirs
[test 267f566] Revert "Third on side"
 Author: √Å√©√≠ √≥√∫ <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 theirs
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
ok 8 - cherry-pick(U/U)
expecting success: 
	# Both the commitencoding and logoutputencoding is set to ISO-8859-1

	git config i18n.commitencoding ISO8859-1 &&
	git config i18n.logoutputencoding ISO8859-1 &&
	. "$TEST_DIRECTORY"/t3901-8859-1.txt &&

	git reset --hard master &&
	git cherry-pick side^ &&
	git cherry-pick side &&
	git revert HEAD &&

	check_encoding 3 8859
HEAD is now at 1abbfe5 Second on main
[test e1b2855] Second on side
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 yours
[test 37f31da] Third on side
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 theirs
Removing theirs
[test 2f88e21] Revert "Third on side"
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 theirs
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
encoding ISO8859-1
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
encoding ISO8859-1
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
encoding ISO8859-1
ok 9 - cherry-pick(L/L)
expecting success: 
	# Commitencoding is set to UTF-8 but logoutputencoding is ISO-8859-1

	git config i18n.commitencoding UTF-8 &&
	git config i18n.logoutputencoding ISO8859-1 &&
	. "$TEST_DIRECTORY"/t3901-utf8.txt &&

	git reset --hard master &&
	git cherry-pick side^ &&
	git cherry-pick side &&
	git revert HEAD &&

	check_encoding 3
HEAD is now at 1abbfe5 Second on main
[test 226e420] Second on side
 Author: √Å√©√≠ √≥√∫ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 yours
[test 0c82aa3] Third on side
 Author: √Å√©√≠ √≥√∫ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 theirs
Removing theirs
[test 267f566] Revert "Third on side"
 Author: √Å√©√≠ √≥√∫ <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 theirs
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>

ok 10 - cherry-pick(U/L)

expecting success: 
	# Again, the commitencoding is set to ISO-8859-1 but
	# logoutputencoding is set to UTF-8.

	git config i18n.commitencoding ISO8859-1 &&
	git config i18n.logoutputencoding UTF-8 &&
	. "$TEST_DIRECTORY"/t3901-8859-1.txt &&

	git reset --hard master &&
	git cherry-pick side^ &&
	git cherry-pick side &&
	git revert HEAD &&

	check_encoding 3 8859

HEAD is now at 1abbfe5 Second on main
[test e1b2855] Second on side
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 yours
[test 37f31da] Third on side
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 theirs
Removing theirs
[test 2f88e21] Revert "Third on side"
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 theirs
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
encoding ISO8859-1
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
encoding ISO8859-1
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
encoding ISO8859-1

ok 11 - cherry-pick(L/U)

expecting success: 
	git config i18n.commitencoding UTF-8 &&
	git config i18n.logoutputencoding UTF-8 &&
	. "$TEST_DIRECTORY"/t3901-utf8.txt &&

	git reset --hard side &&
	git rebase --merge master &&

	check_encoding 2

HEAD is now at 717f610 Third on side
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
1abbfe5 Second on main
907dc52 Second on side
found 1 common ancestor(s):
a751cb4 Initial commit
[detached HEAD 226e420] Second on side
 Author: √Å√©√≠ √≥√∫ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 yours
Committed: 0001 Second on side
Merging master with HEAD~0
Merging:
226e420 Second on side
717f610 Third on side
found 1 common ancestor(s):
907dc52 Second on side
[detached HEAD 0c82aa3] Third on side
 Author: √Å√©√≠ √≥√∫ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 theirs
Committed: 0002 Third on side
All done.
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>

ok 12 - rebase --merge (U/U)

expecting success: 
	git config i18n.commitencoding UTF-8 &&
	git config i18n.logoutputencoding ISO8859-1 &&
	. "$TEST_DIRECTORY"/t3901-utf8.txt &&

	git reset --hard side &&
	git rebase --merge master &&

	check_encoding 2

HEAD is now at 717f610 Third on side
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
1abbfe5 Second on main
907dc52 Second on side
found 1 common ancestor(s):
a751cb4 Initial commit
[detached HEAD 226e420] Second on side
 Author: √Å√©√≠ √≥√∫ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 yours
Committed: 0001 Second on side
Merging master with HEAD~0
Merging:
226e420 Second on side
717f610 Third on side
found 1 common ancestor(s):
907dc52 Second on side
[detached HEAD 0c82aa3] Third on side
 Author: √Å√©√≠ √≥√∫ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 theirs
Committed: 0002 Third on side
All done.
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
ok 13 - rebase --merge (U/L)
expecting success: 
	# In this test we want ISO-8859-1 encoded commits as the result
	git config i18n.commitencoding ISO8859-1 &&
	git config i18n.logoutputencoding ISO8859-1 &&
	. "$TEST_DIRECTORY"/t3901-8859-1.txt &&

	git reset --hard side &&
	git rebase --merge master &&

	check_encoding 2 8859
HEAD is now at 717f610 Third on side
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
1abbfe5 Second on main
907dc52 Second on side
found 1 common ancestor(s):
a751cb4 Initial commit
[detached HEAD e1b2855] Second on side
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 yours
Committed: 0001 Second on side
Merging master with HEAD~0
Merging:
e1b2855 Second on side
717f610 Third on side
found 1 common ancestor(s):
907dc52 Second on side
[detached HEAD 37f31da] Third on side
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 theirs
Committed: 0002 Third on side
All done.
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
encoding ISO8859-1
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
encoding ISO8859-1

ok 14 - rebase --merge (L/L)

expecting success: 
	# This is pathological -- use UTF-8 as intermediate form
	# to get ISO-8859-1 results.
	git config i18n.commitencoding ISO8859-1 &&
	git config i18n.logoutputencoding UTF-8 &&
	. "$TEST_DIRECTORY"/t3901-8859-1.txt &&

	git reset --hard side &&
	git rebase --merge master &&

	check_encoding 2 8859

HEAD is now at 717f610 Third on side
First, rewinding head to replay your work on top of it...
Merging master with HEAD~1
Merging:
1abbfe5 Second on main
907dc52 Second on side
found 1 common ancestor(s):
a751cb4 Initial commit
[detached HEAD e1b2855] Second on side
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 yours
Committed: 0001 Second on side
Merging master with HEAD~0
Merging:
e1b2855 Second on side
717f610 Third on side
found 1 common ancestor(s):
907dc52 Second on side
[detached HEAD 37f31da] Third on side
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 theirs
Committed: 0002 Third on side
All done.
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
encoding ISO8859-1
From: =?UTF-8?q?=C3=81=C3=A9=C3=AD=20=C3=B3=C3=BA?= <author@example.com>
encoding ISO8859-1

ok 15 - rebase --merge (L/U)

# passed all 15 test(s)
1..15
