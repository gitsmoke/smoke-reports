Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6005-rev-list-count/.git/
expecting success: 
    for n in 1 2 3 4 5 ; do \
        echo $n > a ; \
        git add a ; \
        git commit -m "$n" ; \
    done
[master (root-commit) 7130bc1] 1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 a
[master b111ba2] 2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master d152d95] 3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 58b4873] 4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master ed63c99] 5
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup
expecting success: 
    test $(git rev-list HEAD | wc -l) = 5

ok 2 - no options
expecting success: 
    test $(git rev-list HEAD --max-count=0 | wc -l) = 0 &&
    test $(git rev-list HEAD --max-count=3 | wc -l) = 3 &&
    test $(git rev-list HEAD --max-count=5 | wc -l) = 5 &&
    test $(git rev-list HEAD --max-count=10 | wc -l) = 5

ok 3 - --max-count

expecting success: 
    test $(git rev-list HEAD --max-count=1 | wc -l) = 1 &&
    test $(git rev-list HEAD -1 | wc -l) = 1 &&
    test $(git rev-list HEAD -n1 | wc -l) = 1 &&
    test $(git rev-list HEAD -n 1 | wc -l) = 1

ok 4 - --max-count all forms

expecting success: 
    test $(git rev-list HEAD --skip=0 | wc -l) = 5 &&
    test $(git rev-list HEAD --skip=3 | wc -l) = 2 &&
    test $(git rev-list HEAD --skip=5 | wc -l) = 0 &&
    test $(git rev-list HEAD --skip=10 | wc -l) = 0

ok 5 - --skip

expecting success: 
    test $(git rev-list HEAD --skip=0 --max-count=0 | wc -l) = 0 &&
    test $(git rev-list HEAD --skip=0 --max-count=10 | wc -l) = 5 &&
    test $(git rev-list HEAD --skip=3 --max-count=0 | wc -l) = 0 &&
    test $(git rev-list HEAD --skip=3 --max-count=1 | wc -l) = 1 &&
    test $(git rev-list HEAD --skip=3 --max-count=2 | wc -l) = 2 &&
    test $(git rev-list HEAD --skip=3 --max-count=10 | wc -l) = 2 &&
    test $(git rev-list HEAD --skip=5 --max-count=10 | wc -l) = 0 &&
    test $(git rev-list HEAD --skip=10 --max-count=10 | wc -l) = 0

ok 6 - --skip --max-count

# passed all 6 test(s)
1..6
