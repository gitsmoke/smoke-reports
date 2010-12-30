Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9131-git-svn-empty-symlink/.git/
expecting success: 
	svnadmin load "$rawsvnrepo" <<EOF
SVN-fs-dump-format-version: 2

UUID: 60780f9a-7df5-43b4-83ab-60e2c0673ef7

Revision-number: 0
Prop-content-length: 56
Content-length: 56

K 8
svn:date
V 27
2008-11-26T07:17:27.590577Z
PROPS-END

Revision-number: 1
Prop-content-length: 111
Content-length: 111

K 7
svn:log
V 4
test
K 10
svn:author
V 12
normalperson
K 8
svn:date
V 27
2008-11-26T07:18:03.511836Z
PROPS-END

Node-path: bar
Node-kind: file
Node-action: add
Prop-content-length: 33
Text-content-length: 0
Text-content-md5: d41d8cd98f00b204e9800998ecf8427e
Content-length: 33

K 11
svn:special
V 1
*
PROPS-END

Revision-number: 2
Prop-content-length: 121
Content-length: 121

K 7
svn:log
V 13
bar => doink

K 10
svn:author
V 12
normalperson
K 8
svn:date
V 27
2008-11-27T03:55:31.601672Z
PROPS-END

Node-path: bar
Node-kind: file
Node-action: change
Text-content-length: 10
Text-content-md5: 92ca4fe7a9721f877f765c252dcd66c9
Content-length: 10

link doink

EOF

<<< Started new transaction, based on original revision 1
     * adding path : bar ... done.

------- Committed revision 1 >>>

<<< Started new transaction, based on original revision 2
     * editing path : bar ... done.

------- Committed revision 2 >>>


ok 1 - load svn dumpfile

expecting success: git svn clone -r1 "$svnrepo" x
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9131-git-svn-empty-symlink/x/.git/
	A	bar
r1 = dec2eb3e7d09e4035cece10e9c60363dffed5f29 (refs/remotes/git-svn)
ok 2 - clone using git svn
expecting success: (cd x && git config svn.brokenSymlinkWorkaround true)
ok 3 - enable broken symlink workaround
expecting success: test -f x/bar && ! test -s x/bar
ok 4 - "bar" is an empty file
expecting success: (cd x && git svn rebase)
	M	bar
r2 = 3837e39623e5ef269161f897e4e66bcb59687c3a (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.

ok 5 - get "bar" => symlink fix from svn

expecting success: test -h x/bar

ok 6 - "bar" becomes a symlink

expecting success: git svn clone -r1 "$svnrepo" y
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9131-git-svn-empty-symlink/y/.git/
	A	bar
r1 = dec2eb3e7d09e4035cece10e9c60363dffed5f29 (refs/remotes/git-svn)
ok 7 - clone using git svn

expecting success: (cd y && git config svn.brokenSymlinkWorkaround false)

ok 8 - disable broken symlink workaround
expecting success: test -f y/bar && ! test -s y/bar
ok 9 - "bar" is an empty file
expecting success: (cd y && git svn rebase)
	M	bar
r2 = 20f1441b7b637347845e7749fd8bd8b606ae08e2 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
ok 10 - get "bar" => symlink fix from svn
expecting success: ! test -L y/bar
ok 11 - "bar" does not become a symlink
expecting success: git svn clone -r1 "$svnrepo" z
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9131-git-svn-empty-symlink/z/.git/
	A	bar
r1 = dec2eb3e7d09e4035cece10e9c60363dffed5f29 (refs/remotes/git-svn)
ok 12 - clone using git svn

expecting success: test -f z/bar && ! test -s z/bar

ok 13 - "bar" is an empty file
expecting success: (cd z && git svn rebase)
	M	bar
r2 = 20f1441b7b637347845e7749fd8bd8b606ae08e2 (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Fast-forwarded master to refs/remotes/git-svn.
ok 14 - get "bar" => symlink fix from svn

expecting success: ! test -L z/bar

ok 15 - "bar" does not become a symlink
# passed all 15 test(s)
1..15
