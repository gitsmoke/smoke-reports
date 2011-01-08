Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3307-notes-man/.git/
expecting success: 
	test_commit A &&
	test_commit B &&
	test_commit C
[master (root-commit) 0ddfaf1] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A.t
[master d9df450] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B.t
[master 35a8500] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C.t

ok 1 - setup
expecting success: 
	cat <<-\EOF >expect &&
	    B

	Notes:
	    Acked-by: A C Ker <acker@example.com>
	EOF
	git notes add -m "Acked-by: A C Ker <acker@example.com>" B &&
	git show -s B^{commit} >log &&
	tail -n 4 log >actual &&
	test_cmp expect actual

ok 2 - example 1: notes to add an Acked-by line

expecting success: 
	cp "$TEST_DIRECTORY"/test4012.png . &&
	git checkout B &&
	blob=$(git hash-object -w test4012.png) &&
	git notes --ref=logo add -C "$blob" &&
	git notes --ref=logo copy B C &&
	git notes --ref=logo show C >actual &&
	test_cmp test4012.png actual
ok 3 - example 2: binary notes
# passed all 3 test(s)
1..3
