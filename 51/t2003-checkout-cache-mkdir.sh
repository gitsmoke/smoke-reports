ok 1 - setup
ok 2 # skip have symlink in place where dir is expected. (missing SYMLINKS of SYMLINKS)
ok 3 - use --prefix=path2/
ok 4 - use --prefix=tmp-
ok 5 - use --prefix=tmp- but with a conflicting file and dir
ok 6 # skip use --prefix=tmp/orary/ where tmp is a symlink (missing SYMLINKS of SYMLINKS)
ok 7 # skip use --prefix=tmp/orary- where tmp is a symlink (missing SYMLINKS of SYMLINKS)
ok 8 # skip use --prefix=tmp- where tmp-path1 is a symlink (missing SYMLINKS of SYMLINKS)
# passed all 8 test(s)
1..8
