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
[master (root-commit) 4daaed6] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 deepsubfile
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5526-fetch-submodules/submodule/.git/
Cloning into deepsubmodule...
done.
[master (root-commit) e779f00] new
 Author: A U Thor <author@example.com>
 3 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 .gitmodules
 create mode 160000 deepsubmodule
 create mode 100644 subfile
Adding existing repo at 'submodule' to the index
[master (root-commit) 75a1ff1] initial
 Author: A U Thor <author@example.com>
 2 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 .gitmodules
 create mode 160000 submodule
Cloning into downstream...
done.
Submodule 'submodule' (/Users/trast/git-smoke/t/trash directory.t5526-fetch-submodules/submodule) registered for path 'submodule'
Cloning into submodule...
done.
Submodule path 'submodule': checked out 'e779f0057799f5aef6ad1ef3505c38a041efa973'
Submodule 'deepsubmodule' (/Users/trast/git-smoke/t/trash directory.t5526-fetch-submodules/deepsubmodule) registered for path 'deepsubmodule'
Cloning into deepsubmodule...
done.
Submodule path 'deepsubmodule': checked out '4daaed6724ac12fa7389eafcaaa72de3396e2b5d'

ok 1 - setup

expecting success: 
	add_upstream_commit &&
	(
		cd downstream &&
		git fetch --recurse-submodules >../actual.out 2>../actual.err
	) &&
	test_cmp expect.out actual.out &&
	test_cmp expect.err actual.err

[master e3133ce] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master eea6bd5] new
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
[master 6771848] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master a7e0584] new
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

[master 06d6fec] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master c842b0d] new
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
[master ce39922] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master b1ebb44] new
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

[master 3f384fa] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 7482277] new
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
[master 827e72e] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 7e67f0c] new
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

[master 83934c1] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 10a50b4] new
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 13 - --no-recurse-submodules overrides config setting

# passed all 13 test(s)
1..13
