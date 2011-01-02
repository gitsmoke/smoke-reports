Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0030-stripspace/.git/
expecting success: 
    echo "$ttt" >expect &&
    git stripspace <expect >actual &&
    test_cmp expect actual &&

    echo "$ttt$ttt" >expect &&
    git stripspace <expect >actual &&
    test_cmp expect actual &&

    echo "$ttt$ttt$ttt" >expect &&
    git stripspace <expect >actual &&
    test_cmp expect actual &&

    echo "$ttt$ttt$ttt$ttt" >expect &&
    git stripspace <expect >actual &&
    test_cmp expect actual

ok 1 - long lines without spaces should be unchanged

expecting success: 
    echo "$sss$ttt" >expect &&
    git stripspace <expect >actual &&
    test_cmp expect actual &&

    echo "$sss$sss$ttt" >expect &&
    git stripspace <expect >actual &&
    test_cmp expect actual &&

    echo "$sss$sss$sss$ttt" >expect &&
    git stripspace <expect >actual &&
    test_cmp expect actual

ok 2 - lines with spaces at the beginning should be unchanged

expecting success: 
    echo "$ttt$sss$ttt" >expect &&
    git stripspace <expect >actual &&
    test_cmp expect actual &&

    echo "$ttt$sss$sss$ttt" >expect &&
    git stripspace <expect >actual &&
    test_cmp expect actual

ok 3 - lines with intermediate spaces should be unchanged

expecting success: 
    printf "$ttt

$ttt
" > expect &&
    printf "$ttt




$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt$ttt

$ttt
" > expect &&
    printf "$ttt$ttt




$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt$ttt$ttt

$ttt
" > expect &&
    printf "$ttt$ttt$ttt




$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt

$ttt
" > expect &&
    printf "$ttt




$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt

$ttt$ttt
" > expect &&
    printf "$ttt




$ttt$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt

$ttt$ttt$ttt
" > expect &&
    printf "$ttt




$ttt$ttt$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt

$ttt
" > expect &&
    printf "$ttt
	
 

  		
$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt$ttt

$ttt
" > expect &&
    printf "$ttt$ttt
	
 

  		
$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt$ttt$ttt

$ttt
" > expect &&
    printf "$ttt$ttt$ttt
	
 

  		
$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt

$ttt
" > expect &&
    printf "$ttt
	
 

  		
$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt

$ttt$ttt
" > expect &&
    printf "$ttt
	
 

  		
$ttt$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt

$ttt$ttt$ttt
" > expect &&
    printf "$ttt
	
 

  		
$ttt$ttt$ttt
" | git stripspace >actual &&
    test_cmp expect actual

ok 4 - consecutive blank lines should be unified

expecting success: 
    > expect &&

    printf "
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "


" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$sss
$sss
$sss
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$sss$sss
$sss

" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "
$sss
$sss$sss
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$sss$sss$sss$sss


" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "
$sss$sss$sss$sss

" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "

$sss$sss$sss$sss
" | git stripspace >actual &&
    test_cmp expect actual

ok 5 - only consecutive blank lines should be completely removed

expecting success: 
    printf "$ttt
" > expect &&
    printf "
$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt
" > expect &&
    printf "


$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt$ttt
" > expect &&
    printf "


$ttt$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt$ttt$ttt
" > expect &&
    printf "


$ttt$ttt$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt$ttt$ttt$ttt
" > expect &&
    printf "


$ttt$ttt$ttt$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt
" > expect &&

    printf "$sss
$sss
$sss
$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "
$sss
$sss$sss
$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$sss$sss
$sss

$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$sss$sss$sss


$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "
$sss$sss$sss

$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "

$sss$sss$sss
$ttt
" | git stripspace >actual &&
    test_cmp expect actual

ok 6 - consecutive blank lines at the beginning should be removed

expecting success: 
    printf "$ttt
" > expect &&
    printf "$ttt

" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt
" > expect &&
    printf "$ttt



" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt$ttt
" > expect &&
    printf "$ttt$ttt



" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt$ttt$ttt
" > expect &&
    printf "$ttt$ttt$ttt



" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt$ttt$ttt$ttt
" > expect &&
    printf "$ttt$ttt$ttt$ttt



" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt
" > expect &&

    printf "$ttt
$sss
$sss
$sss
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt

$sss
$sss$sss
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt
$sss$sss
$sss

" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt
$sss$sss$sss


" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt

$sss$sss$sss

" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt


$sss$sss$sss
" | git stripspace >actual &&
    test_cmp expect actual

ok 7 - consecutive blank lines at the end should be removed

expecting success: 
    test `printf "$ttt" | git stripspace | wc -l` -gt 0 &&
    test `printf "$ttt$ttt" | git stripspace | wc -l` -gt 0 &&
    test `printf "$ttt$ttt$ttt" | git stripspace | wc -l` -gt 0 &&
    test `printf "$ttt$ttt$ttt$ttt" | git stripspace | wc -l` -gt 0


ok 8 - text without newline at end should end with newline

expecting success: 
    test `printf "$ttt$sss" | git stripspace | wc -l` -gt 0 &&
    test `printf "$ttt$ttt$sss" | git stripspace | wc -l` -gt 0 &&
    test `printf "$ttt$ttt$ttt$sss" | git stripspace | wc -l` -gt 0 &&
    test `printf "$ttt$sss$sss" | git stripspace | wc -l` -gt 0 &&
    test `printf "$ttt$ttt$sss$sss" | git stripspace | wc -l` -gt 0 &&
    test `printf "$ttt$sss$sss$sss" | git stripspace | wc -l` -gt 0


ok 9 - text plus spaces without newline at end should end with newline

expecting success: 
    ! (printf "$ttt$sss" | git stripspace | grep "  " >/dev/null) &&
    ! (printf "$ttt$ttt$sss" | git stripspace | grep "  " >/dev/null) &&
    ! (printf "$ttt$ttt$ttt$sss" | git stripspace | grep "  " >/dev/null) &&
    ! (printf "$ttt$sss$sss" | git stripspace | grep "  " >/dev/null) &&
    ! (printf "$ttt$ttt$sss$sss" | git stripspace | grep "  " >/dev/null) &&
    ! (printf "$ttt$sss$sss$sss" | git stripspace | grep "  " >/dev/null)

ok 10 - text plus spaces without newline at end should not show spaces

expecting success: 
    printf "$ttt
" >expect &&
    printf "$ttt$sss" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt
" >expect &&
    printf "$ttt$sss$sss" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt
" >expect &&
    printf "$ttt$sss$sss$sss" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt$ttt
" >expect &&
    printf "$ttt$ttt$sss" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt$ttt
" >expect &&
    printf "$ttt$ttt$sss$sss" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt$ttt$ttt
" >expect &&
    printf "$ttt$ttt$ttt$sss" | git stripspace >actual &&
    test_cmp expect actual

ok 11 - text plus spaces without newline should show the correct lines

expecting success: 
    ! (echo "$ttt$sss" | git stripspace | grep "  " >/dev/null) &&
    ! (echo "$ttt$ttt$sss" | git stripspace | grep "  " >/dev/null) &&
    ! (echo "$ttt$ttt$ttt$sss" | git stripspace | grep "  " >/dev/null) &&
    ! (echo "$ttt$sss$sss" | git stripspace | grep "  " >/dev/null) &&
    ! (echo "$ttt$ttt$sss$sss" | git stripspace | grep "  " >/dev/null) &&
    ! (echo "$ttt$sss$sss$sss" | git stripspace | grep "  " >/dev/null)

ok 12 - text plus spaces at end should not show spaces

expecting success: 
    echo "$ttt" >expect &&
    echo "$ttt$sss" | git stripspace >actual &&
    test_cmp expect actual &&

    echo "$ttt" >expect &&
    echo "$ttt$sss$sss" | git stripspace >actual &&
    test_cmp expect actual &&

    echo "$ttt" >expect &&
    echo "$ttt$sss$sss$sss" | git stripspace >actual &&
    test_cmp expect actual &&

    echo "$ttt$ttt" >expect &&
    echo "$ttt$ttt$sss" | git stripspace >actual &&
    test_cmp expect actual &&

    echo "$ttt$ttt" >expect &&
    echo "$ttt$ttt$sss$sss" | git stripspace >actual &&
    test_cmp expect actual &&

    echo "$ttt$ttt$ttt" >expect &&
    echo "$ttt$ttt$ttt$sss" | git stripspace >actual &&
    test_cmp expect actual

ok 13 - text plus spaces at end should be cleaned and newline must remain

expecting success: 
    printf "" >expect &&

    echo | git stripspace >actual &&
    test_cmp expect actual &&

    echo "$sss" | git stripspace >actual &&
    test_cmp expect actual &&

    echo "$sss$sss" | git stripspace >actual &&
    test_cmp expect actual &&

    echo "$sss$sss$sss" | git stripspace >actual &&
    test_cmp expect actual &&

    echo "$sss$sss$sss$sss" | git stripspace >actual &&
    test_cmp expect actual

ok 14 - spaces with newline at end should be replaced with empty string

expecting success: 
    ! (printf "" | git stripspace | grep " " >/dev/null) &&
    ! (printf "$sss" | git stripspace | grep " " >/dev/null) &&
    ! (printf "$sss$sss" | git stripspace | grep " " >/dev/null) &&
    ! (printf "$sss$sss$sss" | git stripspace | grep " " >/dev/null) &&
    ! (printf "$sss$sss$sss$sss" | git stripspace | grep " " >/dev/null)

ok 15 - spaces without newline at end should not show spaces

expecting success: 
    printf "" >expect &&

    printf "" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$sss$sss" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$sss$sss$sss" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$sss$sss$sss$sss" | git stripspace >actual &&
    test_cmp expect actual

ok 16 - spaces without newline at end should be replaced with empty string

expecting success: 
    printf "$ttt$ttt
$ttt
" >expect &&
    printf "$ttt$ttt
$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt
$ttt$ttt
$ttt
" >expect &&
    printf "$ttt
$ttt$ttt
$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt
$ttt
$ttt
$ttt$ttt
" >expect &&
    printf "$ttt
$ttt
$ttt
$ttt$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt
$ttt

$ttt$ttt
$ttt
" >expect &&
    printf "$ttt
$ttt

$ttt$ttt
$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt$ttt

$ttt
$ttt$ttt
" >expect &&
    printf "$ttt$ttt

$ttt
$ttt$ttt
" | git stripspace >actual &&
    test_cmp expect actual &&

    printf "$ttt
$ttt$ttt

$ttt
" >expect &&
    printf "$ttt
$ttt$ttt

$ttt
" | git stripspace >actual &&
    test_cmp expect actual

ok 17 - consecutive text lines should be unchanged

expecting success: 
	test ! -z "$(echo "# comment" | git stripspace)" &&
	test -z "$(echo "# comment" | git stripspace -s)"


ok 18 - strip comments, too

# passed all 18 test(s)
1..18
