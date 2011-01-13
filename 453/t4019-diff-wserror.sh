ok 1 - setup
ok 2 - default
ok 3 - default (attribute)
not ok - 4 default, tabwidth=10 (attribute)
#	
#	
#		git config core.whitespace "tabwidth=10" &&
#		echo "F whitespace" >.gitattributes &&
#		prepare_output &&
#	
#		grep Eight normal >/dev/null &&
#		grep HT error >/dev/null &&
#		grep With error >/dev/null &&
#		grep Return error >/dev/null &&
#		grep No normal >/dev/null
#	
#	
ok 5 - no check (attribute)
ok 6 - no check, tabwidth=10 (attribute), must be irrelevant
ok 7 - without -trail
ok 8 - without -trail (attribute)
ok 9 - without -space
ok 10 - without -space (attribute)
ok 11 - with indent-non-tab only
ok 12 - with indent-non-tab only (attribute)
not ok - 13 with indent-non-tab only, tabwidth=10
#	
#	
#		rm -f .gitattributes &&
#		git config core.whitespace indent,tabwidth=10,-trailing,-space &&
#		prepare_output &&
#	
#		grep Eight normal >/dev/null &&
#		grep HT normal >/dev/null &&
#		grep With normal >/dev/null &&
#		grep Return normal >/dev/null &&
#		grep No normal >/dev/null
#	
#	
not ok - 14 with indent-non-tab only, tabwidth=10 (attribute)
#	
#	
#		test_might_fail git config --unset core.whitespace &&
#		echo "F whitespace=indent,-trailing,-space,tabwidth=10" >.gitattributes &&
#		prepare_output &&
#	
#		grep Eight normal >/dev/null &&
#		grep HT normal >/dev/null &&
#		grep With normal >/dev/null &&
#		grep Return normal >/dev/null &&
#		grep No normal >/dev/null
#	
#	
ok 15 - with cr-at-eol
ok 16 - with cr-at-eol (attribute)
ok 17 - trailing empty lines (1)
ok 18 - trailing empty lines (2)
ok 19 - checkdiff shows correct line number for trailing blank lines
ok 20 - do not color trailing cr in context
ok 21 - color new trailing blank lines
# failed 3 among 21 test(s)
1..21
