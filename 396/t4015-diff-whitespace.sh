Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4015-diff-whitespace/.git/
expecting success: test_cmp expect out

ok 1 - Ray's example without options

expecting success: test_cmp expect out

ok 2 - Ray's example with -w

expecting success: test_cmp expect out

ok 3 - Ray's example with -b
expecting success: test_cmp expect out
ok 4 - another test, without options
expecting success: test_cmp expect out

ok 5 - another test, with -w

expecting success: test_cmp expect out

ok 6 - another test, with -w -b

expecting success: test_cmp expect out

ok 7 - another test, with -w --ignore-space-at-eol

expecting success: test_cmp expect out

ok 8 - another test, with -w -b --ignore-space-at-eol

expecting success: test_cmp expect out

ok 9 - another test, with -b

expecting success: test_cmp expect out

ok 10 - another test, with -b --ignore-space-at-eol

expecting success: test_cmp expect out

ok 11 - another test, with --ignore-space-at-eol

expecting success: 

	# This is indented with SP HT SP.
	echo " 	 foo();" > x &&
	git diff --check | grep "space before tab in indent"


x:1: space before tab in indent.

ok 12 - check mixed spaces and tabs in indent

expecting success: 

	# This is indented with HT SP HT.
	echo "	 	foo();" > x &&
	git diff --check | grep "space before tab in indent"


x:1: space before tab in indent.

ok 13 - check mixed tabs and spaces in indent

expecting success: 

	git commit -m "snapshot" &&
	echo "foo();" > x &&
	git diff --check


[master (root-commit) 12c325b] snapshot
 Author: A U Thor <author@example.com>
 1 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 x

ok 14 - check with no whitespace errors

expecting success: 

	echo "foo(); " > x &&
	test_must_fail git diff --check


x:1: trailing whitespace.
+foo(); 

ok 15 - check with trailing whitespace

expecting success: 

	# indent has space followed by hard tab
	echo " 	foo();" > x &&
	test_must_fail git diff --check


x:1: space before tab in indent.
+ 	foo();

ok 16 - check with space before tab in indent

expecting success: 

	git checkout x &&
	git diff --check --exit-code



ok 17 - --check and --exit-code are not exclusive

expecting success: 

	git diff --check --quiet



ok 18 - --check and --quiet are not exclusive

expecting success: 

	echo "foo();" > x &&
	git add x &&
	git diff --cached --check

ok 19 - check staged with no whitespace errors

expecting success: 

	echo "foo(); " > x &&
	git add x &&
	test_must_fail git diff --cached --check


x:1: trailing whitespace.
+foo(); 

ok 20 - check staged with trailing whitespace

expecting success: 

	# indent has space followed by hard tab
	echo " 	foo();" > x &&
	git add x &&
	test_must_fail git diff --cached --check


x:1: space before tab in indent.
+ 	foo();

ok 21 - check staged with space before tab in indent

expecting success: 

	echo "foo();" > x &&
	git add x &&
	git diff-index --check HEAD



ok 22 - check with no whitespace errors (diff-index)

expecting success: 

	echo "foo(); " > x &&
	git add x &&
	test_must_fail git diff-index --check HEAD


x:1: trailing whitespace.
+foo(); 

ok 23 - check with trailing whitespace (diff-index)

expecting success: 

	# indent has space followed by hard tab
	echo " 	foo();" > x &&
	git add x &&
	test_must_fail git diff-index --check HEAD


x:1: space before tab in indent.
+ 	foo();

ok 24 - check with space before tab in indent (diff-index)

expecting success: 

	echo "foo();" > x &&
	git add x &&
	git diff-index --cached --check HEAD



ok 25 - check staged with no whitespace errors (diff-index)

expecting success: 

	echo "foo(); " > x &&
	git add x &&
	test_must_fail git diff-index --cached --check HEAD
x:1: trailing whitespace.
+foo(); 

ok 26 - check staged with trailing whitespace (diff-index)

expecting success: 

	# indent has space followed by hard tab
	echo " 	foo();" > x &&
	git add x &&
	test_must_fail git diff-index --cached --check HEAD
x:1: space before tab in indent.
+ 	foo();

ok 27 - check staged with space before tab in indent (diff-index)

expecting success: 

	echo "foo();" > x &&
	git commit -m "new commit" x &&
	git diff-tree --check HEAD^ HEAD


[master 5c50ef9] new commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 6 deletions(-)

ok 28 - check with no whitespace errors (diff-tree)

expecting success: 

	echo "foo(); " > x &&
	git commit -m "another commit" x &&
	test_must_fail git diff-tree --check HEAD^ HEAD


[master 204c9bf] another commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
x:1: trailing whitespace.
+foo(); 

ok 29 - check with trailing whitespace (diff-tree)

expecting success: 

	# indent has space followed by hard tab
	echo " 	foo();" > x &&
	git commit -m "yet another" x &&
	test_must_fail git diff-tree --check HEAD^ HEAD


[master 009d95e] yet another
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
x:1: space before tab in indent.
+ 	foo();

ok 30 - check with space before tab in indent (diff-tree)

expecting success: 

	git config core.whitespace "-trailing-space" &&
	echo "foo ();   " > x &&
	git diff --check



ok 31 - check trailing whitespace (trailing-space: off)

expecting success: 

	git config core.whitespace "trailing-space" &&
	echo "foo ();   " > x &&
	test_must_fail git diff --check
x:1: trailing whitespace.
+foo ();   

ok 32 - check trailing whitespace (trailing-space: on)

expecting success: 

	# indent contains space followed by HT
	git config core.whitespace "-space-before-tab" &&
	echo " 	foo ();" > x &&
	git diff --check

ok 33 - check space before tab in indent (space-before-tab: off)

expecting success: 

	# indent contains space followed by HT
	git config core.whitespace "space-before-tab" &&
	echo " 	foo ();   " > x &&
	test_must_fail git diff --check
x:1: trailing whitespace, space before tab in indent.
+ 	foo ();   

ok 34 - check space before tab in indent (space-before-tab: on)

expecting success: 

	git config core.whitespace "-indent-with-non-tab" &&
	echo "        foo ();" > x &&
	git diff --check

ok 35 - check spaces as indentation (indent-with-non-tab: off)

expecting success: 

	git config core.whitespace "indent-with-non-tab" &&
	echo "        foo ();" > x &&
	test_must_fail git diff --check
x:1: indent with spaces.
+        foo ();

ok 36 - check spaces as indentation (indent-with-non-tab: on)
expecting success: 

	git config core.whitespace "indent-with-non-tab,tabwidth=9" &&
	git diff --check

ok 37 - ditto, but tabwidth=9
expecting success: 

	git config core.whitespace "indent-with-non-tab" &&
	echo "	                foo ();" > x &&
	test_must_fail git diff --check
x:1: indent with spaces.
+	                foo ();
ok 38 - check tabs and spaces as indentation (indent-with-non-tab: on)
expecting success: 

	git config core.whitespace "indent-with-non-tab,tabwidth=10" &&
	test_must_fail git diff --check
x:1: indent with spaces.
+	                foo ();

ok 39 - ditto, but tabwidth=10

expecting success: 

	git config core.whitespace "indent-with-non-tab,tabwidth=20" &&
	git diff --check

ok 40 - ditto, but tabwidth=20

expecting success: 

	git config core.whitespace "-tab-in-indent" &&
	echo "	foo ();" > x &&
	git diff --check

ok 41 - check tabs as indentation (tab-in-indent: off)

expecting success: 

	git config core.whitespace "tab-in-indent" &&
	echo "	foo ();" > x &&
	test_must_fail git diff --check
x:1: tab in indent.
+	foo ();

ok 42 - check tabs as indentation (tab-in-indent: on)

expecting success: 

	git config core.whitespace "tab-in-indent" &&
	echo "	                foo ();" > x &&
	test_must_fail git diff --check
x:1: tab in indent.
+	                foo ();

ok 43 - check tabs and spaces as indentation (tab-in-indent: on)

expecting success: 

	git config core.whitespace "tab-in-indent,tabwidth=1" &&
	test_must_fail git diff --check
x:1: tab in indent.
+	                foo ();

ok 44 - ditto, but tabwidth=1 (must be irrelevant)

expecting success: 

	git config core.whitespace "tab-in-indent,indent-with-non-tab" &&
	echo "foo ();" > x &&
	test_must_fail git diff --check

ok 45 - check tab-in-indent and indent-with-non-tab conflict
expecting success: 

	git config --unset core.whitespace &&
	echo "x whitespace" > .gitattributes &&
	echo "	  foo ();" > x &&
	git diff --check &&
	rm -f .gitattributes
ok 46 - check tab-in-indent excluded from wildcard whitespace attribute

expecting success: 

	echo "" > x &&
	echo "foo(); " >> x &&
	git diff --check | grep "x:2:"
x:2: trailing whitespace.

ok 47 - line numbers in --check output are correct

expecting success: 
	echo "foo();" >x &&
	echo "" >>x &&
	git diff --check | grep "new blank line"

x:2: new blank line at EOF.

ok 48 - checkdiff detects new trailing blank lines (1)

expecting success: 
	{ echo a; echo b; echo; echo; } >x &&
	git add x &&
	{ echo a; echo; echo; echo; echo; } >x &&
	git diff --check | grep "new blank line"

x:2: new blank line at EOF.

ok 49 - checkdiff detects new trailing blank lines (2)

expecting success: 
	git checkout x &&
	mv x y &&
	(
		echo "/* This is new */" &&
		echo "" &&
		cat y
	) >x &&
	git diff --check


ok 50 - checkdiff allows new blank lines

expecting success: 
	git reset --hard &&
	echo >x "hello world" &&
	git add x &&
	git commit -m "hello 1" &&
	echo >x "hello  world" &&
	git diff -b >actual &&
	test_cmp expect actual

HEAD is now at 009d95e yet another
[master be09256] hello 1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 51 - whitespace-only changes not reported
expecting success: 
	git reset --hard &&
	for i in 1 2 3 4 5 6 7 8 9; do echo "$i$i$i$i$i$i"; done >x &&
	git add x &&
	git commit -m "base" &&
	sed -e "5s/^/ /" x >z &&
	git rm x &&
	git add z &&
	git diff -w -M --cached |
	sed -e "/^similarity index /s/[0-9][0-9]*/NUM/" >actual &&
	test_cmp expect actual
HEAD is now at be09256 hello 1
[master f33ea4f] base
 Author: A U Thor <author@example.com>
 1 files changed, 9 insertions(+), 1 deletions(-)
rm 'x'

ok 52 - whitespace-only changes reported across renames
expecting success: 
	git reset --hard &&
	>empty &&
	git add empty &&
	git commit -m empty &&
	git mv empty void &&
	git diff -w --cached -M >current &&
	test_cmp expected current
HEAD is now at f33ea4f base
[master ed813f9] empty
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 empty

ok 53 - rename empty

expecting success: 

	git reset --hard &&
	echo >x hello &&
	git commit -m "one side" x &&
	git checkout HEAD^ &&
	echo >x goodbye &&
	git commit -m "the other side" x &&
	git config core.autocrlf true &&
	test_must_fail git merge master &&

	git diff | sed -e "1,/^@@@/d" >actual &&
	! grep "^-" actual


HEAD is now at ed813f9 empty
[master 9945607] one side
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 9 deletions(-)
[detached HEAD 53d55f1] the other side
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 9 deletions(-)
Merging:
53d55f1 the other side
virtual master
found 1 common ancestor(s):
ed813f9 empty
Auto-merging x
CONFLICT (content): Merge conflict in x
Automatic merge failed; fix conflicts and then commit the result.

ok 54 - combined diff with autocrlf conversion

expecting success: 
	git config color.diff always &&
	git config color.diff.plain normal &&
	git config color.diff.meta bold &&
	git config color.diff.frag cyan &&
	git config color.diff.func normal &&
	git config color.diff.old red &&
	git config color.diff.new green &&
	git config color.diff.commit yellow &&
	git config color.diff.whitespace "normal red" &&

	git config core.autocrlf false

ok 55 - setup diff colors
expecting success: 
	git config core.whitespace blank-at-eol &&
	git reset --hard &&
	echo "test" > x &&
	git commit -m "initial" x &&
	echo "{NTN}" | tr "NT" "
	" >> x &&
	git -c color.diff=always diff | test_decode_color >current &&
	test_cmp expected current
HEAD is now at 53d55f1 the other side
[detached HEAD 8122762] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 56 - diff that introduces a line with only tabs

# passed all 56 test(s)
1..56
