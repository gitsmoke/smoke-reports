Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1000-read-tree-m-3way/.git/
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
expecting success: rm -fr [NDMALTS][NDMALTSF] Z &&
     rm .git/index &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result

ok 45 - 3-way merge with git read-tree -m, empty cache

expecting success: rm -fr [NDMALTS][NDMALTSF] Z &&
     rm .git/index &&
     git read-tree 997bbc4a0a51e0574168a4f637739380edebe4d7 &&
     git checkout-index -f -u -a &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result

ok 46 - 3-way merge with git read-tree -m, match H

expecting success: 
     rm -f .git/index XX &&
     echo XX >XX &&
     git update-index --add XX &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226

ok 47 - 1 - must not have an entry not in A.

expecting success: rm -f .git/index NA &&
     cp .orig-B/NA NA &&
     git update-index --add NA &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226
ok 48 - 2 - must match B in !O && !A && B case.

expecting success: rm -f .git/index NA &&
     cp .orig-B/NA NA &&
     git update-index --add NA &&
     echo extra >>NA &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226

ok 49 - 2 - matching B alone is OK in !O && !A && B case.

expecting success: rm -f .git/index AN &&
     cp .orig-A/AN AN &&
     git update-index --add AN &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result

ok 50 - 3 - must match A in !O && A && !B case.

expecting success: rm -f .git/index AN &&
     cp .orig-A/AN AN &&
     git update-index --add AN &&
     echo extra >>AN &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226

ok 51 - 3 - matching A alone is OK in !O && A && !B case.

expecting success: 
     rm -f .git/index AN &&
     cp .orig-A/AN AN &&
     echo extra >>AN &&
     git update-index --add AN &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226

ok 52 - 3 (fail) - must match A in !O && A && !B case.

expecting success: rm -f .git/index AA &&
     cp .orig-A/AA AA &&
     git update-index --add AA &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result
ok 53 - 4 - must match and be up-to-date in !O && A && B && A!=B case.
expecting success: 
     rm -f .git/index AA &&
     cp .orig-A/AA AA &&
     git update-index --add AA &&
     echo extra >>AA &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226

ok 54 - 4 (fail) - must match and be up-to-date in !O && A && B && A!=B case.

expecting success: 
     rm -f .git/index AA &&
     cp .orig-A/AA AA &&
     echo extra >>AA &&
     git update-index --add AA &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226
ok 55 - 4 (fail) - must match and be up-to-date in !O && A && B && A!=B case.

expecting success: rm -f .git/index LL &&
     cp .orig-A/LL LL &&
     git update-index --add LL &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result

ok 56 - 5 - must match in !O && A && B && A==B case.

expecting success: rm -f .git/index LL &&
     cp .orig-A/LL LL &&
     git update-index --add LL &&
     echo extra >>LL &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result

ok 57 - 5 - must match in !O && A && B && A==B case.

expecting success: 
     rm -f .git/index LL &&
     cp .orig-A/LL LL &&
     echo extra >>LL &&
     git update-index --add LL &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226


ok 58 - 5 (fail) - must match A in !O && A && B && A==B case.

expecting success: 
     rm -f .git/index DD &&
     echo DD >DD &&
     git update-index --add DD &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226

ok 59 - 6 - must not exist in O && !A && !B case

expecting success: 
     rm -f .git/index DM &&
     cp .orig-B/DM DM &&
     git update-index --add DM &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226


ok 60 - 7 - must not exist in O && !A && B && O!=B case

expecting success: 
     rm -f .git/index DN &&
     cp .orig-B/DN DN &&
     git update-index --add DN &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226
ok 61 - 8 - must not exist in O && !A && B && O==B case
expecting success: rm -f .git/index MD &&
     cp .orig-A/MD MD &&
     git update-index --add MD &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result

ok 62 - 9 - must match and be up-to-date in O && A && !B && O!=A case

expecting success: 
     rm -f .git/index MD &&
     cp .orig-A/MD MD &&
     git update-index --add MD &&
     echo extra >>MD &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226

ok 63 - 9 (fail) - must match and be up-to-date in O && A && !B && O!=A case

expecting success: 
     rm -f .git/index MD &&
     cp .orig-A/MD MD &&
     echo extra >>MD &&
     git update-index --add MD &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226
ok 64 - 9 (fail) - must match and be up-to-date in O && A && !B && O!=A case

expecting success: rm -f .git/index ND &&
     cp .orig-A/ND ND &&
     git update-index --add ND &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result

ok 65 - 10 - must match and be up-to-date in O && A && !B && O==A case

expecting success: 
     rm -f .git/index ND &&
     cp .orig-A/ND ND &&
     git update-index --add ND &&
     echo extra >>ND &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226

ok 66 - 10 (fail) - must match and be up-to-date in O && A && !B && O==A case
expecting success: 
     rm -f .git/index ND &&
     cp .orig-A/ND ND &&
     echo extra >>ND &&
     git update-index --add ND &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226
ok 67 - 10 (fail) - must match and be up-to-date in O && A && !B && O==A case

expecting success: rm -f .git/index MM &&
     cp .orig-A/MM MM &&
     git update-index --add MM &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result

ok 68 - 11 - must match and be up-to-date in O && A && B && O!=A && O!=B && A!=B case

expecting success: 
     rm -f .git/index MM &&
     cp .orig-A/MM MM &&
     git update-index --add MM &&
     echo extra >>MM &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226
ok 69 - 11 (fail) - must match and be up-to-date in O && A && B && O!=A && O!=B && A!=B case
expecting success: 
     rm -f .git/index MM &&
     cp .orig-A/MM MM &&
     echo extra >>MM &&
     git update-index --add MM &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226
ok 70 - 11 (fail) - must match and be up-to-date in O && A && B && O!=A && O!=B && A!=B case
expecting success: rm -f .git/index SS &&
     cp .orig-A/SS SS &&
     git update-index --add SS &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result

ok 71 - 12 - must match A in O && A && B && O!=A && A==B case

expecting success: rm -f .git/index SS &&
     cp .orig-A/SS SS &&
     git update-index --add SS &&
     echo extra >>SS &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result

ok 72 - 12 - must match A in O && A && B && O!=A && A==B case

expecting success: 
     rm -f .git/index SS &&
     cp .orig-A/SS SS &&
     echo extra >>SS &&
     git update-index --add SS &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226

ok 73 - 12 (fail) - must match A in O && A && B && O!=A && A==B case
expecting success: rm -f .git/index MN &&
     cp .orig-A/MN MN &&
     git update-index --add MN &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result
ok 74 - 13 - must match A in O && A && B && O!=A && O==B case
expecting success: rm -f .git/index MN &&
     cp .orig-A/MN MN &&
     git update-index --add MN &&
     echo extra >>MN &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result

ok 75 - 13 - must match A in O && A && B && O!=A && O==B case

expecting success: rm -f .git/index NM &&
     cp .orig-A/NM NM &&
     git update-index --add NM &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result

ok 76 - 14 - must match and be up-to-date in O && A && B && O==A && O!=B case

expecting success: rm -f .git/index NM &&
     cp .orig-B/NM NM &&
     git update-index --add NM &&
     echo extra >>NM &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result

ok 77 - 14 - may match B in O && A && B && O==A && O!=B case

expecting success: 
     rm -f .git/index NM &&
     cp .orig-A/NM NM &&
     git update-index --add NM &&
     echo extra >>NM &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226

ok 78 - 14 (fail) - must match and be up-to-date in O && A && B && O==A && O!=B case

expecting success: 
     rm -f .git/index NM &&
     cp .orig-A/NM NM &&
     echo extra >>NM &&
     git update-index --add NM &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226
ok 79 - 14 (fail) - must match and be up-to-date in O && A && B && O==A && O!=B case

expecting success: rm -f .git/index NN &&
     cp .orig-A/NN NN &&
     git update-index --add NN &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result

ok 80 - 15 - must match A in O && A && B && O==A && O==B case

expecting success: rm -f .git/index NN &&
     cp .orig-A/NN NN &&
     git update-index --add NN &&
     echo extra >>NN &&
     git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226 &&
     check_result

ok 81 - 15 - must match A in O && A && B && O==A && O==B case

expecting success: 
     rm -f .git/index NN &&
     cp .orig-A/NN NN &&
     echo extra >>NN &&
     git update-index --add NN &&
     test_must_fail git read-tree -m 3fe085e0589de4327971d50e416fc292dd00fbfe 997bbc4a0a51e0574168a4f637739380edebe4d7 76d47d681d7f1d4fa975334a9a0ba8a6eeea2226

ok 82 - 15 (fail) - must match A in O && A && B && O==A && O==B case

expecting success: rm -f .git/index F16 &&
    echo F16 >F16 &&
    git update-index --add F16 &&
    tree0=`git write-tree` &&
    echo E16 >F16 &&
    git update-index F16 &&
    tree1=`git write-tree` &&
    git read-tree -m $tree0 $tree1 $tree1 $tree0 &&
    git ls-files --stage
100644 ecbec6db011caa3ae26739812f092f76875fe6b6 2	F16
100644 bcf4afda2c30299bf6538240d40bcb8fb3857691 3	F16

ok 83 - 16 - A matches in one and B matches in another.

# passed all 83 test(s)
1..83
