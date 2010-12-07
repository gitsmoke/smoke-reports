not ok - 1 no commits: projects_list (implicit)
#	gitweb_run
not ok - 2 no commits: projects_index
#	gitweb_run "a=project_index"
not ok - 3 no commits: .git summary (implicit)
#	gitweb_run "p=.git"
not ok - 4 no commits: .git commit (implicit HEAD)
#	gitweb_run "p=.git;a=commit"
not ok - 5 no commits: .git commitdiff (implicit HEAD)
#	gitweb_run "p=.git;a=commitdiff"
not ok - 6 no commits: .git tree (implicit HEAD)
#	gitweb_run "p=.git;a=tree"
not ok - 7 no commits: .git heads
#	gitweb_run "p=.git;a=heads"
not ok - 8 no commits: .git tags
#	gitweb_run "p=.git;a=tags"
ok 9 - Make initial commit
not ok - 10 projects_list (implicit)
#	gitweb_run
not ok - 11 projects_index
#	gitweb_run "a=project_index"
not ok - 12 .git summary (implicit)
#	gitweb_run "p=.git"
not ok - 13 .git commit (implicit HEAD)
#	gitweb_run "p=.git;a=commit"
not ok - 14 .git commitdiff (implicit HEAD, root commit)
#	gitweb_run "p=.git;a=commitdiff"
not ok - 15 .git commitdiff_plain (implicit HEAD, root commit)
#	gitweb_run "p=.git;a=commitdiff_plain"
not ok - 16 .git commit (HEAD)
#	gitweb_run "p=.git;a=commit;h=HEAD"
not ok - 17 .git tree (implicit HEAD)
#	gitweb_run "p=.git;a=tree"
not ok - 18 .git blob (file)
#	gitweb_run "p=.git;a=blob;f=file"
not ok - 19 .git blob_plain (file)
#	gitweb_run "p=.git;a=blob_plain;f=file"
not ok - 20 .git commit (non-existent)
#	gitweb_run "p=.git;a=commit;h=non-existent"
not ok - 21 .git commitdiff (non-existent)
#	gitweb_run "p=.git;a=commitdiff;h=non-existent"
not ok - 22 .git commitdiff (non-existent vs HEAD)
#	gitweb_run "p=.git;a=commitdiff;hp=non-existent;h=HEAD"
not ok - 23 .git tree (0000000000000000000000000000000000000000)
#	gitweb_run "p=.git;a=tree;h=0000000000000000000000000000000000000000"
not ok - 24 .git tag (0000000000000000000000000000000000000000)
#	gitweb_run "p=.git;a=tag;h=0000000000000000000000000000000000000000"
not ok - 25 .git blob (non-existent)
#	gitweb_run "p=.git;a=blob;f=non-existent"
not ok - 26 .git blob_plain (non-existent)
#	gitweb_run "p=.git;a=blob_plain;f=non-existent"
not ok - 27 commitdiff(0): root
#	gitweb_run "p=.git;a=commitdiff"
not ok - 28 commitdiff(0): file added
#	echo "New file" > new_file &&
#		 git add new_file &&
#		 git commit -a -m "File added." &&
#		 gitweb_run "p=.git;a=commitdiff"
not ok - 29 commitdiff(0): mode change
#	test_chmod +x new_file &&
#		 git commit -a -m "Mode changed." &&
#		 gitweb_run "p=.git;a=commitdiff"
not ok - 30 commitdiff(0): file renamed
#	git mv new_file renamed_file &&
#		 git commit -a -m "File renamed." &&
#		 gitweb_run "p=.git;a=commitdiff"
not ok - 31 commitdiff(0): file to symlink
#	rm renamed_file &&
#		 ln -s file renamed_file &&
#		 git commit -a -m "File to symlink." &&
#		 gitweb_run "p=.git;a=commitdiff"
not ok - 32 commitdiff(0): file deleted
#	git rm renamed_file &&
#		 rm -f renamed_file &&
#		 git commit -a -m "File removed." &&
#		 gitweb_run "p=.git;a=commitdiff"
not ok - 33 commitdiff(0): file copied / new file
#	cp file file2 &&
#		 git add file2 &&
#		 git commit -a -m "File copied." &&
#		 gitweb_run "p=.git;a=commitdiff"
not ok - 34 commitdiff(0): mode change and modified
#	echo "New line" >> file2 &&
#		 test_chmod +x file2 &&
#		 git commit -a -m "Mode change and modification." &&
#		 gitweb_run "p=.git;a=commitdiff"
not ok - 35 commitdiff(0): renamed and modified
#	cat >file2<<EOF &&
#	Dominus regit me,
#	et nihil mihi deerit.
#	In loco pascuae ibi me collocavit,
#	super aquam refectionis educavit me;
#	animam meam convertit,
#	deduxit me super semitas jusitiae,
#	propter nomen suum.
#	EOF
#		 git commit -a -m "File added." &&
#		 git mv file2 file3 &&
#		 echo "Propter nomen suum." >> file3 &&
#		 git commit -a -m "File rename and modification." &&
#		 gitweb_run "p=.git;a=commitdiff"
not ok - 36 commitdiff(0): renamed, mode change and modified
#	git mv file3 file2 &&
#		 echo "Propter nomen suum." >> file2 &&
#		 test_chmod +x file2 &&
#		 git commit -a -m "File rename, mode change and modification." &&
#		 gitweb_run "p=.git;a=commitdiff"
ok 37 - setup typechange commits
not ok - 38 commitdiff(2): file renamed from foo to foo/baz
#	gitweb_run "p=.git;a=commitdiff;hp=initial;h=foo-baz-renamed-from-foo"
not ok - 39 commitdiff(2): file renamed from foo/baz to foo
#	gitweb_run "p=.git;a=commitdiff;hp=foo-baz-renamed-from-foo;h=initial"
not ok - 40 commitdiff(2): directory becomes file
#	gitweb_run "p=.git;a=commitdiff;hp=foo-becomes-a-directory;h=initial"
not ok - 41 commitdiff(2): file becomes directory
#	gitweb_run "p=.git;a=commitdiff;hp=initial;h=foo-becomes-a-directory"
not ok - 42 commitdiff(2): file becomes symlink
#	gitweb_run "p=.git;a=commitdiff;hp=initial;h=foo-symlinked-to-bar"
not ok - 43 commitdiff(2): symlink becomes file
#	gitweb_run "p=.git;a=commitdiff;hp=foo-symlinked-to-bar;h=foo-back-to-file"
not ok - 44 commitdiff(2): symlink becomes directory
#	gitweb_run "p=.git;a=commitdiff;hp=foo-symlinked-to-bar;h=foo-becomes-a-directory"
not ok - 45 commitdiff(2): directory becomes symlink
#	gitweb_run "p=.git;a=commitdiff;hp=foo-becomes-a-directory;h=foo-symlinked-to-bar"
ok 46 - Create a merge
not ok - 47 commit(0): merge commit
#	gitweb_run "p=.git;a=commit"
not ok - 48 commitdiff(0): merge commit
#	gitweb_run "p=.git;a=commitdiff"
ok 49 - Prepare large commit
not ok - 50 commit(1): large commit
#	gitweb_run "p=.git;a=commit;h=b"
not ok - 51 commitdiff(1): large commit
#	gitweb_run "p=.git;a=commitdiff;h=b"
not ok - 52 tags: list of different types of tags
#	git checkout master &&
#		 git tag -a -m "Tag commit object" tag-commit HEAD &&
#		 git tag -a -m "" tag-commit-nomessage HEAD &&
#		 git tag -a -m "Tag tag object" tag-tag tag-commit &&
#		 git tag -a -m "Tag tree object" tag-tree HEAD^{tree} &&
#		 git tag -a -m "Tag blob object" tag-blob HEAD:file &&
#		 git tag lightweight/tag-commit HEAD &&
#		 git tag lightweight/tag-tag tag-commit &&
#		 git tag lightweight/tag-tree HEAD^{tree} &&
#		 git tag lightweight/tag-blob HEAD:file &&
#		 gitweb_run "p=.git;a=tags"
not ok - 53 tag: Tag to commit object
#	gitweb_run "p=.git;a=tag;h=tag-commit"
not ok - 54 tag: on lightweight tag (invalid)
#	gitweb_run "p=.git;a=tag;h=lightweight/tag-commit"
not ok - 55 logs: log (implicit HEAD)
#	gitweb_run "p=.git;a=log"
not ok - 56 logs: shortlog (implicit HEAD)
#	gitweb_run "p=.git;a=shortlog"
not ok - 57 logs: history (implicit HEAD, file)
#	gitweb_run "p=.git;a=history;f=file"
not ok - 58 logs: history (implicit HEAD, non-existent file)
#	gitweb_run "p=.git;a=history;f=non-existent"
not ok - 59 logs: history (implicit HEAD, deleted file)
#	git checkout master &&
#		 echo "to be deleted" > deleted_file &&
#		 git add deleted_file &&
#		 git commit -m "Add file to be deleted" &&
#		 git rm deleted_file &&
#		 git commit -m "Delete file" &&
#		 gitweb_run "p=.git;a=history;f=deleted_file"
not ok - 60 path_info: project
#	gitweb_run "" "/.git"
not ok - 61 path_info: project/branch
#	gitweb_run "" "/.git/b"
not ok - 62 path_info: project/branch:file
#	gitweb_run "" "/.git/master:file"
not ok - 63 path_info: project/branch:dir/
#	gitweb_run "" "/.git/master:foo/"
not ok - 64 path_info: project/branch:file (non-existent)
#	gitweb_run "" "/.git/master:non-existent"
not ok - 65 path_info: project/branch:dir/ (non-existent)
#	gitweb_run "" "/.git/master:non-existent/"
not ok - 66 path_info: project/branch:/file
#	gitweb_run "" "/.git/master:/file"
not ok - 67 path_info: project/:/file (implicit HEAD)
#	gitweb_run "" "/.git/:/file"
not ok - 68 path_info: project/:/ (implicit HEAD, top tree)
#	gitweb_run "" "/.git/:/"
not ok - 69 feeds: OPML
#	gitweb_run "a=opml"
not ok - 70 feed: RSS
#	gitweb_run "p=.git;a=rss"
not ok - 71 feed: Atom
#	gitweb_run "p=.git;a=atom"
not ok - 72 encode(commit): utf8
#	. "$TEST_DIRECTORY"/t3901-utf8.txt &&
#		 echo "UTF-8" >> file &&
#		 git add file &&
#		 git commit -F "$TEST_DIRECTORY"/t3900/1-UTF-8.txt &&
#		 gitweb_run "p=.git;a=commit"
not ok - 73 encode(commit): iso-8859-1
#	. "$TEST_DIRECTORY"/t3901-8859-1.txt &&
#		 echo "ISO-8859-1" >> file &&
#		 git add file &&
#		 git config i18n.commitencoding ISO-8859-1 &&
#		 git commit -F "$TEST_DIRECTORY"/t3900/ISO8859-1.txt &&
#		 git config --unset i18n.commitencoding &&
#		 gitweb_run "p=.git;a=commit"
not ok - 74 encode(log): utf-8 and iso-8859-1
#	gitweb_run "p=.git;a=log"
not ok - 75 opt: log --no-merges
#	gitweb_run "p=.git;a=log;opt=--no-merges"
not ok - 76 opt: atom --no-merges
#	gitweb_run "p=.git;a=log;opt=--no-merges"
not ok - 77 opt: "file" history --no-merges
#	gitweb_run "p=.git;a=history;f=file;opt=--no-merges"
not ok - 78 opt: log --no-such-option (invalid option)
#	gitweb_run "p=.git;a=log;opt=--no-such-option"
not ok - 79 opt: tree --no-merges (invalid option for action)
#	gitweb_run "p=.git;a=tree;opt=--no-merges"
not ok - 80 URL: no project URLs, no base URL
#	gitweb_run "p=.git;a=summary"
not ok - 81 URL: project URLs via gitweb.url
#	git config --add gitweb.url git://example.com/git/trash.git &&
#	        git config --add gitweb.url http://example.com/git/trash.git &&
#	        gitweb_run "p=.git;a=summary"
not ok - 82 URL: project URLs via cloneurl file
#	gitweb_run "p=.git;a=summary"
not ok - 83 config override: projects list (implicit)
#	gitweb_run
not ok - 84 config override: tree view, features not overridden in repo config
#	gitweb_run "p=.git;a=tree"
not ok - 85 config override: tree view, features disabled in repo config
#	git config gitweb.blame no &&
#		 git config gitweb.snapshot none &&
#		 git config gitweb.avatar gravatar &&
#		 gitweb_run "p=.git;a=tree"
not ok - 86 config override: tree view, features enabled in repo config (1)
#	git config gitweb.blame yes &&
#		 git config gitweb.snapshot "zip,tgz, tbz2" &&
#		 gitweb_run "p=.git;a=tree"
not ok - 87 config override: tree view, features enabled in repo config (2)
#	gitweb_run "p=.git;a=tree"
not ok - 88 README.html with non-ASCII characters (utf-8)
#	echo "<b>UTF-8 example:</b><br />" > .git/README.html &&
#		 cat "$TEST_DIRECTORY"/t3900/1-UTF-8.txt >> .git/README.html &&
#		 gitweb_run "p=.git;a=summary"
Skipping syntax highlighting test, because 'highlight' was not found
ok 89 # skip syntax highlighting (no highlight, unknown syntax) (missing HIGHLIGHT)
ok 90 # skip syntax highlighting (highlighted, shell script) (missing HIGHLIGHT)
ok 91 - enable caching
not ok - 92 caching enabled (project summary, first run, generating cache)
#	gitweb_run "p=.git;a=summary"
not ok - 93 caching enabled (project summary, second run, cached version)
#	gitweb_run "p=.git;a=summary"
not ok - 94 caching enabled (non-existent commit, non-cache error page)
#	gitweb_run "p=.git;a=commit;h=non-existent"
# failed 87 among 94 test(s)
1..94
