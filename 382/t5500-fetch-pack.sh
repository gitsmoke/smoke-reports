Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5500-fetch-pack/.git/
expecting success: 
	mkdir client &&
	(
		cd client &&
		git init &&
		git config transfer.unpacklimit 0
	) &&
	add A1 &&
	prev=1 &&
	cur=2 &&
	while [ $cur -le 10 ]; do
		add A$cur $(eval echo \$A$prev) &&
		prev=$cur &&
		cur=$(($cur+1))
	done &&
	add B1 $A1 &&
	echo $ATIP > .git/refs/heads/A &&
	echo $BTIP > .git/refs/heads/B &&
	git symbolic-ref HEAD refs/heads/B
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5500-fetch-pack/client/.git/
ok 1 - setup
expecting success: 
		(
			cd client &&
			git fetch-pack -k -v .. $heads &&

			case "$heads" in
			    *A*)
				    echo $ATIP > .git/refs/heads/A;;
			esac &&
			case "$heads" in *B*)
			    echo $BTIP > .git/refs/heads/B;;
			esac &&
			git symbolic-ref HEAD refs/heads/`echo $heads \
				| sed -e "s/^\(.\).*$/\1/"` &&

			git fsck --full &&

			mv .git/objects/pack/pack-* . &&
			p=`ls -1 pack-*.pack` &&
			git unpack-objects <$p &&
			git fsck --full &&

			idx=`echo pack-*.idx` &&
			pack_count=`git show-index <$idx | wc -l` &&
			test $pack_count = $count &&
			rm -f pack-*
		)
	
pack	c5c993050ae70220697fc1e56381633516023444
ed6d498dac4948371a8c2a3954eef783312857f5 refs/heads/B
9980fc7e97f06bbd7341f45d570f0c5eb2a954f1 refs/heads/A

ok 2 - 1st pull
expecting success: 
	add A11 $A10 &&
	prev=1 &&
	cur=2 &&
	while [ $cur -le 65 ]; do
		add B$cur $(eval echo \$B$prev) &&
		prev=$cur &&
		cur=$(($cur+1))
	done

ok 3 - post 1st pull setup

expecting success: 
		(
			cd client &&
			git fetch-pack -k -v .. $heads &&

			case "$heads" in
			    *A*)
				    echo $ATIP > .git/refs/heads/A;;
			esac &&
			case "$heads" in *B*)
			    echo $BTIP > .git/refs/heads/B;;
			esac &&
			git symbolic-ref HEAD refs/heads/`echo $heads \
				| sed -e "s/^\(.\).*$/\1/"` &&

			git fsck --full &&

			mv .git/objects/pack/pack-* . &&
			p=`ls -1 pack-*.pack` &&
			git unpack-objects <$p &&
			git fsck --full &&

			idx=`echo pack-*.idx` &&
			pack_count=`git show-index <$idx | wc -l` &&
			test $pack_count = $count &&
			rm -f pack-*
		)
	
pack	1b3caff5a0254226dc3a224e147806b8647caf60
27f494dfb7e67d2f9cd2282404adf1d97581aa34 refs/heads/B

ok 4 - 2nd pull

expecting success: 
		(
			cd client &&
			git fetch-pack -k -v .. $heads &&

			case "$heads" in
			    *A*)
				    echo $ATIP > .git/refs/heads/A;;
			esac &&
			case "$heads" in *B*)
			    echo $BTIP > .git/refs/heads/B;;
			esac &&
			git symbolic-ref HEAD refs/heads/`echo $heads \
				| sed -e "s/^\(.\).*$/\1/"` &&

			git fsck --full &&

			mv .git/objects/pack/pack-* . &&
			p=`ls -1 pack-*.pack` &&
			git unpack-objects <$p &&
			git fsck --full &&

			idx=`echo pack-*.idx` &&
			pack_count=`git show-index <$idx | wc -l` &&
			test $pack_count = $count &&
			rm -f pack-*
		)
	
pack	a42c9ca5b5ce7d235f96d2073f90d8ce87ea7ef1
f85e353c1b377970afbb804118d9135948598eea refs/heads/A

ok 5 - 3rd pull

expecting success: 
	git clone --depth 2 "file://$(pwd)/." shallow

Cloning into shallow...

ok 6 - clone shallow

expecting success: 
	(
		cd shallow &&
		git count-objects -v
	) > count.shallow &&
	grep "^in-pack: 18" count.shallow
in-pack: 18

ok 7 - clone shallow object count

expecting success: 
	sed -e "/^in-pack:/d" -e "/^packs:/d" -e "/^size-pack:/d" \
	    -e "/: 0$/d" count.shallow > count_output &&
	! test -s count_output


ok 8 - clone shallow object count (part 2)

expecting success: 
	(
		cd shallow &&
		git fsck --full
	)


ok 9 - fsck in shallow repo

expecting success: 
	(
		cd shallow &&
		git fetch
	)


ok 10 - simple fetch in shallow repo

expecting success: 
	(
		cd shallow &&
		git count-objects -v
	) > count.shallow.2 &&
	cmp count.shallow count.shallow.2


ok 11 - no changes expected

expecting success: 
	(
		cd shallow &&
		git fetch --depth=2
	)
ok 12 - fetch same depth in shallow repo

expecting success: 
	(
		cd shallow &&
		git count-objects -v
	) > count.shallow.3 &&
	cmp count.shallow count.shallow.3

ok 13 - no changes expected

expecting success: 
	add B66 $B65 &&
	add B67 $B66

ok 14 - add two more

expecting success: 
	(
		cd shallow &&
		git pull .. B
	)
Updating 27f494d..437bc54
Fast-forward
 test.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 15 - pull in shallow repo

expecting success: 
	(
		cd shallow &&
		git count-objects -v
	) > count.shallow &&
	grep "^count: 6" count.shallow
count: 6

ok 16 - clone shallow object count

expecting success: 
	add B68 $B67 &&
	add B69 $B68

ok 17 - add two more (part 2)

expecting success: 
	(
		cd shallow &&
		git pull --depth 4 .. B
	)
Updating 437bc54..9ca64d8
Fast-forward
 test.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 18 - deepening pull in shallow repo

expecting success: 
	(
		cd shallow &&
		git count-objects -v
	) > count.shallow &&
	grep "^count: 12" count.shallow
count: 12

ok 19 - clone shallow object count

expecting success: 
	(
		cd shallow &&
		git fetch --depth 4 .. A:A
	)
ok 20 - deepening fetch in shallow repo
expecting success: 
	(
		cd shallow &&
		git count-objects -v
	) > count.shallow &&
	grep "^count: 18" count.shallow
count: 18

ok 21 - clone shallow object count

expecting success: 
	(
		cd shallow &&
		test_must_fail git pull --depth 4 .. A
	)
Merging:
9ca64d8 B69 12506236f9d4e4c1150d951940e54aa6ef43c8d3
virtual f85e353c1b377970afbb804118d9135948598eea
found 0 common ancestor(s):
Auto-merging test.txt
CONFLICT (add/add): Merge conflict in test.txt
Automatic merge failed; fix conflicts and then commit the result.

ok 22 - pull in shallow repo with missing merge base

expecting success: 
	(
		cd shallow &&
		git fetch --depth=8 &&
		git fetch --depth=10 &&
		git fetch --depth=11
	)
ok 23 - additional simple shallow deepenings

expecting success: 
	(
		cd shallow &&
		git count-objects -v
	) > count.shallow &&
	grep "^count: 52" count.shallow
count: 52

ok 24 - clone shallow object count

# passed all 24 test(s)
1..24
