ok 1 - setup
ok 2 - custom mergetool
ok 3 - mergetool crlf
ok 4 - mergetool in subdir
ok 5 - mergetool on file in parent dir
not ok - 6 mergetool skips autoresolved
#	
#	    git checkout -b test4 branch1 &&
#	    test_must_fail git merge master &&
#	    test -n "$(git ls-files -u)" &&
#	    output="$(git mergetool --no-prompt)" &&
#	    test "$output" = "No files need merging" &&
#	    git reset --hard
#	
ok 7 - mergetool merges all from subdir
# failed 1 among 7 test(s)
1..7
