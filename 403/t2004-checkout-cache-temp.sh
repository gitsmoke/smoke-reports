Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2004-checkout-cache-temp/.git/
expecting success: 
mkdir asubdir &&
echo tree1path0 >path0 &&
echo tree1path1 >path1 &&
echo tree1path3 >path3 &&
echo tree1path4 >path4 &&
echo tree1asubdir/path5 >asubdir/path5 &&
git update-index --add path0 path1 path3 path4 asubdir/path5 &&
t1=$(git write-tree) &&
rm -f path* .merge_* out .git/index &&
echo tree2path0 >path0 &&
echo tree2path1 >path1 &&
echo tree2path2 >path2 &&
echo tree2path4 >path4 &&
git update-index --add path0 path1 path2 path4 &&
t2=$(git write-tree) &&
rm -f path* .merge_* out .git/index &&
echo tree2path0 >path0 &&
echo tree3path1 >path1 &&
echo tree3path2 >path2 &&
echo tree3path3 >path3 &&
git update-index --add path0 path1 path2 path3 &&
t3=$(git write-tree)

ok 1 - preparation

expecting success: 
rm -f path* .merge_* out .git/index &&
git read-tree $t1 &&
git checkout-index --temp -- path1 >out &&
test $(wc -l <out) = 1 &&
test $(cut "-d	" -f2 out) = path1 &&
p=$(cut "-d	" -f1 out) &&
test -f $p &&
test $(cat $p) = tree1path1

ok 2 - checkout one stage 0 to temporary file

expecting success: 
rm -f path* .merge_* out .git/index &&
git read-tree $t1 &&
git checkout-index -a --temp >out &&
test $(wc -l <out) = 5 &&
for f in path0 path1 path3 path4 asubdir/path5
do
	test $(grep $f out | cut "-d	" -f2) = $f &&
	p=$(grep $f out | cut "-d	" -f1) &&
	test -f $p &&
	test $(cat $p) = tree1$f
done

ok 3 - checkout all stage 0 to temporary files

expecting success: 
rm -f path* .merge_* out .git/index &&
git read-tree -m $t1 $t2 $t3

ok 4 - prepare 3-way merge

expecting success: 
rm -f path* .merge_* out &&
git checkout-index --stage=2 --temp -- path1 >out &&
test $(wc -l <out) = 1 &&
test $(cut "-d	" -f2 out) = path1 &&
p=$(cut "-d	" -f1 out) &&
test -f $p &&
test $(cat $p) = tree2path1

ok 5 - checkout one stage 2 to temporary file

expecting success: 
rm -f path* .merge_* out &&
git checkout-index --all --stage=2 --temp >out &&
test $(wc -l <out) = 3 &&
for f in path1 path2 path4
do
	test $(grep $f out | cut "-d	" -f2) = $f &&
	p=$(grep $f out | cut "-d	" -f1) &&
	test -f $p &&
	test $(cat $p) = tree2$f
done

ok 6 - checkout all stage 2 to temporary files

expecting success: 
rm -f path* .merge_* out &&
git checkout-index --stage=all --temp -- path0 >out &&
test $(wc -l <out) = 0

ok 7 - checkout all stages/one file to nothing

expecting success: 
rm -f path* .merge_* out &&
git checkout-index --stage=all --temp -- path1 >out &&
test $(wc -l <out) = 1 &&
test $(cut "-d	" -f2 out) = path1 &&
cut "-d	" -f1 out | (read s1 s2 s3 &&
test -f $s1 &&
test -f $s2 &&
test -f $s3 &&
test $(cat $s1) = tree1path1 &&
test $(cat $s2) = tree2path1 &&
test $(cat $s3) = tree3path1)

ok 8 - checkout all stages/one file to temporary files

expecting success: 
rm -f path* .merge_* out &&
git checkout-index --stage=all --temp -- path2 >out &&
test $(wc -l <out) = 1 &&
test $(cut "-d	" -f2 out) = path2 &&
cut "-d	" -f1 out | (read s1 s2 s3 &&
test $s1 = . &&
test -f $s2 &&
test -f $s3 &&
test $(cat $s2) = tree2path2 &&
test $(cat $s3) = tree3path2)

ok 9 - checkout some stages/one file to temporary files

expecting success: 
rm -f path* .merge_* out &&
git checkout-index -a --stage=all --temp >out &&
test $(wc -l <out) = 5
ok 10 - checkout all stages/all files to temporary files
expecting success: 
test x$(grep path0 out | cut "-d	" -f2) = x

ok 11 - -- path0: no entry
expecting success: 
test $(grep path1 out | cut "-d	" -f2) = path1 &&
grep path1 out | cut "-d	" -f1 | (read s1 s2 s3 &&
test -f $s1 &&
test -f $s2 &&
test -f $s3 &&
test $(cat $s1) = tree1path1 &&
test $(cat $s2) = tree2path1 &&
test $(cat $s3) = tree3path1)

ok 12 - -- path1: all 3 stages

expecting success: 
test $(grep path2 out | cut "-d	" -f2) = path2 &&
grep path2 out | cut "-d	" -f1 | (read s1 s2 s3 &&
test $s1 = . &&
test -f $s2 &&
test -f $s3 &&
test $(cat $s2) = tree2path2 &&
test $(cat $s3) = tree3path2)

ok 13 - -- path2: no stage 1, have stage 2 and 3

expecting success: 
test $(grep path3 out | cut "-d	" -f2) = path3 &&
grep path3 out | cut "-d	" -f1 | (read s1 s2 s3 &&
test -f $s1 &&
test $s2 = . &&
test -f $s3 &&
test $(cat $s1) = tree1path3 &&
test $(cat $s3) = tree3path3)

ok 14 - -- path3: no stage 2, have stage 1 and 3

expecting success: 
test $(grep path4 out | cut "-d	" -f2) = path4 &&
grep path4 out | cut "-d	" -f1 | (read s1 s2 s3 &&
test -f $s1 &&
test -f $s2 &&
test $s3 = . &&
test $(cat $s1) = tree1path4 &&
test $(cat $s2) = tree2path4)

ok 15 - -- path4: no stage 3, have stage 1 and 3

expecting success: 
test $(grep asubdir/path5 out | cut "-d	" -f2) = asubdir/path5 &&
grep asubdir/path5 out | cut "-d	" -f1 | (read s1 s2 s3 &&
test -f $s1 &&
test $s2 = . &&
test $s3 = . &&
test $(cat $s1) = tree1asubdir/path5)

ok 16 - -- asubdir/path5: no stage 2 and 3 have stage 1

expecting success: 
(cd asubdir &&
 git checkout-index -a --stage=all >out &&
 test $(wc -l <out) = 1 &&
 test $(grep path5 out | cut "-d	" -f2) = path5 &&
 grep path5 out | cut "-d	" -f1 | (read s1 s2 s3 &&
 test -f ../$s1 &&
 test $s2 = . &&
 test $s3 = . &&
 test $(cat ../$s1) = tree1asubdir/path5)
)

ok 17 - checkout --temp within subdir

expecting success: 
rm -f path* .merge_* out .git/index &&
ln -s b a &&
git update-index --add a &&
t4=$(git write-tree) &&
rm -f .git/index &&
git read-tree $t4 &&
git checkout-index --temp -a >out &&
test $(wc -l <out) = 1 &&
test $(cut "-d	" -f2 out) = a &&
p=$(cut "-d	" -f1 out) &&
test -f $p &&
test $(cat $p) = b

ok 18 - checkout --temp symlink

# passed all 18 test(s)
1..18
