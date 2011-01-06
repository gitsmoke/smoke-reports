Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9134-git-svn-ignore-paths/.git/
expecting success: 
	svn_cmd co "$svnrepo" s &&
	(
		cd s &&
		mkdir qqq www &&
		echo test_qqq > qqq/test_qqq.txt &&
		echo test_www > www/test_www.txt &&
		svn_cmd add qqq &&
		svn_cmd add www &&
		svn_cmd commit -m "create some files" &&
		svn_cmd up &&
		echo hi >> www/test_www.txt &&
		svn_cmd commit -m "modify www/test_www.txt" &&
		svn_cmd up
	)
Checked out revision 0.
A         qqq
A         qqq/test_qqq.txt
A         www
A         www/test_www.txt
Adding         qqq
Adding         qqq/test_qqq.txt
Adding         www
Adding         www/test_www.txt
Transmitting file data ..
Committed revision 1.
At revision 1.
Sending        www/test_www.txt
Transmitting file data .
Committed revision 2.
At revision 2.

ok 1 - setup test repository

expecting success: 
	git svn clone --ignore-paths="^www" "$svnrepo" g &&
	echo test_qqq > expect &&
	for i in g/*/*.txt; do cat $i >> expect2; done &&
	test_cmp expect expect2
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9134-git-svn-ignore-paths/g/.git/
	A	qqq/test_qqq.txt
r1 = 837ce58b62d48521c7b8e08024c259b9ffaf1721 (refs/remotes/git-svn)
r2 = bad72041c51fa33d65d3b736bb53ba0646502b7c (refs/remotes/git-svn)
ok 2 - clone an SVN repository with ignored www directory
expecting success: 
	git svn init "$svnrepo" c &&
	( cd c && git svn fetch --ignore-paths="^www" ) &&
	rm expect2 &&
	echo test_qqq > expect &&
	for i in c/*/*.txt; do cat $i >> expect2; done &&
	test_cmp expect expect2
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9134-git-svn-ignore-paths/c/.git/
	A	qqq/test_qqq.txt
r1 = 837ce58b62d48521c7b8e08024c259b9ffaf1721 (refs/remotes/git-svn)
r2 = bad72041c51fa33d65d3b736bb53ba0646502b7c (refs/remotes/git-svn)

ok 3 - init+fetch an SVN repository with ignored www directory

expecting success: 
	(
	    cd g &&
	    git config --get svn-remote.svn.ignore-paths | fgrep "www"
	)

^www

ok 4 - verify ignore-paths config saved by clone

expecting success: 
	(
		cd s &&
		echo b >> qqq/test_qqq.txt &&
		svn_cmd commit -m "SVN-side change outside of www" &&
		svn_cmd up &&
		svn_cmd log -v | fgrep "SVN-side change outside of www"
	)

Sending        qqq/test_qqq.txt
Transmitting file data .
Committed revision 3.
At revision 3.
SVN-side change outside of www

ok 5 - SVN-side change outside of www

expecting success: 
	(
		cd g &&
		git svn rebase &&
		printf "test_qqq
b
" > expect &&
		for i in */*.txt; do cat $i >> expect2; done &&
		test_cmp expect2 expect &&
		rm expect expect2
	)
	M	qqq/test_qqq.txt
r3 = 58055a7bb6200c067519a16ab6b263ae146b3a2e (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.

ok 6 - update git svn-cloned repo (config ignore)

expecting success: 
	(
		cd c &&
		git svn rebase --ignore-paths="^www" &&
		printf "test_qqq
b
" > expect &&
		for i in */*.txt; do cat $i >> expect2; done &&
		test_cmp expect2 expect &&
		rm expect expect2
	)
	M	qqq/test_qqq.txt
r3 = 58055a7bb6200c067519a16ab6b263ae146b3a2e (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.

ok 7 - update git svn-cloned repo (option ignore)

expecting success: 
	(
		cd s &&
		echo zaq >> www/test_www.txt
		svn_cmd commit -m "SVN-side change inside of www/test_www.txt" &&
		svn_cmd up &&
		svn_cmd log -v | fgrep "SVN-side change inside of www/test_www.txt"
	)

Sending        www/test_www.txt
Transmitting file data .
Committed revision 4.
At revision 4.
SVN-side change inside of www/test_www.txt

ok 8 - SVN-side change inside of ignored www

expecting success: 
	(
		cd g &&
		git svn rebase &&
		printf "test_qqq
b
" > expect &&
		for i in */*.txt; do cat $i >> expect2; done &&
		test_cmp expect2 expect &&
		rm expect expect2
	)
r4 = 306e56db7a2de712e6bd6d478118ef404751ddc1 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
ok 9 - update git svn-cloned repo (config ignore)
expecting success: 
	(
		cd c &&
		git svn rebase --ignore-paths="^www" &&
		printf "test_qqq
b
" > expect &&
		for i in */*.txt; do cat $i >> expect2; done &&
		test_cmp expect2 expect &&
		rm expect expect2
	)
r4 = 306e56db7a2de712e6bd6d478118ef404751ddc1 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.

ok 10 - update git svn-cloned repo (option ignore)

expecting success: 
	(
		cd s &&
		echo cvf >> www/test_www.txt
		echo ygg >> qqq/test_qqq.txt
		svn_cmd commit -m "SVN-side change in and out of ignored www" &&
		svn_cmd up &&
		svn_cmd log -v | fgrep "SVN-side change in and out of ignored www"
	)

Sending        qqq/test_qqq.txt
Sending        www/test_www.txt
Transmitting file data ..
Committed revision 5.
At revision 5.
SVN-side change in and out of ignored www

ok 11 - SVN-side change in and out of ignored www

expecting success: 
	(
		cd g &&
		git svn rebase &&
		printf "test_qqq
b
ygg
" > expect &&
		for i in */*.txt; do cat $i >> expect2; done &&
		test_cmp expect2 expect &&
		rm expect expect2
	)
	M	qqq/test_qqq.txt
r5 = 8f414f441c52e1568f201f5eaf67f4a56f2529f4 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
ok 12 - update git svn-cloned repo again (config ignore)

expecting success: 
	(
		cd c &&
		git svn rebase --ignore-paths="^www" &&
		printf "test_qqq
b
ygg
" > expect &&
		for i in */*.txt; do cat $i >> expect2; done &&
		test_cmp expect2 expect &&
		rm expect expect2
	)
	M	qqq/test_qqq.txt
r5 = 8f414f441c52e1568f201f5eaf67f4a56f2529f4 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.

ok 13 - update git svn-cloned repo again (option ignore)

# passed all 13 test(s)
1..13
