Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4114-apply-typechange/.git/
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
	printf " " > foo &&
	git update-index foo &&
	git commit -m "foo becomes binary" &&
	git branch foo-becomes-binary &&
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
	
[master (root-commit) 492db7b] initial
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 bar
 create mode 100644 foo
[master 40c83e8] foo symlinked to bar
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
 rewrite foo (100%)
 mode change 100644 => 120000
[master d57037b] foo back to file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
 rewrite foo (100%)
 mode change 120000 => 100644
[master 0488e2a] foo becomes binary
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
[master bed9b4b] foo becomes a directory
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 0 deletions(-)
 delete mode 100644 foo
 create mode 100644 foo/baz
[master 06be9cd] foo/baz is the original foo
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup repository and commits
expecting success: 
	git checkout -f initial &&
	git diff-tree -M -p HEAD foo-baz-renamed-from-foo > patch &&
	git apply --index < patch
	
ok 2 - file renamed from foo to foo/baz

expecting success: 
	git checkout -f foo-baz-renamed-from-foo &&
	git diff-tree -M -p HEAD initial > patch &&
	git apply --index < patch
	
ok 3 - file renamed from foo/baz to foo

expecting success: 
	git checkout -f foo-becomes-a-directory &&
	git diff-tree -p HEAD initial > patch &&
	git apply --index < patch
	
ok 4 - directory becomes file

expecting success: 
	git checkout -f initial &&
	git diff-tree -p HEAD foo-becomes-a-directory > patch &&
	git apply --index < patch
	
ok 5 - file becomes directory

expecting success: 
	git checkout -f initial &&
	git diff-tree -p HEAD foo-symlinked-to-bar > patch &&
	git apply --index < patch
	
ok 6 - file becomes symlink

expecting success: 
	git checkout -f foo-symlinked-to-bar &&
	git diff-tree -p HEAD foo-back-to-file > patch &&
	git apply --index < patch
	
ok 7 - symlink becomes file

expecting success: 
	git checkout -f foo-becomes-binary &&
	git diff-tree -p --binary HEAD foo-symlinked-to-bar > patch &&
	git apply --index < patch
	
ok 8 - binary file becomes symlink

expecting success: 
	git checkout -f foo-symlinked-to-bar &&
	git diff-tree -p --binary HEAD foo-becomes-binary > patch &&
	git apply --index < patch
	
ok 9 - symlink becomes binary file

expecting success: 
	git checkout -f foo-symlinked-to-bar &&
	git diff-tree -p HEAD foo-becomes-a-directory > patch &&
	git apply --index < patch
	

ok 10 - symlink becomes directory

expecting success: 
	git checkout -f foo-becomes-a-directory &&
	git diff-tree -p HEAD foo-symlinked-to-bar > patch &&
	git apply --index < patch
	
ok 11 - directory becomes symlink

# passed all 11 test(s)
1..11
