ok 1 - -C option copies authorship and message
ok 2 - -C option copies only the message with --reset-author
ok 3 - -c option copies authorship and message
ok 4 - -c option copies only the message with --reset-author
ok 5 - --amend option copies authorship
ok 6 - --amend option with empty author
ok 7 - --amend option with missing author
ok 8 - --reset-author makes the commit ours even with --amend option
ok 9 - --reset-author and --author are mutually exclusive
ok 10 - --reset-author should be rejected without -c/-C/--amend
ok 11 - commit respects CHERRY_PICK_HEAD and MERGE_MSG
ok 12 - --reset-author with CHERRY_PICK_HEAD
# passed all 12 test(s)
1..12
