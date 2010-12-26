Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6001-rev-list-graft/.git/
expecting success: 
	mkdir subdir &&
	echo >fileA fileA &&
	echo >subdir/fileB fileB &&
	git add fileA subdir/fileB &&
	git commit -a -m "Initial in one history." &&
	A0=`git rev-parse --verify HEAD` &&

	echo >fileA fileA modified &&
	git commit -a -m "Second in one history." &&
	A1=`git rev-parse --verify HEAD` &&

	echo >subdir/fileB fileB modified &&
	git commit -a -m "Third in one history." &&
	A2=`git rev-parse --verify HEAD` &&

	rm -f .git/refs/heads/master .git/index &&

	echo >fileA fileA again &&
	echo >subdir/fileB fileB again &&
	git add fileA subdir/fileB &&
	git commit -a -m "Initial in alternate history." &&
	B0=`git rev-parse --verify HEAD` &&

	echo >fileA fileA modified in alternate history &&
	git commit -a -m "Second in alternate history." &&
	B1=`git rev-parse --verify HEAD` &&

	echo >subdir/fileB fileB modified in alternate history &&
	git commit -a -m "Third in alternate history." &&
	B2=`git rev-parse --verify HEAD` &&
	: done

[master (root-commit) 3727674] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 557aad9] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 695f60c] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) 4db7247] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 460b184] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 333d60d] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic 333d60d3d87f3984c7d67f816af98f7c207c1a02 -- 333d60d3d87f3984c7d67f816af98f7c207c1a02 460b184fdf22147b58a269e3074a3d76ccb7e300 4db7247d51c5b9265ccc18db0af8f41459820668
	

ok 2 - without grafts

expecting success: 
		echo '4db7247d51c5b9265ccc18db0af8f41459820668 695f60c5f8125f58ce840430716ec4403de8c2ad' >.git/info/grafts &&
		check basic 333d60d3d87f3984c7d67f816af98f7c207c1a02 -- 333d60d3d87f3984c7d67f816af98f7c207c1a02 460b184fdf22147b58a269e3074a3d76ccb7e300 4db7247d51c5b9265ccc18db0af8f41459820668 695f60c5f8125f58ce840430716ec4403de8c2ad 557aad909f1812534fef53b7463443321fb61509 372767468172596e5a0bfc54086aa7919d96f4b2
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 333d60d3d87f3984c7d67f816af98f7c207c1a02 subdir -- 333d60d3d87f3984c7d67f816af98f7c207c1a02 4db7247d51c5b9265ccc18db0af8f41459820668
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo '4db7247d51c5b9265ccc18db0af8f41459820668 695f60c5f8125f58ce840430716ec4403de8c2ad' >.git/info/grafts &&
		check basic 333d60d3d87f3984c7d67f816af98f7c207c1a02 subdir -- 333d60d3d87f3984c7d67f816af98f7c207c1a02 4db7247d51c5b9265ccc18db0af8f41459820668 695f60c5f8125f58ce840430716ec4403de8c2ad 372767468172596e5a0bfc54086aa7919d96f4b2
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 333d60d3d87f3984c7d67f816af98f7c207c1a02 -- 333d60d3d87f3984c7d67f816af98f7c207c1a02 460b184fdf22147b58a269e3074a3d76ccb7e300 4db7247d51c5b9265ccc18db0af8f41459820668
	

ok 6 - without grafts

expecting success: 
		echo '4db7247d51c5b9265ccc18db0af8f41459820668 695f60c5f8125f58ce840430716ec4403de8c2ad' >.git/info/grafts &&
		check parents 333d60d3d87f3984c7d67f816af98f7c207c1a02 -- 333d60d3d87f3984c7d67f816af98f7c207c1a02 460b184fdf22147b58a269e3074a3d76ccb7e300 4db7247d51c5b9265ccc18db0af8f41459820668 695f60c5f8125f58ce840430716ec4403de8c2ad 557aad909f1812534fef53b7463443321fb61509 372767468172596e5a0bfc54086aa7919d96f4b2
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 333d60d3d87f3984c7d67f816af98f7c207c1a02 subdir -- 333d60d3d87f3984c7d67f816af98f7c207c1a02 4db7247d51c5b9265ccc18db0af8f41459820668
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo '4db7247d51c5b9265ccc18db0af8f41459820668 695f60c5f8125f58ce840430716ec4403de8c2ad' >.git/info/grafts &&
		check parents 333d60d3d87f3984c7d67f816af98f7c207c1a02 subdir -- 333d60d3d87f3984c7d67f816af98f7c207c1a02 4db7247d51c5b9265ccc18db0af8f41459820668 695f60c5f8125f58ce840430716ec4403de8c2ad 372767468172596e5a0bfc54086aa7919d96f4b2
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 333d60d3d87f3984c7d67f816af98f7c207c1a02 -- 333d60d3d87f3984c7d67f816af98f7c207c1a02 460b184fdf22147b58a269e3074a3d76ccb7e300 4db7247d51c5b9265ccc18db0af8f41459820668
	

ok 10 - without grafts

expecting success: 
		echo '4db7247d51c5b9265ccc18db0af8f41459820668 695f60c5f8125f58ce840430716ec4403de8c2ad' >.git/info/grafts &&
		check parents-raw 333d60d3d87f3984c7d67f816af98f7c207c1a02 -- 333d60d3d87f3984c7d67f816af98f7c207c1a02 460b184fdf22147b58a269e3074a3d76ccb7e300 4db7247d51c5b9265ccc18db0af8f41459820668 695f60c5f8125f58ce840430716ec4403de8c2ad 557aad909f1812534fef53b7463443321fb61509 372767468172596e5a0bfc54086aa7919d96f4b2
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 333d60d3d87f3984c7d67f816af98f7c207c1a02 subdir -- 333d60d3d87f3984c7d67f816af98f7c207c1a02 4db7247d51c5b9265ccc18db0af8f41459820668
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo '4db7247d51c5b9265ccc18db0af8f41459820668 695f60c5f8125f58ce840430716ec4403de8c2ad' >.git/info/grafts &&
		check parents-raw 333d60d3d87f3984c7d67f816af98f7c207c1a02 subdir -- 333d60d3d87f3984c7d67f816af98f7c207c1a02 4db7247d51c5b9265ccc18db0af8f41459820668 695f60c5f8125f58ce840430716ec4403de8c2ad 372767468172596e5a0bfc54086aa7919d96f4b2
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13
