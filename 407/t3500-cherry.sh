Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3500-cherry/.git/
expecting success: echo First > A &&
     git update-index --add A &&
     test_tick &&
     git commit -m "Add A." &&

     git checkout -b my-topic-branch &&

     echo Second > B &&
     git update-index --add B &&
     test_tick &&
     git commit -m "Add B." &&

     echo AnotherSecond > C &&
     git update-index --add C &&
     test_tick &&
     git commit -m "Add C." &&

     git checkout -f master &&
     rm -f B C &&

     echo Third >> A &&
     git update-index A &&
     test_tick &&
     git commit -m "Modify A." &&

     expr "$(echo $(git cherry master my-topic-branch) )" : "+ [^ ]* + .*"
[master (root-commit) 4655d1a] Add A.
 Author: A U Thor <bogus_email_address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A
[my-topic-branch 75dd694] Add B.
 Author: A U Thor <bogus_email_address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B
[my-topic-branch c8d60d2] Add C.
 Author: A U Thor <bogus_email_address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C
[master 90cb8ed] Modify A.
 Author: A U Thor <bogus_email_address>
 1 files changed, 1 insertions(+), 0 deletions(-)
85

ok 1 - prepare repository with topic branch, and check cherry finds the 2 patches from there

expecting success: expr "$(echo $(git cherry master my-topic-branch my-topic-branch^1) )" : "+ [^ ]*"

42

ok 2 - check that cherry with limit returns only the top patch

expecting success: git cherry-pick my-topic-branch^0 &&
     echo $(git cherry master my-topic-branch) &&
     expr "$(echo $(git cherry master my-topic-branch) )" : "+ [^ ]* - .*"

[master 3a1a38a] Add C.
 Author: A U Thor <bogus_email_address>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C
+ 75dd694131e593dac8cf8ea0a377f1b73a80c1ad - c8d60d26f42936e7a055747f5412d41a6bce7d77
85

ok 3 - cherry-pick one of the 2 patches, and check cherry recognized one and only one as new

# passed all 3 test(s)
1..3
