Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6018-rev-list-glob/.git/
expecting success: 

	commit master &&
	git checkout -b subspace/one master &&
	commit one &&
	git checkout -b subspace/two master &&
	commit two &&
	git checkout -b subspace-x master &&
	commit subspace-x &&
	git checkout -b other/three master &&
	commit three &&
	git checkout -b someref master &&
	commit some &&
	git checkout master &&
	commit master2 &&
	git tag foo/bar master &&
	commit master3 &&
	git update-ref refs/remotes/foo/baz master &&
	commit master4
[master (root-commit) e1f5012] master
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[subspace/one 2eafb28] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[subspace/two 8d58bb9] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[subspace-x a6204e5] subspace-x
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[other/three 9f9c15a] three
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[someref 065b9f3] some
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 95cfde6] master2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 32e7f0b] master3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 427c67e] master4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 

	compare rev-parse "subspace/one subspace/two" "--glob=refs/heads/subspace/*"

ok 2 - rev-parse --glob=refs/heads/subspace/*

expecting success: 

	compare rev-parse "subspace/one subspace/two" "--glob=heads/subspace/*"

ok 3 - rev-parse --glob=heads/subspace/*

expecting success: 

	compare rev-parse "subspace/one subspace/two" "--glob=refs/heads/subspace/"

ok 4 - rev-parse --glob=refs/heads/subspace/

expecting success: 

	compare rev-parse "subspace/one subspace/two" "--glob=heads/subspace/"

ok 5 - rev-parse --glob=heads/subspace/

expecting success: 

	compare rev-parse "subspace/one subspace/two" "--glob=heads/subspace"



ok 6 - rev-parse --glob=heads/subspace

expecting success: 

	compare rev-parse "subspace/one subspace/two" "--branches=subspace/*"

ok 7 - rev-parse --branches=subspace/*

expecting success: 

	compare rev-parse "subspace/one subspace/two" "--branches=subspace/"



ok 8 - rev-parse --branches=subspace/

expecting success: 

	compare rev-parse "subspace/one subspace/two" "--branches=subspace"

ok 9 - rev-parse --branches=subspace

expecting success: 

	compare rev-parse "subspace/one subspace/two other/three" "--glob=heads/subspace/* --glob=heads/other/*"

ok 10 - rev-parse --glob=heads/subspace/* --glob=heads/other/*

expecting success: 

	compare rev-parse "master" "--glob=heads/someref/* master"



ok 11 - rev-parse --glob=heads/someref/* master

expecting success: 

	compare rev-parse "master other/three someref subspace-x subspace/one subspace/two" "--glob=heads/*"



ok 12 - rev-parse --glob=heads/*

expecting success: 

	compare rev-parse "foo/bar" "--tags=foo"



ok 13 - rev-parse --tags=foo

expecting success: 

	compare rev-parse "foo/baz" "--remotes=foo"

ok 14 - rev-parse --remotes=foo

expecting success: 

	compare rev-list "subspace/one subspace/two" "--glob=refs/heads/subspace/*"

ok 15 - rev-list --glob=refs/heads/subspace/*

expecting success: 

	compare rev-list "subspace/one subspace/two" "--glob refs/heads/subspace/*"

ok 16 - rev-list --glob refs/heads/subspace/*

expecting success: 

	compare rev-list "subspace/one subspace/two" "--glob=heads/subspace/*"

ok 17 - rev-list --glob=heads/subspace/*

expecting success: 

	compare rev-list "subspace/one subspace/two" "--glob=refs/heads/subspace/"

ok 18 - rev-list --glob=refs/heads/subspace/

expecting success: 

	compare rev-list "subspace/one subspace/two" "--glob=heads/subspace/"

ok 19 - rev-list --glob=heads/subspace/

expecting success: 

	compare rev-list "subspace/one subspace/two" "--glob=heads/subspace"

ok 20 - rev-list --glob=heads/subspace

expecting success: 

	compare rev-list "subspace/one subspace/two" "--branches=subspace/*"

ok 21 - rev-list --branches=subspace/*

expecting success: 

	compare rev-list "subspace/one subspace/two" "--branches=subspace/"

ok 22 - rev-list --branches=subspace/

expecting success: 

	compare rev-list "subspace/one subspace/two" "--branches=subspace"

ok 23 - rev-list --branches=subspace

expecting success: 

	compare rev-list "master subspace-x someref other/three subspace/one subspace/two" "--branches"



ok 24 - rev-list --branches

expecting success: 

	compare rev-list "master" "--glob=heads/someref/* master"

ok 25 - rev-list --glob=heads/someref/* master

expecting success: 

	compare rev-list "subspace/one subspace/two other/three" "--glob=heads/subspace/* --glob=heads/other/*"



ok 26 - rev-list --glob=heads/subspace/* --glob=heads/other/*

expecting success: 

	compare rev-list "master other/three someref subspace-x subspace/one subspace/two" "--glob=heads/*"

ok 27 - rev-list --glob=heads/*

expecting success: 

	compare rev-list "foo/bar" "--tags=foo"

ok 28 - rev-list --tags=foo

expecting success: 

	compare rev-list "foo/bar" "--tags"



ok 29 - rev-list --tags

expecting success: 

	compare rev-list "foo/baz" "--remotes=foo"

ok 30 - rev-list --remotes=foo

# passed all 30 test(s)
1..30
