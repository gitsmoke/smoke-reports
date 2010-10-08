ok 1 - set up basic repo with 1 file (hello) and 4 commits
ok 2 - bisect starts with only one bad
ok 3 - bisect does not start with only one good
ok 4 - bisect start with one bad and good
ok 5 - bisect fails if given any junk instead of revs
ok 6 - bisect reset: back in the master branch
ok 7 - bisect reset: back in another branch
ok 8 - bisect reset when not bisecting
ok 9 - bisect reset removes packed refs
ok 10 - bisect start: back in good branch
ok 11 - bisect start: no ".git/BISECT_START" if junk rev
ok 12 - bisect start: no ".git/BISECT_START" if mistaken rev
ok 13 - bisect start: no ".git/BISECT_START" if checkout error
ok 14 - bisect skip: successfull result
ok 15 - bisect skip: cannot tell between 3 commits
ok 16 - bisect skip: cannot tell between 2 commits
ok 17 - bisect skip: with commit both bad and skipped
ok 18 - "git bisect run" simple case
ok 19 - "git bisect run" with more complex "git bisect start"
ok 20 - bisect skip: add line and then a new test
ok 21 - bisect skip and bisect replay
ok 22 - bisect run & skip: cannot tell between 2
ok 23 - bisect run & skip: find first bad
ok 24 - bisect skip only one range
ok 25 - bisect skip many ranges
ok 26 - bisect starting with a detached HEAD
ok 27 - bisect errors out if bad and good are mistaken
ok 28 - bisect does not create a "bisect" branch
ok 29 - side branch creation
ok 30 - good merge base when good and bad are siblings
ok 31 - skipped merge base when good and bad are siblings
ok 32 - bad merge base when good and bad are siblings
ok 33 - many merge bases creation
ok 34 - good merge bases when good and bad are siblings
ok 35 - optimized merge base checks
ok 36 - "parallel" side branch creation
ok 37 - restricting bisection on one dir
ok 38 - restricting bisection on one dir and a file
ok 39 - skipping away from skipped commit
ok 40 - erroring out when using bad path parameters
# passed all 40 test(s)
1..40
