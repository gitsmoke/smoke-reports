Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
expecting success: 
	reinit_git &&
	echo "SVN-fs-dump-format-version: 2" >input &&
	test-svn-fe input >stream &&
	git fast-import <stream
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
ok 1 - empty dump
expecting success: 
	reinit_git &&
	echo "SVN-fs-dump-format-version: 4" >v4.dump &&
	test_must_fail test-svn-fe v4.dump >stream &&
	test_cmp empty stream
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
ok 2 - v4 dumps not supported
checking known breakage: 
	reinit_git &&
	printf "rev <nobody, nobody@local>: %s
" "" "" >expect &&
	cat >emptyrev.dump <<-\EOF &&
	SVN-fs-dump-format-version: 3

	Revision-number: 1
	Prop-content-length: 0
	Content-length: 0

	Revision-number: 2
	Prop-content-length: 0
	Content-length: 0

	EOF
	test-svn-fe emptyrev.dump >stream &&
	git fast-import <stream &&
	git log -p --format="rev <%an, %ae>: %s" HEAD >actual &&
	test_cmp expect actual
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
not ok 3 - empty revision # TODO known breakage
expecting success: 
	reinit_git &&
	printf "rev <nobody, nobody@local>: %s
" "" "" >expect &&
	cat >emptyprop.dump <<-\EOF &&
	SVN-fs-dump-format-version: 3

	Revision-number: 1
	Prop-content-length: 10
	Content-length: 10

	PROPS-END

	Revision-number: 2
	Prop-content-length: 10
	Content-length: 10

	PROPS-END
	EOF
	test-svn-fe emptyprop.dump >stream &&
	git fast-import <stream &&
	git log -p --format="rev <%an, %ae>: %s" HEAD >actual &&
	test_cmp expect actual
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
progress Imported commit 1.
progress Imported commit 2.
ok 4 - empty properties

expecting success: 
	reinit_git &&
	echo "<author@example.com, author@example.com@local>" >expect.author &&
	cat >message <<-\EOF &&
	A concise summary of the change

	A detailed description of the change, why it is needed, what
	was broken and why applying this is the best course of action.

	* file.c
	    Details pertaining to an individual file.
	EOF
	{
		properties \
			svn:author author@example.com \
			svn:log "$(cat message)" &&
		echo PROPS-END
	} >props &&
	{
		echo "SVN-fs-dump-format-version: 3" &&
		echo &&
		echo "Revision-number: 1" &&
		echo Prop-content-length: $(wc -c <props) &&
		echo Content-length: $(wc -c <props) &&
		echo &&
		cat props
	} >log.dump &&
	test-svn-fe log.dump >stream &&
	git fast-import <stream &&
	git log -p --format="%B" HEAD >actual.log &&
	git log --format="<%an, %ae>" >actual.author &&
	test_cmp message actual.log &&
	test_cmp expect.author actual.author
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
progress Imported commit 1.
ok 5 - author name and commit message

expecting success: 
	reinit_git &&
	echo author >expect &&
	cat >extraprop.dump <<-\EOF &&
	SVN-fs-dump-format-version: 3

	Revision-number: 1
	Prop-content-length: 56
	Content-length: 56

	K 8
	nonsense
	V 1
	y
	K 10
	svn:author
	V 6
	author
	PROPS-END
	EOF
	test-svn-fe extraprop.dump >stream &&
	git fast-import <stream &&
	git log -p --format=%an HEAD >actual &&
	test_cmp expect actual
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
progress Imported commit 1.
ok 6 - unsupported properties are ignored
checking known breakage: 
	echo author@example.com >expect.author &&
	echo 1999-01-01 >expect.date &&
	echo file >expect.files &&
	reinit_git &&
	{
		properties \
			svn:author author@example.com \
			svn:date "1999-01-01T00:01:002.000000Z" \
			svn:log "add empty file" &&
		echo PROPS-END
	} >props &&
	{
		cat <<-EOF &&
		SVN-fs-dump-format-version: 3

		Revision-number: 1
		EOF
		echo Prop-content-length: $(wc -c <props) &&
		echo Content-length: $(wc -c <props) &&
		echo &&
		cat props &&
		cat <<-\EOF

		Node-path: empty-file
		Node-kind: file
		Node-action: add
		Content-length: 0

		EOF
	} >emptyfile.dump &&
	test-svn-fe emptyfile.dump >stream &&
	git fast-import <stream &&
	git log --format=%an HEAD >actual.author &&
	git log --date=short --format=%ad HEAD >actual.date &&
	git ls-tree -r --name-only HEAD >actual.files &&
	test_cmp expect.author actual.author &&
	test_cmp expect.date actual.date &&
	test_cmp expect.files actual.files &&
	git checkout HEAD empty-file &&
	test_cmp empty file
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/

not ok 7 - timestamp and empty file # TODO known breakage
expecting success: 
	reinit_git &&
	printf "%s
" directory/file1 directory/file2 >expect.files &&
	echo hi >hi &&
	echo hello >hello &&
	{
		properties \
			svn:author author@example.com \
			svn:date "1999-02-01T00:01:002.000000Z" \
			svn:log "add directory with some files in it" &&
		echo PROPS-END
	} >props &&
	{
		cat <<-EOF &&
		SVN-fs-dump-format-version: 3

		Revision-number: 1
		EOF
		echo Prop-content-length: $(wc -c <props) &&
		echo Content-length: $(wc -c <props) &&
		echo &&
		cat props &&
		cat <<-\EOF &&

		Node-path: directory
		Node-kind: dir
		Node-action: add
		Prop-content-length: 10
		Content-length: 10

		PROPS-END

		Node-path: directory/file1
		Node-kind: file
		Node-action: add
		EOF
		text_no_props hello &&
		cat <<-\EOF &&
		Node-path: directory/file2
		Node-kind: file
		Node-action: add
		EOF
		text_no_props hi
	} >directory.dump &&
	test-svn-fe directory.dump >stream &&
	git fast-import <stream &&

	git ls-tree -r --name-only HEAD >actual.files &&
	git checkout HEAD directory &&
	test_cmp expect.files actual.files &&
	test_cmp hello directory/file1 &&
	test_cmp hi directory/file2
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
progress Imported commit 1.
ok 8 - directory with files
expecting success: 
	cat >inaction.dump <<-\EOF &&
	SVN-fs-dump-format-version: 3

	Revision-number: 1
	Prop-content-length: 10
	Content-length: 10

	PROPS-END

	Node-path: directory
	Node-kind: dir
	Prop-content-length: 10
	Content-length: 10

	PROPS-END
	EOF
	test_must_fail test-svn-fe inaction.dump

ok 9 - node without action

expecting success: 
	cat >textless.dump <<-\EOF &&
	SVN-fs-dump-format-version: 3

	Revision-number: 1
	Prop-content-length: 10
	Content-length: 10

	PROPS-END

	Node-path: textless
	Node-kind: file
	Node-action: add
	Prop-content-length: 10
	Content-length: 10

	PROPS-END
	EOF
	test_must_fail test-svn-fe textless.dump
ok 10 - action: add node without text
checking known breakage: 
	reinit_git &&
	cat >expect <<-\EOF &&
	OBJID
	:120000 100644 OBJID OBJID T	greeting
	OBJID
	:100644 120000 OBJID OBJID T	greeting
	OBJID
	:000000 100644 OBJID OBJID A	greeting
	EOF
	echo "link hello" >expect.blob &&
	echo hello >hello &&
	cat >filemode.dump <<-\EOF &&
	SVN-fs-dump-format-version: 3

	Revision-number: 1
	Prop-content-length: 10
	Content-length: 10

	PROPS-END
	Node-path: greeting
	Node-kind: file
	Node-action: add
	Prop-content-length: 10
	Text-content-length: 11
	Content-length: 21

	PROPS-END
	link hello

	Revision-number: 2
	Prop-content-length: 10
	Content-length: 10

	PROPS-END

	Node-path: greeting
	Node-kind: file
	Node-action: change
	Prop-content-length: 33
	Content-length: 33

	K 11
	svn:special
	V 1
	*
	PROPS-END

	Revision-number: 3
	Prop-content-length: 10
	Content-length: 10

	PROPS-END

	Node-path: greeting
	Node-kind: file
	Node-action: change
	Prop-content-length: 10
	Content-length: 10

	PROPS-END
	EOF
	test-svn-fe filemode.dump >stream &&
	git fast-import <stream &&
	{
		git rev-list HEAD |
		git diff-tree --root --stdin |
		sed "s/$_x40/OBJID/g"
	} >actual &&
	git show HEAD:greeting >actual.blob &&
	git show HEAD^:greeting >actual.target &&
	test_cmp expect actual &&
	test_cmp expect.blob actual.blob &&
	test_cmp hello actual.target
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
progress Imported commit 1.
progress Imported commit 2.
progress Imported commit 3.
--- hello	2011-01-09 04:09:27.000000000 +0000
+++ actual.target	2011-01-09 04:09:27.000000000 +0000
@@ -1 +1 @@
-hello
+link hello

not ok 11 - change file mode but keep old content # TODO known breakage

expecting success: 
	reinit_git &&
	cat >expect <<-\EOF &&
	OBJID
	:120000 100644 OBJID OBJID T	greeting
	OBJID
	:100644 120000 OBJID OBJID T	greeting
	OBJID
	:000000 100644 OBJID OBJID A	greeting
	EOF
	echo "link hello" >expect.blob &&
	echo hello >hello &&
	cat >filemode.dump <<-\EOF &&
	SVN-fs-dump-format-version: 3

	Revision-number: 1
	Prop-content-length: 10
	Content-length: 10

	PROPS-END

	Node-path: greeting
	Node-kind: file
	Node-action: add
	Prop-content-length: 10
	Text-content-length: 11
	Content-length: 21

	PROPS-END
	link hello

	Revision-number: 2
	Prop-content-length: 10
	Content-length: 10

	PROPS-END

	Node-path: greeting
	Node-kind: file
	Node-action: change
	Prop-content-length: 33
	Text-content-length: 11
	Content-length: 44

	K 11
	svn:special
	V 1
	*
	PROPS-END
	link hello

	Revision-number: 3
	Prop-content-length: 10
	Content-length: 10

	PROPS-END

	Node-path: greeting
	Node-kind: file
	Node-action: change
	Prop-content-length: 10
	Text-content-length: 11
	Content-length: 21

	PROPS-END
	link hello
	EOF
	test-svn-fe filemode.dump >stream &&
	git fast-import <stream &&
	{
		git rev-list HEAD |
		git diff-tree --root --stdin |
		sed "s/$_x40/OBJID/g"
	} >actual &&
	git show HEAD:greeting >actual.blob &&
	git show HEAD^:greeting >actual.target &&
	test_cmp expect actual &&
	test_cmp expect.blob actual.blob &&
	test_cmp hello actual.target
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
progress Imported commit 1.
progress Imported commit 2.
progress Imported commit 3.
ok 12 - change file mode and reiterate content
expecting success: 
	{
		# (old) h + (inline) ello + (old) 

		printf "SVNQ%b%b%s" "Q" "Q„" "ello" |
		q_to_nul
	} >delta &&
	{
		properties \
			svn:author author@example.com \
			svn:date "1999-01-05T00:01:002.000000Z" \
			svn:log "add greeting" &&
		echo PROPS-END
	} >props &&
	{
		properties \
			svn:author author@example.com \
			svn:date "1999-01-06T00:01:002.000000Z" \
			svn:log "change it" &&
		echo PROPS-END
	} >props2 &&
	{
		echo SVN-fs-dump-format-version: 3 &&
		echo &&
		echo Revision-number: 1 &&
		echo Prop-content-length: $(wc -c <props) &&
		echo Content-length: $(wc -c <props) &&
		echo &&
		cat props &&
		cat <<-\EOF &&

		Node-path: hello
		Node-kind: file
		Node-action: add
		Prop-content-length: 10
		Text-content-length: 3
		Content-length: 13

		PROPS-END
		hi

		EOF
		echo Revision-number: 2 &&
		echo Prop-content-length: $(wc -c <props2) &&
		echo Content-length: $(wc -c <props2) &&
		echo &&
		cat props2 &&
		cat <<-\EOF &&

		Node-path: hello
		Node-kind: file
		Node-action: change
		Text-delta: true
		Prop-content-length: 10
		EOF
		echo Text-content-length: $(wc -c <delta) &&
		echo Content-length: $((10 + $(wc -c <delta))) &&
		echo &&
		echo PROPS-END &&
		cat delta
	} >delta.dump &&
	test_must_fail test-svn-fe delta.dump

blob
mark :1
data 3
hi

commit refs/heads/master
committer author@example.com <author@example.com@local> 915494462 +0000
data 12
add greeting
M 100644 :1 hello

progress Imported commit 1.


ok 13 - deltas not supported

expecting success: 
	reinit_git &&
	cat >expect <<-\EOF &&
	OBJID
	:100755 100644 OBJID OBJID M	script.sh
	EOF
	{
		properties \
			svn:author author@example.com \
			svn:date "1999-03-06T00:01:002.000000Z" \
			svn:log "make an executable, or chmod -x it" &&
		echo PROPS-END
	} >revprops &&
	{
		echo SVN-fs-dump-format-version: 3 &&
		echo &&
		echo Revision-number: 1 &&
		echo Prop-content-length: $(wc -c <revprops) &&
		echo Content-length: $(wc -c <revprops) &&
		echo &&
		cat revprops &&
		echo &&
		cat <<-\EOF &&
		Node-path: script.sh
		Node-kind: file
		Node-action: add
		Text-content-length: 0
		Prop-content-length: 39
		Content-length: 39

		K 14
		svn:executable
		V 4
		true
		PROPS-END

		EOF
		echo Revision-number: 2 &&
		echo Prop-content-length: $(wc -c <revprops) &&
		echo Content-length: $(wc -c <revprops) &&
		echo &&
		cat revprops &&
		echo &&
		cat <<-\EOF
		Node-path: script.sh
		Node-kind: file
		Node-action: change
		Prop-delta: true
		Prop-content-length: 30
		Content-length: 30

		D 14
		svn:executable
		PROPS-END
		EOF
	} >propdelta.dump &&
	test-svn-fe propdelta.dump >stream &&
	git fast-import <stream &&
	{
		git rev-list HEAD |
		git diff-tree --stdin |
		sed "s/$_x40/OBJID/g"
	} >actual &&
	test_cmp expect actual

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
progress Imported commit 1.
progress Imported commit 2.
ok 14 - property deltas supported
expecting success: 
	reinit_git &&
	cat <<-\EOF >expect &&
	OBJID
	OBJID
	:000000 100644 OBJID OBJID A	greeting
	EOF
	sed -e "s/X$//" <<-\EOF >changeroot.dump &&
	SVN-fs-dump-format-version: 3

	Revision-number: 1
	Prop-content-length: 10
	Content-length: 10

	PROPS-END

	Node-path: greeting
	Node-kind: file
	Node-action: add
	Text-content-length: 0
	Prop-content-length: 10
	Content-length: 10

	PROPS-END

	Revision-number: 2
	Prop-content-length: 10
	Content-length: 10

	PROPS-END

	Node-path: X
	Node-kind: dir
	Node-action: change
	Prop-delta: true
	Prop-content-length: 43
	Content-length: 43

	K 10
	svn:ignore
	V 11
	build-area

	PROPS-END
	EOF
	test-svn-fe changeroot.dump >stream &&
	git fast-import <stream &&
	{
		git rev-list HEAD |
		git diff-tree --root --always --stdin |
		sed "s/$_x40/OBJID/g"
	} >actual &&
	test_cmp expect actual
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
progress Imported commit 1.
progress Imported commit 2.
ok 15 - properties on /
expecting success: 
	reinit_git &&
	cat >expect <<-\EOF &&
	OBJID
	:120000 100644 OBJID OBJID T	test-file
	OBJID
	:100755 120000 OBJID OBJID T	test-file
	OBJID
	:000000 100755 OBJID OBJID A	test-file
	EOF
	cat >deleteprop.dump <<-\EOF &&
	SVN-fs-dump-format-version: 3

	Revision-number: 1
	Prop-content-length: 10
	Content-length: 10

	PROPS-END

	Node-path: test-file
	Node-kind: file
	Node-action: add
	Prop-delta: true
	Prop-content-length: 35
	Text-content-length: 17
	Content-length: 52

	K 14
	svn:executable
	V 0

	PROPS-END
	link testing 123

	Revision-number: 2
	Prop-content-length: 10
	Content-length: 10

	PROPS-END

	Node-path: test-file
	Node-kind: file
	Node-action: change
	Prop-delta: true
	Prop-content-length: 53
	Text-content-length: 17
	Content-length: 70

	K 11
	svn:special
	V 1
	*
	D 14
	svn:executable
	PROPS-END
	link testing 231

	Revision-number: 3
	Prop-content-length: 10
	Content-length: 10

	PROPS-END

	Node-path: test-file
	Node-kind: file
	Node-action: change
	Prop-delta: true
	Prop-content-length: 27
	Text-content-length: 17
	Content-length: 44

	D 11
	svn:special
	PROPS-END
	link testing 321
	EOF
	test-svn-fe deleteprop.dump >stream &&
	git fast-import <stream &&
	{
		git rev-list HEAD |
		git diff-tree --root --stdin |
		sed "s/$_x40/OBJID/g"
	} >actual &&
	test_cmp expect actual
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/.git/
progress Imported commit 1.
progress Imported commit 2.
progress Imported commit 3.
ok 16 - deltas for typechange

expecting success: 
	svnadmin create simple-svn &&
	svnadmin load simple-svn <"$TEST_DIRECTORY/t9135/svn.dump" &&
	svn_cmd export "file://$PWD/simple-svn" simple-svnco &&
	git init simple-git &&
	test-svn-fe "$TEST_DIRECTORY/t9135/svn.dump" >simple.fe &&
	(
		cd simple-git &&
		git fast-import <../simple.fe
	) &&
	(
		cd simple-svnco &&
		git init &&
		git add . &&
		git fetch ../simple-git master &&
		git diff --exit-code FETCH_HEAD
	)
<<< Started new transaction, based on original revision 1
     * adding path : branches ... done.
     * adding path : trunk ... done.

------- Committed revision 1 >>>
<<< Started new transaction, based on original revision 2
     * adding path : branches/branch-b ...COPIED... done.

------- Committed revision 2 >>>
<<< Started new transaction, based on original revision 3
     * adding path : branches/branch-b/b1 ... done.

------- Committed revision 3 >>>
<<< Started new transaction, based on original revision 4
     * adding path : branches/branch-c ...COPIED... done.

------- Committed revision 4 >>>

<<< Started new transaction, based on original revision 5
     * deleting path : branches/branch-c ... done.

------- Committed revision 5 >>>

<<< Started new transaction, based on original revision 6
     * adding path : branches/branch-c ...COPIED... done.

------- Committed revision 6 >>>

A    simple-svnco
A    simple-svnco/trunk
A    simple-svnco/branches
A    simple-svnco/branches/branch-b
A    simple-svnco/branches/branch-b/b1
A    simple-svnco/branches/branch-c
A    simple-svnco/branches/branch-c/b1
Exported revision 6.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/simple-git/.git/
progress Imported commit 1.
progress Imported commit 2.
progress Imported commit 3.
progress Imported commit 4.
progress Imported commit 5.
progress Imported commit 6.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9010-svn-fe/simple-svnco/.git/
ok 17 - t9135/svn.dump

# still have 3 known breakage(s)
# passed all remaining 14 test(s)
1..17
