Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9150-svk-mergetickets/.git/
expecting success: 
	svnadmin load -q '/Users/trast/git-smoke/t/trash directory.t9150-svk-mergetickets/svnrepo' 	  < '/Users/trast/git-smoke/t/t9150/svk-merge.dump' &&
	git svn init --minimize-url -R svkmerge 	  --rewrite-root=http://svn.example.org 	  -T trunk -b branches 'file:///Users/trast/git-smoke/t/trash directory.t9150-svk-mergetickets/svnrepo' &&
	git svn fetch --all
	
r1 = b53c4e1a175ef8929e6e4aab56280e58a0de64a8 (refs/remotes/trunk)
	A	Makefile
r2 = 90f5e8071f5b77e35b17e90dec357e5c88edec7f (refs/remotes/trunk)
r3 = 79d9656e5bf2f11fc8ec4e9a20e1cea4615a760a (refs/remotes/left)
	M	Makefile
r4 = 86c978a5a9e208309128c39af65ada54e20c81ab (refs/remotes/left)
	M	Makefile
r5 = 242969651859ed31ccc35c99fab280c17353acd2 (refs/remotes/trunk)
	M	Makefile
r6 = 9682859fd9aa34c6573af588d38b75aaaeaa1918 (refs/remotes/left)
	M	Makefile
r7 = 8f305e8c49bb2f343a16bd4f0bd3386700698bf5 (refs/remotes/trunk)
ok 1 - load svk depot
expecting success: 
	[        2 -eq 2 ]
	

ok 2 - svk merges were represented coming in
# passed all 2 test(s)
1..2
