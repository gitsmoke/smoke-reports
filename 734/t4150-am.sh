ok 1 - setup: messages
ok 2 - setup
ok 3 - am applies patch correctly
ok 4 - am applies patch e-mail not in a mbox
ok 5 - am applies patch e-mail not in a mbox with CRLF
ok 6 - setup: new author and committer
ok 7 - am changes committer and keeps author
ok 8 - am --signoff adds Signed-off-by: line
ok 9 - am stays in branch
ok 10 - am --signoff does not add Signed-off-by: line if already there
ok 11 - am without --keep removes Re: and [PATCH] stuff
ok 12 - am --keep really keeps the subject
ok 13 - am -3 falls back to 3-way merge
ok 14 - am can rename a file
ok 15 - am -3 can rename a file
ok 16 - am -3 can rename a file after falling back to 3-way merge
ok 17 - am -3 -q is quiet
ok 18 - am pauses on conflict
ok 19 - am --skip works
ok 20 - am --resolved works
ok 21 - am takes patches from a Pine mailbox
ok 22 - am fails on mail without patch
ok 23 - am fails on empty patch
ok 24 - am works from stdin in subdirectory
ok 25 - am works from file (relative path given) in subdirectory
ok 26 - am works from file (absolute path given) in subdirectory
ok 27 - am --committer-date-is-author-date
ok 28 - am without --committer-date-is-author-date
ok 29 - am --ignore-date
ok 30 - am into an unborn branch
ok 31 - am newline in subject
ok 32 - am -q is quiet
# passed all 32 test(s)
1..32
