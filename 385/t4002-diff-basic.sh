Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4002-diff-basic/.git/
expecting success: git update-index --add $p &&
	    git update-index --add Z/$p

ok 1 - adding test file NN and Z/NN

expecting success: git update-index --add $p &&
	    git update-index --add Z/$p

ok 2 - adding test file ND and Z/ND

expecting success: git update-index --add $p &&
	    git update-index --add Z/$p

ok 3 - adding test file NM and Z/NM

expecting success: git update-index --add $p &&
	    git update-index --add Z/$p

ok 4 - adding test file DN and Z/DN

expecting success: git update-index --add $p &&
	    git update-index --add Z/$p

ok 5 - adding test file DD and Z/DD
expecting success: git update-index --add $p &&
	    git update-index --add Z/$p

ok 6 - adding test file DM and Z/DM

expecting success: git update-index --add $p &&
	    git update-index --add Z/$p

ok 7 - adding test file MN and Z/MN

expecting success: git update-index --add $p &&
	    git update-index --add Z/$p

ok 8 - adding test file MD and Z/MD

expecting success: git update-index --add $p &&
	    git update-index --add Z/$p

ok 9 - adding test file MM and Z/MM

expecting success: git update-index --add SS

ok 10 - adding test file SS

expecting success: git update-index --add TT

ok 11 - adding test file TT

expecting success: tree_O=$(git write-tree)

ok 12 - prepare initial tree

expecting success: git update-index --remove $to_remove

ok 13 - change in branch A (removal)

expecting success: git update-index MD

ok 14 - change in branch A (modification)

expecting success: git update-index MM

ok 15 - change in branch A (modification)

expecting success: git update-index MN

ok 16 - change in branch A (modification)

expecting success: git update-index Z/MD

ok 17 - change in branch A (modification)

expecting success: git update-index Z/MM

ok 18 - change in branch A (modification)

expecting success: git update-index Z/MN

ok 19 - change in branch A (modification)

expecting success: git update-index --add AN

ok 20 - change in branch A (addition)

expecting success: git update-index --add AA

ok 21 - change in branch A (addition)

expecting success: git update-index --add Z/AN

ok 22 - change in branch A (addition)

expecting success: git update-index --add Z/AA

ok 23 - change in branch A (addition)

expecting success: git update-index --add LL &&
     git update-index SS

ok 24 - change in branch A (addition)

expecting success: git update-index TT

ok 25 - change in branch A (edit)

expecting success: git update-index --add DF/DF

ok 26 - change in branch A (change file to directory)

expecting success: tree_A=$(git write-tree)

ok 27 - recording branch A tree

expecting success: git read-tree $tree_O &&
     git checkout-index -a

ok 28 - reading original tree and checking out

expecting success: git update-index --remove DD MD ND Z/DD Z/MD Z/ND

ok 29 - change in branch B (removal)

expecting success: git update-index DM

ok 30 - change in branch B (modification)

expecting success: git update-index MM

ok 31 - change in branch B (modification)

expecting success: git update-index NM

ok 32 - change in branch B (modification)

expecting success: git update-index Z/DM

ok 33 - change in branch B (modification)

expecting success: git update-index Z/MM

ok 34 - change in branch B (modification)

expecting success: git update-index Z/NM

ok 35 - change in branch B (modification)

expecting success: git update-index --add NA

ok 36 - change in branch B (addition)

expecting success: git update-index --add AA

ok 37 - change in branch B (addition)

expecting success: git update-index --add Z/NA

ok 38 - change in branch B (addition)

expecting success: git update-index --add Z/AA

ok 39 - change in branch B (addition)

expecting success: git update-index --add LL &&
     git update-index SS

ok 40 - change in branch B (addition and modification)

expecting success: git update-index TT

ok 41 - change in branch B (modification)

expecting success: git update-index --add DF

ok 42 - change in branch B (addition of a file to conflict with directory)

expecting success: tree_B=$(git write-tree)

ok 43 - recording branch B tree

expecting success: rm -f .git/index &&
     git read-tree $tree_O &&
     mkdir .orig-O &&
     git checkout-index --prefix=.orig-O/ -f -q -a &&
     rm -f .git/index &&
     git read-tree $tree_A &&
     mkdir .orig-A &&
     git checkout-index --prefix=.orig-A/ -f -q -a &&
     rm -f .git/index &&
     git read-tree $tree_B &&
     mkdir .orig-B &&
     git checkout-index --prefix=.orig-B/ -f -q -a

ok 44 - keep contents of 3 trees for easy access
expecting success: git diff-tree $tree_O $tree_A >.test-a &&
     cmp -s .test-a .test-plain-OA

ok 45 - diff-tree of known trees.

expecting success: git diff-tree -r $tree_O $tree_A >.test-a &&
     cmp -s .test-a .test-recursive-OA

ok 46 - diff-tree of known trees.

expecting success: git diff-tree $tree_O $tree_B >.test-a &&
     cmp -s .test-a .test-plain-OB

ok 47 - diff-tree of known trees.

expecting success: git diff-tree -r $tree_O $tree_B >.test-a &&
     cmp -s .test-a .test-recursive-OB

ok 48 - diff-tree of known trees.

expecting success: git diff-tree $tree_A $tree_B >.test-a &&
     cmp -s .test-a .test-plain-AB

ok 49 - diff-tree of known trees.

expecting success: git diff-tree -r $tree_A $tree_B >.test-a &&
     cmp -s .test-a .test-recursive-AB

ok 50 - diff-tree of known trees.

expecting success: echo $tree_A $tree_B | git diff-tree --stdin > .test-a &&
     echo $tree_A $tree_B > .test-plain-ABx &&
     cat .test-plain-AB >> .test-plain-ABx &&
     cmp -s .test-a .test-plain-ABx

ok 51 - diff-tree --stdin of known trees.

expecting success: echo $tree_A $tree_B | git diff-tree -r --stdin > .test-a &&
     echo $tree_A $tree_B > .test-recursive-ABx &&
     cat .test-recursive-AB >> .test-recursive-ABx &&
     cmp -s .test-a .test-recursive-ABx

ok 52 - diff-tree --stdin of known trees.

expecting success: git read-tree $tree_A &&
     git diff-index --cached $tree_O >.test-a &&
     cmp -s .test-a .test-recursive-OA

ok 53 - diff-cache O with A in cache

expecting success: git read-tree $tree_B &&
     git diff-index --cached $tree_O >.test-a &&
     cmp -s .test-a .test-recursive-OB

ok 54 - diff-cache O with B in cache

expecting success: git read-tree $tree_B &&
     git diff-index --cached $tree_A >.test-a &&
     cmp -s .test-a .test-recursive-AB

ok 55 - diff-cache A with B in cache

expecting success: rm -fr Z [A-Z][A-Z] &&
     git read-tree $tree_A &&
     git checkout-index -f -a &&
     git read-tree --reset $tree_O &&
     test_must_fail git update-index --refresh -q &&
     git diff-files >.test-a &&
     cmp_diff_files_output .test-a .test-recursive-OA
DD: needs update
DM: needs update
DN: needs update
MD: needs update
MM: needs update
MN: needs update
SS: needs update
TT: needs update
Z/DD: needs update
Z/DM: needs update
Z/DN: needs update
Z/MD: needs update
Z/MM: needs update
Z/MN: needs update

ok 56 - diff-files with O in cache and A checked out

expecting success: rm -fr Z [A-Z][A-Z] &&
     git read-tree $tree_B &&
     git checkout-index -f -a &&
     git read-tree --reset $tree_O &&
     test_must_fail git update-index --refresh -q &&
     git diff-files >.test-a &&
     cmp_diff_files_output .test-a .test-recursive-OB
DD: needs update
DM: needs update
MD: needs update
MM: needs update
ND: needs update
NM: needs update
SS: needs update
TT: needs update
Z/DD: needs update
Z/DM: needs update
Z/MD: needs update
Z/MM: needs update
Z/ND: needs update
Z/NM: needs update

ok 57 - diff-files with O in cache and B checked out

expecting success: rm -fr Z [A-Z][A-Z] &&
     git read-tree $tree_B &&
     git checkout-index -f -a &&
     git read-tree --reset $tree_A &&
     test_must_fail git update-index --refresh -q &&
     git diff-files >.test-a &&
     cmp_diff_files_output .test-a .test-recursive-AB
AA: needs update
AN: needs update
DF/DF: needs update
MD: needs update
MM: needs update
MN: needs update
ND: needs update
NM: needs update
TT: needs update
Z/AA: needs update
Z/AN: needs update
Z/MD: needs update
Z/MM: needs update
Z/MN: needs update
Z/ND: needs update
Z/NM: needs update

ok 58 - diff-files with A in cache and B checked out

expecting success: git diff-tree $tree_O $tree_A >.test-a &&
    git diff-tree -R $tree_A $tree_O >.test-b &&
    cmp -s .test-a .test-b

ok 59 - diff-tree O A == diff-tree -R A O

expecting success: git diff-tree -r $tree_O $tree_A >.test-a &&
    git diff-tree -r -R $tree_A $tree_O >.test-b &&
    cmp -s .test-a .test-b

ok 60 - diff-tree -r O A == diff-tree -r -R A O

expecting success: git diff-tree $tree_B $tree_A >.test-a &&
    git diff-tree -R $tree_A $tree_B >.test-b &&
    cmp -s .test-a .test-b

ok 61 - diff-tree B A == diff-tree -R A B

expecting success: git diff-tree -r $tree_B $tree_A >.test-a &&
    git diff-tree -r -R $tree_A $tree_B >.test-b &&
    cmp -s .test-a .test-b

ok 62 - diff-tree -r B A == diff-tree -r -R A B

expecting success: test_must_fail git diff --no-index -- MN - < NN |
        grep -v "^index" | sed "s#/-#/NN#" >.test-a &&
    test_must_fail git diff --no-index -- MN NN |
        grep -v "^index" >.test-b &&
    test_cmp .test-a .test-b

ok 63 - diff can read from stdin

# passed all 63 test(s)
1..63
