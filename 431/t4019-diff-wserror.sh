Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4019-diff-wserror/.git/
expecting success: 

	git config diff.color.whitespace "blue reverse" &&
	>F &&
	git add F &&
	echo "         Eight SP indent" >>F &&
	echo " 	HT and SP indent" >>F &&
	echo "With trailing SP " >>F &&
	echo "Carriage ReturnQ" | tr Q "" >>F &&
	echo "No problem" >>F &&
	echo >>F

ok 1 - setup
expecting success: 

	prepare_output &&

	grep Eight normal >/dev/null &&
	grep HT error >/dev/null &&
	grep With error >/dev/null &&
	grep Return error >/dev/null &&
	grep No normal >/dev/null

ok 2 - default

expecting success: 

	test_might_fail git config --unset core.whitespace &&
	echo "F whitespace" >.gitattributes &&
	prepare_output &&

	grep Eight error >/dev/null &&
	grep HT error >/dev/null &&
	grep With error >/dev/null &&
	grep Return error >/dev/null &&
	grep No normal >/dev/null

ok 3 - default (attribute)

expecting success: 

	git config core.whitespace "tabwidth=10" &&
	echo "F whitespace" >.gitattributes &&
	prepare_output &&

	grep Eight normal >/dev/null &&
	grep HT error >/dev/null &&
	grep With error >/dev/null &&
	grep Return error >/dev/null &&
	grep No normal >/dev/null

ok 4 - default, tabwidth=10 (attribute)

expecting success: 

	test_might_fail git config --unset core.whitespace &&
	echo "F -whitespace" >.gitattributes &&
	prepare_output &&

	grep Eight normal >/dev/null &&
	grep HT normal >/dev/null &&
	grep With normal >/dev/null &&
	grep Return normal >/dev/null &&
	grep No normal >/dev/null

ok 5 - no check (attribute)

expecting success: 

	git config core.whitespace "tabwidth=10" &&
	echo "F -whitespace" >.gitattributes &&
	prepare_output &&

	grep Eight normal >/dev/null &&
	grep HT normal >/dev/null &&
	grep With normal >/dev/null &&
	grep Return normal >/dev/null &&
	grep No normal >/dev/null

ok 6 - no check, tabwidth=10 (attribute), must be irrelevant

expecting success: 

	rm -f .gitattributes &&
	git config core.whitespace -trail &&
	prepare_output &&

	grep Eight normal >/dev/null &&
	grep HT error >/dev/null &&
	grep With normal >/dev/null &&
	grep Return normal >/dev/null &&
	grep No normal >/dev/null

ok 7 - without -trail

expecting success: 

	test_might_fail git config --unset core.whitespace &&
	echo "F whitespace=-trail" >.gitattributes &&
	prepare_output &&

	grep Eight normal >/dev/null &&
	grep HT error >/dev/null &&
	grep With normal >/dev/null &&
	grep Return normal >/dev/null &&
	grep No normal >/dev/null

ok 8 - without -trail (attribute)

expecting success: 

	rm -f .gitattributes &&
	git config core.whitespace -space &&
	prepare_output &&

	grep Eight normal >/dev/null &&
	grep HT normal >/dev/null &&
	grep With error >/dev/null &&
	grep Return error >/dev/null &&
	grep No normal >/dev/null

ok 9 - without -space

expecting success: 

	test_might_fail git config --unset core.whitespace &&
	echo "F whitespace=-space" >.gitattributes &&
	prepare_output &&

	grep Eight normal >/dev/null &&
	grep HT normal >/dev/null &&
	grep With error >/dev/null &&
	grep Return error >/dev/null &&
	grep No normal >/dev/null



ok 10 - without -space (attribute)

expecting success: 

	rm -f .gitattributes &&
	git config core.whitespace indent,-trailing,-space &&
	prepare_output &&

	grep Eight error >/dev/null &&
	grep HT normal >/dev/null &&
	grep With normal >/dev/null &&
	grep Return normal >/dev/null &&
	grep No normal >/dev/null



ok 11 - with indent-non-tab only

expecting success: 

	test_might_fail git config --unset core.whitespace &&
	echo "F whitespace=indent,-trailing,-space" >.gitattributes &&
	prepare_output &&

	grep Eight error >/dev/null &&
	grep HT normal >/dev/null &&
	grep With normal >/dev/null &&
	grep Return normal >/dev/null &&
	grep No normal >/dev/null



ok 12 - with indent-non-tab only (attribute)

expecting success: 

	rm -f .gitattributes &&
	git config core.whitespace indent,tabwidth=10,-trailing,-space &&
	prepare_output &&

	grep Eight normal >/dev/null &&
	grep HT normal >/dev/null &&
	grep With normal >/dev/null &&
	grep Return normal >/dev/null &&
	grep No normal >/dev/null



ok 13 - with indent-non-tab only, tabwidth=10

expecting success: 

	test_might_fail git config --unset core.whitespace &&
	echo "F whitespace=indent,-trailing,-space,tabwidth=10" >.gitattributes &&
	prepare_output &&

	grep Eight normal >/dev/null &&
	grep HT normal >/dev/null &&
	grep With normal >/dev/null &&
	grep Return normal >/dev/null &&
	grep No normal >/dev/null

ok 14 - with indent-non-tab only, tabwidth=10 (attribute)

expecting success: 

	rm -f .gitattributes &&
	git config core.whitespace cr-at-eol &&
	prepare_output &&

	grep Eight normal >/dev/null &&
	grep HT error >/dev/null &&
	grep With error >/dev/null &&
	grep Return normal >/dev/null &&
	grep No normal >/dev/null



ok 15 - with cr-at-eol

expecting success: 

	test_might_fail git config --unset core.whitespace &&
	echo "F whitespace=trailing,cr-at-eol" >.gitattributes &&
	prepare_output &&

	grep Eight normal >/dev/null &&
	grep HT error >/dev/null &&
	grep With error >/dev/null &&
	grep Return normal >/dev/null &&
	grep No normal >/dev/null

ok 16 - with cr-at-eol (attribute)

expecting success: 

	rm -f .gitattributes &&
	test_must_fail git diff --check >output &&
	grep "new blank line at" output &&
	grep "trailing whitespace" output
F:6: new blank line at EOF.
F:3: trailing whitespace.
F:4: trailing whitespace.

ok 17 - trailing empty lines (1)

expecting success: 

	echo "F -whitespace" >.gitattributes &&
	git diff --check >output &&
	! test -s output

ok 18 - trailing empty lines (2)

expecting success: 

	printf "a
b
" > G &&
	git add G &&
	printf "x
x
x
a
b
c

" > G &&
	[ "$(git diff --check -- G)" = "G:7: new blank line at EOF." ]

ok 19 - checkdiff shows correct line number for trailing blank lines

expecting success: 
	test_might_fail git config --unset core.whitespace &&
	rm -f .gitattributes &&
	echo AAAQ | tr Q "" >G &&
	git add G &&
	echo BBBQ | tr Q "" >>G &&
	git diff --color G | tr "" Q >output &&
	grep "BBB.*${blue_grep}Q" output &&
	grep "AAA.*\[mQ" output
[32m+[m[32mBBB[m[7;34mQ[m
 AAA[mQ
ok 20 - do not color trailing cr in context
expecting success: 
	{ echo a; echo b; echo; echo; } >x &&
	git add x &&
	{ echo a; echo; echo; echo; echo c; echo; echo; echo; echo; } >x &&
	git diff --color x >output &&
	cnt=$($grep_a "${blue_grep}" output | wc -l) &&
	test $cnt = 2

ok 21 - color new trailing blank lines

# passed all 21 test(s)
1..21
