ok 1 - setup
ok 2 - whitespace=nowarn, default rule
ok 3 - whitespace=warn, default rule
ok 4 - whitespace=error-all, default rule
ok 5 - whitespace=error-all, no rule
ok 6 - whitespace=error-all, no rule (attribute)
ok 7 - rule=-trailing,-space,-indent,-tab
ok 8 - rule=-trailing,-space,-indent,-tab,tabwidth=16
ok 9 - rule=-trailing,-space,-indent,-tab (attributes)
ok 10 - rule=-trailing,-space,-indent,-tab,tabwidth=16 (attributes)
ok 11 - rule=-trailing,-space,-indent,tab
ok 12 - rule=-trailing,-space,-indent,tab,tabwidth=16
ok 13 - rule=-trailing,-space,-indent,tab (attributes)
ok 14 - rule=-trailing,-space,-indent,tab,tabwidth=16 (attributes)
ok 15 - rule=-trailing,-space,indent,-tab
ok 16 - rule=-trailing,-space,indent,-tab,tabwidth=16
ok 17 - rule=-trailing,-space,indent,-tab (attributes)
ok 18 - rule=-trailing,-space,indent,-tab,tabwidth=16 (attributes)
ok 19 - rule=-trailing,space,-indent,-tab
ok 20 - rule=-trailing,space,-indent,-tab,tabwidth=16
ok 21 - rule=-trailing,space,-indent,-tab (attributes)
ok 22 - rule=-trailing,space,-indent,-tab,tabwidth=16 (attributes)
ok 23 - rule=-trailing,space,-indent,tab
ok 24 - rule=-trailing,space,-indent,tab,tabwidth=16
ok 25 - rule=-trailing,space,-indent,tab (attributes)
ok 26 - rule=-trailing,space,-indent,tab,tabwidth=16 (attributes)
ok 27 - rule=-trailing,space,indent,-tab
ok 28 - rule=-trailing,space,indent,-tab,tabwidth=16
ok 29 - rule=-trailing,space,indent,-tab (attributes)
ok 30 - rule=-trailing,space,indent,-tab,tabwidth=16 (attributes)
ok 31 - rule=trailing,-space,-indent,-tab
ok 32 - rule=trailing,-space,-indent,-tab,tabwidth=16
ok 33 - rule=trailing,-space,-indent,-tab (attributes)
ok 34 - rule=trailing,-space,-indent,-tab,tabwidth=16 (attributes)
ok 35 - rule=trailing,-space,-indent,tab
ok 36 - rule=trailing,-space,-indent,tab,tabwidth=16
ok 37 - rule=trailing,-space,-indent,tab (attributes)
ok 38 - rule=trailing,-space,-indent,tab,tabwidth=16 (attributes)
ok 39 - rule=trailing,-space,indent,-tab
ok 40 - rule=trailing,-space,indent,-tab,tabwidth=16
ok 41 - rule=trailing,-space,indent,-tab (attributes)
ok 42 - rule=trailing,-space,indent,-tab,tabwidth=16 (attributes)
ok 43 - rule=trailing,space,-indent,-tab
ok 44 - rule=trailing,space,-indent,-tab,tabwidth=16
ok 45 - rule=trailing,space,-indent,-tab (attributes)
ok 46 - rule=trailing,space,-indent,-tab,tabwidth=16 (attributes)
ok 47 - rule=trailing,space,-indent,tab
ok 48 - rule=trailing,space,-indent,tab,tabwidth=16
ok 49 - rule=trailing,space,-indent,tab (attributes)
ok 50 - rule=trailing,space,-indent,tab,tabwidth=16 (attributes)
ok 51 - rule=trailing,space,indent,-tab
ok 52 - rule=trailing,space,indent,-tab,tabwidth=16
ok 53 - rule=trailing,space,indent,-tab (attributes)
ok 54 - rule=trailing,space,indent,-tab,tabwidth=16 (attributes)
ok 55 - trailing whitespace & no newline at the end of file
ok 56 - blank at EOF with --whitespace=fix (1)
ok 57 - blank at EOF with --whitespace=fix (2)
ok 58 - blank at EOF with --whitespace=fix (3)
ok 59 - blank at end of hunk, not at EOF with --whitespace=fix
ok 60 - blank at EOF with --whitespace=warn
ok 61 - blank at EOF with --whitespace=error
ok 62 - blank but not empty at EOF
ok 63 - applying beyond EOF requires one non-blank context line
ok 64 - tons of blanks at EOF should not apply
ok 65 - missing blank line at end with --whitespace=fix
ok 66 - two missing blank lines at end with --whitespace=fix
ok 67 - missing blank line at end, insert before end, --whitespace=fix
ok 68 - shrink file with tons of missing blanks at end of file
ok 69 - missing blanks at EOF must only match blank lines
ok 70 - missing blank line should match context line with spaces
ok 71 - same, but with the --ignore-space-option
ok 72 - same, but with CR-LF line endings && cr-at-eol set
ok 73 - same, but with CR-LF line endings && cr-at-eol unset
# passed all 73 test(s)
1..73
