Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1006-cat-file/.git/
expecting success: 
	echo_without_newline "$hello_content" > hello &&
	git update-index --add hello

ok 1 - setup
expecting success: 
	git cat-file -e $sha1
    

ok 2 - blob exists
expecting success: 
        test $type = "$(git cat-file -t $sha1)"
    

ok 3 - Type of blob is correct

expecting success: 
        test $size = "$(git cat-file -s $sha1)"
    

ok 4 - Size of blob is correct

expecting success: 
	expect="$(maybe_remove_timestamp "$content" $no_ts)"
	actual="$(maybe_remove_timestamp "$(git cat-file $type $sha1)" $no_ts)"

        if test "z$expect" = "z$actual"
	then
		: happy
	else
		echo "Oops: expected $expect"
		echo "but got $actual"
		false
        fi
    

ok 5 - Content of blob is correct

expecting success: 
	expect="$(maybe_remove_timestamp "$pretty_content" $no_ts)"
	actual="$(maybe_remove_timestamp "$(git cat-file -p $sha1)" $no_ts)"
        if test "z$expect" = "z$actual"
	then
		: happy
	else
		echo "Oops: expected $expect"
		echo "but got $actual"
		false
        fi
    

ok 6 - Pretty content of blob is correct

expecting success: 
	expect="$(maybe_remove_timestamp "$batch_output" $no_ts)"
	actual="$(maybe_remove_timestamp "$(echo $sha1 | git cat-file --batch)" $no_ts)"
        if test "z$expect" = "z$actual"
	then
		: happy
	else
		echo "Oops: expected $expect"
		echo "but got $actual"
		false
        fi
    

ok 7 - --batch output of blob is correct

expecting success: 
	expect="$sha1 $type $size"
	actual="$(echo_without_newline $sha1 | git cat-file --batch-check)"
        if test "z$expect" = "z$actual"
	then
		: happy
	else
		echo "Oops: expected $expect"
		echo "but got $actual"
		false
        fi
    

ok 8 - --batch-check output of blob is correct
expecting success: 
	git cat-file -e $sha1
    

ok 9 - tree exists

expecting success: 
        test $type = "$(git cat-file -t $sha1)"
    

ok 10 - Type of tree is correct

expecting success: 
        test $size = "$(git cat-file -s $sha1)"
    

ok 11 - Size of tree is correct

expecting success: 
	expect="$(maybe_remove_timestamp "$pretty_content" $no_ts)"
	actual="$(maybe_remove_timestamp "$(git cat-file -p $sha1)" $no_ts)"
        if test "z$expect" = "z$actual"
	then
		: happy
	else
		echo "Oops: expected $expect"
		echo "but got $actual"
		false
        fi
    

ok 12 - Pretty content of tree is correct

expecting success: 
	expect="$sha1 $type $size"
	actual="$(echo_without_newline $sha1 | git cat-file --batch-check)"
        if test "z$expect" = "z$actual"
	then
		: happy
	else
		echo "Oops: expected $expect"
		echo "but got $actual"
		false
        fi
    

ok 13 - --batch-check output of tree is correct

expecting success: 
	git cat-file -e $sha1
    

ok 14 - commit exists

expecting success: 
        test $type = "$(git cat-file -t $sha1)"
    

ok 15 - Type of commit is correct

expecting success: 
        test $size = "$(git cat-file -s $sha1)"
    

ok 16 - Size of commit is correct

expecting success: 
	expect="$(maybe_remove_timestamp "$content" $no_ts)"
	actual="$(maybe_remove_timestamp "$(git cat-file $type $sha1)" $no_ts)"

        if test "z$expect" = "z$actual"
	then
		: happy
	else
		echo "Oops: expected $expect"
		echo "but got $actual"
		false
        fi
    

ok 17 - Content of commit is correct

expecting success: 
	expect="$(maybe_remove_timestamp "$pretty_content" $no_ts)"
	actual="$(maybe_remove_timestamp "$(git cat-file -p $sha1)" $no_ts)"
        if test "z$expect" = "z$actual"
	then
		: happy
	else
		echo "Oops: expected $expect"
		echo "but got $actual"
		false
        fi
    

ok 18 - Pretty content of commit is correct

expecting success: 
	expect="$(maybe_remove_timestamp "$batch_output" $no_ts)"
	actual="$(maybe_remove_timestamp "$(echo $sha1 | git cat-file --batch)" $no_ts)"
        if test "z$expect" = "z$actual"
	then
		: happy
	else
		echo "Oops: expected $expect"
		echo "but got $actual"
		false
        fi
    

ok 19 - --batch output of commit is correct

expecting success: 
	expect="$sha1 $type $size"
	actual="$(echo_without_newline $sha1 | git cat-file --batch-check)"
        if test "z$expect" = "z$actual"
	then
		: happy
	else
		echo "Oops: expected $expect"
		echo "but got $actual"
		false
        fi
    

ok 20 - --batch-check output of commit is correct
expecting success: 
	git cat-file -e $sha1
    

ok 21 - tag exists

expecting success: 
        test $type = "$(git cat-file -t $sha1)"
    

ok 22 - Type of tag is correct

expecting success: 
        test $size = "$(git cat-file -s $sha1)"
    

ok 23 - Size of tag is correct

expecting success: 
	expect="$(maybe_remove_timestamp "$content" $no_ts)"
	actual="$(maybe_remove_timestamp "$(git cat-file $type $sha1)" $no_ts)"

        if test "z$expect" = "z$actual"
	then
		: happy
	else
		echo "Oops: expected $expect"
		echo "but got $actual"
		false
        fi
    

ok 24 - Content of tag is correct

expecting success: 
	expect="$(maybe_remove_timestamp "$pretty_content" $no_ts)"
	actual="$(maybe_remove_timestamp "$(git cat-file -p $sha1)" $no_ts)"
        if test "z$expect" = "z$actual"
	then
		: happy
	else
		echo "Oops: expected $expect"
		echo "but got $actual"
		false
        fi
    

ok 25 - Pretty content of tag is correct

expecting success: 
	expect="$(maybe_remove_timestamp "$batch_output" $no_ts)"
	actual="$(maybe_remove_timestamp "$(echo $sha1 | git cat-file --batch)" $no_ts)"
        if test "z$expect" = "z$actual"
	then
		: happy
	else
		echo "Oops: expected $expect"
		echo "but got $actual"
		false
        fi
    

ok 26 - --batch output of tag is correct

expecting success: 
	expect="$sha1 $type $size"
	actual="$(echo_without_newline $sha1 | git cat-file --batch-check)"
        if test "z$expect" = "z$actual"
	then
		: happy
	else
		echo "Oops: expected $expect"
		echo "but got $actual"
		false
        fi
    

ok 27 - --batch-check output of tag is correct

expecting success: test 'Hello World' = "$(git cat-file blob bb50ec8a71343279c59ba488a3445888e3fb624b)"

ok 28 - Reach a blob from a tag pointing to it

expecting success: 
	    test_must_fail git cat-file --$batch -$opt $hello_sha1
	

ok 29 - Passing -t with --batch fails

expecting success: 
	    test_must_fail git cat-file -$opt --$batch $hello_sha1
	

ok 30 - Passing --batch with -t fails

expecting success: 
	    test_must_fail git cat-file --$batch -$opt $hello_sha1
	

ok 31 - Passing -s with --batch fails

expecting success: 
	    test_must_fail git cat-file -$opt --$batch $hello_sha1
	

ok 32 - Passing --batch with -s fails

expecting success: 
	    test_must_fail git cat-file --$batch -$opt $hello_sha1
	

ok 33 - Passing -e with --batch fails

expecting success: 
	    test_must_fail git cat-file -$opt --$batch $hello_sha1
	

ok 34 - Passing --batch with -e fails

expecting success: 
	    test_must_fail git cat-file --$batch -$opt $hello_sha1
	

ok 35 - Passing -p with --batch fails

expecting success: 
	    test_must_fail git cat-file -$opt --$batch $hello_sha1
	

ok 36 - Passing --batch with -p fails

expecting success: 
	test_must_fail git cat-file --$batch blob $hello_sha1
    

ok 37 - Passing <type> with --batch fails

expecting success: 
	test_must_fail git cat-file blob --$batch $hello_sha1
    

ok 38 - Passing --batch with <type> fails

expecting success: 
	test_must_fail git cat-file --$batch $hello_sha1
    

ok 39 - Passing sha1 with --batch fails

expecting success: 
	    test_must_fail git cat-file --$batch -$opt $hello_sha1
	

ok 40 - Passing -t with --batch-check fails

expecting success: 
	    test_must_fail git cat-file -$opt --$batch $hello_sha1
	

ok 41 - Passing --batch-check with -t fails

expecting success: 
	    test_must_fail git cat-file --$batch -$opt $hello_sha1
	

ok 42 - Passing -s with --batch-check fails

expecting success: 
	    test_must_fail git cat-file -$opt --$batch $hello_sha1
	

ok 43 - Passing --batch-check with -s fails

expecting success: 
	    test_must_fail git cat-file --$batch -$opt $hello_sha1
	

ok 44 - Passing -e with --batch-check fails

expecting success: 
	    test_must_fail git cat-file -$opt --$batch $hello_sha1
	

ok 45 - Passing --batch-check with -e fails

expecting success: 
	    test_must_fail git cat-file --$batch -$opt $hello_sha1
	

ok 46 - Passing -p with --batch-check fails

expecting success: 
	    test_must_fail git cat-file -$opt --$batch $hello_sha1
	

ok 47 - Passing --batch-check with -p fails

expecting success: 
	test_must_fail git cat-file --$batch blob $hello_sha1
    

ok 48 - Passing <type> with --batch-check fails

expecting success: 
	test_must_fail git cat-file blob --$batch $hello_sha1
    

ok 49 - Passing --batch-check with <type> fails

expecting success: 
	test_must_fail git cat-file --$batch $hello_sha1
    

ok 50 - Passing sha1 with --batch-check fails

expecting success: 
    test "foobar42 missing
foobar84 missing" = \
    "$( ( echo foobar42; echo_without_newline foobar84; ) | git cat-file --batch-check)"


ok 51 - --batch-check for a non-existent named object

expecting success: 
    test "0000000000000000000000000000000000000042 missing
0000000000000000000000000000000000000084 missing" = \
    "$( ( echo 0000000000000000000000000000000000000042;
         echo_without_newline 0000000000000000000000000000000000000084; ) \
       | git cat-file --batch-check)"


ok 52 - --batch-check for a non-existent hash

expecting success: 
    test "$tag_sha1 tag $tag_size
$tag_content
0000000000000000000000000000000000000000 missing" = \
    "$( ( echo $tag_sha1;
         echo_without_newline 0000000000000000000000000000000000000000; ) \
       | git cat-file --batch)"

ok 53 - --batch for an existent and a non-existent hash

expecting success: 
    test " missing" = "$(echo | git cat-file --batch-check)"


ok 54 - --batch-check for an emtpy line

expecting success: 
	test "$(maybe_remove_timestamp "$batch_output" 1)" = "$(maybe_remove_timestamp "$(echo_without_newline "$batch_input" | git cat-file --batch)" 1)"
ok 55 - --batch with multiple sha1s gives correct format
expecting success: 
    test "$batch_check_output" = \
    "$(echo_without_newline "$batch_check_input" | git cat-file --batch-check)"

ok 56 - --batch-check with multiple sha1s gives correct format
# passed all 56 test(s)
1..56
