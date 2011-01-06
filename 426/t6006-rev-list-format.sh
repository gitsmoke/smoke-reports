Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6006-rev-list-format/.git/
expecting success: 
touch foo && git add foo && git commit -m "added foo" &&
  echo changed >foo && git commit -a -m "changed foo"
[master (root-commit) 86c75cf] added foo
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master 131a310] changed foo
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup
expecting success: 
git rev-list --pretty=format:'%%h' master >output.percent &&
test_cmp expect.percent output.percent

ok 2 - format percent
expecting success: 
git rev-list --pretty=format:'%H%n%h' master >output.hash &&
test_cmp expect.hash output.hash

ok 3 - format hash

expecting success: 
git rev-list --pretty=format:'%T%n%t' master >output.tree &&
test_cmp expect.tree output.tree


ok 4 - format tree

expecting success: 
git rev-list --pretty=format:'%P%n%p' master >output.parents &&
test_cmp expect.parents output.parents


ok 5 - format parents
expecting success: 
git rev-list --pretty=format:'%an%n%ae%n%ad%n%aD%n%at' master >output.author &&
test_cmp expect.author output.author

ok 6 - format author

expecting success: 
git rev-list --pretty=format:'%cn%n%ce%n%cd%n%cD%n%ct' master >output.committer &&
test_cmp expect.committer output.committer

ok 7 - format committer

expecting success: 
git rev-list --pretty=format:'%e' master >output.encoding &&
test_cmp expect.encoding output.encoding


ok 8 - format encoding

expecting success: 
git rev-list --pretty=format:'%s' master >output.subject &&
test_cmp expect.subject output.subject


ok 9 - format subject
expecting success: 
git rev-list --pretty=format:'%b' master >output.body &&
test_cmp expect.body output.body


ok 10 - format body
expecting success: 
git rev-list --pretty=format:'%B' master >output.raw-body &&
test_cmp expect.raw-body output.raw-body

ok 11 - format raw-body
expecting success: 
git rev-list --pretty=format:'%Credfoo%Cgreenbar%Cbluebaz%Cresetxyzzy' master >output.colors &&
test_cmp expect.colors output.colors

ok 12 - format colors
expecting success: 
git rev-list --pretty=format:'%C(red yellow bold)foo%C(reset)' master >output.advanced-colors &&
test_cmp expect.advanced-colors output.advanced-colors

ok 13 - format advanced-colors
expecting success: 
git config i18n.commitencoding iso8859-1 &&
  echo change2 >foo && git commit -a -F commit-msg
[master f58db70] Test printing of complex bodies
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 14 - setup complex body
expecting success: 
git rev-list --pretty=format:'%e' master >output.complex-encoding &&
test_cmp expect.complex-encoding output.complex-encoding

ok 15 - format complex-encoding
expecting success: 
git rev-list --pretty=format:'%s' master >output.complex-subject &&
test_cmp expect.complex-subject output.complex-subject

ok 16 - format complex-subject
expecting success: 
git rev-list --pretty=format:'%b' master >output.complex-body &&
test_cmp expect.complex-body output.complex-body

ok 17 - format complex-body
expecting success: 
	echo  >expect commit f58db70b055c5718631e5c61528b28b12090cdea &&
	echo >>expect fooQbar &&
	git rev-list -1 --format=foo%x00bar HEAD >actual.nul &&
	nul_to_q <actual.nul >actual &&
	test_cmp expect actual

ok 18 - %x00 shows NUL

expecting success: 
	echo 2005-04-07 >expect.ad-short &&
	git log -1 --date=short --pretty=tformat:%ad >output.ad-short master &&
	test_cmp expect.ad-short output.ad-short


ok 19 - %ad respects --date=

expecting success: 
	test_tick &&
	C=$(GIT_AUTHOR_EMAIL= git commit-tree HEAD^{tree} </dev/null) &&
	A=$(git show --pretty=format:%an,%ae,%ad%n -s $C) &&
	test "$A" = "A U Thor,,Thu Apr 7 15:14:13 2005 -0700" || {
		echo "Eh? $A" >failure
		false
	}


ok 20 - empty email

expecting success: 
	git show -s --pretty=format:"%s%n%-b%nThanks%n" HEAD^^ >actual &&
	test $(wc -l <actual) = 2

ok 21 - del LF before empty (1)

expecting success: 
	git show -s --pretty=format:"%s%n%-b%nThanks%n" HEAD >actual &&
	test $(wc -l <actual) = 6 &&
	grep "^$" actual


ok 22 - del LF before empty (2)
expecting success: 
	git show -s --pretty=format:"%s%+b%nThanks%n" HEAD^^ >actual &&
	test $(wc -l <actual) = 2

ok 23 - add LF before non-empty (1)

expecting success: 
	git show -s --pretty=format:"%s%+b%nThanks%n" HEAD >actual &&
	test $(wc -l <actual) = 6 &&
	grep "^$" actual


ok 24 - add LF before non-empty (2)

expecting success: 
	git show -s --pretty=format:"%s% bThanks" HEAD^^ >actual &&
	test $(wc -w <actual) = 2

ok 25 - add SP before non-empty (1)

expecting success: 
	git show -s --pretty=format:"%s% sThanks" HEAD^^ >actual &&
	test $(wc -w <actual) = 4

ok 26 - add SP before non-empty (2)

expecting success: 
	echo SHORT SHORT SHORT >expect2 &&
	echo LONG LONG LONG >expect3 &&
	git log -1 --format="%h %h %h" HEAD >actual1 &&
	git log -1 --abbrev=5 --format="%h %h %h" HEAD >actual2 &&
	git log -1 --abbrev=5 --format="%H %H %H" HEAD >actual3 &&
	sed -e "s/$_x40/LONG/g" -e "s/$_x05/SHORT/g" <actual2 >fuzzy2 &&
	sed -e "s/$_x40/LONG/g" -e "s/$_x05/SHORT/g" <actual3 >fuzzy3 &&
	test_cmp expect2 fuzzy2 &&
	test_cmp expect3 fuzzy3 &&
	! test_cmp actual1 actual2
--- actual1	2011-01-06 04:08:46.000000000 +0000
+++ actual2	2011-01-06 04:08:46.000000000 +0000
@@ -1 +1 @@
-f58db70 f58db70 f58db70
+f58db f58db f58db

ok 27 - --abbrev

expecting success: 
	git log -1 --format=%H --abbrev-commit --abbrev=20 HEAD >actual &&
	len=$(wc -c <actual) &&
	test $len = 41

ok 28 - %H is not affected by --abbrev-commit

expecting success: 
	git log -1 --format=%h --abbrev-commit --abbrev=20 HEAD >actual &&
	len=$(wc -c <actual) &&
	test $len = 21

ok 29 - %h is not affected by --abbrev-commit

expecting success: 
	git reflog >expect &&
	git log -g --format="%h %gD: %gs" >actual &&
	test_cmp expect actual

ok 30 - "%h %gD: %gs" is same as git-reflog

expecting success: 
	git reflog --date=raw >expect &&
	git log -g --format="%h %gD: %gs" --date=raw >actual &&
	test_cmp expect actual

ok 31 - "%h %gD: %gs" is same as git-reflog (with date)

expecting success: 
	git reflog --abbrev=13 --date=raw >expect &&
	git log -g --abbrev=13 --format="%h %gD: %gs" --date=raw >actual &&
	test_cmp expect actual

ok 32 - "%h %gD: %gs" is same as git-reflog (with --abbrev)

expecting success: 
	echo "master@{0}" >expect.gd-short &&
	git log -g -1 --format=%gd refs/heads/master >actual.gd-short &&
	test_cmp expect.gd-short actual.gd-short

ok 33 - %gd shortens ref name

expecting success: 
	git commit -m "dummy" --allow-empty &&
	git commit -m "dummy" --allow-empty &&
	git filter-branch --msg-filter "sed -e s/dummy//" HEAD^^.. &&
	git rev-list --oneline HEAD >test.txt &&
	test $(git rev-list --oneline HEAD | wc -l) -eq 5 &&
	test $(git rev-list --oneline --graph HEAD | wc -l) -eq 5
[master 4e8b0c9] dummy
 Author: A U Thor <author@example.com>
[master b85769c] dummy
 Author: A U Thor <author@example.com>
Rewrite 4e8b0c9b8485c1119853b71ed08e14e68532f46a (1/2)Rewrite b85769c236326b9e48ba5a084be4383e839b2ebd (2/2)
Ref 'refs/heads/master' was rewritten

ok 34 - oneline with empty message

# passed all 34 test(s)
1..34
