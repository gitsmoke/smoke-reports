Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7005-editor/.git/
expecting success: 

	vi=$(TERM=vt100 git var GIT_EDITOR) &&
	test -n "$vi"

ok 1 - determine default editor
expecting success: 

	msg="Hand-edited" &&
	test_commit "$msg" &&
	echo "$msg" >expect &&
	git show -s --format=%s > actual &&
	test_cmp actual expect
[master (root-commit) 2ddcc77] Hand-edited
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 Hand-edited.t

ok 2 - setup

expecting success: 

	if git commit --amend
	then
		echo "Oops?"
		false
	else
		: happy
	fi


ok 3 - dumb should error out when falling back on vi

expecting success: 

	EDITOR=./e-EDITOR.sh &&
	VISUAL=./e-VISUAL.sh &&
	export EDITOR VISUAL &&
	git commit --amend &&
	test "$(git show -s --format=%s)" = "Edited by EDITOR"
[master 7eecd8c] Edited by EDITOR
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 Hand-edited.t

ok 4 - dumb should prefer EDITOR to VISUAL
expecting success: 
		git --exec-path=. commit --amend &&
		git show -s --pretty=oneline |
		sed -e "s/^[0-9a-f]* //" >actual &&
		test_cmp actual expect
	
[master d4c0200] Edited by vi
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 Hand-edited.t

ok 5 - Using vi
expecting success: 
		git --exec-path=. commit --amend &&
		git show -s --pretty=oneline |
		sed -e "s/^[0-9a-f]* //" >actual &&
		test_cmp actual expect
	
[master 7eecd8c] Edited by EDITOR
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 Hand-edited.t

ok 6 - Using EDITOR

expecting success: 
		git --exec-path=. commit --amend &&
		git show -s --pretty=oneline |
		sed -e "s/^[0-9a-f]* //" >actual &&
		test_cmp actual expect
	
[master 2ee1d44] Edited by VISUAL
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 Hand-edited.t

ok 7 - Using VISUAL

expecting success: 
		git --exec-path=. commit --amend &&
		git show -s --pretty=oneline |
		sed -e "s/^[0-9a-f]* //" >actual &&
		test_cmp actual expect
	
[master 1c851bb] Edited by core_editor
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 Hand-edited.t

ok 8 - Using core_editor

expecting success: 
		git --exec-path=. commit --amend &&
		git show -s --pretty=oneline |
		sed -e "s/^[0-9a-f]* //" >actual &&
		test_cmp actual expect
	
[master 1bdd03b] Edited by GIT_EDITOR
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 Hand-edited.t

ok 9 - Using GIT_EDITOR

expecting success: 
		git --exec-path=. commit --amend &&
		git show -s --pretty=oneline |
		sed -e "s/^[0-9a-f]* //" >actual &&
		test_cmp actual expect
	
[master d4c0200] Edited by vi
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 Hand-edited.t

ok 10 - Using vi (override)

expecting success: 
		git --exec-path=. commit --amend &&
		git show -s --pretty=oneline |
		sed -e "s/^[0-9a-f]* //" >actual &&
		test_cmp actual expect
	
[master 7eecd8c] Edited by EDITOR
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 Hand-edited.t

ok 11 - Using EDITOR (override)

expecting success: 
		git --exec-path=. commit --amend &&
		git show -s --pretty=oneline |
		sed -e "s/^[0-9a-f]* //" >actual &&
		test_cmp actual expect
	
[master 2ee1d44] Edited by VISUAL
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 Hand-edited.t

ok 12 - Using VISUAL (override)

expecting success: 
		git --exec-path=. commit --amend &&
		git show -s --pretty=oneline |
		sed -e "s/^[0-9a-f]* //" >actual &&
		test_cmp actual expect
	
[master 1c851bb] Edited by core_editor
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 Hand-edited.t

ok 13 - Using core_editor (override)

expecting success: 
		git --exec-path=. commit --amend &&
		git show -s --pretty=oneline |
		sed -e "s/^[0-9a-f]* //" >actual &&
		test_cmp actual expect
	
[master 1bdd03b] Edited by GIT_EDITOR
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 Hand-edited.t

ok 14 - Using GIT_EDITOR (override)

expecting success: 

	chmod a+x "e space.sh" &&
	GIT_EDITOR="./e\ space.sh" git commit --amend &&
	test space = "$(git show -s --pretty=format:%s)"


[master 5d9c28a] space
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 Hand-edited.t

ok 15 - editor with a space

expecting success: 

	git config core.editor \"./e\ space.sh\" &&
	git commit --amend &&
	test space = "$(git show -s --pretty=format:%s)"


[master 5d9c28a] space
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 Hand-edited.t

ok 16 - core.editor with a space

# passed all 16 test(s)
1..16
