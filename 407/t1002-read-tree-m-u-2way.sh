Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1002-read-tree-m-u-2way/.git/
expecting success: echo frotz >frotz &&
     echo nitfol >nitfol &&
     echo bozbar >bozbar &&
     echo rezrov >rezrov &&
     git update-index --add nitfol bozbar rezrov &&
     treeH=`git write-tree` &&
     echo treeH $treeH &&
     git ls-tree $treeH &&

     echo gnusto >bozbar &&
     git update-index --add frotz bozbar --force-remove rezrov &&
     git ls-files --stage >M.out &&
     treeM=`git write-tree` &&
     echo treeM $treeM &&
     git ls-tree $treeM &&
     sum bozbar frotz nitfol >M.sum &&
     git diff-tree $treeH $treeM
treeH 661afa9096b7e2d4b9a28a6e43736cd0b06d1308
100644 blob 78d812a2124ff980a1a70f8cca493698d643d242	bozbar
100644 blob dca6b92303befc93086aa025d90a5facd7eb2812	nitfol
100644 blob 766498d93a4b06057a8e49d23f4068f1170ff38f	rezrov
treeM 05bf9652e9b06473d6ca2f32ff60e2401e59bfa6
100644 blob bb3b2cd2e136e1e4e7ecdf10068e246196dd8294	bozbar
100644 blob 8e4020bb5a8d8c873b25de15933e75cc0fc275df	frotz
100644 blob dca6b92303befc93086aa025d90a5facd7eb2812	nitfol
:100644 100644 78d812a2124ff980a1a70f8cca493698d643d242 bb3b2cd2e136e1e4e7ecdf10068e246196dd8294 M	bozbar
:000000 100644 0000000000000000000000000000000000000000 8e4020bb5a8d8c873b25de15933e75cc0fc275df A	frotz
:100644 000000 766498d93a4b06057a8e49d23f4068f1170ff38f 0000000000000000000000000000000000000000 D	rezrov

ok 1 - setup
expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     git read-tree -m -u $treeH $treeM &&
     git ls-files --stage >1-3.out &&
     cmp M.out 1-3.out &&
     sum bozbar frotz nitfol >actual3.sum &&
     cmp M.sum actual3.sum &&
     check_cache_at bozbar clean &&
     check_cache_at frotz clean &&
     check_cache_at nitfol clean
bozbar: clean
frotz: clean
nitfol: clean
ok 2 - 1, 2, 3 - no carry forward
expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo "+100644 X 0	yomin" >expected &&
     echo yomin >yomin &&
     git update-index --add yomin &&
     git read-tree -m -u $treeH $treeM &&
     git ls-files --stage >4.out || return 1
     git diff -U0 --no-index M.out 4.out >4diff.out
     compare_change 4diff.out expected &&
     check_cache_at yomin clean &&
     sum bozbar frotz nitfol >actual4.sum &&
     cmp M.sum actual4.sum &&
     echo yomin >yomin1 &&
     diff yomin yomin1 &&
     rm -f yomin1
yomin: clean

ok 3 - 4 - carry forward local addition.

expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     git read-tree -m -u $treeH &&
     echo yomin >yomin &&
     git update-index --add yomin &&
     echo yomin yomin >yomin &&
     git read-tree -m -u $treeH $treeM &&
     git ls-files --stage >5.out || return 1
     git diff -U0 --no-index M.out 5.out >5diff.out
     compare_change 5diff.out expected &&
     check_cache_at yomin dirty &&
     sum bozbar frotz nitfol >actual5.sum &&
     cmp M.sum actual5.sum &&
     : dirty index should have prevented -u from checking it out. &&
     echo yomin yomin >yomin1 &&
     diff yomin yomin1 &&
     rm -f yomin1
yomin: dirty
ok 4 - 5 - carry forward local addition.
expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo frotz >frotz &&
     git update-index --add frotz &&
     git read-tree -m -u $treeH $treeM &&
     git ls-files --stage >6.out &&
     test_cmp M.out 6.out &&
     check_cache_at frotz clean &&
     sum bozbar frotz nitfol >actual3.sum &&
     cmp M.sum actual3.sum &&
     echo frotz >frotz1 &&
     diff frotz frotz1 &&
     rm -f frotz1
frotz: clean

ok 5 - 6 - local addition already has the same.

expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo frotz >frotz &&
     git update-index --add frotz &&
     echo frotz frotz >frotz &&
     git read-tree -m -u $treeH $treeM &&
     git ls-files --stage >7.out &&
     test_cmp M.out 7.out &&
     check_cache_at frotz dirty &&
     sum bozbar frotz nitfol >actual7.sum &&
     if cmp M.sum actual7.sum; then false; else :; fi &&
     : dirty index should have prevented -u from checking it out. &&
     echo frotz frotz >frotz1 &&
     diff frotz frotz1 &&
     rm -f frotz1
frotz: dirty
M.sum actual7.sum differ: char 16, line 2

ok 6 - 7 - local addition already has the same.

expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo frotz frotz >frotz &&
     git update-index --add frotz &&
     if git read-tree -m -u $treeH $treeM; then false; else :; fi

ok 7 - 8 - conflicting addition.

expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo frotz frotz >frotz &&
     git update-index --add frotz &&
     echo frotz >frotz &&
     if git read-tree -m -u $treeH $treeM; then false; else :; fi
ok 8 - 9 - conflicting addition.

expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo rezrov >rezrov &&
     git update-index --add rezrov &&
     git read-tree -m -u $treeH $treeM &&
     git ls-files --stage >10.out &&
     cmp M.out 10.out &&
     sum bozbar frotz nitfol >actual10.sum &&
     cmp M.sum actual10.sum

ok 9 - 10 - path removed.

expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo rezrov >rezrov &&
     git update-index --add rezrov &&
     echo rezrov rezrov >rezrov &&
     if git read-tree -m -u $treeH $treeM; then false; else :; fi

ok 10 - 11 - dirty path removed.

expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo rezrov rezrov >rezrov &&
     git update-index --add rezrov &&
     if git read-tree -m -u $treeH $treeM; then false; else :; fi
ok 11 - 12 - unmatching local changes being removed.

expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo rezrov rezrov >rezrov &&
     git update-index --add rezrov &&
     echo rezrov >rezrov &&
     if git read-tree -m -u $treeH $treeM; then false; else :; fi

ok 12 - 13 - unmatching local changes being removed.

expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo nitfol nitfol >nitfol &&
     git update-index --add nitfol &&
     git read-tree -m -u $treeH $treeM &&
     git ls-files --stage >14.out &&
     test_must_fail git diff -U0 --no-index M.out 14.out >14diff.out &&
     compare_change 14diff.out expected &&
     sum bozbar frotz >actual14.sum &&
     grep -v nitfol M.sum > expected14.sum &&
     cmp expected14.sum actual14.sum &&
     sum bozbar frotz nitfol >actual14a.sum &&
     if cmp M.sum actual14a.sum; then false; else :; fi &&
     check_cache_at nitfol clean &&
     echo nitfol nitfol >nitfol1 &&
     diff nitfol nitfol1 &&
     rm -f nitfol1
M.sum actual14a.sum differ: char 30, line 3
nitfol: clean
ok 13 - 14 - unchanged in two heads.
expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo nitfol nitfol >nitfol &&
     git update-index --add nitfol &&
     echo nitfol nitfol nitfol >nitfol &&
     git read-tree -m -u $treeH $treeM &&
     git ls-files --stage >15.out &&
     test_must_fail git diff -U0 --no-index M.out 15.out >15diff.out &&
     compare_change 15diff.out expected &&
     check_cache_at nitfol dirty &&
     sum bozbar frotz >actual15.sum &&
     grep -v nitfol M.sum > expected15.sum &&
     cmp expected15.sum actual15.sum &&
     sum bozbar frotz nitfol >actual15a.sum &&
     if cmp M.sum actual15a.sum; then false; else :; fi &&
     echo nitfol nitfol nitfol >nitfol1 &&
     diff nitfol nitfol1 &&
     rm -f nitfol1
nitfol: dirty
M.sum actual15a.sum differ: char 30, line 3
ok 14 - 15 - unchanged in two heads.
expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo bozbar bozbar >bozbar &&
     git update-index --add bozbar &&
     if git read-tree -m -u $treeH $treeM; then false; else :; fi

ok 15 - 16 - conflicting local change.

expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo bozbar bozbar >bozbar &&
     git update-index --add bozbar &&
     echo bozbar bozbar bozbar >bozbar &&
     if git read-tree -m -u $treeH $treeM; then false; else :; fi
ok 16 - 17 - conflicting local change.

expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo gnusto >bozbar &&
     git update-index --add bozbar &&
     git read-tree -m -u $treeH $treeM &&
     git ls-files --stage >18.out &&
     test_cmp M.out 18.out &&
     check_cache_at bozbar clean &&
     sum bozbar frotz nitfol >actual18.sum &&
     cmp M.sum actual18.sum
bozbar: clean

ok 17 - 18 - local change already having a good result.

expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo gnusto >bozbar &&
     git update-index --add bozbar &&
     echo gnusto gnusto >bozbar &&
     git read-tree -m -u $treeH $treeM &&
     git ls-files --stage >19.out &&
     test_cmp M.out 19.out &&
     check_cache_at bozbar dirty &&
     sum frotz nitfol >actual19.sum &&
     grep -v bozbar  M.sum > expected19.sum &&
     cmp expected19.sum actual19.sum &&
     sum bozbar frotz nitfol >actual19a.sum &&
     if cmp M.sum actual19a.sum; then false; else :; fi &&
     echo gnusto gnusto >bozbar1 &&
     diff bozbar bozbar1 &&
     rm -f bozbar1
bozbar: dirty
M.sum actual19a.sum differ: char 1, line 1

ok 18 - 19 - local change already having a good result, further modified.

expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo bozbar >bozbar &&
     git update-index --add bozbar &&
     git read-tree -m -u $treeH $treeM &&
     git ls-files --stage >20.out &&
     test_cmp M.out 20.out &&
     check_cache_at bozbar clean &&
     sum bozbar frotz nitfol >actual20.sum &&
     cmp M.sum actual20.sum
bozbar: clean
ok 19 - 20 - no local change, use new tree.
expecting success: rm -f .git/index nitfol bozbar rezrov frotz &&
     git read-tree --reset -u $treeH &&
     echo bozbar >bozbar &&
     git update-index --add bozbar &&
     echo gnusto gnusto >bozbar &&
     if git read-tree -m -u $treeH $treeM; then false; else :; fi

ok 20 - 21 - no local change, dirty cache.

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

ok 21 - DF vs DF/DF case setup.
expecting success: rm -f .git/index &&
     rm -fr DF &&
     echo DF >DF &&
     git update-index --add DF &&
     git read-tree -m -u $treeDF $treeDFDF &&
     git ls-files --stage >DFDFcheck.out &&
     test_cmp DFDF.out DFDFcheck.out &&
     check_cache_at DF/DF clean
DF/DF: clean

ok 22 - DF vs DF/DF case test.

# passed all 22 test(s)
1..22
