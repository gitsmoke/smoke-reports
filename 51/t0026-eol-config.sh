ok 1 - setup
ok 2 - eol=lf puts LFs in normalized file
not ok - 3 eol=crlf puts CRLFs in normalized file
#	
#	
#		rm -f .gitattributes tmp one two &&
#		git config core.eol crlf &&
#		git read-tree --reset -u HEAD &&
#	
#		has_cr one &&
#		! has_cr two &&
#		onediff=`git diff one` &&
#		twodiff=`git diff two` &&
#		test -z "$onediff" -a -z "$twodiff"
#	
ok 4 - autocrlf=true overrides eol=lf
ok 5 - autocrlf=true overrides unset eol
# failed 1 among 5 test(s)
1..5
