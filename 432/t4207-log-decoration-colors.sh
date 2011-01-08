Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4207-log-decoration-colors/.git/
expecting success: 
	git config diff.color.commit yellow &&
	git config color.decorate.branch green &&
	git config color.decorate.remoteBranch red &&
	git config color.decorate.tag "reverse bold yellow" &&
	git config color.decorate.stash magenta &&
	git config color.decorate.HEAD cyan &&

	c_reset=$(get_color reset) &&

	c_commit=$(get_color yellow) &&
	c_branch=$(get_color green) &&
	c_remoteBranch=$(get_color red) &&
	c_tag=$(get_color "reverse bold yellow") &&
	c_stash=$(get_color magenta) &&
	c_HEAD=$(get_color cyan) &&

	test_commit A &&
	git clone . other &&
	(
		cd other &&
		test_commit A1
	) &&

	git remote add -f other ./other &&
	test_commit B &&
	git tag v1.0 &&
	echo >>A.t &&
	git stash save Changes to A.t
[master (root-commit) 0ddfaf1] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A.t
Cloning into other
done.
[master ca6ed14] A1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A1.t
Updating other
[master d9df450] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B.t
Saved working directory and index state On master: Changes to A.t
HEAD is now at d9df450 B

ok 1 - setup

expecting success: 
	git log --first-parent --abbrev=10 --all --decorate --oneline --color=always |
	sed "s/[0-9a-f]\{10,10\}/COMMIT_ID/" >out &&
	test_cmp expected out

ok 2 - Commit Decorations Colored Correctly

# passed all 2 test(s)
1..2
