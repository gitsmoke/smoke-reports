ok 1 - setup
ok 2 - whitespace=nowarn, default rule
ok 3 - whitespace=warn, default rule
ok 4 - whitespace=error-all, default rule
ok 5 - whitespace=error-all, no rule
ok 6 - whitespace=error-all, no rule (attribute)
not ok - 7 spaces inserted by tab-in-indent
#	
#	
#		git config core.whitespace -trailing,-space,-indent,tab &&
#		rm -f .gitattributes &&
#		test_fix % &&
#		sed -e "s/_/ /g" -e "s/>/	/" <<-\EOF >expect &&
#			An_SP in an ordinary line>and a HT.
#			________A HT (%).
#			________A SP and a HT (@%).
#			_________A SP, a HT and a SP (@%).
#			_______Seven SP.
#			________Eight SP (#).
#			________Seven SP and a HT (@%).
#			________________Eight SP and a HT (@#%).
#			_________Seven SP, a HT and a SP (@%).
#			_________________Eight SP, a HT and a SP (@#%).
#			_______________Fifteen SP (#).
#			________________Fifteen SP and a HT (@#%).
#			________________Sixteen SP (#=).
#			________________________Sixteen SP and a HT (@#%=).
#			_____a__Five SP, a non WS, two SP.
#			A line with a (!) trailing SP_
#			A line with a (!) trailing HT>
#		EOF
#		test_cmp expect target
#	
#	
ok 8 - rule=-trailing,-space,-indent,-tab
ok 9 - rule=-trailing,-space,-indent,-tab,tabwidth=16
ok 10 - rule=-trailing,-space,-indent,-tab (attributes)
ok 11 - rule=-trailing,-space,-indent,-tab,tabwidth=16 (attributes)
ok 12 - rule=-trailing,-space,-indent,tab
ok 13 - rule=-trailing,-space,-indent,tab,tabwidth=16
ok 14 - rule=-trailing,-space,-indent,tab (attributes)
ok 15 - rule=-trailing,-space,-indent,tab,tabwidth=16 (attributes)
ok 16 - rule=-trailing,-space,indent,-tab
not ok - 17 rule=-trailing,-space,indent,-tab,tabwidth=16
#	
#						git config core.whitespace "$rule,tabwidth=16" &&
#						test_fix "$tt$ts$ti16$th"
#					
ok 18 - rule=-trailing,-space,indent,-tab (attributes)
not ok - 19 rule=-trailing,-space,indent,-tab,tabwidth=16 (attributes)
#	
#						echo "target whitespace=$rule,tabwidth=16" >.gitattributes &&
#						test_fix "$tt$ts$ti16$th"
#					
ok 20 - rule=-trailing,space,-indent,-tab
ok 21 - rule=-trailing,space,-indent,-tab,tabwidth=16
ok 22 - rule=-trailing,space,-indent,-tab (attributes)
ok 23 - rule=-trailing,space,-indent,-tab,tabwidth=16 (attributes)
ok 24 - rule=-trailing,space,-indent,tab
ok 25 - rule=-trailing,space,-indent,tab,tabwidth=16
ok 26 - rule=-trailing,space,-indent,tab (attributes)
ok 27 - rule=-trailing,space,-indent,tab,tabwidth=16 (attributes)
ok 28 - rule=-trailing,space,indent,-tab
not ok - 29 rule=-trailing,space,indent,-tab,tabwidth=16
#	
#						git config core.whitespace "$rule,tabwidth=16" &&
#						test_fix "$tt$ts$ti16$th"
#					
ok 30 - rule=-trailing,space,indent,-tab (attributes)
not ok - 31 rule=-trailing,space,indent,-tab,tabwidth=16 (attributes)
#	
#						echo "target whitespace=$rule,tabwidth=16" >.gitattributes &&
#						test_fix "$tt$ts$ti16$th"
#					
ok 32 - rule=trailing,-space,-indent,-tab
ok 33 - rule=trailing,-space,-indent,-tab,tabwidth=16
ok 34 - rule=trailing,-space,-indent,-tab (attributes)
ok 35 - rule=trailing,-space,-indent,-tab,tabwidth=16 (attributes)
ok 36 - rule=trailing,-space,-indent,tab
ok 37 - rule=trailing,-space,-indent,tab,tabwidth=16
ok 38 - rule=trailing,-space,-indent,tab (attributes)
ok 39 - rule=trailing,-space,-indent,tab,tabwidth=16 (attributes)
ok 40 - rule=trailing,-space,indent,-tab
not ok - 41 rule=trailing,-space,indent,-tab,tabwidth=16
#	
#						git config core.whitespace "$rule,tabwidth=16" &&
#						test_fix "$tt$ts$ti16$th"
#					
ok 42 - rule=trailing,-space,indent,-tab (attributes)
not ok - 43 rule=trailing,-space,indent,-tab,tabwidth=16 (attributes)
#	
#						echo "target whitespace=$rule,tabwidth=16" >.gitattributes &&
#						test_fix "$tt$ts$ti16$th"
#					
ok 44 - rule=trailing,space,-indent,-tab
ok 45 - rule=trailing,space,-indent,-tab,tabwidth=16
ok 46 - rule=trailing,space,-indent,-tab (attributes)
ok 47 - rule=trailing,space,-indent,-tab,tabwidth=16 (attributes)
ok 48 - rule=trailing,space,-indent,tab
ok 49 - rule=trailing,space,-indent,tab,tabwidth=16
ok 50 - rule=trailing,space,-indent,tab (attributes)
ok 51 - rule=trailing,space,-indent,tab,tabwidth=16 (attributes)
ok 52 - rule=trailing,space,indent,-tab
not ok - 53 rule=trailing,space,indent,-tab,tabwidth=16
#	
#						git config core.whitespace "$rule,tabwidth=16" &&
#						test_fix "$tt$ts$ti16$th"
#					
ok 54 - rule=trailing,space,indent,-tab (attributes)
not ok - 55 rule=trailing,space,indent,-tab,tabwidth=16 (attributes)
#	
#						echo "target whitespace=$rule,tabwidth=16" >.gitattributes &&
#						test_fix "$tt$ts$ti16$th"
#					
ok 56 - trailing whitespace & no newline at the end of file
ok 57 - blank at EOF with --whitespace=fix (1)
ok 58 - blank at EOF with --whitespace=fix (2)
ok 59 - blank at EOF with --whitespace=fix (3)
ok 60 - blank at end of hunk, not at EOF with --whitespace=fix
ok 61 - blank at EOF with --whitespace=warn
ok 62 - blank at EOF with --whitespace=error
ok 63 - blank but not empty at EOF
ok 64 - applying beyond EOF requires one non-blank context line
ok 65 - tons of blanks at EOF should not apply
ok 66 - missing blank line at end with --whitespace=fix
ok 67 - two missing blank lines at end with --whitespace=fix
ok 68 - missing blank line at end, insert before end, --whitespace=fix
ok 69 - shrink file with tons of missing blanks at end of file
ok 70 - missing blanks at EOF must only match blank lines
ok 71 - missing blank line should match context line with spaces
ok 72 - same, but with the --ignore-space-option
ok 73 - same, but with CR-LF line endings && cr-at-eol set
ok 74 - same, but with CR-LF line endings && cr-at-eol unset
# failed 9 among 74 test(s)
1..74
