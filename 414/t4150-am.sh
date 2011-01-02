Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4150-am/.git/
expecting success: 
	cat >msg <<-\EOF &&
	second

	Lorem ipsum dolor sit amet, consectetuer sadipscing elitr, sed diam nonumy
	eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam
	voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita
	kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem
	ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
	tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At
	vero eos et accusam et justo duo dolores et ea rebum.

	EOF
	q_to_tab <<-\EOF >>msg &&
	QDuis autem vel eum iriure dolor in hendrerit in vulputate velit
	Qesse molestie consequat, vel illum dolore eu feugiat nulla facilisis
	Qat vero eros et accumsan et iusto odio dignissim qui blandit
	Qpraesent luptatum zzril delenit augue duis dolore te feugait nulla
	Qfacilisi.
	EOF
	cat >>msg <<-\EOF &&

	Lorem ipsum dolor sit amet,
	consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
	laoreet dolore magna aliquam erat volutpat.

	  git
	  ---
	  +++

	Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit
	lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure
	dolor in hendrerit in vulputate velit esse molestie consequat, vel illum
	dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio
	dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te
	feugait nulla facilisi.
	EOF

	cat >failmail <<-\EOF &&
	From foo@example.com Fri May 23 10:43:49 2008
	From:	foo@example.com
	To:	bar@example.com
	Subject: Re: [RFC/PATCH] git-foo.sh
	Date:	Fri, 23 May 2008 05:23:42 +0200

	Sometimes we have to find out that there's nothing left.

	EOF

	cat >pine <<-\EOF &&
	From MAILER-DAEMON Fri May 23 10:43:49 2008
	Date: 23 May 2008 05:23:42 +0200
	From: Mail System Internal Data <MAILER-DAEMON@example.com>
	Subject: DON'T DELETE THIS MESSAGE -- FOLDER INTERNAL DATA
	Message-ID: <foo-0001@example.com>

	This text is part of the internal format of your mail folder, and is not
	a real message.  It is created automatically by the mail system software.
	If deleted, important folder data will be lost, and it will be re-created
	with the data reset to initial values.

	EOF

	signoff="Signed-off-by: $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL>"

ok 1 - setup: messages

expecting success: 
	echo hello >file &&
	git add file &&
	test_tick &&
	git commit -m first &&
	git tag first &&

	echo world >>file &&
	git add file &&
	test_tick &&
	git commit -s -F msg &&
	git tag second &&

	git format-patch --stdout first >patch1 &&
	{
		echo "X-Fake-Field: Line One" &&
		echo "X-Fake-Field: Line Two" &&
		echo "X-Fake-Field: Line Three" &&
		git format-patch --stdout first | sed -e "1d"
	} > patch1.eml &&
	{
		echo "X-Fake-Field: Line One" &&
		echo "X-Fake-Field: Line Two" &&
		echo "X-Fake-Field: Line Three" &&
		git format-patch --stdout first | sed -e "1d"
	} | append_cr >patch1-crlf.eml &&

	sed -n -e "3,\$p" msg >file &&
	git add file &&
	test_tick &&
	git commit -m third &&

	git format-patch --stdout first >patch2	&&

	git checkout -b lorem &&
	sed -n -e "11,\$p" msg >file &&
	head -n 9 msg >>file &&
	test_tick &&
	git commit -a -m "moved stuff" &&

	echo goodbye >another &&
	git add another &&
	test_tick &&
	git commit -m "added another file" &&

	git format-patch --stdout master >lorem-move.patch &&

	git checkout -b rename &&
	git mv file renamed &&
	git commit -m "renamed a file" &&

	git format-patch -M --stdout lorem >rename.patch &&

	git reset --soft lorem^ &&
	git commit -m "renamed a file and added another" &&

	git format-patch -M --stdout lorem^ >rename-add.patch &&

	# reset time
	unset test_tick &&
	test_tick

[master (root-commit) 6b2d93f] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master e01c0d3] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 9ecb9b7] third
 Author: A U Thor <author@example.com>
 1 files changed, 28 insertions(+), 2 deletions(-)
 rewrite file (100%)
[lorem 310b007] moved stuff
 Author: A U Thor <author@example.com>
 1 files changed, 9 insertions(+), 8 deletions(-)
[lorem 5adb50d] added another file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 another
[rename 9b77aec] renamed a file
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename file => renamed (100%)
[rename 1312087] renamed a file and added another
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 another
 rename file => renamed (100%)

ok 2 - setup

expecting success: 
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout first &&
	test_tick &&
	git am <patch1 &&
	! test -d .git/rebase-apply &&
	git diff --exit-code second &&
	test "$(git rev-parse second)" = "$(git rev-parse HEAD)" &&
	test "$(git rev-parse second^)" = "$(git rev-parse HEAD^)"

HEAD is now at 1312087 renamed a file and added another
Applying: second
ok 3 - am applies patch correctly
expecting success: 
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout first &&
	git am patch1.eml &&
	! test -d .git/rebase-apply &&
	git diff --exit-code second &&
	test "$(git rev-parse second)" = "$(git rev-parse HEAD)" &&
	test "$(git rev-parse second^)" = "$(git rev-parse HEAD^)"
HEAD is now at e01c0d3 second
Applying: second

ok 4 - am applies patch e-mail not in a mbox

expecting success: 
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout first &&
	git am patch1-crlf.eml &&
	! test -d .git/rebase-apply &&
	git diff --exit-code second &&
	test "$(git rev-parse second)" = "$(git rev-parse HEAD)" &&
	test "$(git rev-parse second^)" = "$(git rev-parse HEAD^)"

HEAD is now at e01c0d3 second
Applying: second

ok 5 - am applies patch e-mail not in a mbox with CRLF

expecting success: 
	GIT_AUTHOR_NAME="Another Thor" &&
	GIT_AUTHOR_EMAIL="a.thor@example.com" &&
	GIT_COMMITTER_NAME="Co M Miter" &&
	GIT_COMMITTER_EMAIL="c.miter@example.com" &&
	export GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL


ok 6 - setup: new author and committer

expecting success: 
	test_tick &&
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout first &&
	git am patch2 &&
	! test -d .git/rebase-apply &&
	test "$(git rev-parse master^^)" = "$(git rev-parse HEAD^^)" &&
	git diff --exit-code master..HEAD &&
	git diff --exit-code master^..HEAD^ &&
	compare author master HEAD &&
	compare author master^ HEAD^ &&
	test "$GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL>" = \
	     "$(git log -1 --pretty=format:"%cn <%ce>" HEAD)"

HEAD is now at e01c0d3 second
Applying: second
Applying: third

ok 7 - am changes committer and keeps author

expecting success: 
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout -b master2 first &&
	git am --signoff <patch2 &&
	printf "%s
" "$signoff" >expected &&
	echo "Signed-off-by: $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL>" >>expected &&
	git cat-file commit HEAD^ | grep "Signed-off-by:" >actual &&
	test_cmp expected actual &&
	echo "Signed-off-by: $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL>" >expected &&
	git cat-file commit HEAD | grep "Signed-off-by:" >actual &&
	test_cmp expected actual

HEAD is now at 5005784 third
Applying: second
Applying: third

ok 8 - am --signoff adds Signed-off-by: line

expecting success: 
	echo refs/heads/master2 >expected &&
	git symbolic-ref HEAD >actual &&
	test_cmp expected actual


ok 9 - am stays in branch

expecting success: 
	git format-patch --stdout HEAD^ >patch3 &&
	sed -e "/^Subject/ s,\[PATCH,Re: Re: Re: & 1/5 v2," patch3 >patch4 &&
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout HEAD^ &&
	git am --signoff patch4 &&
	git cat-file commit HEAD >actual &&
	test $(grep -c "^Signed-off-by:" actual) -eq 1
HEAD is now at a84b439 third
Applying: third

ok 10 - am --signoff does not add Signed-off-by: line if already there

expecting success: 
	git rev-parse HEAD >expected &&
	git rev-parse master2 >actual &&
	test_cmp expected actual

ok 11 - am without --keep removes Re: and [PATCH] stuff

expecting success: 
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout HEAD^ &&
	git am --keep patch4 &&
	! test -d .git/rebase-apply &&
	git cat-file commit HEAD >actual &&
	grep "Re: Re: Re: \[PATCH 1/5 v2\] third" actual

HEAD is now at a84b439 third
Applying: Re: Re: Re: [PATCH 1/5 v2] third
Re: Re: Re: [PATCH 1/5 v2] third

ok 12 - am --keep really keeps the subject

expecting success: 
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout -b lorem2 master2 &&
	sed -n -e "3,\$p" msg >file &&
	head -n 9 msg >>file &&
	git add file &&
	test_tick &&
	git commit -m "copied stuff" &&
	git am -3 lorem-move.patch &&
	! test -d .git/rebase-apply &&
	git diff --exit-code lorem

HEAD is now at 930d93f Re: Re: Re: [PATCH 1/5 v2] third
[lorem2 6f68cdc] copied stuff
 Author: Another Thor <a.thor@example.com>
 1 files changed, 9 insertions(+), 0 deletions(-)
Applying: moved stuff
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with moved stuff
Merging:
6f68cdc copied stuff
virtual moved stuff
found 1 common ancestor(s):
virtual 1a0aed3db7ed3439d173ac047eca267fd076cc21
Auto-merging file
Applying: added another file

ok 13 - am -3 falls back to 3-way merge

expecting success: 
	grep "^rename from" rename.patch &&
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout lorem^0 &&
	git am rename.patch &&
	! test -d .git/rebase-apply &&
	git update-index --refresh &&
	git diff --exit-code rename

rename from file
HEAD is now at 7446e63 added another file
Applying: renamed a file

ok 14 - am can rename a file

expecting success: 
	grep "^rename from" rename.patch &&
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout lorem^0 &&
	git am -3 rename.patch &&
	! test -d .git/rebase-apply &&
	git update-index --refresh &&
	git diff --exit-code rename

rename from file
HEAD is now at 053c2a5 renamed a file
Applying: renamed a file
ok 15 - am -3 can rename a file
expecting success: 
	grep "^rename from" rename-add.patch &&
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout lorem^0 &&
	git am -3 rename-add.patch &&
	! test -d .git/rebase-apply &&
	git update-index --refresh &&
	git diff --exit-code rename
rename from file
HEAD is now at 053c2a5 renamed a file
Applying: renamed a file and added another
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with renamed a file and added another
Merging:
5adb50d added another file
virtual renamed a file and added another
found 1 common ancestor(s):
virtual 7ef4c6cfd0798027608935ae3f888758bcaceb89
Skipped renamed (merged same as existing)

ok 16 - am -3 can rename a file after falling back to 3-way merge

expecting success: 
	rm -fr .git/rebase-apply &&
	git checkout -f lorem2 &&
	git reset master2 --hard &&
	sed -n -e "3,\$p" msg >file &&
	head -n 9 msg >>file &&
	git add file &&
	test_tick &&
	git commit -m "copied stuff" &&
	git am -3 -q lorem-move.patch >output.out 2>&1 &&
	! test -s output.out

HEAD is now at a84b439 third
[lorem2 3fb6e08] copied stuff
 Author: Another Thor <a.thor@example.com>
 1 files changed, 9 insertions(+), 0 deletions(-)
ok 17 - am -3 -q is quiet

expecting success: 
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout lorem2^^ &&
	test_must_fail git am lorem-move.patch &&
	test -d .git/rebase-apply
HEAD is now at 2f1565a added another file
Applying: moved stuff
Patch failed at 0001 moved stuff
When you have resolved this problem run gitam--resolved.
If you would prefer to skip this patch, instead run gitam--skip.
To restore the original branch and stop patching run gitam--abort.

ok 18 - am pauses on conflict

expecting success: 
	echo goodbye >expected &&
	git am --skip &&
	! test -d .git/rebase-apply &&
	git diff --exit-code lorem2^^ -- file &&
	test_cmp expected another
Applying: added another file

ok 19 - am --skip works

expecting success: 
	echo goodbye >expected &&
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout lorem2^^ &&
	test_must_fail git am lorem-move.patch &&
	test -d .git/rebase-apply &&
	echo resolved >>file &&
	git add file &&
	git am --resolved &&
	! test -d .git/rebase-apply &&
	test_cmp expected another

HEAD is now at 4caeaa8 added another file
Applying: moved stuff
Patch failed at 0001 moved stuff
When you have resolved this problem run gitam--resolved.
If you would prefer to skip this patch, instead run gitam--skip.
To restore the original branch and stop patching run gitam--abort.
Applying: moved stuff
Applying: added another file
ok 20 - am --resolved works
expecting success: 
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout first &&
	cat pine patch1 | git am &&
	! test -d .git/rebase-apply &&
	git diff --exit-code master^..HEAD
HEAD is now at 0245a4a added another file
Applying: second

ok 21 - am takes patches from a Pine mailbox

expecting success: 
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	test_must_fail git am <failmail &&
	git am --abort &&
	! test -d .git/rebase-apply

HEAD is now at bd67801 second
Patch is empty.  Was it split wrong?
If you would prefer to skip this patch, instead run gitam--skip.
To restore the original branch and stop patching run gitam--abort.

ok 22 - am fails on mail without patch

expecting success: 
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	echo "---" >>failmail &&
	test_must_fail git am <failmail &&
	git am --skip &&
	! test -d .git/rebase-apply
HEAD is now at bd67801 second
Applying: git-foo.sh
Patch failed at 0001 git-foo.sh
When you have resolved this problem run gitam--resolved.
If you would prefer to skip this patch, instead run gitam--skip.
To restore the original branch and stop patching run gitam--abort.

ok 23 - am fails on empty patch

expecting success: 
	rm -fr subdir &&
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout first &&
	(
		mkdir -p subdir &&
		cd subdir &&
		git am <../patch1
	) &&
	git diff --exit-code second

HEAD is now at bd67801 second
Applying: second

ok 24 - am works from stdin in subdirectory

expecting success: 
	rm -fr subdir &&
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout first &&
	(
		mkdir -p subdir &&
		cd subdir &&
		git am ../patch1
	) &&
	git diff --exit-code second

HEAD is now at bd67801 second
Applying: second

ok 25 - am works from file (relative path given) in subdirectory

expecting success: 
	rm -fr subdir &&
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout first &&
	P=$(pwd) &&
	(
		mkdir -p subdir &&
		cd subdir &&
		git am "$P/patch1"
	) &&
	git diff --exit-code second

HEAD is now at bd67801 second
Applying: second

ok 26 - am works from file (absolute path given) in subdirectory

expecting success: 
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout first &&
	test_tick &&
	git am --committer-date-is-author-date patch1 &&
	git cat-file commit HEAD | sed -e "/^\$/q" >head1 &&
	sed -ne "/^author /s/.*> //p" head1 >at &&
	sed -ne "/^committer /s/.*> //p" head1 >ct &&
	test_cmp at ct

HEAD is now at bd67801 second
Applying: second
ok 27 - am --committer-date-is-author-date
expecting success: 
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout first &&
	test_tick &&
	git am patch1 &&
	git cat-file commit HEAD | sed -e "/^\$/q" >head1 &&
	sed -ne "/^author /s/.*> //p" head1 >at &&
	sed -ne "/^committer /s/.*> //p" head1 >ct &&
	! test_cmp at ct
HEAD is now at d3536eb second
Applying: second
--- at	2011-01-02 04:07:26.000000000 +0000
+++ ct	2011-01-02 04:07:26.000000000 +0000
@@ -1 +1 @@
-1112912053 -0700
+1112912353 -0700

ok 28 - am without --committer-date-is-author-date
expecting success: 
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout first &&
	test_tick &&
	git am --ignore-date patch1 &&
	git cat-file commit HEAD | sed -e "/^\$/q" >head1 &&
	sed -ne "/^author /s/.*> //p" head1 >at &&
	grep "+0000" at
HEAD is now at f1146f3 second
Applying: second
1293941247 +0000
ok 29 - am --ignore-date
expecting success: 
	git rev-parse first^{tree} >expected &&
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	rm -fr subdir &&
	mkdir subdir &&
	git format-patch --numbered-files -o subdir -1 first &&
	(
		cd subdir &&
		git init &&
		git am 1
	) &&
	(
		cd subdir &&
		git rev-parse HEAD^{tree} >../actual
	) &&
	test_cmp expected actual
HEAD is now at 8c441ff second
subdir/1
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4150-am/subdir/.git/
Applying: first
ok 30 - am into an unborn branch
expecting success: 
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout first &&
	test_tick &&
	sed -e "s/second/second \
 foo/" patch1 >patchnl &&
	git am <patchnl >output.out 2>&1
HEAD is now at 8c441ff second
ok 31 - am newline in subject

expecting success: 
	grep "^Applying: second \
 foo$" output.out
Applying: second \n foo

ok 32 - output: am newline in subject

expecting success: 
	rm -fr .git/rebase-apply &&
	git reset --hard &&
	git checkout first &&
	test_tick &&
	git am -q <patch1 >output.out 2>&1 &&
	! test -s output.out
HEAD is now at acc03f7 second \n foo
ok 33 - am -q is quiet

# passed all 33 test(s)
1..33
