Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2003-checkout-cache-mkdir/.git/
expecting success: mkdir path1 &&
    echo frotz >path0 &&
    echo rezrov >path1/file1 &&
    git update-index --add path0 path1/file1

ok 1 - setup

expecting success: rm -fr path0 path1 &&
     mkdir path2 &&
     ln -s path2 path1 &&
     git checkout-index -f -a &&
     test ! -h path1 && test -d path1 &&
     test -f path1/file1 && test ! -f path2/file1

ok 2 - have symlink in place where dir is expected.

expecting success: rm -fr path0 path1 path2 &&
     mkdir path2 &&
     git checkout-index --prefix=path2/ -f -a &&
     test -f path2/path0 &&
     test -f path2/path1/file1 &&
     test ! -f path0 &&
     test ! -f path1/file1

ok 3 - use --prefix=path2/

expecting success: rm -fr path0 path1 path2 tmp* &&
     git checkout-index --prefix=tmp- -f -a &&
     test -f tmp-path0 &&
     test -f tmp-path1/file1 &&
     test ! -f path0 &&
     test ! -f path1/file1

ok 4 - use --prefix=tmp-

expecting success: rm -fr path0 path1 path2 tmp* &&
     echo nitfol >tmp-path1 &&
     mkdir tmp-path0 &&
     git checkout-index --prefix=tmp- -f -a &&
     test -f tmp-path0 &&
     test -f tmp-path1/file1 &&
     test ! -f path0 &&
     test ! -f path1/file1

ok 5 - use --prefix=tmp- but with a conflicting file and dir

expecting success: rm -fr path0 path1 path2 tmp* &&
     mkdir tmp1 tmp1/orary &&
     ln -s tmp1 tmp &&
     git checkout-index --prefix=tmp/orary/ -f -a &&
     test -d tmp1/orary &&
     test -f tmp1/orary/path0 &&
     test -f tmp1/orary/path1/file1 &&
     test -h tmp

ok 6 - use --prefix=tmp/orary/ where tmp is a symlink

expecting success: rm -fr path0 path1 path2 tmp* &&
     mkdir tmp1 &&
     ln -s tmp1 tmp &&
     git checkout-index --prefix=tmp/orary- -f -a &&
     test -f tmp1/orary-path0 &&
     test -f tmp1/orary-path1/file1 &&
     test -h tmp

ok 7 - use --prefix=tmp/orary- where tmp is a symlink

expecting success: rm -fr path0 path1 path2 tmp* &&
     mkdir tmp1 &&
     ln -s tmp1 tmp-path1 &&
     git checkout-index --prefix=tmp- -f -a &&
     test -f tmp-path0 &&
     test ! -h tmp-path1 &&
     test -d tmp-path1 &&
     test -f tmp-path1/file1

ok 8 - use --prefix=tmp- where tmp-path1 is a symlink

# passed all 8 test(s)
1..8
