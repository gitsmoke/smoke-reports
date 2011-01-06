Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0021-conversion/.git/
expecting success: 
	git config filter.rot13.smudge ./rot13.sh &&
	git config filter.rot13.clean ./rot13.sh &&

	{
	    echo "*.t filter=rot13"
	    echo "*.i ident"
	} >.gitattributes &&

	{
	    echo a b c d e f g h i j k l m
	    echo n o p q r s t u v w x y z
	    echo '$Id$'
	} >test &&
	cat test >test.t &&
	cat test >test.o &&
	cat test >test.i &&
	git add test test.t test.i &&
	rm -f test test.t test.i &&
	git checkout -- test test.t test.i

ok 1 - setup

expecting success: 

	cmp test.o test &&
	cmp test.o test.t &&

	# ident should be stripped in the repository
	git diff --raw --exit-code :test :test.i &&
	id=$(git rev-parse --verify :test) &&
	embedded=$(sed -ne "$script" test.i) &&
	test "z$id" = "z$embedded" &&

	git cat-file blob :test.t > test.r &&

	./rot13.sh < test.o > test.t &&
	cmp test.r test.t


ok 2 - check

expecting success: 
	{
		echo "File with expanded keywords"
		echo "\$Id\$"
		echo "\$Id:\$"
		echo "\$Id: 0000000000000000000000000000000000000000 \$"
		echo "\$Id: NoSpaceAtEnd\$"
		echo "\$Id:NoSpaceAtFront \$"
		echo "\$Id:NoSpaceAtEitherEnd\$"
		echo "\$Id: NoTerminatingSymbol"
		echo "\$Id: Foreign Commit With Spaces \$"
		echo "\$Id: NoTerminatingSymbolAtEOF"
	} > expanded-keywords &&

	{
		echo "File with expanded keywords"
		echo "\$Id: fd0478f5f1486f3d5177d4c3f6eb2765e8fc56b9 \$"
		echo "\$Id: fd0478f5f1486f3d5177d4c3f6eb2765e8fc56b9 \$"
		echo "\$Id: fd0478f5f1486f3d5177d4c3f6eb2765e8fc56b9 \$"
		echo "\$Id: fd0478f5f1486f3d5177d4c3f6eb2765e8fc56b9 \$"
		echo "\$Id: fd0478f5f1486f3d5177d4c3f6eb2765e8fc56b9 \$"
		echo "\$Id: fd0478f5f1486f3d5177d4c3f6eb2765e8fc56b9 \$"
		echo "\$Id: NoTerminatingSymbol"
		echo "\$Id: Foreign Commit With Spaces \$"
		echo "\$Id: NoTerminatingSymbolAtEOF"
	} > expected-output &&

	git add expanded-keywords &&
	git commit -m "File with keywords expanded" &&

	echo "expanded-keywords ident" >> .gitattributes &&

	rm -f expanded-keywords &&
	git checkout -- expanded-keywords &&
	cat expanded-keywords &&
	cmp expanded-keywords expected-output
[master (root-commit) 008e3d5] File with keywords expanded
 Author: A U Thor <author@example.com>
 4 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 expanded-keywords
 create mode 100644 test
 create mode 100644 test.i
 create mode 100644 test.t
File with expanded keywords
$Id: fd0478f5f1486f3d5177d4c3f6eb2765e8fc56b9 $
$Id: fd0478f5f1486f3d5177d4c3f6eb2765e8fc56b9 $
$Id: fd0478f5f1486f3d5177d4c3f6eb2765e8fc56b9 $
$Id: fd0478f5f1486f3d5177d4c3f6eb2765e8fc56b9 $
$Id: fd0478f5f1486f3d5177d4c3f6eb2765e8fc56b9 $
$Id: fd0478f5f1486f3d5177d4c3f6eb2765e8fc56b9 $
$Id: NoTerminatingSymbol
$Id: Foreign Commit With Spaces $
$Id: NoTerminatingSymbolAtEOF

ok 3 - expanded_in_repo
expecting success: 
	cat >argc.sh <<-EOF &&
	#!$SHELL_PATH
	cat >/dev/null
	echo argc: \$# "\$@"
	EOF
	normal=name-no-magic &&
	special="name  with 'sq' and \$x" &&
	echo some test text >"$normal" &&
	echo some test text >"$special" &&
	git add "$normal" "$special" &&
	git commit -q -m "add files" &&
	echo "name* filter=argc" >.gitattributes &&

	# delete the files and check them out again, using a smudge filter
	# that will count the args and echo the command-line back to us
	git config filter.argc.smudge "sh ./argc.sh %f" &&
	rm "$normal" "$special" &&
	git checkout -- "$normal" "$special" &&

	# make sure argc.sh counted the right number of args
	echo "argc: 1 $normal" >expect &&
	test_cmp expect "$normal" &&
	echo "argc: 1 $special" >expect &&
	test_cmp expect "$special" &&

	# do the same thing, but with more args in the filter expression
	git config filter.argc.smudge "sh ./argc.sh %f --my-extra-arg" &&
	rm "$normal" "$special" &&
	git checkout -- "$normal" "$special" &&

	# make sure argc.sh counted the right number of args
	echo "argc: 2 $normal --my-extra-arg" >expect &&
	test_cmp expect "$normal" &&
	echo "argc: 2 $special --my-extra-arg" >expect &&
	test_cmp expect "$special" &&
	:

ok 4 - filter shell-escaped filenames

# passed all 4 test(s)
1..4
