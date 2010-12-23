Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1001-read-tree-m-2way/.git/
expecting success: echo frotz >frotz &&
     echo nitfol >nitfol &&
     cat bozbar-old >bozbar &&
     echo rezrov >rezrov &&
     echo yomin >yomin &&
     git update-index --add nitfol bozbar rezrov &&
     treeH=`git write-tree` &&
     echo treeH $treeH &&
     git ls-tree $treeH &&

     cat bozbar-new >bozbar &&
     git update-index --add frotz bozbar --force-remove rezrov &&
     git ls-files --stage >M.out &&
     treeM=`git write-tree` &&
     echo treeM $treeM &&
     git ls-tree $treeM &&
     git diff-tree $treeH $treeM
treeH ca3aa9e6ee09349df7db6f0de15016afcdf5d9e4
100644 blob 3e8d9abb979a4fbdc93309f457a5496bc41ba6ab	bozbar
100644 blob dca6b92303befc93086aa025d90a5facd7eb2812	nitfol
100644 blob 766498d93a4b06057a8e49d23f4068f1170ff38f	rezrov
treeM d2c045ead2ecb56f2632385a395918bf21816c12
100644 blob 346d4e61f111336a1443ef6b2e834aa5b1a7f91a	bozbar
100644 blob 8e4020bb5a8d8c873b25de15933e75cc0fc275df	frotz
100644 blob dca6b92303befc93086aa025d90a5facd7eb2812	nitfol
:100644 100644 3e8d9abb979a4fbdc93309f457a5496bc41ba6ab 346d4e61f111336a1443ef6b2e834aa5b1a7f91a M	bozbar
:000000 100644 0000000000000000000000000000000000000000 8e4020bb5a8d8c873b25de15933e75cc0fc275df A	frotz
:100644 000000 766498d93a4b06057a8e49d23f4068f1170ff38f 0000000000000000000000000000000000000000 D	rezrov

ok 1 - setup

expecting success: rm -f .git/index &&
     read_tree_twoway $treeH $treeM &&
     git ls-files --stage >1-3.out &&
     test_cmp M.out 1-3.out &&
     check_cache_at bozbar dirty &&
     check_cache_at frotz dirty &&
     check_cache_at nitfol dirty
100644 346d4e61f111336a1443ef6b2e834aa5b1a7f91a 0	bozbar
100644 8e4020bb5a8d8c873b25de15933e75cc0fc275df 0	frotz
100644 dca6b92303befc93086aa025d90a5facd7eb2812 0	nitfol
bozbar: dirty
frotz: dirty
nitfol: dirty

ok 2 - 1, 2, 3 - no carry forward
expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     git update-index --add yomin &&
     read_tree_twoway $treeH $treeM &&
     git ls-files --stage >4.out &&
     test_must_fail git diff --no-index M.out 4.out >4diff.out &&
     compare_change 4diff.out expected &&
     check_cache_at yomin clean
100644 346d4e61f111336a1443ef6b2e834aa5b1a7f91a 0	bozbar
100644 8e4020bb5a8d8c873b25de15933e75cc0fc275df 0	frotz
100644 dca6b92303befc93086aa025d90a5facd7eb2812 0	nitfol
100644 0a41e115ab61be0328a19b29f18cdcb49338d516 0	yomin
yomin: clean

ok 3 - 4 - carry forward local addition.
expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     echo yomin >yomin &&
     git update-index --add yomin &&
     echo yomin yomin >yomin &&
     read_tree_twoway $treeH $treeM &&
     git ls-files --stage >5.out &&
     test_must_fail git diff --no-index M.out 5.out >5diff.out &&
     compare_change 5diff.out expected &&
     check_cache_at yomin dirty
100644 346d4e61f111336a1443ef6b2e834aa5b1a7f91a 0	bozbar
100644 8e4020bb5a8d8c873b25de15933e75cc0fc275df 0	frotz
100644 dca6b92303befc93086aa025d90a5facd7eb2812 0	nitfol
100644 0a41e115ab61be0328a19b29f18cdcb49338d516 0	yomin
yomin: dirty

ok 4 - 5 - carry forward local addition.
expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     git update-index --add frotz &&
     read_tree_twoway $treeH $treeM &&
     git ls-files --stage >6.out &&
     test_cmp M.out 6.out &&
     check_cache_at frotz clean
100644 346d4e61f111336a1443ef6b2e834aa5b1a7f91a 0	bozbar
100644 8e4020bb5a8d8c873b25de15933e75cc0fc275df 0	frotz
100644 dca6b92303befc93086aa025d90a5facd7eb2812 0	nitfol
frotz: clean

ok 5 - 6 - local addition already has the same.

expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     echo frotz >frotz &&
     git update-index --add frotz &&
     echo frotz frotz >frotz &&
     read_tree_twoway $treeH $treeM &&
     git ls-files --stage >7.out &&
     test_cmp M.out 7.out &&
     check_cache_at frotz dirty
100644 346d4e61f111336a1443ef6b2e834aa5b1a7f91a 0	bozbar
100644 8e4020bb5a8d8c873b25de15933e75cc0fc275df 0	frotz
100644 dca6b92303befc93086aa025d90a5facd7eb2812 0	nitfol
frotz: dirty
ok 6 - 7 - local addition already has the same.
expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     echo frotz frotz >frotz &&
     git update-index --add frotz &&
     if read_tree_twoway $treeH $treeM; then false; else :; fi
ok 7 - 8 - conflicting addition.
expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     echo frotz frotz >frotz &&
     git update-index --add frotz &&
     echo frotz >frotz &&
     if read_tree_twoway $treeH $treeM; then false; else :; fi
ok 8 - 9 - conflicting addition.
expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     echo rezrov >rezrov &&
     git update-index --add rezrov &&
     read_tree_twoway $treeH $treeM &&
     git ls-files --stage >10.out &&
     test_cmp M.out 10.out
100644 346d4e61f111336a1443ef6b2e834aa5b1a7f91a 0	bozbar
100644 8e4020bb5a8d8c873b25de15933e75cc0fc275df 0	frotz
100644 dca6b92303befc93086aa025d90a5facd7eb2812 0	nitfol

ok 9 - 10 - path removed.

expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     echo rezrov >rezrov &&
     git update-index --add rezrov &&
     echo rezrov rezrov >rezrov &&
     if read_tree_twoway $treeH $treeM; then false; else :; fi

ok 10 - 11 - dirty path removed.

expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     echo rezrov rezrov >rezrov &&
     git update-index --add rezrov &&
     if read_tree_twoway $treeH $treeM; then false; else :; fi
ok 11 - 12 - unmatching local changes being removed.

expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     echo rezrov rezrov >rezrov &&
     git update-index --add rezrov &&
     echo rezrov >rezrov &&
     if read_tree_twoway $treeH $treeM; then false; else :; fi

ok 12 - 13 - unmatching local changes being removed.
expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     echo nitfol nitfol >nitfol &&
     git update-index --add nitfol &&
     read_tree_twoway $treeH $treeM &&
     git ls-files --stage >14.out &&
     test_must_fail git diff --no-index M.out 14.out >14diff.out &&
     compare_change 14diff.out expected &&
     check_cache_at nitfol clean
100644 346d4e61f111336a1443ef6b2e834aa5b1a7f91a 0	bozbar
100644 8e4020bb5a8d8c873b25de15933e75cc0fc275df 0	frotz
100644 7e1bf714fb103c778a21dd67411666901222425a 0	nitfol
nitfol: clean

ok 13 - 14 - unchanged in two heads.

expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     echo nitfol nitfol >nitfol &&
     git update-index --add nitfol &&
     echo nitfol nitfol nitfol >nitfol &&
     read_tree_twoway $treeH $treeM &&
     git ls-files --stage >15.out &&
     test_must_fail git diff --no-index M.out 15.out >15diff.out &&
     compare_change 15diff.out expected &&
     check_cache_at nitfol dirty
100644 346d4e61f111336a1443ef6b2e834aa5b1a7f91a 0	bozbar
100644 8e4020bb5a8d8c873b25de15933e75cc0fc275df 0	frotz
100644 7e1bf714fb103c778a21dd67411666901222425a 0	nitfol
nitfol: dirty

ok 14 - 15 - unchanged in two heads.
expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     echo bozbar bozbar >bozbar &&
     git update-index --add bozbar &&
     if read_tree_twoway $treeH $treeM; then false; else :; fi
ok 15 - 16 - conflicting local change.
expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     echo bozbar bozbar >bozbar &&
     git update-index --add bozbar &&
     echo bozbar bozbar bozbar >bozbar &&
     if read_tree_twoway $treeH $treeM; then false; else :; fi

ok 16 - 17 - conflicting local change.
expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     cat bozbar-new >bozbar &&
     git update-index --add bozbar &&
     read_tree_twoway $treeH $treeM &&
     git ls-files --stage >18.out &&
     test_cmp M.out 18.out &&
     check_cache_at bozbar clean
100644 346d4e61f111336a1443ef6b2e834aa5b1a7f91a 0	bozbar
100644 8e4020bb5a8d8c873b25de15933e75cc0fc275df 0	frotz
100644 dca6b92303befc93086aa025d90a5facd7eb2812 0	nitfol
bozbar: clean

ok 17 - 18 - local change already having a good result.

expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     cat bozbar-new >bozbar &&
     git update-index --add bozbar &&
     echo gnusto gnusto >bozbar &&
     read_tree_twoway $treeH $treeM &&
     git ls-files --stage >19.out &&
     test_cmp M.out 19.out &&
     check_cache_at bozbar dirty
100644 346d4e61f111336a1443ef6b2e834aa5b1a7f91a 0	bozbar
100644 8e4020bb5a8d8c873b25de15933e75cc0fc275df 0	frotz
100644 dca6b92303befc93086aa025d90a5facd7eb2812 0	nitfol
bozbar: dirty

ok 18 - 19 - local change already having a good result, further modified.

expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     cat bozbar-old >bozbar &&
     git update-index --add bozbar &&
     read_tree_twoway $treeH $treeM &&
     git ls-files --stage >20.out &&
     test_cmp M.out 20.out &&
     check_cache_at bozbar dirty
100644 346d4e61f111336a1443ef6b2e834aa5b1a7f91a 0	bozbar
100644 8e4020bb5a8d8c873b25de15933e75cc0fc275df 0	frotz
100644 dca6b92303befc93086aa025d90a5facd7eb2812 0	nitfol
bozbar: dirty

ok 19 - 20 - no local change, use new tree.

expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     cat bozbar-old >bozbar &&
     git update-index --add bozbar &&
     echo gnusto gnusto >bozbar &&
     if read_tree_twoway $treeH $treeM; then false; else :; fi

ok 20 - 21 - no local change, dirty cache.

expecting success: rm -f .git/index &&
     git read-tree $treeH &&
     git checkout-index -u -f -q -a &&
     sed -e "s/such as/SUCH AS/" bozbar-old >bozbar &&
     git update-index --add bozbar &&
     if read_tree_twoway $treeH $treeM; then false; else :; fi
ok 21 - 22 - local change cache updated.

expecting success: rm -f .git/index &&
     echo DF >DF &&
     git update-index --add DF &&
     treeDF=`git write-tree` &&
     echo treeDF $treeDF &&
     git ls-tree $treeDF &&

     rm -f DF &&
     mkdir DF &&
     echo DF/DF >DF/DF &&
     git update-index --add --remove DF DF/DF &&
     treeDFDF=`git write-tree` &&
     echo treeDFDF $treeDFDF &&
     git ls-tree $treeDFDF &&
     git ls-files --stage >DFDF.out
treeDF 6bf22db9043f2b5821c019d0ce0f2605421affcb
100644 blob 052efc3abbc31348f7abd34535b1953d38273257	DF
treeDFDF c38e296263d024b0f48c4a728d293232ac6c5443
040000 tree 90bbead36f4d6a7c325fd450e6cfbcc7479d421a	DF

ok 22 - DF vs DF/DF case setup.
expecting success: rm -f .git/index &&
     rm -fr DF &&
     echo DF >DF &&
     git update-index --add DF &&
     read_tree_twoway $treeDF $treeDFDF &&
     git ls-files --stage >DFDFcheck.out &&
     test_cmp DFDF.out DFDFcheck.out &&
     check_cache_at DF/DF dirty &&
     :
100644 b90ea14b2dd74b6f377c10870b3757344bbe077c 0	DF/DF
DF/DF: dirty

ok 23 - DF vs DF/DF case test.

expecting success: rm -f .git/index &&
     : >a &&
     git update-index --add a &&
     treeM=`git write-tree` &&
     echo treeM $treeM &&
     git ls-tree $treeM &&
     git ls-files --stage >treeM.out &&

     rm -f a &&
     git update-index --remove a &&
     mkdir a &&
     : >a/b &&
     treeH=`git write-tree` &&
     echo treeH $treeH &&
     git ls-tree $treeH
treeM 496d6428b9cf92981dc9495211e6e1120fb6f2ba
100644 blob e69de29bb2d1d6434b8b29ae775ad8c2e48c5391	a
treeH 4b825dc642cb6eb9a060e54bf8d69288fbee4904

ok 24 - a/b (untracked) vs a case setup.

expecting success: test_must_fail git read-tree -u -m "$treeH" "$treeM" &&
     git ls-files --stage &&
     test -f a/b

ok 25 - a/b (untracked) vs a, plus c/d case test.

expecting success: rm -f .git/index &&
     rm -fr a &&
     : >a &&
     mkdir c &&
     : >c/d &&
     git update-index --add a c/d &&
     treeM=`git write-tree` &&
     echo treeM $treeM &&
     git ls-tree $treeM &&
     git ls-files --stage >treeM.out &&

     rm -f a &&
     mkdir a &&
     : >a/b &&
     git update-index --add --remove a a/b &&
     treeH=`git write-tree` &&
     echo treeH $treeH &&
     git ls-tree $treeH
treeM 3e82e8b9894d6c7982dcd25a6dad66400d52735f
100644 blob e69de29bb2d1d6434b8b29ae775ad8c2e48c5391	a
040000 tree 2a26db49a6962700da5bd4084ae0e5a22d6583ee	c
treeH 02c6f058fb950781e5b773c21e4c237db1ff4d5a
040000 tree 4277b6e69d25e5efa77c455340557b384a4c018a	a
040000 tree 2a26db49a6962700da5bd4084ae0e5a22d6583ee	c

ok 26 - a/b vs a, plus c/d case setup.

expecting success: git read-tree -u -m "$treeH" "$treeM" &&
     git ls-files --stage | tee >treeMcheck.out &&
     test_cmp treeM.out treeMcheck.out

ok 27 - a/b vs a, plus c/d case test.

expecting success: 
	echo >file-a &&
	echo >file-b &&
	git add file-a file-b &&
	git commit -a -m "test for correct modified tree" &&
	git branch initial-mod &&
	echo b >file-b &&
	git commit -a -m "B" &&
	echo a >file-a &&
	git add file-a &&
	git ls-tree $(git write-tree) file-a >expect &&
	git read-tree -m HEAD initial-mod &&
	git ls-tree $(git write-tree) file-a >actual &&
	test_cmp expect actual
[master (root-commit) 7c54c6b] test for correct modified tree
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 a
 create mode 100644 c/d
 create mode 100644 file-a
 create mode 100644 file-b
[master 2ecba62] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 28 - -m references the correct modified tree
# passed all 28 test(s)
1..28
