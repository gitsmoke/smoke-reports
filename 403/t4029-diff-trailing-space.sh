Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4029-diff-trailing-space/.git/
expecting success: printf "
x
" > f &&
     git add f &&
     git commit -q -m. f &&
     printf "
y
" > f &&
     git config --bool diff.suppressBlankEmpty true &&
     git diff f > actual &&
     test_cmp exp actual &&
     perl -i.bak -p -e "s/^\$/ /" exp &&
     git config --bool diff.suppressBlankEmpty false &&
     git diff f > actual &&
     test_cmp exp actual &&
     git config --bool --unset diff.suppressBlankEmpty &&
     git diff f > actual &&
     test_cmp exp actual
     

ok 1 - diff honors config option, diff.suppressBlankEmpty

# passed all 1 test(s)
1..1
