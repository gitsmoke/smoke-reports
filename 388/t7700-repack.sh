Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7700-repack/.git/
expecting success: 
	echo content1 > file1 &&
	echo content2 > file2 &&
	git add . &&
	test_tick &&
	git commit -m initial_commit &&
	# Create two packs
	# The first pack will contain all of the objects except one
	git rev-list --objects --all | grep -v file2 |
		git pack-objects pack > /dev/null &&
	# The second pack will contain the excluded object
	packsha1=$(git rev-list --objects --all | grep file2 |
		git pack-objects pack) &&
	touch -r pack-$packsha1.pack pack-$packsha1.keep &&
	objsha1=$(git verify-pack -v pack-$packsha1.idx | head -n 1 |
		sed -e "s/^\([0-9a-f]\{40\}\).*/\1/") &&
	mv pack-* .git/objects/pack/ &&
	git repack -A -d -l &&
	git prune-packed &&
	for p in .git/objects/pack/*.idx; do
		idx=$(basename $p)
		test "pack-$packsha1.idx" = "$idx" && continue
		if git verify-pack -v $p | egrep "^$objsha1"; then
			found_duplicate_object=1
			echo "DUPLICATE OBJECT FOUND"
			break
		fi
	done &&
	test -z "$found_duplicate_object"

[master (root-commit) 3677360] initial_commit
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2

ok 1 - objects in packs marked .keep are not repacked

expecting success: 
	mkdir alt_objects &&
	echo `pwd`/alt_objects > .git/objects/info/alternates &&
	echo content3 > file3 &&
	objsha1=$(GIT_OBJECT_DIRECTORY=alt_objects git hash-object -w file3) &&
	git add file3 &&
	test_tick &&
	git commit -m commit_file3 &&
	git repack -a -d -l &&
	git prune-packed &&
	for p in .git/objects/pack/*.idx; do
		if git verify-pack -v $p | egrep "^$objsha1"; then
			found_duplicate_object=1
			echo "DUPLICATE OBJECT FOUND"
			break
		fi
	done &&
	test -z "$found_duplicate_object"

[master 6f105e6] commit_file3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file3

ok 2 - loose objects in alternate ODB are not repacked

expecting success: 
	mkdir alt_objects/pack &&
	mv .git/objects/pack/* alt_objects/pack &&
	git repack -a &&
	myidx=$(ls -1 .git/objects/pack/*.idx) &&
	test -f "$myidx" &&
	for p in alt_objects/pack/*.idx; do
		git verify-pack -v $p | sed -n -e "/^[0-9a-f]\{40\}/p"
	done | while read sha1 rest; do
		if ! ( git verify-pack -v $myidx | grep "^$sha1" ); then
			echo "Missing object in local pack: $sha1"
			return 1
		fi
	done

3677360288c631b6b2e1f0e1f081b1e518605e9f commit 178 132 170
5676a2d9f02138eabe54b0c560a89a5fb2264ec4 tree   4 15 451 1 97b3ce03d6823ba5c356b4c628dce30bedb81fe0
6f105e6234717c52e9b117b08840926910a68314 commit 224 158 12
97b3ce03d6823ba5c356b4c628dce30bedb81fe0 tree   99 95 302
ac3e272b72bbf89def8657766b855d0656630ed4 blob   9 18 397
637f0347d31dad180d6fc7f6720c187b05a8754c blob   9 18 415

ok 3 - packed obs in alt ODB are repacked even when local repo is packless

expecting success: 
	rm -f .git/objects/pack/* &&
	echo new_content >> file1 &&
	git add file1 &&
	test_tick &&
	git commit -m more_content &&
	git repack &&
	git repack -a -d &&
	myidx=$(ls -1 .git/objects/pack/*.idx) &&
	test -f "$myidx" &&
	for p in alt_objects/pack/*.idx; do
		git verify-pack -v $p | sed -n -e "/^[0-9a-f]\{40\}/p"
	done | while read sha1 rest; do
		if ! ( git verify-pack -v $myidx | grep "^$sha1" ); then
			echo "Missing object in local pack: $sha1"
			return 1
		fi
	done

[master 7934c82] more_content
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
3677360288c631b6b2e1f0e1f081b1e518605e9f commit 178 132 330
5676a2d9f02138eabe54b0c560a89a5fb2264ec4 tree   4 14 733 1 97b3ce03d6823ba5c356b4c628dce30bedb81fe0
6f105e6234717c52e9b117b08840926910a68314 commit 224 158 172
97b3ce03d6823ba5c356b4c628dce30bedb81fe0 tree   99 95 620
ac3e272b72bbf89def8657766b855d0656630ed4 blob   9 18 715
637f0347d31dad180d6fc7f6720c187b05a8754c blob   9 18 584

ok 4 - packed obs in alt ODB are repacked when local repo has packs

expecting success: 
	# swap the .keep so the commit object is in the pack with .keep
	for p in alt_objects/pack/*.pack
	do
		base_name=$(basename $p .pack) &&
		if test -f alt_objects/pack/$base_name.keep
		then
			rm alt_objects/pack/$base_name.keep
		else
			touch alt_objects/pack/$base_name.keep
		fi
	done &&
	git repack -a -d &&
	myidx=$(ls -1 .git/objects/pack/*.idx) &&
	test -f "$myidx" &&
	for p in alt_objects/pack/*.idx; do
		git verify-pack -v $p | sed -n -e "/^[0-9a-f]\{40\}/p"
	done | while read sha1 rest; do
		if ! ( git verify-pack -v $myidx | grep "^$sha1" ); then
			echo "Missing object in local pack: $sha1"
			return 1
		fi
	done

3677360288c631b6b2e1f0e1f081b1e518605e9f commit 178 132 330
5676a2d9f02138eabe54b0c560a89a5fb2264ec4 tree   4 14 733 1 97b3ce03d6823ba5c356b4c628dce30bedb81fe0
6f105e6234717c52e9b117b08840926910a68314 commit 224 158 172
97b3ce03d6823ba5c356b4c628dce30bedb81fe0 tree   99 95 620
ac3e272b72bbf89def8657766b855d0656630ed4 blob   9 18 715
637f0347d31dad180d6fc7f6720c187b05a8754c blob   9 18 584

ok 5 - packed obs in alternate ODB kept pack are repacked

expecting success: 
	rm -f alt_objects/pack/*.keep &&
	mv .git/objects/pack/* alt_objects/pack/ &&
	csha1=$(git rev-parse HEAD^{commit}) &&
	git reset --hard HEAD^ &&
	test_tick &&
	git reflog expire --expire=$test_tick --expire-unreachable=$test_tick --all &&
	# The pack-objects call on the next line is equivalent to
	# git repack -A -d without the call to prune-packed
	git pack-objects --honor-pack-keep --non-empty --all --reflog \
	    --unpack-unreachable </dev/null pack &&
	rm -f .git/objects/pack/* &&
	mv pack-* .git/objects/pack/ &&
	test 0 = $(git verify-pack -v -- .git/objects/pack/*.idx |
		egrep "^$csha1 " | sort | uniq | wc -l) &&
	echo > .git/objects/info/alternates &&
	test_must_fail git show $csha1

HEAD is now at 6f105e6 commit_file3
881156ba8d0410e1736c4e2986c471d8dc6ca09b

ok 6 - packed unreachable obs in alternate ODB are not loosened

expecting success: 
	echo `pwd`/alt_objects > .git/objects/info/alternates &&
	echo "$csha1" | git pack-objects --non-empty --all --reflog pack &&
	rm -f .git/objects/pack/* &&
	mv pack-* .git/objects/pack/ &&
	# The pack-objects call on the next line is equivalent to
	# git repack -A -d without the call to prune-packed
	git pack-objects --honor-pack-keep --non-empty --all --reflog \
	    --unpack-unreachable </dev/null pack &&
	rm -f .git/objects/pack/* &&
	mv pack-* .git/objects/pack/ &&
	test 0 = $(git verify-pack -v -- .git/objects/pack/*.idx |
		egrep "^$csha1 " | sort | uniq | wc -l) &&
	echo > .git/objects/info/alternates &&
	test_must_fail git show $csha1
c877d64f4aab58d40f0b7c3b1ea176d121d3e00d
881156ba8d0410e1736c4e2986c471d8dc6ca09b

ok 7 - local packed unreachable obs that exist in alternate ODB are not loosened

expecting success: 
	test_tick &&
	git commit --allow-empty -m "commit 4" &&
	H0=$(git rev-parse HEAD) &&
	H1=$(git rev-parse HEAD^) &&
	H2=$(git rev-parse HEAD^^) &&
	echo "$H0 $H2" > .git/info/grafts &&
	git reflog expire --expire=$test_tick --expire-unreachable=$test_tick --all &&
	git repack -a -d &&
	git cat-file -t $H1
	
[master 818d068] commit 4
 Author: A U Thor <author@example.com>
commit

ok 8 - objects made unreachable by grafts only are kept

# passed all 8 test(s)
1..8
