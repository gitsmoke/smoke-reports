ok 1 - setup
not ok - 2 custom mergetool
#	
#	    git checkout -b test1 branch1 &&
#	    git submodule update -N &&
#	    test_must_fail git merge master >/dev/null 2>&1 &&
#	    ( yes "" | git mergetool file1 file1 ) &&
#	    ( yes "" | git mergetool file2 "spaced name" >/dev/null 2>&1 ) &&
#	    ( yes "" | git mergetool subdir/file3 >/dev/null 2>&1 ) &&
#	    ( yes "d" | git mergetool file11 >/dev/null 2>&1 ) &&
#	    ( yes "d" | git mergetool file12 >/dev/null 2>&1 ) &&
#	    ( yes "l" | git mergetool submod >/dev/null 2>&1 ) &&
#	    test "$(cat file1)" = "master updated" &&
#	    test "$(cat file2)" = "master new" &&
#	    test "$(cat subdir/file3)" = "master new sub" &&
#	    test "$(cat submod/bar)" = "branch1 submodule" &&
#	    git commit -m "branch1 resolved with mergetool"
#	
not ok - 3 mergetool crlf
#	
#	    git config core.autocrlf true &&
#	    git checkout -b test2 branch1 &&
#	    test_must_fail git merge master >/dev/null 2>&1 &&
#	    ( yes "" | git mergetool file1 >/dev/null 2>&1 ) &&
#	    ( yes "" | git mergetool file2 >/dev/null 2>&1 ) &&
#	    ( yes "" | git mergetool "spaced name" >/dev/null 2>&1 ) &&
#	    ( yes "" | git mergetool subdir/file3 >/dev/null 2>&1 ) &&
#	    ( yes "d" | git mergetool file11 >/dev/null 2>&1 ) &&
#	    ( yes "d" | git mergetool file12 >/dev/null 2>&1 ) &&
#	    ( yes "r" | git mergetool submod >/dev/null 2>&1 ) &&
#	    test "$(printf x | cat file1 -)" = "$(printf "master updated
#	x")" &&
#	    test "$(printf x | cat file2 -)" = "$(printf "master new
#	x")" &&
#	    test "$(printf x | cat subdir/file3 -)" = "$(printf "master new sub
#	x")" &&
#	    git submodule update -N &&
#	    test "$(cat submod/bar)" = "master submodule" &&
#	    git commit -m "branch1 resolved with mergetool - autocrlf" &&
#	    git config core.autocrlf false &&
#	    git reset --hard
#	
ok 4 - mergetool in subdir
not ok - 5 mergetool on file in parent dir
#	
#	    (
#		cd subdir &&
#		( yes "" | git mergetool ../file1 >/dev/null 2>&1 ) &&
#		( yes "" | git mergetool ../file2 ../spaced\ name >/dev/null 2>&1 ) &&
#		( yes "d" | git mergetool ../file11 >/dev/null 2>&1 ) &&
#		( yes "d" | git mergetool ../file12 >/dev/null 2>&1 ) &&
#		( yes "l" | git mergetool ../submod >/dev/null 2>&1 ) &&
#		test "$(cat ../file1)" = "master updated" &&
#		test "$(cat ../file2)" = "master new" &&
#		test "$(cat ../submod/bar)" = "branch1 submodule" &&
#		git commit -m "branch1 resolved with mergetool - subdir"
#	    )
#	
not ok - 6 mergetool skips autoresolved
#	
#	    git checkout -b test4 branch1 &&
#	    git submodule update -N &&
#	    test_must_fail git merge master &&
#	    test -n "$(git ls-files -u)" &&
#	    ( yes "d" | git mergetool file11 >/dev/null 2>&1 ) &&
#	    ( yes "d" | git mergetool file12 >/dev/null 2>&1 ) &&
#	    ( yes "l" | git mergetool submod >/dev/null 2>&1 ) &&
#	    output="$(git mergetool --no-prompt)" &&
#	    test "$output" = "No files need merging" &&
#	    git reset --hard
#	
ok 7 - mergetool merges all from subdir
ok 8 - mergetool skips resolved paths when rerere is active
not ok - 9 mergetool takes partial path
#	
#	    git config rerere.enabled false &&
#	    git checkout -b test12 branch1 &&
#	    git submodule update -N &&
#	    test_must_fail git merge master &&
#	
#	    #shouldnt need these lines
#	    #( yes "d" | git mergetool file11 >/dev/null 2>&1 ) &&
#	    #( yes "d" | git mergetool file12 >/dev/null 2>&1 ) &&
#	    #( yes "l" | git mergetool submod >/dev/null 2>&1 ) &&
#	    #( yes "" | git mergetool file1 file2 >/dev/null 2>&1 ) &&
#	
#	    ( yes "" | git mergetool subdir ) &&
#	
#	    test "$(cat subdir/file3)" = "master new sub" &&
#	    git reset --hard
#	
not ok - 10 deleted vs modified submodule
#	
#	    git checkout -b test6 branch1 &&
#	    git submodule update -N &&
#	    mv submod submod-movedaside &&
#	    git rm submod &&
#	    git commit -m "Submodule deleted from branch" &&
#	    git checkout -b test6.a test6 &&
#	    test_must_fail git merge master &&
#	    test -n "$(git ls-files -u)" &&
#	    ( yes "" | git mergetool file1 file2 spaced\ name subdir/file3 >/dev/null 2>&1 ) &&
#	    ( yes "d" | git mergetool file11 file12 >/dev/null 2>&1 ) &&
#	    ( yes "r" | git mergetool submod ) &&
#	    rmdir submod && mv submod-movedaside submod &&
#	    test "$(cat submod/bar)" = "branch1 submodule" &&
#	    git submodule update -N &&
#	    test "$(cat submod/bar)" = "master submodule" &&
#	    output="$(git mergetool --no-prompt)" &&
#	    test "$output" = "No files need merging" &&
#	    git commit -m "Merge resolved by keeping module" &&
#	
#	    mv submod submod-movedaside &&
#	    git checkout -b test6.b test6 &&
#	    git submodule update -N &&
#	    test_must_fail git merge master &&
#	    test -n "$(git ls-files -u)" &&
#	    ( yes "" | git mergetool file1 file2 spaced\ name subdir/file3 >/dev/null 2>&1 ) &&
#	    ( yes "d" | git mergetool file11 file12 >/dev/null 2>&1 ) &&
#	    ( yes "l" | git mergetool submod ) &&
#	    test ! -e submod &&
#	    output="$(git mergetool --no-prompt)" &&
#	    test "$output" = "No files need merging" &&
#	    git commit -m "Merge resolved by deleting module" &&
#	
#	    mv submod-movedaside submod &&
#	    git checkout -b test6.c master &&
#	    git submodule update -N &&
#	    test_must_fail git merge test6 &&
#	    test -n "$(git ls-files -u)" &&
#	    ( yes "" | git mergetool file1 file2 spaced\ name subdir/file3 >/dev/null 2>&1 ) &&
#	    ( yes "d" | git mergetool file11 file12 >/dev/null 2>&1 ) &&
#	    ( yes "r" | git mergetool submod ) &&
#	    test ! -e submod &&
#	    test -d submod.orig &&
#	    git submodule update -N &&
#	    output="$(git mergetool --no-prompt)" &&
#	    test "$output" = "No files need merging" &&
#	    git commit -m "Merge resolved by deleting module" &&
#	    mv submod.orig submod &&
#	
#	    git checkout -b test6.d master &&
#	    git submodule update -N &&
#	    test_must_fail git merge test6 &&
#	    test -n "$(git ls-files -u)" &&
#	    ( yes "" | git mergetool file1 file2 spaced\ name subdir/file3 >/dev/null 2>&1 ) &&
#	    ( yes "d" | git mergetool file11 file12 >/dev/null 2>&1 ) &&
#	    ( yes "l" | git mergetool submod ) &&
#	    test "$(cat submod/bar)" = "master submodule" &&
#	    git submodule update -N &&
#	    test "$(cat submod/bar)" = "master submodule" &&
#	    output="$(git mergetool --no-prompt)" &&
#	    test "$output" = "No files need merging" &&
#	    git commit -m "Merge resolved by keeping module" &&
#	    git reset --hard HEAD
#	
not ok - 11 file vs modified submodule
#	
#	    git checkout -b test7 branch1 &&
#	    git submodule update -N &&
#	    mv submod submod-movedaside &&
#	    git rm submod &&
#	    echo not a submodule >submod &&
#	    git add submod &&
#	    git commit -m "Submodule path becomes file" &&
#	    git checkout -b test7.a branch1 &&
#	    test_must_fail git merge master &&
#	    test -n "$(git ls-files -u)" &&
#	    ( yes "" | git mergetool file1 file2 spaced\ name subdir/file3 >/dev/null 2>&1 ) &&
#	    ( yes "d" | git mergetool file11 file12 >/dev/null 2>&1 ) &&
#	    ( yes "r" | git mergetool submod ) &&
#	    rmdir submod && mv submod-movedaside submod &&
#	    test "$(cat submod/bar)" = "branch1 submodule" &&
#	    git submodule update -N &&
#	    test "$(cat submod/bar)" = "master submodule" &&
#	    output="$(git mergetool --no-prompt)" &&
#	    test "$output" = "No files need merging" &&
#	    git commit -m "Merge resolved by keeping module" &&
#	
#	    mv submod submod-movedaside &&
#	    git checkout -b test7.b test7 &&
#	    test_must_fail git merge master &&
#	    test -n "$(git ls-files -u)" &&
#	    ( yes "" | git mergetool file1 file2 spaced\ name subdir/file3 >/dev/null 2>&1 ) &&
#	    ( yes "d" | git mergetool file11 file12 >/dev/null 2>&1 ) &&
#	    ( yes "l" | git mergetool submod ) &&
#	    git submodule update -N &&
#	    test "$(cat submod)" = "not a submodule" &&
#	    output="$(git mergetool --no-prompt)" &&
#	    test "$output" = "No files need merging" &&
#	    git commit -m "Merge resolved by keeping file" &&
#	
#	    git checkout -b test7.c master &&
#	    rmdir submod && mv submod-movedaside submod &&
#	    test ! -e submod.orig &&
#	    git submodule update -N &&
#	    test_must_fail git merge test7 &&
#	    test -n "$(git ls-files -u)" &&
#	    ( yes "" | git mergetool file1 file2 spaced\ name subdir/file3 >/dev/null 2>&1 ) &&
#	    ( yes "d" | git mergetool file11 file12 >/dev/null 2>&1 ) &&
#	    ( yes "r" | git mergetool submod ) &&
#	    test -d submod.orig &&
#	    git submodule update -N &&
#	    test "$(cat submod)" = "not a submodule" &&
#	    output="$(git mergetool --no-prompt)" &&
#	    test "$output" = "No files need merging" &&
#	    git commit -m "Merge resolved by keeping file" &&
#	
#	    git checkout -b test7.d master &&
#	    rmdir submod && mv submod.orig submod &&
#	    git submodule update -N &&
#	    test_must_fail git merge test7 &&
#	    test -n "$(git ls-files -u)" &&
#	    ( yes "" | git mergetool file1 file2 spaced\ name subdir/file3 >/dev/null 2>&1 ) &&
#	    ( yes "d" | git mergetool file11 file12 >/dev/null 2>&1 ) &&
#	    ( yes "l" | git mergetool submod ) &&
#	    test "$(cat submod/bar)" = "master submodule" &&
#	    git submodule update -N &&
#	    test "$(cat submod/bar)" = "master submodule" &&
#	    output="$(git mergetool --no-prompt)" &&
#	    test "$output" = "No files need merging" &&
#	    git commit -m "Merge resolved by keeping module"
#	
not ok - 12 submodule in subdirectory
#	
#	    git checkout -b test10 branch1 &&
#	    git submodule update -N &&
#	    (
#		cd subdir &&
#		test_create_repo subdir_module &&
#		(
#		    cd subdir_module &&
#		    : >file15 &&
#		    git add file15 &&
#		    git commit -m "add initial versions"
#		)
#	    ) &&
#	    git submodule add git://example.com/subsubmodule subdir/subdir_module &&
#	    git add subdir/subdir_module &&
#	    git commit -m "add submodule in subdirectory" &&
#	
#	    git checkout -b test10.a test10 &&
#	    git submodule update -N &&
#	    (
#		cd subdir/subdir_module &&
#		git checkout -b super10.a &&
#		echo test10.a >file15 &&
#		git add file15 &&
#		git commit -m "on branch 10.a"
#	    ) &&
#	    git add subdir/subdir_module &&
#	    git commit -m "change submodule in subdirectory on test10.a" &&
#	
#	    git checkout -b test10.b test10 &&
#	    git submodule update -N &&
#	    (
#		cd subdir/subdir_module &&
#		git checkout -b super10.b &&
#		echo test10.b >file15 &&
#		git add file15 &&
#		git commit -m "on branch 10.b"
#	    ) &&
#	    git add subdir/subdir_module &&
#	    git commit -m "change submodule in subdirectory on test10.b" &&
#	
#	    test_must_fail git merge test10.a >/dev/null 2>&1 &&
#	    (
#		cd subdir &&
#		( yes "l" | git mergetool subdir_module )
#	    ) &&
#	    test "$(cat subdir/subdir_module/file15)" = "test10.b" &&
#	    git submodule update -N &&
#	    test "$(cat subdir/subdir_module/file15)" = "test10.b" &&
#	    git reset --hard &&
#	    git submodule update -N &&
#	
#	    test_must_fail git merge test10.a >/dev/null 2>&1 &&
#	    ( yes "r" | git mergetool subdir/subdir_module ) &&
#	    test "$(cat subdir/subdir_module/file15)" = "test10.b" &&
#	    git submodule update -N &&
#	    test "$(cat subdir/subdir_module/file15)" = "test10.a" &&
#	    git commit -m "branch1 resolved with mergetool" &&
#	    rm -rf subdir/subdir_module
#	
not ok - 13 directory vs modified submodule
#	
#	    git checkout -b test11 branch1 &&
#	    mv submod submod-movedaside &&
#	    git rm submod &&
#	    mkdir submod &&
#	    echo not a submodule >submod/file16 &&
#	    git add submod/file16 &&
#	    git commit -m "Submodule path becomes directory" &&
#	
#	    test_must_fail git merge master &&
#	    test -n "$(git ls-files -u)" &&
#	    ( yes "l" | git mergetool submod ) &&
#	    test "$(cat submod/file16)" = "not a submodule" &&
#	    rm -rf submod.orig &&
#	
#	    git reset --hard >/dev/null 2>&1 &&
#	    test_must_fail git merge master &&
#	    test -n "$(git ls-files -u)" &&
#	    test ! -e submod.orig &&
#	    ( yes "r" | git mergetool submod ) &&
#	    test -d submod.orig &&
#	    test "$(cat submod.orig/file16)" = "not a submodule" &&
#	    rm -r submod.orig &&
#	    mv submod-movedaside/.git submod &&
#	    ( cd submod && git clean -f && git reset --hard ) &&
#	    git submodule update -N &&
#	    test "$(cat submod/bar)" = "master submodule" &&
#	    git reset --hard >/dev/null 2>&1 && rm -rf submod-movedaside &&
#	
#	    git checkout -b test11.c master &&
#	    git submodule update -N &&
#	    test_must_fail git merge test11 &&
#	    test -n "$(git ls-files -u)" &&
#	    ( yes "l" | git mergetool submod ) &&
#	    git submodule update -N &&
#	    test "$(cat submod/bar)" = "master submodule" &&
#	
#	    git reset --hard >/dev/null 2>&1 &&
#	    git submodule update -N &&
#	    test_must_fail git merge test11 &&
#	    test -n "$(git ls-files -u)" &&
#	    test ! -e submod.orig &&
#	    ( yes "r" | git mergetool submod ) &&
#	    test "$(cat submod/file16)" = "not a submodule" &&
#	
#	    git reset --hard master >/dev/null 2>&1 &&
#	    ( cd submod && git clean -f && git reset --hard ) &&
#	    git submodule update -N
#	
# failed 9 among 13 test(s)
1..13
