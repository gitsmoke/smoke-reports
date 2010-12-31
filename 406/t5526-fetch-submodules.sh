Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5526-fetch-submodules/.git/
expecting success: 
	mkdir deepsubmodule &&
	(
		cd deepsubmodule &&
		git init &&
		echo deepsubcontent > deepsubfile &&
		git add deepsubfile &&
		git commit -m new deepsubfile
	) &&
	mkdir submodule &&
	(
		cd submodule &&
		git init &&
		echo subcontent > subfile &&
		git add subfile &&
		git submodule add "$pwd/deepsubmodule" deepsubmodule &&
		git commit -a -m new
	) &&
	git submodule add "$pwd/submodule" submodule &&
	git commit -am initial &&
	git clone . downstream &&
	(
		cd downstream &&
		git submodule update --init --recursive
	) &&
	echo "Fetching submodule submodule" > expect.out &&
	echo "Fetching submodule submodule/deepsubmodule" >> expect.out

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5526-fetch-submodules/deepsubmodule/.git/
[master (root-commit) 3496b67] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 deepsubfile
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5526-fetch-submodules/submodule/.git/
Cloning into deepsubmodule...
done.
[master (root-commit) a48dac8] new
 Author: A U Thor <author@example.com>
 3 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 .gitmodules
 create mode 160000 deepsubmodule
 create mode 100644 subfile
Adding existing repo at 'submodule' to the index
[master (root-commit) b865385] initial
 Author: A U Thor <author@example.com>
 2 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 .gitmodules
 create mode 160000 submodule
Cloning into downstream...
done.
Submodule 'submodule' (/Users/trast/git-smoke/t/trash directory.t5526-fetch-submodules/submodule) registered for path 'submodule'
Cloning into submodule...
done.
Submodule path 'submodule': checked out 'a48dac850e8bc187abba027387843a993ad0fe28'
Submodule 'deepsubmodule' (/Users/trast/git-smoke/t/trash directory.t5526-fetch-submodules/deepsubmodule) registered for path 'deepsubmodule'
Cloning into deepsubmodule...
done.
Submodule path 'deepsubmodule': checked out '3496b67c92e02da10c30f9f4400e200668017d8b'

ok 1 - setup

expecting success: 
	add_upstream_commit &&
	(
		cd downstream &&
		git fetch --recurse-submodules >../actual.out 2>../actual.err
	) &&
	test_cmp expect.out actual.out &&
	test_cmp expect.err actual.err
[master 09980af] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 26f9a92] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 2 - fetch --recurse-submodules recurses into submodules

expecting success: 
	add_upstream_commit &&
	(
		cd downstream &&
		git fetch >../actual.out 2>../actual.err
	) &&
	! test -s actual.out &&
	! test -s actual.err

[master 8c98221] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master f12c63e] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 3 - fetch alone only fetches superproject

expecting success: 
	(
		cd downstream &&
		git fetch --no-recurse-submodules >../actual.out 2>../actual.err
	) &&
	! test -s actual.out &&
	! test -s actual.err


ok 4 - fetch --no-recurse-submodules only fetches superproject

expecting success: 
	(
		cd downstream &&
		git config -f .gitmodules submodule.submodule.fetchRecurseSubmodules true &&
		git fetch >../actual.out 2>../actual.err
	) &&
	test_cmp expect.out actual.out &&
	test_cmp expect.err actual.err

ok 5 - using fetchRecurseSubmodules=true in .gitmodules recurses into submodules

expecting success: 
	add_upstream_commit &&
	(
		cd downstream &&
		git fetch --no-recurse-submodules >../actual.out 2>../actual.err
	) &&
	! test -s actual.out &&
	! test -s actual.err
[master 1ed52c1] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master fdd1baa] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 6 - --no-recurse-submodules overrides .gitmodules config

expecting success: 
	(
		cd downstream &&
		git config submodule.submodule.fetchRecurseSubmodules false &&
		git fetch >../actual.out 2>../actual.err
	) &&
	! test -s actual.out &&
	! test -s actual.err

ok 7 - using fetchRecurseSubmodules=false in .git/config overrides setting in .gitmodules

expecting success: 
	(
		cd downstream &&
		git fetch --recurse-submodules >../actual.out 2>../actual.err &&
		git config -f --unset .gitmodules submodule.submodule.fetchRecurseSubmodules true &&
		git config --unset submodule.submodule.fetchRecurseSubmodules
	) &&
	test_cmp expect.out actual.out &&
	test_cmp expect.err actual.err


ok 8 - --recurse-submodules overrides fetchRecurseSubmodules setting from .git/config

expecting success: 
	(
		cd downstream &&
		git fetch --recurse-submodules --quiet >../actual.out 2>../actual.err
	) &&
	! test -s actual.out &&
	! test -s actual.err


ok 9 - --quiet propagates to submodules

expecting success: 
	add_upstream_commit &&
	(
		cd downstream &&
		git fetch --recurse-submodules --dry-run >../actual.out 2>../actual.err
	) &&
	test_cmp expect.out actual.out &&
	test_cmp expect.err actual.err &&
	(
		cd downstream &&
		git fetch --recurse-submodules >../actual.out 2>../actual.err
	) &&
	test_cmp expect.out actual.out &&
	test_cmp expect.err actual.err

[master 36bf63b] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 34cb5f2] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 10 - --dry-run propagates to submodules

expecting success: 
	add_upstream_commit &&
	(
		cd downstream &&
		git config fetch.recurseSubmodules true
		git fetch >../actual.out 2>../actual.err
	) &&
	test_cmp expect.out actual.out &&
	test_cmp expect.err actual.err

[master 99255ad] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 5ea2acc] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 11 - recurseSubmodules=true propagates into submodules

expecting success: 
	add_upstream_commit &&
	(
		cd downstream &&
		(
			cd submodule &&
			git config fetch.recurseSubmodules false
		) &&
		git fetch --recurse-submodules >../actual.out 2>../actual.err
	) &&
	test_cmp expect.out actual.out &&
	test_cmp expect.err actual.err

[master 44fe161] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 9c80814] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 12 - --recurse-submodules overrides config in submodule

expecting success: 
	add_upstream_commit &&
	(
		cd downstream &&
		git config fetch.recurseSubmodules true
		git fetch --no-recurse-submodules >../actual.out 2>../actual.err
	) &&
	! test -s actual.out &&
	! test -s actual.err
[master e37f0d2] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 82ebeff] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 13 - --no-recurse-submodules overrides config setting

# passed all 13 test(s)
1..13
