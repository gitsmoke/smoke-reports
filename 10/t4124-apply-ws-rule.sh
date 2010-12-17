ok 1 - setup
ok 2 - whitespace=nowarn, default rule
ok 3 - whitespace=warn, default rule
ok 4 - whitespace=error-all, default rule
ok 5 - whitespace=error-all, no rule
ok 6 - whitespace=error-all, no rule (attribute)
ok 7 - rule=-trailing,-space,-indent,-tab
ok 8 - rule=-trailing,-space,-indent,-tab (attributes)
ok 9 - rule=-trailing,-space,-indent,tab
ok 10 - rule=-trailing,-space,-indent,tab (attributes)
ok 11 - rule=-trailing,-space,indent,-tab
ok 12 - rule=-trailing,-space,indent,-tab (attributes)
ok 13 - rule=-trailing,space,-indent,-tab
ok 14 - rule=-trailing,space,-indent,-tab (attributes)
ok 15 - rule=-trailing,space,-indent,tab
ok 16 - rule=-trailing,space,-indent,tab (attributes)
ok 17 - rule=-trailing,space,indent,-tab
ok 18 - rule=-trailing,space,indent,-tab (attributes)
ok 19 - rule=trailing,-space,-indent,-tab
ok 20 - rule=trailing,-space,-indent,-tab (attributes)
ok 21 - rule=trailing,-space,-indent,tab
ok 22 - rule=trailing,-space,-indent,tab (attributes)
ok 23 - rule=trailing,-space,indent,-tab
ok 24 - rule=trailing,-space,indent,-tab (attributes)
ok 25 - rule=trailing,space,-indent,-tab
ok 26 - rule=trailing,space,-indent,-tab (attributes)
ok 27 - rule=trailing,space,-indent,tab
ok 28 - rule=trailing,space,-indent,tab (attributes)
ok 29 - rule=trailing,space,indent,-tab
ok 30 - rule=trailing,space,indent,-tab (attributes)
ok 31 - trailing whitespace & no newline at the end of file
ok 32 - blank at EOF with --whitespace=fix (1)
ok 33 - blank at EOF with --whitespace=fix (2)
ok 34 - blank at EOF with --whitespace=fix (3)
ok 35 - blank at end of hunk, not at EOF with --whitespace=fix
ok 36 - blank at EOF with --whitespace=warn
ok 37 - blank at EOF with --whitespace=error
ok 38 - blank but not empty at EOF
ok 39 - applying beyond EOF requires one non-blank context line
ok 40 - tons of blanks at EOF should not apply
ok 41 - missing blank line at end with --whitespace=fix
ok 42 - two missing blank lines at end with --whitespace=fix
ok 43 - missing blank line at end, insert before end, --whitespace=fix
ok 44 - shrink file with tons of missing blanks at end of file
ok 45 - missing blanks at EOF must only match blank lines
ok 46 - missing blank line should match context line with spaces
ok 47 - same, but with the --ignore-space-option
ok 48 - same, but with CR-LF line endings && cr-at-eol set
ok 49 - same, but with CR-LF line endings && cr-at-eol unset
# passed all 49 test(s)
1..49
