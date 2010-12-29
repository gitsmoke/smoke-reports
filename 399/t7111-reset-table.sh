Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7111-reset-table/.git/
expecting success: 
    test_commit E file1 &&
    test_commit D file1 &&
    test_commit C file1

[master (root-commit) 8464dc0] E
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1
[master 2131783] D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 4bb0b07] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - creating initial commits

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 2 - check: A B C D --soft A B D

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C
Unstaged changes after reset:
M	file1

ok 3 - check: A B C D --mixed A D D

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C
HEAD is now at 2131783 D

ok 4 - check: A B C D --hard D D D

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 5 - check: A B C D --merge XXXXX  

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 6 - check: A B C D --keep XXXXX  

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 7 - check: A B C C --soft A B C

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C
Unstaged changes after reset:
M	file1

ok 8 - check: A B C C --mixed A C C

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C
HEAD is now at 4bb0b07 C

ok 9 - check: A B C C --hard C C C

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 10 - check: A B C C --merge XXXXX  

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 11 - check: A B C C --keep A C C

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 12 - check: B B C D --soft B B D

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C
Unstaged changes after reset:
M	file1

ok 13 - check: B B C D --mixed B D D

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C
HEAD is now at 2131783 D

ok 14 - check: B B C D --hard D D D

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 15 - check: B B C D --merge D D D

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 16 - check: B B C D --keep XXXXX  

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 17 - check: B B C C --soft B B C

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C
Unstaged changes after reset:
M	file1

ok 18 - check: B B C C --mixed B C C

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C
HEAD is now at 4bb0b07 C

ok 19 - check: B B C C --hard C C C

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 20 - check: B B C C --merge C C C

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C
ok 21 - check: B B C C --keep B C C

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 22 - check: B C C D --soft B C D

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C
Unstaged changes after reset:
M	file1

ok 23 - check: B C C D --mixed B D D

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C
HEAD is now at 2131783 D

ok 24 - check: B C C D --hard D D D

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 25 - check: B C C D --merge XXXXX  

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 26 - check: B C C D --keep XXXXX  

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 27 - check: B C C C --soft B C C

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C
Unstaged changes after reset:
M	file1

ok 28 - check: B C C C --mixed B C C

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C
HEAD is now at 4bb0b07 C

ok 29 - check: B C C C --hard C C C

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 30 - check: B C C C --merge B C C

expecting success: 
	git reset --hard C &&
	if test "$I1" != "$H1"
	then
	    echo "$I1" >file1 &&
	    git add file1
	fi &&
	if test "$W1" != "$I1"
	then
	    echo "$W1" >file1
	fi &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    test "$(cat file1)" = "$W2" &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at 4bb0b07 C

ok 31 - check: B C C C --keep B C C

expecting success: 
    git reset --hard C &&
    git branch branch1 &&
    git branch branch2 &&
    git checkout branch1 &&
    test_commit B1 file1 &&
    git checkout branch2 &&
    test_commit B file1

HEAD is now at 4bb0b07 C
[branch1 5456cd2] B1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[branch2 aa272d3] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 32 - setting up branches to test with unmerged entries

expecting success: 
	git reset --hard B &&
	test_must_fail git merge branch1 &&
	cat file1 >X_file1 &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    if test "$W2" = "X"
	    then
		test_cmp file1 X_file1
	    else
		test "$(cat file1)" = "$W2"
	    fi &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at aa272d3 B
Merging:
aa272d3 B
virtual branch1
found 1 common ancestor(s):
4bb0b07 C
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.

ok 33 - check: X U B C --soft XXXXX  

expecting success: 
	git reset --hard B &&
	test_must_fail git merge branch1 &&
	cat file1 >X_file1 &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    if test "$W2" = "X"
	    then
		test_cmp file1 X_file1
	    else
		test "$(cat file1)" = "$W2"
	    fi &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at aa272d3 B
Merging:
aa272d3 B
virtual branch1
found 1 common ancestor(s):
4bb0b07 C
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.
Unstaged changes after reset:
M	file1

ok 34 - check: X U B C --mixed X C C

expecting success: 
	git reset --hard B &&
	test_must_fail git merge branch1 &&
	cat file1 >X_file1 &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    if test "$W2" = "X"
	    then
		test_cmp file1 X_file1
	    else
		test "$(cat file1)" = "$W2"
	    fi &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at aa272d3 B
Merging:
aa272d3 B
virtual branch1
found 1 common ancestor(s):
4bb0b07 C
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.
HEAD is now at 4bb0b07 C

ok 35 - check: X U B C --hard C C C

expecting success: 
	git reset --hard B &&
	test_must_fail git merge branch1 &&
	cat file1 >X_file1 &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    if test "$W2" = "X"
	    then
		test_cmp file1 X_file1
	    else
		test "$(cat file1)" = "$W2"
	    fi &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at aa272d3 B
Merging:
aa272d3 B
virtual branch1
found 1 common ancestor(s):
4bb0b07 C
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.

ok 36 - check: X U B C --merge C C C

expecting success: 
	git reset --hard B &&
	test_must_fail git merge branch1 &&
	cat file1 >X_file1 &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    if test "$W2" = "X"
	    then
		test_cmp file1 X_file1
	    else
		test "$(cat file1)" = "$W2"
	    fi &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at aa272d3 B
Merging:
aa272d3 B
virtual branch1
found 1 common ancestor(s):
4bb0b07 C
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.

ok 37 - check: X U B C --keep XXXXX  

expecting success: 
	git reset --hard B &&
	test_must_fail git merge branch1 &&
	cat file1 >X_file1 &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    if test "$W2" = "X"
	    then
		test_cmp file1 X_file1
	    else
		test "$(cat file1)" = "$W2"
	    fi &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at aa272d3 B
Merging:
aa272d3 B
virtual branch1
found 1 common ancestor(s):
4bb0b07 C
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.
ok 38 - check: X U B B --soft XXXXX  

expecting success: 
	git reset --hard B &&
	test_must_fail git merge branch1 &&
	cat file1 >X_file1 &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    if test "$W2" = "X"
	    then
		test_cmp file1 X_file1
	    else
		test "$(cat file1)" = "$W2"
	    fi &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at aa272d3 B
Merging:
aa272d3 B
virtual branch1
found 1 common ancestor(s):
4bb0b07 C
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.
Unstaged changes after reset:
M	file1

ok 39 - check: X U B B --mixed X B B

expecting success: 
	git reset --hard B &&
	test_must_fail git merge branch1 &&
	cat file1 >X_file1 &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    if test "$W2" = "X"
	    then
		test_cmp file1 X_file1
	    else
		test "$(cat file1)" = "$W2"
	    fi &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at aa272d3 B
Merging:
aa272d3 B
virtual branch1
found 1 common ancestor(s):
4bb0b07 C
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.
HEAD is now at aa272d3 B
ok 40 - check: X U B B --hard B B B
expecting success: 
	git reset --hard B &&
	test_must_fail git merge branch1 &&
	cat file1 >X_file1 &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    if test "$W2" = "X"
	    then
		test_cmp file1 X_file1
	    else
		test "$(cat file1)" = "$W2"
	    fi &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at aa272d3 B
Merging:
aa272d3 B
virtual branch1
found 1 common ancestor(s):
4bb0b07 C
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.

ok 41 - check: X U B B --merge B B B

expecting success: 
	git reset --hard B &&
	test_must_fail git merge branch1 &&
	cat file1 >X_file1 &&
	if test "$W2" != "XXXXX"
	then
	    git reset --$opt $T &&
	    if test "$W2" = "X"
	    then
		test_cmp file1 X_file1
	    else
		test "$(cat file1)" = "$W2"
	    fi &&
	    git checkout-index -f -- file1 &&
	    test "$(cat file1)" = "$I2" &&
	    git checkout -f HEAD -- file1 &&
	    test "$(cat file1)" = "$H2"
	else
	    test_must_fail git reset --$opt $T
	fi
    
HEAD is now at aa272d3 B
Merging:
aa272d3 B
virtual branch1
found 1 common ancestor(s):
4bb0b07 C
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.

ok 42 - check: X U B B --keep XXXXX  

# passed all 42 test(s)
1..42
