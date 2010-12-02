ok 1 - setup
ok 2 - custom mergetool
ok 3 - mergetool crlf
ok 4 - mergetool in subdir
ok 5 - mergetool on file in parent dir
ok 6 - mergetool skips autoresolved
not ok - 7 mergetool merges all from subdir
#	
#	    cd subdir && (
#	    git config rerere.enabled false &&
#	    test_must_fail git merge master &&
#	    git mergetool --no-prompt &&
#	    test "$(cat ../file1)" = "master updated" &&
#	    test "$(cat ../file2)" = "master new" &&
#	    test "$(cat file3)" = "master new sub" &&
#	    git add ../file1 ../file2 file3 &&
#	    git commit -m "branch2 resolved by mergetool from subdir") &&
#	    cd ..
#	
# failed 1 among 7 test(s)
1..7
