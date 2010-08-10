ok 1 - set up test repository
# run 2: Perl API (/usr/bin/perl /tmp/build-and-install-git-olpK/t/t9700/test.pl)
ok 2 - use Git;
ok 3 - open repository
ok 4 - config scalar: string
ok 5 - config array: string
ok 6 - config scalar: nonexistent
ok 7 - config array: nonexistent
ok 8 - config_int: integer
ok 9 - config_int: nonexistent
ok 10 - config_bool: true
ok 11 - config_bool: false
ok 12 - get_color
ok 13 - config: duplicate entry in scalar context fails
ok 14 - config_bool: non-boolean values fail
ok 15 - ident scalar: author (type)
ok 16 - ident scalar: committer (type)
ok 17 - ident scalar: invalid ident string (no parsing)
ok 18 - ident array: author
ok 19 - ident array: author
ok 20 - ident array: ident string
ok 21 - ident array: invalid ident string
ok 22 - ident_person: author (type)
ok 23 - ident_person: ident string
ok 24 - ident_person: array
ok 25 - (get file hash)
ok 26 - cat_blob: size
ok 27 - cat_blob: data
ok 28 - hash_object: roundtrip
ok 29 - hash_and_insert_object: returns hash
ok 30 - cat_blob: roundtrip size
ok 31 - cat_blob: roundtrip data
ok 32 - repo_path
ok 33 - wc_path
ok 34 - wc_subdir initial
ok 35 - wc_subdir after wc_chdir
ok 36 - config after wc_chdir
ok 37 - repo_path (2)
ok 38 - wc_path (2)
ok 39 - wc_subdir initial (2)
ok 40 - rev-parse returned hash
ok 41 - log . does not show last commit
1..41
# test_external test Perl API was ok
# test_external_without_stderr test no stderr: Perl API was ok
