Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9700-perl-git/.git/
expecting success: echo "test file 1" > file1 &&
     echo "test file 2" > file2 &&
     mkdir directory1 &&
     echo "in directory1" >> directory1/file &&
     mkdir directory2 &&
     echo "in directory2" >> directory2/file &&
     git add . &&
     git commit -m "first commit" &&

     echo "new file in subdir 2" > directory2/file2 &&
     git add . &&
     git commit -m "commit in directory2" &&

     echo "changed file 1" > file1 &&
     git commit -a -m "second commit" &&

     git config --add color.test.slot1 green &&
     git config --add test.string value &&
     git config --add test.dupstring value1 &&
     git config --add test.dupstring value2 &&
     git config --add test.booltrue true &&
     git config --add test.boolfalse no &&
     git config --add test.boolother other &&
     git config --add test.int 2k
     
[master (root-commit) c6bd3e9] first commit
 Author: A U Thor <author@example.com>
 4 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 directory1/file
 create mode 100644 directory2/file
 create mode 100644 file1
 create mode 100644 file2
[master 08f6be4] commit in directory2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 directory2/file2
[master 3010286] second commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - set up test repository

# run 2: Perl API (/usr/bin/perl /Users/trast/git-smoke/t/t9700/test.pl)
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
# expecting no stderr from previous command
# test_external_without_stderr test no stderr: Perl API was ok
