Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0203-gettext-setlocale-sanity/.git/
# lib-gettext: GETTEXT_POISON defined, can't test gettext
expecting success: 
	. "$TEST_DIRECTORY"/t3901-8859-1.txt &&
	test_commit "iso-c-commit" iso-under-c &&
	git show >out 2>err &&
	! test -s err &&
	grep -q "iso-c-commit" out
[master (root-commit) 7082035] iso-c-commit
 Author: Áéí óú <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 iso-under-c

ok 1 - git show a ISO-8859-1 commit under C locale

skipping test: git show a ISO-8859-1 commit under a UTF-8 locale 
	. "$TEST_DIRECTORY"/t3901-8859-1.txt &&
	test_commit "iso-utf8-commit" iso-under-utf8 &&
	LANGUAGE=is LC_ALL="$is_IS_locale" git show >out 2>err &&
	! test -s err &&
	grep -q "iso-utf8-commit" out

ok 2 # skip git show a ISO-8859-1 commit under a UTF-8 locale (missing GETTEXT_LOCALE)

# passed all 2 test(s)
1..2
