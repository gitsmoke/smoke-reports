Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5506-remote-groups/.git/
expecting success: 
	mkdir one && (cd one && git init) &&
	mkdir two && (cd two && git init) &&
	git remote add -m master one one &&
	git remote add -m master two two
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5506-remote-groups/one/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5506-remote-groups/two/.git/
ok 1 - setup
expecting success: 
	mark update-all &&
	update_repos &&
	git remote update &&
	repo_fetched one &&
	repo_fetched two
[master (root-commit) 4de06b7] update-all
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master (root-commit) 4de06b7] update-all
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
Fetching one
Fetching two
ok 2 - no group updates all

expecting success: 
	mark nonexistant &&
	update_repos &&
	test_must_fail git remote update nonexistant &&
	! repo_fetched one &&
	! repo_fetched two
[master 739a534] nonexistant
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 739a534] nonexistant
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
ok 3 - nonexistant group produces error

expecting success: 
	mark group-all &&
	update_repos &&
	git config --add remotes.all one &&
	git config --add remotes.all two &&
	git remote update all &&
	repo_fetched one &&
	repo_fetched two
[master 39fee86] group-all
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 39fee86] group-all
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Fetching one
Fetching two
ok 4 - updating group updates all members (remote update)

expecting success: 
	mark fetch-group-all &&
	update_repos &&
	git fetch all &&
	repo_fetched one &&
	repo_fetched two
[master 26a185e] fetch-group-all
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 26a185e] fetch-group-all
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Fetching one
Fetching two
ok 5 - updating group updates all members (fetch)

expecting success: 
	mark group-some &&
	update_repos &&
	git config --add remotes.some one &&
	git remote update some &&
	repo_fetched one &&
	! repo_fetched two
[master 0da53bb] group-some
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 0da53bb] group-some
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Fetching one

ok 6 - updating group does not update non-members (remote update)

expecting success: 
	mark fetch-group-some &&
	update_repos &&
	git config --add remotes.some one &&
	git remote update some &&
	repo_fetched one &&
	! repo_fetched two

[master 0aff774] fetch-group-some
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 0aff774] fetch-group-some
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Fetching one
Fetching one

ok 7 - updating group does not update non-members (fetch)

expecting success: 
	mark remote-name &&
	update_repos &&
	git remote update one &&
	repo_fetched one &&
	! repo_fetched two

[master 8de45b4] remote-name
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 8de45b4] remote-name
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Fetching one
ok 8 - updating remote name updates that remote

# passed all 8 test(s)
1..8
