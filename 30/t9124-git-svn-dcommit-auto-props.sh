ok 1 - initialize git svn
ok 2 - enable auto-props config
ok 3 - add files matching auto-props
ok 4 - disable auto-props config
ok 5 - add files matching disabled auto-props
not ok - 6 check resulting svn repository
#	
#	(
#		mkdir work &&
#		cd work &&
#		svn_cmd co "$svnrepo" &&
#		cd svnrepo &&
#	
#		# Check properties from first commit.
#		test "x$(svn_cmd propget svn:executable exec1.sh)" = "x*" &&
#		test "x$(svn_cmd propget svn:mime-type exec1.sh)" = \
#		     "xapplication/x-shellscript" &&
#		test "x$(svn_cmd propget svn:mime-type hello.txt)" = "xtext/plain" &&
#		test "x$(svn_cmd propget svn:eol-style hello.txt)" = "xnative" &&
#		test "x$(svn_cmd propget svn:mime-type bar)" = "x" &&
#	
#		# Check properties from second commit.
#		test "x$(svn_cmd propget svn:executable exec2.sh)" = "x*" &&
#		test "x$(svn_cmd propget svn:mime-type exec2.sh)" = "x" &&
#		test "x$(svn_cmd propget svn:mime-type world.txt)" = "x" &&
#		test "x$(svn_cmd propget svn:eol-style world.txt)" = "x" &&
#		test "x$(svn_cmd propget svn:mime-type zot)" = "x"
#	)
#	
ok 7 - check renamed file
# failed 1 among 7 test(s)
1..7
