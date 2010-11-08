ok 1 - multiple '--stdin's are rejected
ok 2 - Can't use --stdin and --stdin-paths together
ok 3 - Can't pass filenames as arguments with --stdin-paths
ok 4 - Can't use --path with --stdin-paths
ok 5 - Can't use --path with --no-filters
ok 6 - hash a file
ok 7 - blob does not exist in database
ok 8 - hash from stdin
ok 9 - blob does not exist in database
ok 10 - hash a file and write to database
ok 11 - blob exists in database
ok 12 - git hash-object --stdin file1 <file0 first operates on file0, then file1
ok 13 - check that appropriate filter is invoke when --path is used
ok 14 - check that --no-filters option works
ok 15 - check that --no-filters option works with --stdin-paths
ok 16 - hash from stdin and write to database (-w --stdin)
ok 17 - blob exists in database
ok 18 - hash from stdin and write to database (--stdin -w)
ok 19 - blob exists in database
ok 20 - hash two files with names on stdin
ok 21 - hash two files with names on stdin and write to database (-w --stdin-paths)
ok 22 - blob exists in database
ok 23 - blob exists in database
ok 24 - hash two files with names on stdin and write to database (--stdin-paths -w)
ok 25 - blob exists in database
ok 26 - blob exists in database
# passed all 26 test(s)
1..26
