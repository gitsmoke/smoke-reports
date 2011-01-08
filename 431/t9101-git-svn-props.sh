Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9101-git-svn-props/.git/
expecting success: svn co "$svnrepo" test_wc
A    test_wc/empty_lf
A    test_wc/lf
A    test_wc/empty_cr
A    test_wc/kw.c
A    test_wc/ne_lf
A    test_wc/cr
A    test_wc/empty_crlf
A    test_wc/crlf
A    test_wc/ne_cr
A    test_wc/ne_crlf
A    test_wc/empty
Checked out revision 1.

ok 1 - checkout working copy from svn

expecting success: 
	(
		cd test_wc &&
		echo Greetings >> kw.c &&
		poke kw.c &&
		svn_cmd commit -m "Not yet an Id" &&
		echo Hello world >> kw.c &&
		poke kw.c &&
		svn_cmd commit -m "Modified file, but still not yet an Id" &&
		svn_cmd propset svn:keywords Id kw.c &&
		poke kw.c &&
		svn_cmd commit -m "Propset Id"
	)
Sending        kw.c
Transmitting file data .
Committed revision 2.
Sending        kw.c
Transmitting file data .
Committed revision 3.
property 'svn:keywords' set on 'kw.c'
Sending        kw.c

Committed revision 4.

ok 2 - setup some commits to svn

expecting success: git svn init "$svnrepo"

ok 3 - initialize git svn

expecting success: git svn fetch
	A	empty_lf
	A	lf
	A	empty_cr
	A	kw.c
	A	ne_lf
	A	cr
	A	empty_crlf
	A	crlf
	A	ne_cr
	A	ne_crlf
	A	empty
r1 = e69b159a4f50ef4357081a5cd9b9aa0d19bba733 (refs/remotes/git-svn)
	M	kw.c
r2 = 65441f79a8b3cf3531edcfcd915af822c88a73ee (refs/remotes/git-svn)
	M	kw.c
r3 = 34a0125147e3c2ec36d3131911215c2a40816533 (refs/remotes/git-svn)
	M	kw.c
r4 = 944197310ed5234d70e00ef7de2f5b60c2bc719c (refs/remotes/git-svn)

ok 4 - fetch revisions from svn

expecting success: git checkout -b mybranch ${remotes_git_svn} &&
	echo Hi again >> kw.c &&
	git commit -a -m "test keywords ignoring" &&
	git svn set-tree ${remotes_git_svn}..mybranch &&
	git pull . ${remotes_git_svn}
[mybranch 6700025] test keywords ignoring
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
	M	kw.c
	M	kw.c
r5 = 6497c0e7862ae9a3997e0c88b75852683110b825 (refs/remotes/git-svn)
Done committing 1 revisions to SVN
Updating 6700025..6497c0e
Fast-forward

ok 5 - test svn:keywords ignoring

expecting success: test '/* $Id$ */' = '/* $Id$ */'

ok 6 - raw $Id$ found in kw.c

expecting success: 
	(
		cd test_wc &&
		svn_cmd propset svn:eol-style CR empty &&
		svn_cmd propset svn:eol-style CR crlf &&
		svn_cmd propset svn:eol-style CR ne_crlf &&
		svn_cmd commit -m "propset CR on crlf files"
	 )

property 'svn:eol-style' set on 'empty'
property 'svn:eol-style' set on 'crlf'
property 'svn:eol-style' set on 'ne_crlf'
Sending        crlf
Sending        empty
Sending        ne_crlf
Transmitting file data ..
Committed revision 6.

ok 7 - propset CR on crlf files

expecting success: git svn fetch &&
	 git pull . ${remotes_git_svn} &&
	 svn_cmd co "$svnrepo" new_wc
	M	crlf
	M	ne_crlf
	M	empty
r6 = d8d3a4b5a05d80b3ae6c06f0015446c76377e94b (refs/remotes/git-svn)
Updating 6497c0e..d8d3a4b
Fast-forward
 crlf    |    3 +--
 ne_crlf |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)
A    new_wc/empty_lf
A    new_wc/lf
A    new_wc/empty_cr
A    new_wc/kw.c
A    new_wc/ne_lf
A    new_wc/cr
A    new_wc/empty_crlf
A    new_wc/crlf
A    new_wc/ne_cr
A    new_wc/ne_crlf
A    new_wc/empty
Checked out revision 6.
ok 8 - fetch and pull latest from svn and checkout a new wc
expecting success: cmp crlf new_wc/crlf

ok 9 - Comparing crlf

expecting success: cmp ne_crlf new_wc/ne_crlf

ok 10 - Comparing ne_crlf
expecting success: cmp lf new_wc/lf
ok 11 - Comparing lf
expecting success: cmp ne_lf new_wc/ne_lf

ok 12 - Comparing ne_lf

expecting success: cmp cr new_wc/cr

ok 13 - Comparing cr

expecting success: cmp ne_cr new_wc/ne_cr

ok 14 - Comparing ne_cr

expecting success: cmp empty_cr new_wc/empty_cr

ok 15 - Comparing empty_cr

expecting success: cmp empty_lf new_wc/empty_lf

ok 16 - Comparing empty_lf

expecting success: cmp empty new_wc/empty

ok 17 - Comparing empty

expecting success: cmp empty_crlf new_wc/empty_crlf

ok 18 - Comparing empty_crlf

expecting success: svn_cmd propset svn:eol-style CRLF cr &&
	 svn_cmd propset svn:eol-style CRLF ne_cr &&
	 svn_cmd propset svn:keywords Id cr &&
	 svn_cmd propset svn:keywords Id ne_cr &&
	 svn_cmd commit -m "propset CRLF on cr files"
property 'svn:eol-style' set on 'cr'
property 'svn:eol-style' set on 'ne_cr'
property 'svn:keywords' set on 'cr'
property 'svn:keywords' set on 'ne_cr'
Sending        cr
Sending        ne_cr
Transmitting file data ..
Committed revision 7.

ok 19 - Set CRLF on cr files

expecting success: git svn fetch && git pull . ${remotes_git_svn}
	M	cr
	M	ne_cr
r7 = 44934151baf66478502c172a0dc169bc1343be0b (refs/remotes/git-svn)
Updating d8d3a4b..4493415
Fast-forward
 cr    |    4 +++-
 ne_cr |    4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

ok 20 - fetch and pull latest from svn
expecting success: test 'f39bd49beefa1dff130e47c7a24777dfc3657ba2' = 'f39bd49beefa1dff130e47c7a24777dfc3657ba2'

ok 21 - CRLF + $Id$
expecting success: test '41c5e77993f143876592cd19b5e9a6f6d2e4ff8a' = '41c5e77993f143876592cd19b5e9a6f6d2e4ff8a'
ok 22 - CRLF + $Id$ (no newline)
expecting success: 
	(
		cd test_wc &&
		mkdir -p deeply/nested/directory &&
		touch deeply/nested/directory/.keep &&
		svn_cmd add deeply &&
		svn_cmd up &&
		svn_cmd propset -R svn:ignore '
no-such-file*
' .
		svn_cmd commit -m 'propset svn:ignore'
	) &&
	git svn show-ignore > show-ignore.got &&
	cmp show-ignore.expect show-ignore.got
A         deeply
A         deeply/nested
A         deeply/nested/directory
A         deeply/nested/directory/.keep
U    kw.c
Updated to revision 7.
property 'svn:ignore' set on '.'
property 'svn:ignore' set on 'deeply'
property 'svn:ignore' set on 'deeply/nested'
property 'svn:ignore' set on 'deeply/nested/directory'
Sending        .
Adding         deeply
Adding         deeply/nested
Adding         deeply/nested/directory
Adding         deeply/nested/directory/.keep
Transmitting file data .
Committed revision 8.

ok 23 - test show-ignore

expecting success: 
	git svn fetch && git pull . remotes/git-svn &&
	git svn create-ignore &&
	cmp ./.gitignore create-ignore.expect &&
	cmp ./deeply/.gitignore create-ignore.expect &&
	cmp ./deeply/nested/.gitignore create-ignore.expect &&
	cmp ./deeply/nested/directory/.gitignore create-ignore.expect &&
	git ls-files -s | grep gitignore | cmp - create-ignore-index.expect
	
	A	deeply/nested/directory/.keep
r8 = 5781b507e1486d6b27f9575fcbd0756f4f9a9e39 (refs/remotes/git-svn)
Updating 4493415..5781b50
Fast-forward
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 deeply/nested/directory/.keep
ok 24 - test create-ignore
expecting success: 
	git svn propget svn:ignore . | cmp - prop.expect &&
	cd deeply &&
	git svn propget svn:ignore . | cmp - ../prop.expect &&
	git svn propget svn:entry:committed-rev nested/directory/.keep 	  | cmp - ../prop2.expect &&
	git svn propget svn:ignore .. | cmp - ../prop.expect &&
	git svn propget svn:ignore nested/ | cmp - ../prop.expect &&
	git svn propget svn:ignore ./nested | cmp - ../prop.expect &&
	git svn propget svn:ignore .././deeply/nested | cmp - ../prop.expect
	

ok 25 - test propget

expecting success: 
	git svn proplist . | cmp - prop.expect &&
	git svn proplist nested/directory/.keep | cmp - prop2.expect
	

ok 26 - test proplist

# passed all 26 test(s)
1..26
