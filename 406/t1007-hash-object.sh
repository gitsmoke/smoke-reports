Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1007-hash-object/.git/
expecting success: 
	echo example | test_must_fail git hash-object --stdin --stdin

ok 1 - multiple '--stdin's are rejected

expecting success: 
	echo example | test_must_fail git hash-object --stdin --stdin-paths &&
	echo example | test_must_fail git hash-object --stdin-paths --stdin

ok 2 - Can't use --stdin and --stdin-paths together

expecting success: 
	echo example | test_must_fail git hash-object --stdin-paths hello


ok 3 - Can't pass filenames as arguments with --stdin-paths

expecting success: 
	echo example | test_must_fail git hash-object --stdin-paths --path=foo

ok 4 - Can't use --path with --stdin-paths

expecting success: 
	test_must_fail git hash-object --no-filters --path=foo


ok 5 - Can't use --path with --no-filters
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1007-hash-object/test/.git/
expecting success: 
	test $hello_sha1 = $(git hash-object hello)
ok 6 - hash a file
expecting success: 
		test_must_fail git cat-file blob 5e1c309dae7f45e0f39b1bf3ac3cd9db12e7d689
	
ok 7 - blob does not exist in database
expecting success: 
	test $example_sha1 = $(git hash-object --stdin < example)

ok 8 - hash from stdin
expecting success: 
		test_must_fail git cat-file blob ddd3f836d3e3fbb7ae289aa9ae83536f76956399
	
ok 9 - blob does not exist in database
expecting success: 
	test $hello_sha1 = $(git hash-object -w hello)

ok 10 - hash a file and write to database
expecting success: 
		git cat-file blob 5e1c309dae7f45e0f39b1bf3ac3cd9db12e7d689
	
Hello World
ok 11 - blob exists in database
expecting success: 
	echo foo > file1 &&
	obname0=$(echo bar | git hash-object --stdin) &&
	obname1=$(git hash-object file1) &&
	obname0new=$(echo bar | git hash-object --stdin file1 | sed -n -e 1p) &&
	obname1new=$(echo bar | git hash-object --stdin file1 | sed -n -e 2p) &&
	test "$obname0" = "$obname0new" &&
	test "$obname1" = "$obname1new"

ok 12 - git hash-object --stdin file1 <file0 first operates on file0, then file1

expecting success: 
	echo fooQ | tr Q "\015" >file0 &&
	cp file0 file1 &&
	echo "file0 -crlf" >.gitattributes &&
	echo "file1 crlf" >>.gitattributes &&
	git config core.autocrlf true &&
	file0_sha=$(git hash-object file0) &&
	file1_sha=$(git hash-object file1) &&
	test "$file0_sha" != "$file1_sha" &&
	path1_sha=$(git hash-object --path=file1 file0) &&
	path0_sha=$(git hash-object --path=file0 file1) &&
	test "$file0_sha" = "$path0_sha" &&
	test "$file1_sha" = "$path1_sha" &&
	path1_sha=$(cat file0 | git hash-object --path=file1 --stdin) &&
	path0_sha=$(cat file1 | git hash-object --path=file0 --stdin) &&
	test "$file0_sha" = "$path0_sha" &&
	test "$file1_sha" = "$path1_sha" &&
	git config --unset core.autocrlf

ok 13 - check that appropriate filter is invoke when --path is used

expecting success: 
	echo fooQ | tr Q "\015" >file0 &&
	cp file0 file1 &&
	echo "file0 -crlf" >.gitattributes &&
	echo "file1 crlf" >>.gitattributes &&
	git config core.autocrlf true &&
	file0_sha=$(git hash-object file0) &&
	file1_sha=$(git hash-object file1) &&
	test "$file0_sha" != "$file1_sha" &&
	nofilters_file1=$(git hash-object --no-filters file1) &&
	test "$file0_sha" = "$nofilters_file1" &&
	nofilters_file1=$(cat file1 | git hash-object --stdin) &&
	test "$file0_sha" = "$nofilters_file1" &&
	git config --unset core.autocrlf

ok 14 - check that --no-filters option works

expecting success: 
	echo fooQ | tr Q "\015" >file0 &&
	cp file0 file1 &&
	echo "file0 -crlf" >.gitattributes &&
	echo "file1 crlf" >>.gitattributes &&
	git config core.autocrlf true &&
	file0_sha=$(git hash-object file0) &&
	file1_sha=$(git hash-object file1) &&
	test "$file0_sha" != "$file1_sha" &&
	nofilters_file1=$(echo "file1" | git hash-object --stdin-paths --no-filters) &&
	test "$file0_sha" = "$nofilters_file1" &&
	git config --unset core.autocrlf

ok 15 - check that --no-filters option works with --stdin-paths
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1007-hash-object/test/.git/
expecting success: 
		test $example_sha1 = $(git hash-object $args < example)
	

ok 16 - hash from stdin and write to database (-w --stdin)
expecting success: 
		git cat-file blob ddd3f836d3e3fbb7ae289aa9ae83536f76956399
	
This is an example
ok 17 - blob exists in database
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1007-hash-object/test/.git/
expecting success: 
		test $example_sha1 = $(git hash-object $args < example)
	

ok 18 - hash from stdin and write to database (--stdin -w)
expecting success: 
		git cat-file blob ddd3f836d3e3fbb7ae289aa9ae83536f76956399
	
This is an example
ok 19 - blob exists in database

expecting success: 
	test "$sha1s" = "$(echo_without_newline "$filenames" | git hash-object --stdin-paths)"


ok 20 - hash two files with names on stdin

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1007-hash-object/test/.git/
expecting success: 
		test "$sha1s" = "$(echo_without_newline "$filenames" | git hash-object $args)"
	

ok 21 - hash two files with names on stdin and write to database (-w --stdin-paths)
expecting success: 
		git cat-file blob 5e1c309dae7f45e0f39b1bf3ac3cd9db12e7d689
	
Hello World
ok 22 - blob exists in database
expecting success: 
		git cat-file blob ddd3f836d3e3fbb7ae289aa9ae83536f76956399
	
This is an example
ok 23 - blob exists in database
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1007-hash-object/test/.git/
expecting success: 
		test "$sha1s" = "$(echo_without_newline "$filenames" | git hash-object $args)"
	

ok 24 - hash two files with names on stdin and write to database (--stdin-paths -w)
expecting success: 
		git cat-file blob 5e1c309dae7f45e0f39b1bf3ac3cd9db12e7d689
	
Hello World
ok 25 - blob exists in database
expecting success: 
		git cat-file blob ddd3f836d3e3fbb7ae289aa9ae83536f76956399
	
This is an example
ok 26 - blob exists in database
# passed all 26 test(s)
1..26
