Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9500-gitweb-standalone-no-errors/.git/
expecting success: gitweb_run

ok 1 - no commits: projects_list (implicit)

expecting success: gitweb_run "a=project_index"

ok 2 - no commits: projects_index

expecting success: gitweb_run "p=.git"

ok 3 - no commits: .git summary (implicit)

expecting success: gitweb_run "p=.git;a=commit"

ok 4 - no commits: .git commit (implicit HEAD)

expecting success: gitweb_run "p=.git;a=commitdiff"

ok 5 - no commits: .git commitdiff (implicit HEAD)

expecting success: gitweb_run "p=.git;a=tree"

ok 6 - no commits: .git tree (implicit HEAD)

expecting success: gitweb_run "p=.git;a=heads"

ok 7 - no commits: .git heads

expecting success: gitweb_run "p=.git;a=tags"

ok 8 - no commits: .git tags

expecting success: echo "Not an empty file." > file &&
	 git add file &&
	 git commit -a -m "Initial commit." &&
	 git branch b
[master (root-commit) 8793827] Initial commit.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 9 - Make initial commit
expecting success: gitweb_run

ok 10 - projects_list (implicit)

expecting success: gitweb_run "a=project_index"

ok 11 - projects_index

expecting success: gitweb_run "p=.git"

ok 12 - .git summary (implicit)
expecting success: gitweb_run "p=.git;a=commit"
ok 13 - .git commit (implicit HEAD)
expecting success: gitweb_run "p=.git;a=commitdiff"
ok 14 - .git commitdiff (implicit HEAD, root commit)
expecting success: gitweb_run "p=.git;a=commitdiff_plain"

ok 15 - .git commitdiff_plain (implicit HEAD, root commit)

expecting success: gitweb_run "p=.git;a=commit;h=HEAD"

ok 16 - .git commit (HEAD)
expecting success: gitweb_run "p=.git;a=tree"
ok 17 - .git tree (implicit HEAD)
expecting success: gitweb_run "p=.git;a=blob;f=file"
ok 18 - .git blob (file)
expecting success: gitweb_run "p=.git;a=blob_plain;f=file"
ok 19 - .git blob_plain (file)
expecting success: gitweb_run "p=.git;a=commit;h=non-existent"
ok 20 - .git commit (non-existent)
expecting success: gitweb_run "p=.git;a=commitdiff;h=non-existent"
ok 21 - .git commitdiff (non-existent)
expecting success: gitweb_run "p=.git;a=commitdiff;hp=non-existent;h=HEAD"
ok 22 - .git commitdiff (non-existent vs HEAD)

expecting success: gitweb_run "p=.git;a=tree;h=0000000000000000000000000000000000000000"

ok 23 - .git tree (0000000000000000000000000000000000000000)
expecting success: gitweb_run "p=.git;a=tag;h=0000000000000000000000000000000000000000"
ok 24 - .git tag (0000000000000000000000000000000000000000)
expecting success: gitweb_run "p=.git;a=blob;f=non-existent"
ok 25 - .git blob (non-existent)
expecting success: gitweb_run "p=.git;a=blob_plain;f=non-existent"

ok 26 - .git blob_plain (non-existent)

expecting success: gitweb_run "p=.git;a=commitdiff"

ok 27 - commitdiff(0): root
expecting success: echo "New file" > new_file &&
	 git add new_file &&
	 git commit -a -m "File added." &&
	 gitweb_run "p=.git;a=commitdiff"
[master d13f1f9] File added.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 new_file

ok 28 - commitdiff(0): file added

expecting success: test_chmod +x new_file &&
	 git commit -a -m "Mode changed." &&
	 gitweb_run "p=.git;a=commitdiff"
[master 7418dae] Mode changed.
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 new_file

ok 29 - commitdiff(0): mode change

expecting success: git mv new_file renamed_file &&
	 git commit -a -m "File renamed." &&
	 gitweb_run "p=.git;a=commitdiff"
[master 2635774] File renamed.
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename new_file => renamed_file (100%)

ok 30 - commitdiff(0): file renamed

expecting success: rm renamed_file &&
	 ln -s file renamed_file &&
	 git commit -a -m "File to symlink." &&
	 gitweb_run "p=.git;a=commitdiff"
[master 06d1e78] File to symlink.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
 rewrite renamed_file (100%)
 mode change 100755 => 120000

ok 31 - commitdiff(0): file to symlink

expecting success: git rm renamed_file &&
	 rm -f renamed_file &&
	 git commit -a -m "File removed." &&
	 gitweb_run "p=.git;a=commitdiff"
rm 'renamed_file'
[master a3d716c] File removed.
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 120000 renamed_file

ok 32 - commitdiff(0): file deleted

expecting success: cp file file2 &&
	 git add file2 &&
	 git commit -a -m "File copied." &&
	 gitweb_run "p=.git;a=commitdiff"
[master 1498263] File copied.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2

ok 33 - commitdiff(0): file copied / new file

expecting success: echo "New line" >> file2 &&
	 test_chmod +x file2 &&
	 git commit -a -m "Mode change and modification." &&
	 gitweb_run "p=.git;a=commitdiff"
[master d558577] Mode change and modification.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 file2

ok 34 - commitdiff(0): mode change and modified

expecting success: cat >file2<<EOF &&
Dominus regit me,
et nihil mihi deerit.
In loco pascuae ibi me collocavit,
super aquam refectionis educavit me;
animam meam convertit,
deduxit me super semitas jusitiae,
propter nomen suum.
EOF
	 git commit -a -m "File added." &&
	 git mv file2 file3 &&
	 echo "Propter nomen suum." >> file3 &&
	 git commit -a -m "File rename and modification." &&
	 gitweb_run "p=.git;a=commitdiff"
[master e47cb88] File added.
 Author: A U Thor <author@example.com>
 1 files changed, 7 insertions(+), 2 deletions(-)
[master ba9f105] File rename and modification.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 rename file2 => file3 (90%)

ok 35 - commitdiff(0): renamed and modified

expecting success: git mv file3 file2 &&
	 echo "Propter nomen suum." >> file2 &&
	 test_chmod +x file2 &&
	 git commit -a -m "File rename, mode change and modification." &&
	 gitweb_run "p=.git;a=commitdiff"
[master 14921e8] File rename, mode change and modification.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 rename file3 => file2 (91%)

ok 36 - commitdiff(0): renamed, mode change and modified

expecting success: 
	echo "hello world" > foo &&
	echo "hi planet" > bar &&
	git update-index --add foo bar &&
	git commit -m initial &&
	git branch initial &&
	rm -f foo &&
	ln -s bar foo &&
	git update-index foo &&
	git commit -m "foo symlinked to bar" &&
	git branch foo-symlinked-to-bar &&
	rm -f foo &&
	echo "how far is the sun?" > foo &&
	git update-index foo &&
	git commit -m "foo back to file" &&
	git branch foo-back-to-file &&
	rm -f foo &&
	git update-index --remove foo &&
	mkdir foo &&
	echo "if only I knew" > foo/baz &&
	git update-index --add foo/baz &&
	git commit -m "foo becomes a directory" &&
	git branch "foo-becomes-a-directory" &&
	echo "hello world" > foo/baz &&
	git update-index foo/baz &&
	git commit -m "foo/baz is the original foo" &&
	git branch foo-baz-renamed-from-foo
	
[master 47b14a7] initial
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 bar
 create mode 100644 foo
[master 6888a82] foo symlinked to bar
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
 rewrite foo (100%)
 mode change 100644 => 120000
[master 2bfd423] foo back to file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
 rewrite foo (100%)
 mode change 120000 => 100644
[master 6a35b6e] foo becomes a directory
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 1 deletions(-)
 delete mode 100644 foo
 create mode 100644 foo/baz
[master 3009279] foo/baz is the original foo
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 37 - setup typechange commits

expecting success: gitweb_run "p=.git;a=commitdiff;hp=initial;h=foo-baz-renamed-from-foo"

ok 38 - commitdiff(2): file renamed from foo to foo/baz

expecting success: gitweb_run "p=.git;a=commitdiff;hp=foo-baz-renamed-from-foo;h=initial"

ok 39 - commitdiff(2): file renamed from foo/baz to foo

expecting success: gitweb_run "p=.git;a=commitdiff;hp=foo-becomes-a-directory;h=initial"

ok 40 - commitdiff(2): directory becomes file

expecting success: gitweb_run "p=.git;a=commitdiff;hp=initial;h=foo-becomes-a-directory"

ok 41 - commitdiff(2): file becomes directory

expecting success: gitweb_run "p=.git;a=commitdiff;hp=initial;h=foo-symlinked-to-bar"

ok 42 - commitdiff(2): file becomes symlink

expecting success: gitweb_run "p=.git;a=commitdiff;hp=foo-symlinked-to-bar;h=foo-back-to-file"

ok 43 - commitdiff(2): symlink becomes file

expecting success: gitweb_run "p=.git;a=commitdiff;hp=foo-symlinked-to-bar;h=foo-becomes-a-directory"

ok 44 - commitdiff(2): symlink becomes directory

expecting success: gitweb_run "p=.git;a=commitdiff;hp=foo-becomes-a-directory;h=foo-symlinked-to-bar"

ok 45 - commitdiff(2): directory becomes symlink

expecting success: git checkout b &&
	 echo "Branch" >> b &&
	 git add b &&
	 git commit -a -m "On branch" &&
	 git checkout master &&
	 git pull . b
[b 9d77d52] On branch
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 b
Merging:
3009279 foo/baz is the original foo
virtual 9d77d52a9a6ae7ca05ea34863feb88ebe5e2670c
found 1 common ancestor(s):
8793827 Initial commit.
Merge made by recursive.
 b |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 b

ok 46 - Create a merge

expecting success: gitweb_run "p=.git;a=commit"

ok 47 - commit(0): merge commit

expecting success: gitweb_run "p=.git;a=commitdiff"

ok 48 - commitdiff(0): merge commit

expecting success: git checkout b &&
	 echo "To be changed" > 01-change &&
	 echo "To be renamed" > 02-pure-rename-from &&
	 echo "To be deleted" > 03-delete &&
	 echo "To be renamed and changed" > 04-rename-from &&
	 echo "To have mode changed" > 05-mode-change &&
	 echo "File to symlink" > 06-file-or-symlink &&
	 echo "To be changed and have mode changed" > 07-change-mode-change	&&
	 git add 0* &&
	 git commit -a -m "Prepare large commit" &&
	 echo "Changed" > 01-change &&
	 git mv 02-pure-rename-from 02-pure-rename-to &&
	 git rm 03-delete && rm -f 03-delete &&
	 echo "A new file" > 03-new &&
	 git add 03-new &&
	 git mv 04-rename-from 04-rename-to &&
	 echo "Changed" >> 04-rename-to &&
	 test_chmod +x 05-mode-change &&
	 rm -f 06-file-or-symlink &&
	 if test_have_prereq SYMLINKS; then
		ln -s 01-change 06-file-or-symlink
	 else
		printf %s 01-change > 06-file-or-symlink
	 fi &&
	 echo "Changed and have mode changed" > 07-change-mode-change	&&
	 test_chmod +x 07-change-mode-change &&
	 git commit -a -m "Large commit" &&
	 git checkout master
[b 0d84ab1] Prepare large commit
 Author: A U Thor <author@example.com>
 7 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 01-change
 create mode 100644 02-pure-rename-from
 create mode 100644 03-delete
 create mode 100644 04-rename-from
 create mode 100644 05-mode-change
 create mode 100644 06-file-or-symlink
 create mode 100644 07-change-mode-change
rm '03-delete'
[b 8aef761] Large commit
 Author: A U Thor <author@example.com>
 7 files changed, 5 insertions(+), 4 deletions(-)
 rename 02-pure-rename-from => 02-pure-rename-to (100%)
 delete mode 100644 03-delete
 create mode 100644 03-new
 rename 04-rename-from => 04-rename-to (76%)
 mode change 100644 => 100755 05-mode-change
 rewrite 06-file-or-symlink (100%)
 mode change 100644 => 120000
 mode change 100644 => 100755 07-change-mode-change

ok 49 - Prepare large commit

expecting success: gitweb_run "p=.git;a=commit;h=b"

ok 50 - commit(1): large commit

expecting success: gitweb_run "p=.git;a=commitdiff;h=b"

ok 51 - commitdiff(1): large commit

expecting success: git checkout master &&
	 git tag -a -m "Tag commit object" tag-commit HEAD &&
	 git tag -a -m "" tag-commit-nomessage HEAD &&
	 git tag -a -m "Tag tag object" tag-tag tag-commit &&
	 git tag -a -m "Tag tree object" tag-tree HEAD^{tree} &&
	 git tag -a -m "Tag blob object" tag-blob HEAD:file &&
	 git tag lightweight/tag-commit HEAD &&
	 git tag lightweight/tag-tag tag-commit &&
	 git tag lightweight/tag-tree HEAD^{tree} &&
	 git tag lightweight/tag-blob HEAD:file &&
	 gitweb_run "p=.git;a=tags"

ok 52 - tags: list of different types of tags

expecting success: gitweb_run "p=.git;a=tag;h=tag-commit"

ok 53 - tag: Tag to commit object

expecting success: gitweb_run "p=.git;a=tag;h=lightweight/tag-commit"

ok 54 - tag: on lightweight tag (invalid)

expecting success: gitweb_run "p=.git;a=log"

ok 55 - logs: log (implicit HEAD)

expecting success: gitweb_run "p=.git;a=shortlog"

ok 56 - logs: shortlog (implicit HEAD)

expecting success: gitweb_run "p=.git;a=history;f=file"

ok 57 - logs: history (implicit HEAD, file)

expecting success: gitweb_run "p=.git;a=history;f=non-existent"

ok 58 - logs: history (implicit HEAD, non-existent file)

expecting success: git checkout master &&
	 echo "to be deleted" > deleted_file &&
	 git add deleted_file &&
	 git commit -m "Add file to be deleted" &&
	 git rm deleted_file &&
	 git commit -m "Delete file" &&
	 gitweb_run "p=.git;a=history;f=deleted_file"
[master fab69a3] Add file to be deleted
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 deleted_file
rm 'deleted_file'
[master 4d47474] Delete file
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 deleted_file

ok 59 - logs: history (implicit HEAD, deleted file)

expecting success: gitweb_run "" "/.git"

ok 60 - path_info: project

expecting success: gitweb_run "" "/.git/b"

ok 61 - path_info: project/branch

expecting success: gitweb_run "" "/.git/master:file"

ok 62 - path_info: project/branch:file

expecting success: gitweb_run "" "/.git/master:foo/"

ok 63 - path_info: project/branch:dir/

expecting success: gitweb_run "" "/.git/master:non-existent"

ok 64 - path_info: project/branch:file (non-existent)

expecting success: gitweb_run "" "/.git/master:non-existent/"

ok 65 - path_info: project/branch:dir/ (non-existent)

expecting success: gitweb_run "" "/.git/master:/file"

ok 66 - path_info: project/branch:/file

expecting success: gitweb_run "" "/.git/:/file"

ok 67 - path_info: project/:/file (implicit HEAD)

expecting success: gitweb_run "" "/.git/:/"

ok 68 - path_info: project/:/ (implicit HEAD, top tree)

expecting success: gitweb_run "a=opml"

ok 69 - feeds: OPML

expecting success: gitweb_run "p=.git;a=rss"

ok 70 - feed: RSS

expecting success: gitweb_run "p=.git;a=atom"

ok 71 - feed: Atom

expecting success: . "$TEST_DIRECTORY"/t3901-utf8.txt &&
	 echo "UTF-8" >> file &&
	 git add file &&
	 git commit -F "$TEST_DIRECTORY"/t3900/1-UTF-8.txt &&
	 gitweb_run "p=.git;a=commit"
[master cb32ce8] √Ñ√ã√ë√è√ñ
 Author: √Å√©√≠ √≥√∫ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 72 - encode(commit): utf8

expecting success: . "$TEST_DIRECTORY"/t3901-8859-1.txt &&
	 echo "ISO-8859-1" >> file &&
	 git add file &&
	 git config i18n.commitencoding ISO-8859-1 &&
	 git commit -F "$TEST_DIRECTORY"/t3900/ISO8859-1.txt &&
	 git config --unset i18n.commitencoding &&
	 gitweb_run "p=.git;a=commit"
[master ee8491f] ƒÀ—œ÷
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 73 - encode(commit): iso-8859-1

expecting success: gitweb_run "p=.git;a=log"

ok 74 - encode(log): utf-8 and iso-8859-1

expecting success: gitweb_run "p=.git;a=log;opt=--no-merges"

ok 75 - opt: log --no-merges

expecting success: gitweb_run "p=.git;a=log;opt=--no-merges"

ok 76 - opt: atom --no-merges

expecting success: gitweb_run "p=.git;a=history;f=file;opt=--no-merges"

ok 77 - opt: "file" history --no-merges

expecting success: gitweb_run "p=.git;a=log;opt=--no-such-option"

ok 78 - opt: log --no-such-option (invalid option)

expecting success: gitweb_run "p=.git;a=tree;opt=--no-merges"

ok 79 - opt: tree --no-merges (invalid option for action)

expecting success: gitweb_run "p=.git;a=summary"

ok 80 - URL: no project URLs, no base URL

expecting success: git config --add gitweb.url git://example.com/git/trash.git &&
        git config --add gitweb.url http://example.com/git/trash.git &&
        gitweb_run "p=.git;a=summary"

ok 81 - URL: project URLs via gitweb.url

expecting success: gitweb_run "p=.git;a=summary"

ok 82 - URL: project URLs via cloneurl file

expecting success: gitweb_run

ok 83 - config override: projects list (implicit)

expecting success: gitweb_run "p=.git;a=tree"

ok 84 - config override: tree view, features not overridden in repo config

expecting success: git config gitweb.blame no &&
	 git config gitweb.snapshot none &&
	 git config gitweb.avatar gravatar &&
	 gitweb_run "p=.git;a=tree"

ok 85 - config override: tree view, features disabled in repo config

expecting success: git config gitweb.blame yes &&
	 git config gitweb.snapshot "zip,tgz, tbz2" &&
	 gitweb_run "p=.git;a=tree"

ok 86 - config override: tree view, features enabled in repo config (1)

expecting success: gitweb_run "p=.git;a=tree"

ok 87 - config override: tree view, features enabled in repo config (2)

expecting success: echo "<b>UTF-8 example:</b><br />" > .git/README.html &&
	 cat "$TEST_DIRECTORY"/t3900/1-UTF-8.txt >> .git/README.html &&
	 gitweb_run "p=.git;a=summary"

ok 88 - README.html with non-ASCII characters (utf-8)

Skipping syntax highlighting test, because 'highlight' was not found
skipping test: syntax highlighting (no highlight, unknown syntax) git config gitweb.highlight yes &&
	 gitweb_run "p=.git;a=blob;f=file"
ok 89 # skip syntax highlighting (no highlight, unknown syntax) (missing HIGHLIGHT)

skipping test: syntax highlighting (highlighted, shell script) git config gitweb.highlight yes &&
	 echo "#!/usr/bin/sh" > test.sh &&
	 git add test.sh &&
	 git commit -m "Add test.sh" &&
	 gitweb_run "p=.git;a=blob;f=test.sh"
ok 90 # skip syntax highlighting (highlighted, shell script) (missing HIGHLIGHT)

# passed all 90 test(s)
1..90
