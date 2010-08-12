ok 1 - setup
ok 2 - am applies patch correctly
ok 3 - am applies patch e-mail not in a mbox
ok 4 - am applies patch e-mail not in a mbox with CRLF
ok 5 - am changes committer and keeps author
ok 6 - am --signoff adds Signed-off-by: line
ok 7 - am stays in branch
ok 8 - am --signoff does not add Signed-off-by: line if already there
ok 9 - am without --keep removes Re: and [PATCH] stuff
ok 10 - am --keep really keeps the subject
ok 11 - am -3 falls back to 3-way merge
ok 12 - am -3 -q is quiet
ok 13 - am pauses on conflict
ok 14 - am --skip works
ok 15 - am --resolved works
ok 16 - am takes patches from a Pine mailbox
ok 17 - am fails on mail without patch
ok 18 - am fails on empty patch
ok 19 - am works from stdin in subdirectory
ok 20 - am works from file (relative path given) in subdirectory
ok 21 - am works from file (absolute path given) in subdirectory
ok 22 - am --committer-date-is-author-date
ok 23 - am without --committer-date-is-author-date
ok 24 - am --ignore-date
ok 25 - am into an unborn branch
ok 26 - am newline in subject
ok 27 - am -q is quiet
# passed all 27 test(s)
1..27
