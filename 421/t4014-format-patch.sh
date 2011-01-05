Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4014-format-patch/.git/
expecting success: 
	if
		test_have_prereq PERL &&
		"$PERL_PATH" "$TEST_DIRECTORY"/test-terminal.perl \
			sh -c "test -t 1 && test -t 2"
	then
		test_set_prereq TTY &&
		test_terminal () {
			if ! test_declared_prereq TTY
			then
				echo >&4 "test_terminal: need to declare TTY prerequisite"
				return 127
			fi
			"$PERL_PATH" "$TEST_DIRECTORY"/test-terminal.perl "$@"
		}
	fi

ok 1 - set up terminal for tests

expecting success: 

	for i in 1 2 3 4 5 6 7 8 9 10; do echo "$i"; done >file &&
	cat file >elif &&
	git add file elif &&
	test_tick &&
	git commit -m Initial &&
	git checkout -b side &&

	for i in 1 2 5 6 A B C 7 8 9 10; do echo "$i"; done >file &&
	test_chmod +x elif &&
	test_tick &&
	git commit -m "Side changes #1" &&

	for i in D E F; do echo "$i"; done >>file &&
	git update-index file &&
	test_tick &&
	git commit -m "Side changes #2" &&
	git tag C2 &&

	for i in 5 6 1 2 3 A 4 B C 7 8 9 10 D E F; do echo "$i"; done >file &&
	git update-index file &&
	test_tick &&
	git commit -m "Side changes #3 with \n backslash-n in it." &&

	git checkout master &&
	git diff-tree -p C2 | git apply --index &&
	test_tick &&
	git commit -m "Master accepts moral equivalent of #2"
[master (root-commit) e27066e] Initial
 Author: A U Thor <author@example.com>
 2 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 elif
 create mode 100644 file
[side 1135adf] Side changes #1
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 elif
[side fd00575] Side changes #2
 Author: A U Thor <author@example.com>
 1 files changed, 6 insertions(+), 2 deletions(-)
[side 18ed22a] Side changes #3 with \n backslash-n in it.
 Author: A U Thor <author@example.com>
 1 files changed, 4 insertions(+), 2 deletions(-)
[master 2e66419] Master accepts moral equivalent of #2
 Author: A U Thor <author@example.com>
 1 files changed, 6 insertions(+), 2 deletions(-)

ok 2 - setup

expecting success: 

	git format-patch --stdout master..side >patch0 &&
	cnt=`grep "^From " patch0 | wc -l` &&
	test $cnt = 3



ok 3 - format-patch --ignore-if-in-upstream

expecting success: 

	git format-patch --stdout \
		--ignore-if-in-upstream master..side >patch1 &&
	cnt=`grep "^From " patch1 | wc -l` &&
	test $cnt = 2



ok 4 - format-patch --ignore-if-in-upstream

expecting success: 

	git checkout -b slave master &&
	echo "Another line" >>file &&
	test_tick &&
	git commit -am "Slave change #1" &&
	echo "Yet another line" >>file &&
	test_tick &&
	git commit -am "Slave change #2" &&
	git checkout -b merger master &&
	test_tick &&
	git merge --no-ff slave &&
	cnt=`git format-patch -3 --stdout | grep "^From " | wc -l` &&
	test $cnt = 3

[slave 350e112] Slave change #1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[slave 065c933] Slave change #2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Merging:
2e66419 Master accepts moral equivalent of #2
virtual slave
found 1 common ancestor(s):
2e66419 Master accepts moral equivalent of #2
Merge made by recursive.
 file |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

ok 5 - format-patch doesn't consider merge commits

expecting success: 

	git checkout -b rebuild-0 master &&
	git am -3 patch0 &&
	cnt=`git rev-list master.. | wc -l` &&
	test $cnt = 2
Applying: Side changes #1
Applying: Side changes #2
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with Side changes #2
Merging:
65fd934 Side changes #1
virtual Side changes #2
found 1 common ancestor(s):
virtual 8359489d93991065cdaa748bd96dcb831b3d60ca
No changes -- Patch already applied.
Applying: Side changes #3 with \n backslash-n in it.

ok 6 - format-patch result applies

expecting success: 

	git checkout -b rebuild-1 master &&
	git am -3 patch1 &&
	cnt=`git rev-list master.. | wc -l` &&
	test $cnt = 2
Applying: Side changes #1
Applying: Side changes #3 with \n backslash-n in it.

ok 7 - format-patch --ignore-if-in-upstream result applies

expecting success: 

	git cat-file commit side | grep "^Side .* with .* backslash-n"


Side changes #3 with \n backslash-n in it.

ok 8 - commit did not screw up the log message

expecting success: 

	grep "^Subject: .*Side changes #3 with .* backslash-n" patch0 &&
	grep "^Subject: .*Side changes #3 with .* backslash-n" patch1


Subject: [PATCH 3/3] Side changes #3 with \n backslash-n in it.
Subject: [PATCH 2/2] Side changes #3 with \n backslash-n in it.

ok 9 - format-patch did not screw up the log message

expecting success: 

	git cat-file commit rebuild-1 | grep "^Side .* with .* backslash-n"


Side changes #3 with \n backslash-n in it.

ok 10 - replay did not screw up the log message

expecting success: 

	git config format.headers "To: R. E. Cipient <rcipient@example.com>
" &&
	git config --add format.headers "Cc: S. E. Cipient <scipient@example.com>
" &&
	git format-patch --stdout master..side > patch2 &&
	sed -e "/^\$/q" patch2 > hdrs2 &&
	grep "^To: R. E. Cipient <rcipient@example.com>\$" hdrs2 &&
	grep "^Cc: S. E. Cipient <scipient@example.com>\$" hdrs2


To: R. E. Cipient <rcipient@example.com>
Cc: S. E. Cipient <scipient@example.com>

ok 11 - extra headers

expecting success: 

	git config --replace-all format.headers "To: R. E. Cipient <rcipient@example.com>" &&
	git config --add format.headers "Cc: S. E. Cipient <scipient@example.com>" &&
	git format-patch --stdout master..side >patch3 &&
	sed -e "/^\$/q" patch3 > hdrs3 &&
	grep "^To: R. E. Cipient <rcipient@example.com>\$" hdrs3 &&
	grep "^Cc: S. E. Cipient <scipient@example.com>\$" hdrs3


To: R. E. Cipient <rcipient@example.com>
Cc: S. E. Cipient <scipient@example.com>

ok 12 - extra headers without newlines

expecting success: 

	git config --replace-all format.headers "To: R. E. Cipient <rcipient@example.com>" &&
	git config --add format.headers "To: S. E. Cipient <scipient@example.com>" &&
	git format-patch --stdout master..side > patch4 &&
	sed -e "/^\$/q" patch4 > hdrs4 &&
	grep "^To: R. E. Cipient <rcipient@example.com>,\$" hdrs4 &&
	grep "^ *S. E. Cipient <scipient@example.com>\$" hdrs4

To: R. E. Cipient <rcipient@example.com>,
    S. E. Cipient <scipient@example.com>

ok 13 - extra headers with multiple To:s

expecting success: 

	git config --replace-all format.headers "Cc: R. E. Cipient <rcipient@example.com>" &&
	git format-patch --cc="S. E. Cipient <scipient@example.com>" --stdout master..side | sed -e "/^\$/q" >patch5 &&
	grep "^Cc: R. E. Cipient <rcipient@example.com>,\$" patch5 &&
	grep "^ *S. E. Cipient <scipient@example.com>\$" patch5
Cc: R. E. Cipient <rcipient@example.com>,
    S. E. Cipient <scipient@example.com>

ok 14 - additional command line cc

expecting success: 

	git config --unset-all format.headers &&
	git format-patch --add-header="Cc: R. E. Cipient <rcipient@example.com>" --stdout master..side | sed -e "/^\$/q" >patch6 &&
	grep "^Cc: R. E. Cipient <rcipient@example.com>\$" patch6

Cc: R. E. Cipient <rcipient@example.com>

ok 15 - command line headers

expecting success: 

	git config --replace-all format.headers "Cc: R. E. Cipient <rcipient@example.com>" &&
	git format-patch --add-header="Cc: S. E. Cipient <scipient@example.com>" --stdout master..side | sed -e "/^\$/q" >patch7 &&
	grep "^Cc: R. E. Cipient <rcipient@example.com>,\$" patch7 &&
	grep "^ *S. E. Cipient <scipient@example.com>\$" patch7

Cc: R. E. Cipient <rcipient@example.com>,
    S. E. Cipient <scipient@example.com>

ok 16 - configuration headers and command line headers

expecting success: 

	git config --unset-all format.headers &&
	git format-patch --to="R. E. Cipient <rcipient@example.com>" --stdout master..side | sed -e "/^\$/q" >patch8 &&
	grep "^To: R. E. Cipient <rcipient@example.com>\$" patch8

To: R. E. Cipient <rcipient@example.com>

ok 17 - command line To: header

expecting success: 

	git config format.to "R. E. Cipient <rcipient@example.com>" &&
	git format-patch --stdout master..side | sed -e "/^\$/q" >patch9 &&
	grep "^To: R. E. Cipient <rcipient@example.com>\$" patch9

To: R. E. Cipient <rcipient@example.com>

ok 18 - configuration To: header

expecting success: 

	git config --replace-all format.to \
		"R. E. Cipient <rcipient@example.com>" &&
	git format-patch --no-to --stdout master..side |
	sed -e "/^\$/q" >patch10 &&
	! grep "^To: R. E. Cipient <rcipient@example.com>\$" patch10


ok 19 - --no-to overrides config.to

expecting success: 

	git config --replace-all format.to \
		"Someone <someone@out.there>" &&
	git format-patch --no-to --to="Someone Else <else@out.there>" \
		--stdout master..side |
	sed -e "/^\$/q" >patch11 &&
	! grep "^To: Someone <someone@out.there>\$" patch11 &&
	grep "^To: Someone Else <else@out.there>\$" patch11

To: Someone Else <else@out.there>

ok 20 - --no-to and --to replaces config.to

expecting success: 

	git config --replace-all format.cc \
		"C. E. Cipient <rcipient@example.com>" &&
	git format-patch --no-cc --stdout master..side |
	sed -e "/^\$/q" >patch12 &&
	! grep "^Cc: C. E. Cipient <rcipient@example.com>\$" patch12


ok 21 - --no-cc overrides config.cc

expecting success: 

	git config --replace-all format.headers \
		"Header1: B. E. Cipient <rcipient@example.com>" &&
	git format-patch --no-add-headers --stdout master..side |
	sed -e "/^\$/q" >patch13 &&
	! grep "^Header1: B. E. Cipient <rcipient@example.com>\$" patch13


ok 22 - --no-add-headers overrides config.headers

expecting success: 

	rm -rf patches/ &&
	git checkout side &&
	git format-patch -o patches/ master &&
	ls patches/0001-Side-changes-1.patch patches/0002-Side-changes-2.patch patches/0003-Side-changes-3-with-n-backslash-n-in-it.patch

patches/0001-Side-changes-1.patch
patches/0002-Side-changes-2.patch
patches/0003-Side-changes-3-with-n-backslash-n-in-it.patch
patches/0001-Side-changes-1.patch
patches/0002-Side-changes-2.patch
patches/0003-Side-changes-3-with-n-backslash-n-in-it.patch

ok 23 - multiple files

expecting success: 
	git checkout side &&
	check_threading expect.no-threading master


ok 24 - no threading

expecting success: 
	check_threading expect.thread --thread master


ok 25 - thread

expecting success: 
	check_threading expect.in-reply-to --in-reply-to="<test.message>" \
		--thread master


ok 26 - thread in-reply-to

expecting success: 
	check_threading expect.cover-letter --cover-letter --thread master


ok 27 - thread cover-letter

expecting success: 
	check_threading expect.cl-irt --cover-letter \
		--in-reply-to="<test.message>" --thread master


ok 28 - thread cover-letter in-reply-to

expecting success: 
	check_threading expect.cl-irt --cover-letter \
		--in-reply-to="<test.message>" --thread=shallow master


ok 29 - thread explicit shallow

expecting success: 
	check_threading expect.deep --thread=deep master


ok 30 - thread deep

expecting success: 
	check_threading expect.deep-irt  --thread=deep \
		--in-reply-to="<test.message>" master


ok 31 - thread deep in-reply-to

expecting success: 
	check_threading expect.deep-cl --cover-letter --thread=deep master


ok 32 - thread deep cover-letter

expecting success: 
	check_threading expect.deep-cl-irt --cover-letter \
		--in-reply-to="<test.message>" --thread=deep master


ok 33 - thread deep cover-letter in-reply-to

expecting success: 
	git config format.thread true &&
	check_threading expect.thread master


ok 34 - thread via config

expecting success: 
	git config format.thread deep &&
	check_threading expect.deep master


ok 35 - thread deep via config

expecting success: 
	git config format.thread deep &&
	check_threading expect.thread --thread master


ok 36 - thread config + override

expecting success: 
	git config format.thread deep &&
	check_threading expect.no-threading --no-thread master


ok 37 - thread config + --no-thread

expecting success: 

	rm -rf patches/ &&
	git checkout side &&
	for i in 5 6 1 2 3 A 4 B C 7 8 9 10 D E F; do echo "$i"; done >>file &&
	git update-index file &&
	git commit -m "This is an excessively long subject line for a message due to the habit some projects have of not having a short, one-line subject at the start of the commit message, but rather sticking a whole paragraph right at the start as the only thing in the commit message. It had better not become the filename for the patch." &&
	git format-patch -o patches/ master..side &&
	ls patches/0004-This-is-an-excessively-long-subject-line-for-a-messa.patch

[side 422768b] This is an excessively long subject line for a message due to the habit some projects have of not having a short, one-line subject at the start of the commit message, but rather sticking a whole paragraph right at the start as the only thing in the commit message. It had better not become the filename for the patch.
 Author: A U Thor <author@example.com>
 1 files changed, 16 insertions(+), 0 deletions(-)
patches/0001-Side-changes-1.patch
patches/0002-Side-changes-2.patch
patches/0003-Side-changes-3-with-n-backslash-n-in-it.patch
patches/0004-This-is-an-excessively-long-subject-line-for-a-messa.patch
patches/0004-This-is-an-excessively-long-subject-line-for-a-messa.patch

ok 38 - excessive subject

expecting success: 

	git mv file foo &&
	git commit -m foo &&
	git format-patch --cover-letter -1 &&
	! grep "file => foo .* 0 *\$" 0000-cover-letter.patch &&
	git format-patch --cover-letter -1 -M &&
	grep "file => foo .* 0 *\$" 0000-cover-letter.patch


[side ea84707] foo
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename file => foo (100%)
0000-cover-letter.patch
0001-foo.patch
0000-cover-letter.patch
0001-foo.patch
 file => foo |    0

ok 39 - cover-letter inherits diff options

expecting success: 

	git format-patch --cover-letter -2 &&
	sed -e "1,/A U Thor/d" -e "/^\$/q" < 0000-cover-letter.patch > output &&
	test_cmp expect output


0000-cover-letter.patch
0001-This-is-an-excessively-long-subject-line-for-a-messa.patch
0002-foo.patch

ok 40 - shortlog of cover-letter wraps overly-long onelines

expecting success: 

	git format-patch -U4 -2 &&
	sed -e "1,/^\$/d" -e "/^+5/q" < 0001-This-is-an-excessively-long-subject-line-for-a-messa.patch > output &&
	test_cmp expect output


0001-This-is-an-excessively-long-subject-line-for-a-messa.patch
0002-foo.patch

ok 41 - format-patch respects -U

expecting success: 

	git format-patch -p -2 &&
	sed -e "1,/^\$/d" -e "/^+5/q" < 0001-This-is-an-excessively-long-subject-line-for-a-messa.patch > output &&
	test_cmp expect output


0001-This-is-an-excessively-long-subject-line-for-a-messa.patch
0002-foo.patch

ok 42 - format-patch -p suppresses stat

expecting success: 
	filename=$(
		rm -rf sub &&
		mkdir -p sub/dir &&
		cd sub/dir &&
		git format-patch -1
	) &&
	case "$filename" in
	0*)
		;; # ok
	*)
		echo "Oops? $filename"
		false
		;;
	esac &&
	test -f "$filename"


ok 43 - format-patch from a subdirectory (1)

expecting success: 
	filename=$(
		rm -rf sub &&
		mkdir -p sub/dir &&
		cd sub/dir &&
		git format-patch -1 -o ..
	) &&
	case "$filename" in
	../0*)
		;; # ok
	*)
		echo "Oops? $filename"
		false
		;;
	esac &&
	basename=$(expr "$filename" : ".*/\(.*\)") &&
	test -f "sub/$basename"


ok 44 - format-patch from a subdirectory (2)

expecting success: 
	rm -f 0* &&
	filename=$(
		rm -rf sub &&
		mkdir -p sub/dir &&
		cd sub/dir &&
		git format-patch -1 -o "$TRASH_DIRECTORY"
	) &&
	basename=$(expr "$filename" : ".*/\(.*\)") &&
	test -f "$basename"


ok 45 - format-patch from a subdirectory (3)

expecting success: 
	git format-patch -1 --stdout --in-reply-to "baz@foo.bar" > patch8 &&
	grep "^In-Reply-To: <baz@foo.bar>" patch8 &&
	grep "^References: <baz@foo.bar>" patch8

In-Reply-To: <baz@foo.bar>
References: <baz@foo.bar>

ok 46 - format-patch --in-reply-to

expecting success: 
	git format-patch -1 --signoff --stdout |
	grep "^Signed-off-by: $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL>"
Signed-off-by: C O Mitter <committer@example.com>

ok 47 - format-patch --signoff

expecting success: 
	test_must_fail git format-patch --name-only 2> output &&
	test_cmp expect.name-only output &&
	test_must_fail git format-patch --name-status 2> output &&
	test_cmp expect.name-status output &&
	test_must_fail git format-patch --check 2> output &&
	test_cmp expect.check output

ok 48 - options no longer allowed for format-patch

expecting success: 
	git format-patch --numstat --stdout master..side > output &&
	test 6 = $(grep "^diff --git a/" output | wc -l)

ok 49 - format-patch --numstat should produce a patch

expecting success: 
	git format-patch master..side -- file 2>error &&
	! grep "Use .--" error

0001-Side-changes-2.patch
0002-Side-changes-3-with-n-backslash-n-in-it.patch
0003-This-is-an-excessively-long-subject-line-for-a-messa.patch
0004-foo.patch

ok 50 - format-patch -- <path>

expecting success: 
	git format-patch --ignore-if-in-upstream HEAD


ok 51 - format-patch --ignore-if-in-upstream HEAD

expecting success: 
	git format-patch --stdout --signature="my sig" -1 >output &&
	grep "my sig" output
my sig

ok 52 - format-patch --signature

expecting success: 
	git config format.signature "config sig" &&
	git format-patch --stdout -1 >output &&
	grep "config sig" output
config sig

ok 53 - format-patch with format.signature config

expecting success: 
	git config format.signature "config sig" &&
	git format-patch --stdout --signature="overrides" -1 >output &&
	! grep "config sig" output &&
	grep "overrides" output
overrides

ok 54 - format-patch --signature overrides format.signature

expecting success: 
	git config format.signature "config sig" &&
	git format-patch --stdout --signature="my sig" --no-signature \
		-1 >output &&
	! grep "config sig" output &&
	! grep "my sig" output &&
	! grep "^-- \$" output

ok 55 - format-patch --no-signature ignores format.signature

expecting success: 
	git config --unset-all format.signature &&
	git format-patch --stdout --signature="my sig" --cover-letter \
		-1 >output &&
	grep "my sig" output &&
	test 2 = $(grep "my sig" output | wc -l)
my sig
my sig

ok 56 - format-patch --signature --cover-letter
expecting success: 
	git config format.signature "" &&
	git format-patch --stdout -1 >output &&
	! grep "^-- \$" output

ok 57 - format.signature="" supresses signatures

expecting success: 
	git config --unset-all format.signature &&
	git format-patch --stdout --no-signature -1 >output &&
	! grep "^-- \$" output

ok 58 - format-patch --no-signature supresses signatures

expecting success: 
	git format-patch --signature="" -1 >output &&
	! grep "^-- \$" output

ok 59 - format-patch --signature="" supresses signatures

expecting success: 
	rm -f pager_used &&
	(
		GIT_PAGER="wc >pager_used" &&
		export GIT_PAGER &&
		test_terminal git format-patch --stdout --all
	) &&
	test_path_is_file pager_used

ok 60 - format-patch --stdout paginates

expecting success: 
	rm -f pager_used &&
	(
		GIT_PAGER="wc >pager_used" &&
		export GIT_PAGER &&
		test_terminal git --no-pager format-patch --stdout --all &&
		test_terminal git -c "pager.format-patch=false" format-patch --stdout --all
	) &&
	test_path_is_missing pager_used &&
	test_path_is_missing .git/pager_used

From e27066e74e2522a272f220d17767ef6cab999734 Mon Sep 17 00:00:00 2001
Message-Id: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:13:13 -0700
Subject: [PATCH 01/11] Initial
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 elif |   10 ++++++++++
 file |   10 ++++++++++
 2 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 elif
 create mode 100644 file

diff --git a/elif b/elif
new file mode 100644
index 0000000..f00c965
--- /dev/null
+++ b/elif
@@ -0,0 +1,10 @@
+1
+2
+3
+4
+5
+6
+7
+8
+9
+10
diff --git a/file b/file
new file mode 100644
index 0000000..f00c965
--- /dev/null
+++ b/file
@@ -0,0 +1,10 @@
+1
+2
+3
+4
+5
+6
+7
+8
+9
+10
-- 
1.7.4.rc0.209.gad523


From 1135adfeed86678c55e1aad7c568046ee8215660 Mon Sep 17 00:00:00 2001
Message-Id: <1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
In-Reply-To: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:14:13 -0700
Subject: [PATCH 02/11] Side changes #1
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 0 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 elif

diff --git a/elif b/elif
old mode 100644
new mode 100755
-- 
1.7.4.rc0.209.gad523


From fd00575a8382ce27c62b83730a40bcff1dc2f25f Mon Sep 17 00:00:00 2001
Message-Id: <fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
In-Reply-To: <1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:15:13 -0700
Subject: [PATCH 03/11] Side changes #2
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 file |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/file b/file
index f00c965..e5895ff 100644
--- a/file
+++ b/file
@@ -1,10 +1,14 @@
 1
 2
-3
-4
 5
 6
+A
+B
+C
 7
 8
 9
 10
+D
+E
+F
-- 
1.7.4.rc0.209.gad523


From 18ed22aae56367787c36a882bd61281e07994f11 Mon Sep 17 00:00:00 2001
Message-Id: <18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
In-Reply-To: <fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
	<fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:16:13 -0700
Subject: [PATCH 04/11] Side changes #3 with \n backslash-n in it.
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 file |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/file b/file
index e5895ff..40f36c6 100644
--- a/file
+++ b/file
@@ -1,8 +1,10 @@
-1
-2
 5
 6
+1
+2
+3
 A
+4
 B
 C
 7
-- 
1.7.4.rc0.209.gad523


From 2e66419311bb9e77e5d67b8ea7019aaddfb581f1 Mon Sep 17 00:00:00 2001
Message-Id: <2e66419311bb9e77e5d67b8ea7019aaddfb581f1.1294200094.git.committer@example.com>
In-Reply-To: <18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
	<fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
	<18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:17:13 -0700
Subject: [PATCH 05/11] Master accepts moral equivalent of #2
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 file |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/file b/file
index f00c965..e5895ff 100644
--- a/file
+++ b/file
@@ -1,10 +1,14 @@
 1
 2
-3
-4
 5
 6
+A
+B
+C
 7
 8
 9
 10
+D
+E
+F
-- 
1.7.4.rc0.209.gad523


From 350e11281bd1c6490ea045bbbc060879d406b458 Mon Sep 17 00:00:00 2001
Message-Id: <350e11281bd1c6490ea045bbbc060879d406b458.1294200094.git.committer@example.com>
In-Reply-To: <2e66419311bb9e77e5d67b8ea7019aaddfb581f1.1294200094.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
	<fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
	<18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
	<2e66419311bb9e77e5d67b8ea7019aaddfb581f1.1294200094.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:18:13 -0700
Subject: [PATCH 06/11] Slave change #1
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 file |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/file b/file
index e5895ff..3cb93e8 100644
--- a/file
+++ b/file
@@ -12,3 +12,4 @@ C
 D
 E
 F
+Another line
-- 
1.7.4.rc0.209.gad523


From 065c933ac908ac046fbe3293f1c083118e6cc8f9 Mon Sep 17 00:00:00 2001
Message-Id: <065c933ac908ac046fbe3293f1c083118e6cc8f9.1294200094.git.committer@example.com>
In-Reply-To: <350e11281bd1c6490ea045bbbc060879d406b458.1294200094.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
	<fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
	<18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
	<2e66419311bb9e77e5d67b8ea7019aaddfb581f1.1294200094.git.committer@example.com>
	<350e11281bd1c6490ea045bbbc060879d406b458.1294200094.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:19:13 -0700
Subject: [PATCH 07/11] Slave change #2
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 file |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/file b/file
index 3cb93e8..b43af10 100644
--- a/file
+++ b/file
@@ -13,3 +13,4 @@ D
 E
 F
 Another line
+Yet another line
-- 
1.7.4.rc0.209.gad523


From 422768ba4254e7abbeb467b6fe254472207e3d1f Mon Sep 17 00:00:00 2001
Message-Id: <422768ba4254e7abbeb467b6fe254472207e3d1f.1294200094.git.committer@example.com>
In-Reply-To: <065c933ac908ac046fbe3293f1c083118e6cc8f9.1294200094.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
	<fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
	<18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
	<2e66419311bb9e77e5d67b8ea7019aaddfb581f1.1294200094.git.committer@example.com>
	<350e11281bd1c6490ea045bbbc060879d406b458.1294200094.git.committer@example.com>
	<065c933ac908ac046fbe3293f1c083118e6cc8f9.1294200094.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:20:13 -0700
Subject: [PATCH 08/11] This is an excessively long subject line for a message due to the habit some projects have of not having a short, one-line subject at the start of the commit message, but rather sticking a whole paragraph right at the start as the only thing in the commit message. It had better not become the filename for the patch.
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 file |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/file b/file
index 40f36c6..2dc5c23 100644
--- a/file
+++ b/file
@@ -14,3 +14,19 @@ C
 D
 E
 F
+5
+6
+1
+2
+3
+A
+4
+B
+C
+7
+8
+9
+10
+D
+E
+F
-- 
1.7.4.rc0.209.gad523


From 65fd934a9794ce9ab6e5c2574ed909ee8b0d4a42 Mon Sep 17 00:00:00 2001
Message-Id: <65fd934a9794ce9ab6e5c2574ed909ee8b0d4a42.1294200094.git.committer@example.com>
In-Reply-To: <422768ba4254e7abbeb467b6fe254472207e3d1f.1294200094.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
	<fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
	<18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
	<2e66419311bb9e77e5d67b8ea7019aaddfb581f1.1294200094.git.committer@example.com>
	<350e11281bd1c6490ea045bbbc060879d406b458.1294200094.git.committer@example.com>
	<065c933ac908ac046fbe3293f1c083118e6cc8f9.1294200094.git.committer@example.com>
	<422768ba4254e7abbeb467b6fe254472207e3d1f.1294200094.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:14:13 -0700
Subject: [PATCH 09/11] Side changes #1
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 0 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 elif

diff --git a/elif b/elif
old mode 100644
new mode 100755
-- 
1.7.4.rc0.209.gad523


From ea84707526e90d423e619b6b32bd3f6b55088d02 Mon Sep 17 00:00:00 2001
Message-Id: <ea84707526e90d423e619b6b32bd3f6b55088d02.1294200094.git.committer@example.com>
In-Reply-To: <65fd934a9794ce9ab6e5c2574ed909ee8b0d4a42.1294200094.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
	<fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
	<18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
	<2e66419311bb9e77e5d67b8ea7019aaddfb581f1.1294200094.git.committer@example.com>
	<350e11281bd1c6490ea045bbbc060879d406b458.1294200094.git.committer@example.com>
	<065c933ac908ac046fbe3293f1c083118e6cc8f9.1294200094.git.committer@example.com>
	<422768ba4254e7abbeb467b6fe254472207e3d1f.1294200094.git.committer@example.com>
	<65fd934a9794ce9ab6e5c2574ed909ee8b0d4a42.1294200094.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:20:13 -0700
Subject: [PATCH 10/11] foo
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 file |   32 --------------------------------
 foo  |   32 ++++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 32 deletions(-)
 delete mode 100644 file
 create mode 100644 foo

diff --git a/file b/file
deleted file mode 100644
index 2dc5c23..0000000
--- a/file
+++ /dev/null
@@ -1,32 +0,0 @@
-5
-6
-1
-2
-3
-A
-4
-B
-C
-7
-8
-9
-10
-D
-E
-F
-5
-6
-1
-2
-3
-A
-4
-B
-C
-7
-8
-9
-10
-D
-E
-F
diff --git a/foo b/foo
new file mode 100644
index 0000000..2dc5c23
--- /dev/null
+++ b/foo
@@ -0,0 +1,32 @@
+5
+6
+1
+2
+3
+A
+4
+B
+C
+7
+8
+9
+10
+D
+E
+F
+5
+6
+1
+2
+3
+A
+4
+B
+C
+7
+8
+9
+10
+D
+E
+F
-- 
1.7.4.rc0.209.gad523


From 8bf542ef94c579d3eee1a3cf5062c983cb6d25eb Mon Sep 17 00:00:00 2001
Message-Id: <8bf542ef94c579d3eee1a3cf5062c983cb6d25eb.1294200094.git.committer@example.com>
In-Reply-To: <ea84707526e90d423e619b6b32bd3f6b55088d02.1294200094.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
	<fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
	<18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
	<2e66419311bb9e77e5d67b8ea7019aaddfb581f1.1294200094.git.committer@example.com>
	<350e11281bd1c6490ea045bbbc060879d406b458.1294200094.git.committer@example.com>
	<065c933ac908ac046fbe3293f1c083118e6cc8f9.1294200094.git.committer@example.com>
	<422768ba4254e7abbeb467b6fe254472207e3d1f.1294200094.git.committer@example.com>
	<65fd934a9794ce9ab6e5c2574ed909ee8b0d4a42.1294200094.git.committer@example.com>
	<ea84707526e90d423e619b6b32bd3f6b55088d02.1294200094.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:16:13 -0700
Subject: [PATCH 11/11] Side changes #3 with \n backslash-n in it.
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 file |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/file b/file
index e5895ff..40f36c6 100644
--- a/file
+++ b/file
@@ -1,8 +1,10 @@
-1
-2
 5
 6
+1
+2
+3
 A
+4
 B
 C
 7
-- 
1.7.4.rc0.209.gad523

From e27066e74e2522a272f220d17767ef6cab999734 Mon Sep 17 00:00:00 2001
Message-Id: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:13:13 -0700
Subject: [PATCH 01/11] Initial
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 elif |   10 ++++++++++
 file |   10 ++++++++++
 2 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 elif
 create mode 100644 file

diff --git a/elif b/elif
new file mode 100644
index 0000000..f00c965
--- /dev/null
+++ b/elif
@@ -0,0 +1,10 @@
+1
+2
+3
+4
+5
+6
+7
+8
+9
+10
diff --git a/file b/file
new file mode 100644
index 0000000..f00c965
--- /dev/null
+++ b/file
@@ -0,0 +1,10 @@
+1
+2
+3
+4
+5
+6
+7
+8
+9
+10
-- 
1.7.4.rc0.209.gad523


From 1135adfeed86678c55e1aad7c568046ee8215660 Mon Sep 17 00:00:00 2001
Message-Id: <1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
In-Reply-To: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:14:13 -0700
Subject: [PATCH 02/11] Side changes #1
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 0 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 elif

diff --git a/elif b/elif
old mode 100644
new mode 100755
-- 
1.7.4.rc0.209.gad523


From fd00575a8382ce27c62b83730a40bcff1dc2f25f Mon Sep 17 00:00:00 2001
Message-Id: <fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
In-Reply-To: <1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:15:13 -0700
Subject: [PATCH 03/11] Side changes #2
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 file |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/file b/file
index f00c965..e5895ff 100644
--- a/file
+++ b/file
@@ -1,10 +1,14 @@
 1
 2
-3
-4
 5
 6
+A
+B
+C
 7
 8
 9
 10
+D
+E
+F
-- 
1.7.4.rc0.209.gad523


From 18ed22aae56367787c36a882bd61281e07994f11 Mon Sep 17 00:00:00 2001
Message-Id: <18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
In-Reply-To: <fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
	<fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:16:13 -0700
Subject: [PATCH 04/11] Side changes #3 with \n backslash-n in it.
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 file |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/file b/file
index e5895ff..40f36c6 100644
--- a/file
+++ b/file
@@ -1,8 +1,10 @@
-1
-2
 5
 6
+1
+2
+3
 A
+4
 B
 C
 7
-- 
1.7.4.rc0.209.gad523


From 2e66419311bb9e77e5d67b8ea7019aaddfb581f1 Mon Sep 17 00:00:00 2001
Message-Id: <2e66419311bb9e77e5d67b8ea7019aaddfb581f1.1294200095.git.committer@example.com>
In-Reply-To: <18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
	<fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
	<18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:17:13 -0700
Subject: [PATCH 05/11] Master accepts moral equivalent of #2
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 file |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/file b/file
index f00c965..e5895ff 100644
--- a/file
+++ b/file
@@ -1,10 +1,14 @@
 1
 2
-3
-4
 5
 6
+A
+B
+C
 7
 8
 9
 10
+D
+E
+F
-- 
1.7.4.rc0.209.gad523


From 350e11281bd1c6490ea045bbbc060879d406b458 Mon Sep 17 00:00:00 2001
Message-Id: <350e11281bd1c6490ea045bbbc060879d406b458.1294200095.git.committer@example.com>
In-Reply-To: <2e66419311bb9e77e5d67b8ea7019aaddfb581f1.1294200095.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
	<fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
	<18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
	<2e66419311bb9e77e5d67b8ea7019aaddfb581f1.1294200095.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:18:13 -0700
Subject: [PATCH 06/11] Slave change #1
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 file |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/file b/file
index e5895ff..3cb93e8 100644
--- a/file
+++ b/file
@@ -12,3 +12,4 @@ C
 D
 E
 F
+Another line
-- 
1.7.4.rc0.209.gad523


From 065c933ac908ac046fbe3293f1c083118e6cc8f9 Mon Sep 17 00:00:00 2001
Message-Id: <065c933ac908ac046fbe3293f1c083118e6cc8f9.1294200095.git.committer@example.com>
In-Reply-To: <350e11281bd1c6490ea045bbbc060879d406b458.1294200095.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
	<fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
	<18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
	<2e66419311bb9e77e5d67b8ea7019aaddfb581f1.1294200095.git.committer@example.com>
	<350e11281bd1c6490ea045bbbc060879d406b458.1294200095.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:19:13 -0700
Subject: [PATCH 07/11] Slave change #2
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 file |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/file b/file
index 3cb93e8..b43af10 100644
--- a/file
+++ b/file
@@ -13,3 +13,4 @@ D
 E
 F
 Another line
+Yet another line
-- 
1.7.4.rc0.209.gad523


From 422768ba4254e7abbeb467b6fe254472207e3d1f Mon Sep 17 00:00:00 2001
Message-Id: <422768ba4254e7abbeb467b6fe254472207e3d1f.1294200095.git.committer@example.com>
In-Reply-To: <065c933ac908ac046fbe3293f1c083118e6cc8f9.1294200095.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
	<fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
	<18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
	<2e66419311bb9e77e5d67b8ea7019aaddfb581f1.1294200095.git.committer@example.com>
	<350e11281bd1c6490ea045bbbc060879d406b458.1294200095.git.committer@example.com>
	<065c933ac908ac046fbe3293f1c083118e6cc8f9.1294200095.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:20:13 -0700
Subject: [PATCH 08/11] This is an excessively long subject line for a message due to the habit some projects have of not having a short, one-line subject at the start of the commit message, but rather sticking a whole paragraph right at the start as the only thing in the commit message. It had better not become the filename for the patch.
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 file |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/file b/file
index 40f36c6..2dc5c23 100644
--- a/file
+++ b/file
@@ -14,3 +14,19 @@ C
 D
 E
 F
+5
+6
+1
+2
+3
+A
+4
+B
+C
+7
+8
+9
+10
+D
+E
+F
-- 
1.7.4.rc0.209.gad523


From 65fd934a9794ce9ab6e5c2574ed909ee8b0d4a42 Mon Sep 17 00:00:00 2001
Message-Id: <65fd934a9794ce9ab6e5c2574ed909ee8b0d4a42.1294200095.git.committer@example.com>
In-Reply-To: <422768ba4254e7abbeb467b6fe254472207e3d1f.1294200095.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
	<fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
	<18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
	<2e66419311bb9e77e5d67b8ea7019aaddfb581f1.1294200095.git.committer@example.com>
	<350e11281bd1c6490ea045bbbc060879d406b458.1294200095.git.committer@example.com>
	<065c933ac908ac046fbe3293f1c083118e6cc8f9.1294200095.git.committer@example.com>
	<422768ba4254e7abbeb467b6fe254472207e3d1f.1294200095.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:14:13 -0700
Subject: [PATCH 09/11] Side changes #1
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 0 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 elif

diff --git a/elif b/elif
old mode 100644
new mode 100755
-- 
1.7.4.rc0.209.gad523


From ea84707526e90d423e619b6b32bd3f6b55088d02 Mon Sep 17 00:00:00 2001
Message-Id: <ea84707526e90d423e619b6b32bd3f6b55088d02.1294200095.git.committer@example.com>
In-Reply-To: <65fd934a9794ce9ab6e5c2574ed909ee8b0d4a42.1294200095.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
	<fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
	<18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
	<2e66419311bb9e77e5d67b8ea7019aaddfb581f1.1294200095.git.committer@example.com>
	<350e11281bd1c6490ea045bbbc060879d406b458.1294200095.git.committer@example.com>
	<065c933ac908ac046fbe3293f1c083118e6cc8f9.1294200095.git.committer@example.com>
	<422768ba4254e7abbeb467b6fe254472207e3d1f.1294200095.git.committer@example.com>
	<65fd934a9794ce9ab6e5c2574ed909ee8b0d4a42.1294200095.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:20:13 -0700
Subject: [PATCH 10/11] foo
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 file |   32 --------------------------------
 foo  |   32 ++++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 32 deletions(-)
 delete mode 100644 file
 create mode 100644 foo

diff --git a/file b/file
deleted file mode 100644
index 2dc5c23..0000000
--- a/file
+++ /dev/null
@@ -1,32 +0,0 @@
-5
-6
-1
-2
-3
-A
-4
-B
-C
-7
-8
-9
-10
-D
-E
-F
-5
-6
-1
-2
-3
-A
-4
-B
-C
-7
-8
-9
-10
-D
-E
-F
diff --git a/foo b/foo
new file mode 100644
index 0000000..2dc5c23
--- /dev/null
+++ b/foo
@@ -0,0 +1,32 @@
+5
+6
+1
+2
+3
+A
+4
+B
+C
+7
+8
+9
+10
+D
+E
+F
+5
+6
+1
+2
+3
+A
+4
+B
+C
+7
+8
+9
+10
+D
+E
+F
-- 
1.7.4.rc0.209.gad523


From 8bf542ef94c579d3eee1a3cf5062c983cb6d25eb Mon Sep 17 00:00:00 2001
Message-Id: <8bf542ef94c579d3eee1a3cf5062c983cb6d25eb.1294200095.git.committer@example.com>
In-Reply-To: <ea84707526e90d423e619b6b32bd3f6b55088d02.1294200095.git.committer@example.com>
References: <e27066e74e2522a272f220d17767ef6cab999734.1294200094.git.committer@example.com>
	<1135adfeed86678c55e1aad7c568046ee8215660.1294200094.git.committer@example.com>
	<fd00575a8382ce27c62b83730a40bcff1dc2f25f.1294200094.git.committer@example.com>
	<18ed22aae56367787c36a882bd61281e07994f11.1294200094.git.committer@example.com>
	<2e66419311bb9e77e5d67b8ea7019aaddfb581f1.1294200095.git.committer@example.com>
	<350e11281bd1c6490ea045bbbc060879d406b458.1294200095.git.committer@example.com>
	<065c933ac908ac046fbe3293f1c083118e6cc8f9.1294200095.git.committer@example.com>
	<422768ba4254e7abbeb467b6fe254472207e3d1f.1294200095.git.committer@example.com>
	<65fd934a9794ce9ab6e5c2574ed909ee8b0d4a42.1294200095.git.committer@example.com>
	<ea84707526e90d423e619b6b32bd3f6b55088d02.1294200095.git.committer@example.com>
From: A U Thor <author@example.com>
Date: Thu, 7 Apr 2005 15:16:13 -0700
Subject: [PATCH 11/11] Side changes #3 with \n backslash-n in it.
Header1: B. E. Cipient <rcipient@example.com>
To: Someone <someone@out.there>
Cc: C. E. Cipient <rcipient@example.com>

---
 file |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/file b/file
index e5895ff..40f36c6 100644
--- a/file
+++ b/file
@@ -1,8 +1,10 @@
-1
-2
 5
 6
+1
+2
+3
 A
+4
 B
 C
 7
-- 
1.7.4.rc0.209.gad523


ok 61 - format-patch --stdout pagination can be disabled

# passed all 61 test(s)
1..61
