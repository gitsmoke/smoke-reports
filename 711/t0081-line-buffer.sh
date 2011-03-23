ok 1 - setup: have pipes?
ok 2 - hello world
ok 3 - 0-length read, no input available
ok 4 - 0-length read, send along greeting
ok 5 - 1-byte read, no input available
ok 6 - long read (around 8192 bytes)
ok 7 # skip longer read (around 65536 bytes) (missing EXPENSIVE of PIPE,EXPENSIVE)
ok 8 - read from file descriptor
ok 9 - buffer_read_string copes with null byte
ok 10 - skip, copy null byte
ok 11 - read null byte
ok 12 - long reads are truncated
ok 13 - long copies are truncated
ok 14 - long binary reads are truncated
# passed all 14 test(s)
1..14
