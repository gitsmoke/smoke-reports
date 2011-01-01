Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3309-notes-merge-auto-resolve/.git/
expecting success: 
	test_commit 1st &&
	test_commit 2nd &&
	test_commit 3rd &&
	test_commit 4th &&
	test_commit 5th &&
	test_commit 6th &&
	test_commit 7th &&
	test_commit 8th &&
	test_commit 9th &&
	test_commit 10th &&
	test_commit 11th &&
	test_commit 12th &&
	test_commit 13th &&
	test_commit 14th &&
	test_commit 15th
[master (root-commit) 04ed9a0] 1st
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 1st.t
[master 7a4ca6e] 2nd
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 2nd.t
[master d07d62e] 3rd
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 3rd.t
[master 0f7aa3e] 4th
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 4th.t
[master 7f9ad88] 5th
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 5th.t
[master 2c12533] 6th
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 6th.t
[master fb01e0c] 7th
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 7th.t
[master 9a4c31c] 8th
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 8th.t
[master 2e0db4b] 9th
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 9th.t
[master 7c3b87a] 10th
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 10th.t
[master a446fff] 11th
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 11th.t
[master 65e263d] 12th
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 12th.t
[master e871aa6] 13th
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 13th.t
[master 07c85d7] 14th
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 14th.t
[master 4acf42e] 15th
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 15th.t

ok 1 - setup commits
expecting success: 
	git config core.notesRef refs/notes/x &&
	git notes add -m "x notes on 6th commit" 6th &&
	git notes add -m "x notes on 7th commit" 7th &&
	git notes add -m "x notes on 8th commit" 8th &&
	git notes add -m "x notes on 9th commit" 9th &&
	git notes add -m "x notes on 10th commit" 10th &&
	git notes add -m "x notes on 11th commit" 11th &&
	git notes add -m "x notes on 12th commit" 12th &&
	git notes add -m "x notes on 13th commit" 13th &&
	git notes add -m "x notes on 14th commit" 14th &&
	git notes add -m "x notes on 15th commit" 15th

ok 2 - setup merge base (x)
expecting success: verify_notes x x
ok 3 - verify state of merge base (x)
expecting success: 
	git update-ref refs/notes/y refs/notes/x &&
	git config core.notesRef refs/notes/y &&
	git notes add -f -m "y notes on 3rd commit" 3rd &&
	git notes add -f -m "y notes on 4th commit" 4th &&
	git notes add -f -m "y notes on 5th commit" 5th &&
	git notes remove 6th &&
	git notes remove 7th &&
	git notes remove 8th &&
	git notes add -f -m "y notes on 12th commit" 12th &&
	git notes add -f -m "y notes on 13th commit" 13th &&
	git notes add -f -m "y notes on 14th commit" 14th &&
	git notes add -f -m "y notes on 15th commit" 15th
ok 4 - setup local branch (y)
expecting success: verify_notes y y

ok 5 - verify state of local branch (y)

expecting success: 
	git update-ref refs/notes/z refs/notes/x &&
	git config core.notesRef refs/notes/z &&
	git notes add -f -m "z notes on 2nd commit" 2nd &&
	git notes add -f -m "y notes on 4th commit" 4th &&
	git notes add -f -m "z notes on 5th commit" 5th &&
	git notes remove 6th &&
	git notes add -f -m "z notes on 8th commit" 8th &&
	git notes remove 9th &&
	git notes add -f -m "z notes on 11th commit" 11th &&
	git notes remove 12th &&
	git notes add -f -m "y notes on 14th commit" 14th &&
	git notes add -f -m "z notes on 15th commit" 15th
ok 6 - setup remote branch (z)
expecting success: verify_notes z z
ok 7 - verify state of remote branch (z)
expecting success: 
	git config core.notesRef refs/notes/y &&
	test_must_fail git notes merge --strategy=foo z &&
	# Verify no changes (y)
	verify_notes y y
ok 8 - merge z into y with invalid strategy => Fail/No changes
expecting success: 
	git notes merge --strategy=ours z &&
	verify_notes y ours
Using local notes for 4acf42e847e7fffbbf89ee365c20ac7caf40de89
Using local notes for 65e263ded02ae4e8839bc151095113737579dc12
Using local notes for 7f9ad8836c775acb134c0a055fc55fb4cd1ba361
Using local notes for 9a4c31c7f722b5d517e92c64e932dd751e1413bf

ok 9 - merge z into y with "ours" strategy => Non-conflicting 3-way merge

expecting success: 
	git update-ref refs/notes/y refs/notes/y^1 &&
	# Verify pre-merge state
	verify_notes y y

ok 10 - reset to pre-merge state (y)
expecting success: 
	git notes merge --strategy=theirs z &&
	verify_notes y theirs
Using remote notes for 4acf42e847e7fffbbf89ee365c20ac7caf40de89
Using remote notes for 65e263ded02ae4e8839bc151095113737579dc12
Using remote notes for 7f9ad8836c775acb134c0a055fc55fb4cd1ba361
Using remote notes for 9a4c31c7f722b5d517e92c64e932dd751e1413bf

ok 11 - merge z into y with "theirs" strategy => Non-conflicting 3-way merge

expecting success: 
	git update-ref refs/notes/y refs/notes/y^1 &&
	# Verify pre-merge state
	verify_notes y y

ok 12 - reset to pre-merge state (y)
expecting success: 
	git notes merge --strategy=union z &&
	verify_notes y union
Concatenating local and remote notes for 4acf42e847e7fffbbf89ee365c20ac7caf40de89
Concatenating local and remote notes for 65e263ded02ae4e8839bc151095113737579dc12
Concatenating local and remote notes for 7f9ad8836c775acb134c0a055fc55fb4cd1ba361
Concatenating local and remote notes for 9a4c31c7f722b5d517e92c64e932dd751e1413bf

ok 13 - merge z into y with "union" strategy => Non-conflicting 3-way merge

expecting success: 
	git update-ref refs/notes/y refs/notes/y^1 &&
	# Verify pre-merge state
	verify_notes y y

ok 14 - reset to pre-merge state (y)
expecting success: 
	git config core.notesRef refs/notes/z &&
	git notes merge --strategy=union y &&
	verify_notes z union2
Concatenating local and remote notes for 4acf42e847e7fffbbf89ee365c20ac7caf40de89
Concatenating local and remote notes for 65e263ded02ae4e8839bc151095113737579dc12
Concatenating local and remote notes for 7f9ad8836c775acb134c0a055fc55fb4cd1ba361
Concatenating local and remote notes for 9a4c31c7f722b5d517e92c64e932dd751e1413bf

ok 15 - merge y into z with "union" strategy => Non-conflicting 3-way merge
expecting success: 
	git update-ref refs/notes/z refs/notes/z^1 &&
	# Verify pre-merge state
	verify_notes z z

ok 16 - reset to pre-merge state (z)
expecting success: 
	git notes merge --strategy=cat_sort_uniq y &&
	verify_notes z cat_sort_uniq
Concatenating unique lines in local and remote notes for 4acf42e847e7fffbbf89ee365c20ac7caf40de89
Concatenating unique lines in local and remote notes for 65e263ded02ae4e8839bc151095113737579dc12
Concatenating unique lines in local and remote notes for 7f9ad8836c775acb134c0a055fc55fb4cd1ba361
Concatenating unique lines in local and remote notes for 9a4c31c7f722b5d517e92c64e932dd751e1413bf

ok 17 - merge y into z with "cat_sort_uniq" strategy => Non-conflicting 3-way merge

# passed all 17 test(s)
1..17
