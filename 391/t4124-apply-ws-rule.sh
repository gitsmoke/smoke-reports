Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4124-apply-ws-rule/.git/
expecting success: 

	>file &&
	git add file &&
	prepare_test_file >file &&
	git diff-files -p >patch &&
	>target &&
	git add target

ok 1 - setup

expecting success: 

	apply_patch --whitespace=nowarn &&
	test_cmp file target

ok 2 - whitespace=nowarn, default rule

expecting success: 

	apply_patch --whitespace=warn &&
	test_cmp file target

ok 3 - whitespace=warn, default rule

expecting success: 

	apply_patch --whitespace=error-all && return 1
	test -s target && return 1
	: happy
ok 4 - whitespace=error-all, default rule

expecting success: 

	git config core.whitespace -trailing,-space-before,-indent &&
	apply_patch --whitespace=error-all &&
	test_cmp file target

ok 5 - whitespace=error-all, no rule

expecting success: 

	git config --unset core.whitespace &&
	echo "target -whitespace" >.gitattributes &&
	apply_patch --whitespace=error-all &&
	test_cmp file target

ok 6 - whitespace=error-all, no rule (attribute)

expecting success: 

	git config core.whitespace -trailing,-space,-indent,tab &&
	rm -f .gitattributes &&
	test_fix % &&
	sed -e "s/_/ /g" -e "s/>/	/" <<-\EOF >expect &&
		An_SP in an ordinary line>and a HT.
		________A HT (%).
		________A SP and a HT (@%).
		_________A SP, a HT and a SP (@%).
		_______Seven SP.
		________Eight SP (#).
		________Seven SP and a HT (@%).
		________________Eight SP and a HT (@#%).
		_________Seven SP, a HT and a SP (@%).
		_________________Eight SP, a HT and a SP (@#%).
		_______________Fifteen SP (#).
		________________Fifteen SP and a HT (@#%).
		________________Sixteen SP (#=).
		________________________Sixteen SP and a HT (@#%=).
		_____a__Five SP, a non WS, two SP.
		A line with a (!) trailing SP_
		A line with a (!) trailing HT>
	EOF
	test_cmp expect target
ok 7 - spaces inserted by tab-in-indent
expecting success: 
					git config core.whitespace "$rule" &&
					test_fix "$tt$ts$ti$th"
				

ok 8 - rule=-trailing,-space,-indent,-tab

expecting success: 
					git config core.whitespace "$rule,tabwidth=16" &&
					test_fix "$tt$ts$ti16$th"
				

ok 9 - rule=-trailing,-space,-indent,-tab,tabwidth=16

expecting success: 
					git config --unset core.whitespace &&
					echo "target whitespace=$rule" >.gitattributes &&
					test_fix "$tt$ts$ti$th"
				

ok 10 - rule=-trailing,-space,-indent,-tab (attributes)

expecting success: 
					echo "target whitespace=$rule,tabwidth=16" >.gitattributes &&
					test_fix "$tt$ts$ti16$th"
				

ok 11 - rule=-trailing,-space,-indent,-tab,tabwidth=16 (attributes)
expecting success: 
					git config core.whitespace "$rule" &&
					test_fix "$tt$ts$ti$th"
				
ok 12 - rule=-trailing,-space,-indent,tab

expecting success: 
					git config core.whitespace "$rule,tabwidth=16" &&
					test_fix "$tt$ts$ti16$th"
				
ok 13 - rule=-trailing,-space,-indent,tab,tabwidth=16

expecting success: 
					git config --unset core.whitespace &&
					echo "target whitespace=$rule" >.gitattributes &&
					test_fix "$tt$ts$ti$th"
				
ok 14 - rule=-trailing,-space,-indent,tab (attributes)

expecting success: 
					echo "target whitespace=$rule,tabwidth=16" >.gitattributes &&
					test_fix "$tt$ts$ti16$th"
				
ok 15 - rule=-trailing,-space,-indent,tab,tabwidth=16 (attributes)
expecting success: 
					git config core.whitespace "$rule" &&
					test_fix "$tt$ts$ti$th"
				
ok 16 - rule=-trailing,-space,indent,-tab

expecting success: 
					git config core.whitespace "$rule,tabwidth=16" &&
					test_fix "$tt$ts$ti16$th"
				

ok 17 - rule=-trailing,-space,indent,-tab,tabwidth=16

expecting success: 
					git config --unset core.whitespace &&
					echo "target whitespace=$rule" >.gitattributes &&
					test_fix "$tt$ts$ti$th"
				
ok 18 - rule=-trailing,-space,indent,-tab (attributes)

expecting success: 
					echo "target whitespace=$rule,tabwidth=16" >.gitattributes &&
					test_fix "$tt$ts$ti16$th"
				

ok 19 - rule=-trailing,-space,indent,-tab,tabwidth=16 (attributes)

expecting success: 
					git config core.whitespace "$rule" &&
					test_fix "$tt$ts$ti$th"
				

ok 20 - rule=-trailing,space,-indent,-tab

expecting success: 
					git config core.whitespace "$rule,tabwidth=16" &&
					test_fix "$tt$ts$ti16$th"
				

ok 21 - rule=-trailing,space,-indent,-tab,tabwidth=16

expecting success: 
					git config --unset core.whitespace &&
					echo "target whitespace=$rule" >.gitattributes &&
					test_fix "$tt$ts$ti$th"
				
ok 22 - rule=-trailing,space,-indent,-tab (attributes)
expecting success: 
					echo "target whitespace=$rule,tabwidth=16" >.gitattributes &&
					test_fix "$tt$ts$ti16$th"
				
ok 23 - rule=-trailing,space,-indent,-tab,tabwidth=16 (attributes)
expecting success: 
					git config core.whitespace "$rule" &&
					test_fix "$tt$ts$ti$th"
				
ok 24 - rule=-trailing,space,-indent,tab

expecting success: 
					git config core.whitespace "$rule,tabwidth=16" &&
					test_fix "$tt$ts$ti16$th"
				
ok 25 - rule=-trailing,space,-indent,tab,tabwidth=16

expecting success: 
					git config --unset core.whitespace &&
					echo "target whitespace=$rule" >.gitattributes &&
					test_fix "$tt$ts$ti$th"
				
ok 26 - rule=-trailing,space,-indent,tab (attributes)
expecting success: 
					echo "target whitespace=$rule,tabwidth=16" >.gitattributes &&
					test_fix "$tt$ts$ti16$th"
				
ok 27 - rule=-trailing,space,-indent,tab,tabwidth=16 (attributes)
expecting success: 
					git config core.whitespace "$rule" &&
					test_fix "$tt$ts$ti$th"
				
ok 28 - rule=-trailing,space,indent,-tab

expecting success: 
					git config core.whitespace "$rule,tabwidth=16" &&
					test_fix "$tt$ts$ti16$th"
				

ok 29 - rule=-trailing,space,indent,-tab,tabwidth=16

expecting success: 
					git config --unset core.whitespace &&
					echo "target whitespace=$rule" >.gitattributes &&
					test_fix "$tt$ts$ti$th"
				
ok 30 - rule=-trailing,space,indent,-tab (attributes)

expecting success: 
					echo "target whitespace=$rule,tabwidth=16" >.gitattributes &&
					test_fix "$tt$ts$ti16$th"
				
ok 31 - rule=-trailing,space,indent,-tab,tabwidth=16 (attributes)
expecting success: 
					git config core.whitespace "$rule" &&
					test_fix "$tt$ts$ti$th"
				
ok 32 - rule=trailing,-space,-indent,-tab

expecting success: 
					git config core.whitespace "$rule,tabwidth=16" &&
					test_fix "$tt$ts$ti16$th"
				
ok 33 - rule=trailing,-space,-indent,-tab,tabwidth=16
expecting success: 
					git config --unset core.whitespace &&
					echo "target whitespace=$rule" >.gitattributes &&
					test_fix "$tt$ts$ti$th"
				

ok 34 - rule=trailing,-space,-indent,-tab (attributes)

expecting success: 
					echo "target whitespace=$rule,tabwidth=16" >.gitattributes &&
					test_fix "$tt$ts$ti16$th"
				
ok 35 - rule=trailing,-space,-indent,-tab,tabwidth=16 (attributes)
expecting success: 
					git config core.whitespace "$rule" &&
					test_fix "$tt$ts$ti$th"
				

ok 36 - rule=trailing,-space,-indent,tab

expecting success: 
					git config core.whitespace "$rule,tabwidth=16" &&
					test_fix "$tt$ts$ti16$th"
				

ok 37 - rule=trailing,-space,-indent,tab,tabwidth=16

expecting success: 
					git config --unset core.whitespace &&
					echo "target whitespace=$rule" >.gitattributes &&
					test_fix "$tt$ts$ti$th"
				

ok 38 - rule=trailing,-space,-indent,tab (attributes)

expecting success: 
					echo "target whitespace=$rule,tabwidth=16" >.gitattributes &&
					test_fix "$tt$ts$ti16$th"
				

ok 39 - rule=trailing,-space,-indent,tab,tabwidth=16 (attributes)
expecting success: 
					git config core.whitespace "$rule" &&
					test_fix "$tt$ts$ti$th"
				

ok 40 - rule=trailing,-space,indent,-tab

expecting success: 
					git config core.whitespace "$rule,tabwidth=16" &&
					test_fix "$tt$ts$ti16$th"
				
ok 41 - rule=trailing,-space,indent,-tab,tabwidth=16
expecting success: 
					git config --unset core.whitespace &&
					echo "target whitespace=$rule" >.gitattributes &&
					test_fix "$tt$ts$ti$th"
				

ok 42 - rule=trailing,-space,indent,-tab (attributes)

expecting success: 
					echo "target whitespace=$rule,tabwidth=16" >.gitattributes &&
					test_fix "$tt$ts$ti16$th"
				
ok 43 - rule=trailing,-space,indent,-tab,tabwidth=16 (attributes)
expecting success: 
					git config core.whitespace "$rule" &&
					test_fix "$tt$ts$ti$th"
				

ok 44 - rule=trailing,space,-indent,-tab

expecting success: 
					git config core.whitespace "$rule,tabwidth=16" &&
					test_fix "$tt$ts$ti16$th"
				

ok 45 - rule=trailing,space,-indent,-tab,tabwidth=16

expecting success: 
					git config --unset core.whitespace &&
					echo "target whitespace=$rule" >.gitattributes &&
					test_fix "$tt$ts$ti$th"
				

ok 46 - rule=trailing,space,-indent,-tab (attributes)

expecting success: 
					echo "target whitespace=$rule,tabwidth=16" >.gitattributes &&
					test_fix "$tt$ts$ti16$th"
				

ok 47 - rule=trailing,space,-indent,-tab,tabwidth=16 (attributes)

expecting success: 
					git config core.whitespace "$rule" &&
					test_fix "$tt$ts$ti$th"
				

ok 48 - rule=trailing,space,-indent,tab

expecting success: 
					git config core.whitespace "$rule,tabwidth=16" &&
					test_fix "$tt$ts$ti16$th"
				

ok 49 - rule=trailing,space,-indent,tab,tabwidth=16

expecting success: 
					git config --unset core.whitespace &&
					echo "target whitespace=$rule" >.gitattributes &&
					test_fix "$tt$ts$ti$th"
				

ok 50 - rule=trailing,space,-indent,tab (attributes)

expecting success: 
					echo "target whitespace=$rule,tabwidth=16" >.gitattributes &&
					test_fix "$tt$ts$ti16$th"
				

ok 51 - rule=trailing,space,-indent,tab,tabwidth=16 (attributes)

expecting success: 
					git config core.whitespace "$rule" &&
					test_fix "$tt$ts$ti$th"
				

ok 52 - rule=trailing,space,indent,-tab

expecting success: 
					git config core.whitespace "$rule,tabwidth=16" &&
					test_fix "$tt$ts$ti16$th"
				

ok 53 - rule=trailing,space,indent,-tab,tabwidth=16

expecting success: 
					git config --unset core.whitespace &&
					echo "target whitespace=$rule" >.gitattributes &&
					test_fix "$tt$ts$ti$th"
				

ok 54 - rule=trailing,space,indent,-tab (attributes)

expecting success: 
					echo "target whitespace=$rule,tabwidth=16" >.gitattributes &&
					test_fix "$tt$ts$ti16$th"
				

ok 55 - rule=trailing,space,indent,-tab,tabwidth=16 (attributes)

expecting success: 
	>target &&
	create_patch >patch-file &&
	git apply --whitespace=fix patch-file &&
	grep "newline$" target &&
	grep "^$" target

A line with trailing whitespace and no newline


ok 56 - trailing whitespace & no newline at the end of file

expecting success: 
	test_might_fail git config --unset core.whitespace &&
	rm -f .gitattributes &&

	{ echo a; echo b; echo c; } >one &&
	git add one &&
	{ echo a; echo b; echo c; } >expect &&
	{ cat expect; echo; } >one &&
	git diff -- one >patch &&

	git checkout one &&
	git apply --whitespace=fix patch &&
	test_cmp expect one


ok 57 - blank at EOF with --whitespace=fix (1)

expecting success: 
	{ echo a; echo b; echo c; } >one &&
	git add one &&
	{ echo a; echo c; } >expect &&
	{ cat expect; echo; echo; } >one &&
	git diff -- one >patch &&

	git checkout one &&
	git apply --whitespace=fix patch &&
	test_cmp expect one


ok 58 - blank at EOF with --whitespace=fix (2)

expecting success: 
	{ echo a; echo b; echo; } >one &&
	git add one &&
	{ echo a; echo c; echo; } >expect &&
	{ cat expect; echo; echo; } >one &&
	git diff -- one >patch &&

	git checkout one &&
	git apply --whitespace=fix patch &&
	test_cmp expect one


ok 59 - blank at EOF with --whitespace=fix (3)

expecting success: 
	{ echo a; echo b; echo; echo; echo; echo; echo; echo d; } >one &&
	git add one &&
	{ echo a; echo c; echo; echo; echo; echo; echo; echo; echo d; } >expect &&
	cp expect one &&
	git diff -- one >patch &&

	git checkout one &&
	git apply --whitespace=fix patch &&
	test_cmp expect one


ok 60 - blank at end of hunk, not at EOF with --whitespace=fix

expecting success: 
	{ echo a; echo b; echo c; } >one &&
	git add one &&
	echo >>one &&
	cat one >expect &&
	git diff -- one >patch &&

	git checkout one &&
	git apply --whitespace=warn patch 2>error &&
	test_cmp expect one &&
	grep "new blank line at EOF" error
patch:5: new blank line at EOF.

ok 61 - blank at EOF with --whitespace=warn

expecting success: 
	{ echo a; echo b; echo c; } >one &&
	git add one &&
	cat one >expect &&
	echo >>one &&
	git diff -- one >patch &&

	git checkout one &&
	test_must_fail git apply --whitespace=error patch 2>error &&
	test_cmp expect one &&
	grep "new blank line at EOF" error

patch:5: new blank line at EOF.

ok 62 - blank at EOF with --whitespace=error

expecting success: 
	{ echo a; echo b; echo c; } >one &&
	git add one &&
	echo "   " >>one &&
	cat one >expect &&
	git diff -- one >patch &&

	git checkout one &&
	git apply --whitespace=warn patch 2>error &&
	test_cmp expect one &&
	grep "new blank line at EOF" error
patch:5: new blank line at EOF.

ok 63 - blank but not empty at EOF

expecting success: 
	{ echo; echo; echo; echo; } >one &&
	git add one &&
	{ echo b; } >>one &&
	git diff -- one >patch &&

	git checkout one &&
	{ echo a; echo; } >one &&
	cp one expect &&
	test_must_fail git apply --whitespace=fix patch &&
	test_cmp one expect &&
	test_must_fail git apply --ignore-space-change --whitespace=fix patch &&
	test_cmp one expect


ok 64 - applying beyond EOF requires one non-blank context line

expecting success: 
	for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16; do
		echo; echo; echo; echo;
	done >one &&
	git add one &&
	echo a >>one &&
	git diff -- one >patch &&

	>one &&
	test_must_fail git apply --whitespace=fix patch &&
	test_must_fail git apply --ignore-space-change --whitespace=fix patch


ok 65 - tons of blanks at EOF should not apply

expecting success: 
	echo a >one &&
	echo >>one &&
	git add one &&
	echo b >>one &&
	cp one expect &&
	git diff -- one >patch &&
	echo a >one &&
	cp one saved-one &&
	test_must_fail git apply patch &&
	git apply --whitespace=fix patch &&
	test_cmp one expect &&
	mv saved-one one &&
	git apply --ignore-space-change --whitespace=fix patch &&
	test_cmp one expect

ok 66 - missing blank line at end with --whitespace=fix

expecting success: 
	{ echo a; echo; echo b; echo c; } >one &&
	cp one no-blank-lines &&
	{ echo; echo; } >>one &&
	git add one &&
	echo d >>one &&
	cp one expect &&
	echo >>one &&
	git diff -- one >patch &&
	cp no-blank-lines one &&
	test_must_fail git apply patch &&
	git apply --whitespace=fix patch &&
	test_cmp one expect &&
	mv no-blank-lines one &&
	test_must_fail git apply patch &&
	git apply --ignore-space-change --whitespace=fix patch &&
	test_cmp one expect


ok 67 - two missing blank lines at end with --whitespace=fix

expecting success: 
	{ echo a; echo; } >one &&
	git add one &&
	{ echo b; echo a; echo; } >one &&
	cp one expect &&
	git diff -- one >patch &&
	echo a >one &&
	test_must_fail git apply patch &&
	git apply --whitespace=fix patch &&
	test_cmp one expect
ok 68 - missing blank line at end, insert before end, --whitespace=fix
expecting success: 
	{ echo a; echo b; echo c; } >one &&
	cp one no-blank-lines &&
	for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16; do
		echo; echo; echo; echo;
	done >>one &&
	git add one &&
	echo a >one &&
	cp one expect &&
	git diff -- one >patch &&
	cp no-blank-lines one &&
	test_must_fail git apply patch &&
	git apply --whitespace=fix patch &&
	test_cmp one expect &&
	mv no-blank-lines one &&
	git apply --ignore-space-change --whitespace=fix patch &&
	test_cmp one expect
ok 69 - shrink file with tons of missing blanks at end of file

expecting success: 
	{ echo a; echo b; } >one &&
	git add one &&
	{ echo c; echo d; } >>one &&
	git diff -- one >patch &&

	echo a >one &&
	test_must_fail git apply patch &&
	test_must_fail git apply --whitespace=fix patch &&
	test_must_fail git apply --ignore-space-change --whitespace=fix patch

ok 70 - missing blanks at EOF must only match blank lines

expecting success: 
	git add one &&
	echo d >>one &&
	git diff -- one >patch &&
	{ echo a; echo b; echo c; } >one &&
	cp one expect &&
	{ echo; echo d; } >>expect &&
	git add one &&

	git apply --whitespace=fix patch &&
	test_cmp one expect


ok 71 - missing blank line should match context line with spaces

expecting success: 
	git add one &&
	echo d >>one &&
	cp one expect &&
	git diff -- one >patch &&
	{ echo a; echo b; echo c; } >one &&
	git add one &&

	git checkout-index -f one &&
	git apply --ignore-space-change --whitespace=fix patch &&
	test_cmp one expect
ok 72 - same, but with the --ignore-space-option

expecting success: 
	git config core.whitespace cr-at-eol &&
	printf "a
" >one &&
	printf "b
" >>one &&
	printf "c
" >>one &&
	cp one save-one &&
	printf "                 
" >>one &&
	git add one &&
	printf "d
" >>one &&
	cp one expect &&
	git diff -- one >patch &&
	mv save-one one &&

	git apply --ignore-space-change --whitespace=fix patch &&
	test_cmp one expect

ok 73 - same, but with CR-LF line endings && cr-at-eol set

expecting success: 
	git config --unset core.whitespace &&
	printf "a
" >one &&
	printf "b
" >>one &&
	printf "c
" >>one &&
	cp one save-one &&
	printf "                 
" >>one &&
	git add one &&
	cp one expect &&
	printf "d
" >>one &&
	git diff -- one >patch &&
	mv save-one one &&
	echo d >>expect &&

	git apply --ignore-space-change --whitespace=fix patch &&
	test_cmp one expect

ok 74 - same, but with CR-LF line endings && cr-at-eol unset

# passed all 74 test(s)
1..74
