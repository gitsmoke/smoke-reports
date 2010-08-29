ok 1 - setup
ok 2 - default settings cause no changes
not ok - 3 crlf=true causes a CRLF file to be normalized
#	
#	
#		# Backwards compatibility check
#		rm -f .gitattributes tmp one two three &&
#		echo "two crlf" > .gitattributes &&
#		git read-tree --reset -u HEAD &&
#	
#		# Note, "normalized" means that git will normalize it if added
#		has_cr two &&
#		twodiff=`git diff two` &&
#		test -n "$twodiff"
#	
not ok - 4 text=true causes a CRLF file to be normalized
#	
#	
#		rm -f .gitattributes tmp one two three &&
#		echo "two text" > .gitattributes &&
#		git read-tree --reset -u HEAD &&
#	
#		# Note, "normalized" means that git will normalize it if added
#		has_cr two &&
#		twodiff=`git diff two` &&
#		test -n "$twodiff"
#	
not ok - 5 eol=crlf gives a normalized file CRLFs with autocrlf=false
#	
#	
#		rm -f .gitattributes tmp one two three &&
#		git config core.autocrlf false &&
#		echo "one eol=crlf" > .gitattributes &&
#		git read-tree --reset -u HEAD &&
#	
#		has_cr one &&
#		onediff=`git diff one` &&
#		test -z "$onediff"
#	
not ok - 6 eol=crlf gives a normalized file CRLFs with autocrlf=input
#	
#	
#		rm -f .gitattributes tmp one two three &&
#		git config core.autocrlf input &&
#		echo "one eol=crlf" > .gitattributes &&
#		git read-tree --reset -u HEAD &&
#	
#		has_cr one &&
#		onediff=`git diff one` &&
#		test -z "$onediff"
#	
not ok - 7 eol=lf gives a normalized file LFs with autocrlf=true
#	
#	
#		rm -f .gitattributes tmp one two three &&
#		git config core.autocrlf true &&
#		echo "one eol=lf" > .gitattributes &&
#		git read-tree --reset -u HEAD &&
#	
#		! has_cr one &&
#		onediff=`git diff one` &&
#		test -z "$onediff"
#	
ok 8 - autocrlf=true does not normalize CRLF files
not ok - 9 text=auto, autocrlf=true _does_ normalize CRLF files
#	
#	
#		rm -f .gitattributes tmp one two three &&
#		git config core.autocrlf true &&
#		echo "* text=auto" > .gitattributes &&
#		git read-tree --reset -u HEAD &&
#	
#		has_cr one &&
#		has_cr two &&
#		onediff=`git diff one` &&
#		twodiff=`git diff two` &&
#		threediff=`git diff three` &&
#		test -z "$onediff" -a -n "$twodiff" -a -z "$threediff"
#	
ok 10 - text=auto, autocrlf=true does not normalize binary files
not ok - 11 eol=crlf _does_ normalize binary files
#	
#	
#		rm -f .gitattributes tmp one two three &&
#		echo "three eol=crlf" > .gitattributes &&
#		git read-tree --reset -u HEAD &&
#	
#		has_cr three &&
#		threediff=`git diff three` &&
#		test -z "$threediff"
#	
# failed 7 among 11 test(s)
1..11
