ok 1 - setup
ok 2 - attribute test
not ok - 3 core.attributesfile
#	
#		attr_check global unspecified &&
#		git config core.attributesfile "$HOME/global-gitattributes" &&
#		attr_check global global &&
#		git config core.attributesfile "~/global-gitattributes" &&
#		attr_check global global &&
#		echo "global test=precedence" >> .gitattributes &&
#		attr_check global precedence
#	
ok 4 - attribute test: read paths from stdin
ok 5 - root subdir attribute test
ok 6 - setup bare
ok 7 - bare repository: check that .gitattribute is ignored
ok 8 - bare repository: test info/attributes
# failed 1 among 8 test(s)
1..8
