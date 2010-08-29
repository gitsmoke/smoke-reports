ok 1 - setup
not ok - 2 rebase -i with the exec command
#	
#		git checkout master &&
#		(
#		FAKE_LINES="1 exec_>touch-one
#			2 exec_>touch-two exec_false exec_>touch-three
#			3 4 exec_>\"touch-file__name_with_spaces\";_>touch-after-semicolon 5" &&
#		export FAKE_LINES &&
#		test_must_fail git rebase -i A
#		) &&
#		test_path_is_file touch-one &&
#		test_path_is_file touch-two &&
#		test_path_is_missing touch-three " (should have stopped before)" &&
#		test $(git rev-parse C) = $(git rev-parse HEAD) || {
#			echo "Stopped at wrong revision:"
#			echo "($(git describe --tags HEAD) instead of C)"
#			false
#		} &&
#		git rebase --continue &&
#		test_path_is_file touch-three &&
#		test_path_is_file "touch-file  name with spaces" &&
#		test_path_is_file touch-after-semicolon &&
#		test $(git rev-parse master) = $(git rev-parse HEAD) || {
#			echo "Stopped at wrong revision:"
#			echo "($(git describe --tags HEAD) instead of master)"
#			false
#		} &&
#		rm -f touch-*
#	
not ok - 3 rebase -i with the exec command runs from tree root
#	
#		git checkout master &&
#		mkdir subdir && cd subdir &&
#		FAKE_LINES="1 exec_>touch-subdir" \
#			git rebase -i HEAD^ &&
#		cd .. &&
#		test_path_is_file touch-subdir &&
#		rm -fr subdir
#	
not ok - 4 rebase -i with the exec command checks tree cleanness
#	
#		git checkout master &&
#		(
#		FAKE_LINES="exec_echo_foo_>file1 1" &&
#		export FAKE_LINES &&
#		test_must_fail git rebase -i HEAD^
#		) &&
#		test $(git rev-parse master^) = $(git rev-parse HEAD) || {
#			echo "Stopped at wrong revision:"
#			echo "($(git describe --tags HEAD) instead of master^)"
#			false
#		} &&
#		git reset --hard &&
#		git rebase --continue
#	
not ok - 5 no changes are a nop
#	
#		git checkout branch2 &&
#		git rebase -i F &&
#		test "$(git symbolic-ref -q HEAD)" = "refs/heads/branch2" &&
#		test $(git rev-parse I) = $(git rev-parse HEAD)
#	
not ok - 6 test the [branch] option
#	
#		git checkout -b dead-end &&
#		git rm file6 &&
#		git commit -m "stop here" &&
#		git rebase -i F branch2 &&
#		test "$(git symbolic-ref -q HEAD)" = "refs/heads/branch2" &&
#		test $(git rev-parse I) = $(git rev-parse branch2) &&
#		test $(git rev-parse I) = $(git rev-parse HEAD)
#	
not ok - 7 test --onto <branch>
#	
#		git checkout -b test-onto branch2 &&
#		git rebase -i --onto branch1 F &&
#		test "$(git symbolic-ref -q HEAD)" = "refs/heads/test-onto" &&
#		test $(git rev-parse HEAD^) = $(git rev-parse branch1) &&
#		test $(git rev-parse I) = $(git rev-parse branch2)
#	
not ok - 8 rebase on top of a non-conflicting commit
#	
#		git checkout branch1 &&
#		git tag original-branch1 &&
#		git rebase -i branch2 &&
#		test file6 = $(git diff --name-only original-branch1) &&
#		test "$(git symbolic-ref -q HEAD)" = "refs/heads/branch1" &&
#		test $(git rev-parse I) = $(git rev-parse branch2) &&
#		test $(git rev-parse I) = $(git rev-parse HEAD~2)
#	
not ok - 9 reflog for the branch shows state before rebase
#	
#		test $(git rev-parse branch1@{1}) = $(git rev-parse original-branch1)
#	
not ok - 10 exchange two commits
#	
#		FAKE_LINES="2 1" git rebase -i HEAD~2 &&
#		test H = $(git cat-file commit HEAD^ | sed -ne \$p) &&
#		test G = $(git cat-file commit HEAD | sed -ne \$p)
#	
not ok - 11 stop on conflicting pick
#	
#		git tag new-branch1 &&
#		test_must_fail git rebase -i master &&
#		test "$(git rev-parse HEAD~3)" = "$(git rev-parse master)" &&
#		test_cmp expect .git/rebase-merge/patch &&
#		test_cmp expect2 file1 &&
#		test "$(git diff --name-status |
#			sed -n -e "/^U/s/^U[^a-z]*//p")" = file1 &&
#		test 4 = $(grep -v "^#" < .git/rebase-merge/done | wc -l) &&
#		test 0 = $(grep -c "^[^#]" < .git/rebase-merge/git-rebase-todo)
#	
not ok - 12 abort
#	
#		git rebase --abort &&
#		test $(git rev-parse new-branch1) = $(git rev-parse HEAD) &&
#		test "$(git symbolic-ref -q HEAD)" = "refs/heads/branch1" &&
#		test_path_is_missing .git/rebase-merge
#	
not ok - 13 abort with error when new base cannot be checked out
#	
#		git rm --cached file1 &&
#		git commit -m "remove file in base" &&
#		test_must_fail git rebase -i master > output 2>&1 &&
#		grep "The following untracked working tree files would be overwritten by checkout:" \
#			output &&
#		grep "file1" output &&
#		test_path_is_missing .git/rebase-merge &&
#		git reset --hard HEAD^
#	
not ok - 14 retain authorship
#	
#		echo A > file7 &&
#		git add file7 &&
#		test_tick &&
#		GIT_AUTHOR_NAME="Twerp Snog" git commit -m "different author" &&
#		git tag twerp &&
#		git rebase -i --onto master HEAD^ &&
#		git show HEAD | grep "^Author: Twerp Snog"
#	
not ok - 15 squash
#	
#		git reset --hard twerp &&
#		echo B > file7 &&
#		test_tick &&
#		GIT_AUTHOR_NAME="Nitfol" git commit -m "nitfol" file7 &&
#		echo "******************************" &&
#		FAKE_LINES="1 squash 2" EXPECT_HEADER_COUNT=2 \
#			git rebase -i --onto master HEAD~2 &&
#		test B = $(cat file7) &&
#		test $(git rev-parse HEAD^) = $(git rev-parse master)
#	
not ok - 16 retain authorship when squashing
#	
#		git show HEAD | grep "^Author: Twerp Snog"
#	
not ok - 17 -p handles "no changes" gracefully
#	
#		HEAD=$(git rev-parse HEAD) &&
#		git rebase -i -p HEAD^ &&
#		git update-index --refresh &&
#		git diff-files --quiet &&
#		git diff-index --quiet --cached HEAD -- &&
#		test $HEAD = $(git rev-parse HEAD)
#	
not ok 18 - exchange two commits with -p # TODO known breakage
not ok - 19 preserve merges with -p
#	
#		git checkout -b to-be-preserved master^ &&
#		: > unrelated-file &&
#		git add unrelated-file &&
#		test_tick &&
#		git commit -m "unrelated" &&
#		git checkout -b another-branch master &&
#		echo B > file1 &&
#		test_tick &&
#		git commit -m J file1 &&
#		test_tick &&
#		git merge to-be-preserved &&
#		echo C > file1 &&
#		test_tick &&
#		git commit -m K file1 &&
#		echo D > file1 &&
#		test_tick &&
#		git commit -m L1 file1 &&
#		git checkout HEAD^ &&
#		echo 1 > unrelated-file &&
#		test_tick &&
#		git commit -m L2 unrelated-file &&
#		test_tick &&
#		git merge another-branch &&
#		echo E > file1 &&
#		test_tick &&
#		git commit -m M file1 &&
#		git checkout -b to-be-rebased &&
#		test_tick &&
#		git rebase -i -p --onto branch1 master &&
#		git update-index --refresh &&
#		git diff-files --quiet &&
#		git diff-index --quiet --cached HEAD -- &&
#		test $(git rev-parse HEAD~6) = $(git rev-parse branch1) &&
#		test $(git rev-parse HEAD~4^2) = $(git rev-parse to-be-preserved) &&
#		test $(git rev-parse HEAD^^2^) = $(git rev-parse HEAD^^^) &&
#		test $(git show HEAD~5:file1) = B &&
#		test $(git show HEAD~3:file1) = C &&
#		test $(git show HEAD:file1) = E &&
#		test $(git show HEAD:unrelated-file) = 1
#	
not ok - 20 edit ancestor with -p
#	
#		FAKE_LINES="1 edit 2 3 4" git rebase -i -p HEAD~3 &&
#		echo 2 > unrelated-file &&
#		test_tick &&
#		git commit -m L2-modified --amend unrelated-file &&
#		git rebase --continue &&
#		git update-index --refresh &&
#		git diff-files --quiet &&
#		git diff-index --quiet --cached HEAD -- &&
#		test $(git show HEAD:unrelated-file) = 2
#	
not ok - 21 --continue tries to commit
#	
#		test_tick &&
#		test_must_fail git rebase -i --onto new-branch1 HEAD^ &&
#		echo resolved > file1 &&
#		git add file1 &&
#		FAKE_COMMIT_MESSAGE="chouette!" git rebase --continue &&
#		test $(git rev-parse HEAD^) = $(git rev-parse new-branch1) &&
#		git show HEAD | grep chouette
#	
not ok - 22 verbose flag is heeded, even after --continue
#	
#		git reset --hard HEAD@{1} &&
#		test_tick &&
#		test_must_fail git rebase -v -i --onto new-branch1 HEAD^ &&
#		echo resolved > file1 &&
#		git add file1 &&
#		git rebase --continue > output &&
#		grep "^ file1 |    2 +-$" output
#	
ok 23 - multi-squash only fires up editor once
not ok - 24 multi-fixup does not fire up editor
#	
#		git checkout -b multi-fixup E &&
#		base=$(git rev-parse HEAD~4) &&
#		FAKE_COMMIT_AMEND="NEVER" FAKE_LINES="1 fixup 2 fixup 3 fixup 4" \
#			git rebase -i $base &&
#		test $base = $(git rev-parse HEAD^) &&
#		test 0 = $(git show | grep NEVER | wc -l) &&
#		git checkout to-be-rebased &&
#		git branch -D multi-fixup
#	
not ok - 25 commit message used after conflict
#	
#		git checkout -b conflict-fixup conflict-branch &&
#		base=$(git rev-parse HEAD~4) &&
#		(
#			FAKE_LINES="1 fixup 3 fixup 4" &&
#			export FAKE_LINES &&
#			test_must_fail git rebase -i $base
#		) &&
#		echo three > conflict &&
#		git add conflict &&
#		FAKE_COMMIT_AMEND="ONCE" EXPECT_HEADER_COUNT=2 \
#			git rebase --continue &&
#		test $base = $(git rev-parse HEAD^) &&
#		test 1 = $(git show | grep ONCE | wc -l) &&
#		git checkout to-be-rebased &&
#		git branch -D conflict-fixup
#	
not ok - 26 commit message retained after conflict
#	
#		git checkout -b conflict-squash conflict-branch &&
#		base=$(git rev-parse HEAD~4) &&
#		(
#			FAKE_LINES="1 fixup 3 squash 4" &&
#			export FAKE_LINES &&
#			test_must_fail git rebase -i $base
#		) &&
#		echo three > conflict &&
#		git add conflict &&
#		FAKE_COMMIT_AMEND="TWICE" EXPECT_HEADER_COUNT=2 \
#			git rebase --continue &&
#		test $base = $(git rev-parse HEAD^) &&
#		test 2 = $(git show | grep TWICE | wc -l) &&
#		git checkout to-be-rebased &&
#		git branch -D conflict-squash
#	
not ok - 27 squash and fixup generate correct log messages
#	
#		git checkout -b squash-fixup E &&
#		base=$(git rev-parse HEAD~4) &&
#		FAKE_COMMIT_AMEND="ONCE" FAKE_LINES="1 fixup 2 squash 3 fixup 4" \
#			EXPECT_HEADER_COUNT=4 \
#			git rebase -i $base &&
#		git cat-file commit HEAD | sed -e 1,/^\$/d > actual-squash-fixup &&
#		test_cmp expect-squash-fixup actual-squash-fixup &&
#		git checkout to-be-rebased &&
#		git branch -D squash-fixup
#	
not ok - 28 squash ignores comments
#	
#		git checkout -b skip-comments E &&
#		base=$(git rev-parse HEAD~4) &&
#		FAKE_COMMIT_AMEND="ONCE" FAKE_LINES="# 1 # squash 2 # squash 3 # squash 4 #" \
#			EXPECT_HEADER_COUNT=4 \
#			git rebase -i $base &&
#		test $base = $(git rev-parse HEAD^) &&
#		test 1 = $(git show | grep ONCE | wc -l) &&
#		git checkout to-be-rebased &&
#		git branch -D skip-comments
#	
not ok - 29 squash ignores blank lines
#	
#		git checkout -b skip-blank-lines E &&
#		base=$(git rev-parse HEAD~4) &&
#		FAKE_COMMIT_AMEND="ONCE" FAKE_LINES="> 1 > squash 2 > squash 3 > squash 4 >" \
#			EXPECT_HEADER_COUNT=4 \
#			git rebase -i $base &&
#		test $base = $(git rev-parse HEAD^) &&
#		test 1 = $(git show | grep ONCE | wc -l) &&
#		git checkout to-be-rebased &&
#		git branch -D skip-blank-lines
#	
not ok - 30 squash works as expected
#	
#		git checkout -b squash-works no-conflict-branch &&
#		one=$(git rev-parse HEAD~3) &&
#		FAKE_LINES="1 squash 3 2" EXPECT_HEADER_COUNT=2 \
#			git rebase -i HEAD~3 &&
#		test $one = $(git rev-parse HEAD~2)
#	
not ok - 31 interrupted squash works as expected
#	
#		git checkout -b interrupted-squash conflict-branch &&
#		one=$(git rev-parse HEAD~3) &&
#		(
#			FAKE_LINES="1 squash 3 2" &&
#			export FAKE_LINES &&
#			test_must_fail git rebase -i HEAD~3
#		) &&
#		(echo one; echo two; echo four) > conflict &&
#		git add conflict &&
#		test_must_fail git rebase --continue &&
#		echo resolved > conflict &&
#		git add conflict &&
#		git rebase --continue &&
#		test $one = $(git rev-parse HEAD~2)
#	
not ok - 32 interrupted squash works as expected (case 2)
#	
#		git checkout -b interrupted-squash2 conflict-branch &&
#		one=$(git rev-parse HEAD~3) &&
#		(
#			FAKE_LINES="3 squash 1 2" &&
#			export FAKE_LINES &&
#			test_must_fail git rebase -i HEAD~3
#		) &&
#		(echo one; echo four) > conflict &&
#		git add conflict &&
#		test_must_fail git rebase --continue &&
#		(echo one; echo two; echo four) > conflict &&
#		git add conflict &&
#		test_must_fail git rebase --continue &&
#		echo resolved > conflict &&
#		git add conflict &&
#		git rebase --continue &&
#		test $one = $(git rev-parse HEAD~2)
#	
not ok - 33 ignore patch if in upstream
#	
#		HEAD=$(git rev-parse HEAD) &&
#		git checkout -b has-cherry-picked HEAD^ &&
#		echo unrelated > file7 &&
#		git add file7 &&
#		test_tick &&
#		git commit -m "unrelated change" &&
#		git cherry-pick $HEAD &&
#		EXPECT_COUNT=1 git rebase -i $HEAD &&
#		test $HEAD = $(git rev-parse HEAD^)
#	
not ok - 34 --continue tries to commit, even for "edit"
#	
#		parent=$(git rev-parse HEAD^) &&
#		test_tick &&
#		FAKE_LINES="edit 1" git rebase -i HEAD^ &&
#		echo edited > file7 &&
#		git add file7 &&
#		FAKE_COMMIT_MESSAGE="chouette!" git rebase --continue &&
#		test edited = $(git show HEAD:file7) &&
#		git show HEAD | grep chouette &&
#		test $parent = $(git rev-parse HEAD^)
#	
not ok - 35 aborted --continue does not squash commits after "edit"
#	
#		old=$(git rev-parse HEAD) &&
#		test_tick &&
#		FAKE_LINES="edit 1" git rebase -i HEAD^ &&
#		echo "edited again" > file7 &&
#		git add file7 &&
#		(
#			FAKE_COMMIT_MESSAGE=" " &&
#			export FAKE_COMMIT_MESSAGE &&
#			test_must_fail git rebase --continue
#		) &&
#		test $old = $(git rev-parse HEAD) &&
#		git rebase --abort
#	
not ok - 36 auto-amend only edited commits after "edit"
#	
#		test_tick &&
#		FAKE_LINES="edit 1" git rebase -i HEAD^ &&
#		echo "edited again" > file7 &&
#		git add file7 &&
#		FAKE_COMMIT_MESSAGE="edited file7 again" git commit &&
#		echo "and again" > file7 &&
#		git add file7 &&
#		test_tick &&
#		(
#			FAKE_COMMIT_MESSAGE="and again" &&
#			export FAKE_COMMIT_MESSAGE &&
#			test_must_fail git rebase --continue
#		) &&
#		git rebase --abort
#	
not ok - 37 rebase a detached HEAD
#	
#		grandparent=$(git rev-parse HEAD~2) &&
#		git checkout $(git rev-parse HEAD) &&
#		test_tick &&
#		FAKE_LINES="2 1" git rebase -i HEAD~2 &&
#		test $grandparent = $(git rev-parse HEAD~2)
#	
not ok - 38 rebase a commit violating pre-commit
#	
#	
#		mkdir -p .git/hooks &&
#		PRE_COMMIT=.git/hooks/pre-commit &&
#		echo "#!/bin/sh" > $PRE_COMMIT &&
#		echo "test -z \"\$(git diff --cached --check)\"" >> $PRE_COMMIT &&
#		chmod a+x $PRE_COMMIT &&
#		echo "monde! " >> file1 &&
#		test_tick &&
#		test_must_fail git commit -m doesnt-verify file1 &&
#		git commit -m doesnt-verify --no-verify file1 &&
#		test_tick &&
#		FAKE_LINES=2 git rebase -i HEAD~2
#	
#	
not ok - 39 rebase with a file named HEAD in worktree
#	
#	
#		rm -fr .git/hooks &&
#		git reset --hard &&
#		git checkout -b branch3 A &&
#	
#		(
#			GIT_AUTHOR_NAME="Squashed Away" &&
#			export GIT_AUTHOR_NAME &&
#			>HEAD &&
#			git add HEAD &&
#			git commit -m "Add head" &&
#			>BODY &&
#			git add BODY &&
#			git commit -m "Add body"
#		) &&
#	
#		FAKE_LINES="1 squash 2" git rebase -i to-be-rebased &&
#		test "$(git show -s --pretty=format:%an)" = "Squashed Away"
#	
#	
not ok - 40 do "noop" when there is nothing to cherry-pick
#	
#	
#		git checkout -b branch4 HEAD &&
#		GIT_EDITOR=: git commit --amend \
#			--author="Somebody else <somebody@else.com>" 
#		test $(git rev-parse branch3) != $(git rev-parse branch4) &&
#		git rebase -i branch3 &&
#		test $(git rev-parse branch3) = $(git rev-parse branch4)
#	
#	
ok 41 - submodule rebase setup
not ok - 42 submodule rebase -i
#	
#		FAKE_LINES="1 squash 2 3" git rebase -i A
#	
not ok - 43 avoid unnecessary reset
#	
#		git checkout master &&
#		test-chmtime =123456789 file3 &&
#		git update-index --refresh &&
#		HEAD=$(git rev-parse HEAD) &&
#		git rebase -i HEAD~4 &&
#		test $HEAD = $(git rev-parse HEAD) &&
#		MTIME=$(test-chmtime -v +0 file3 | sed s/[^0-9].*$//) &&
#		test 123456789 = $MTIME
#	
not ok - 44 reword
#	
#		git checkout -b reword-branch master &&
#		FAKE_LINES="1 2 3 reword 4" FAKE_COMMIT_MESSAGE="E changed" git rebase -i A &&
#		git show HEAD | grep "E changed" &&
#		test $(git rev-parse master) != $(git rev-parse HEAD) &&
#		test $(git rev-parse master^) = $(git rev-parse HEAD^) &&
#		FAKE_LINES="1 2 reword 3 4" FAKE_COMMIT_MESSAGE="D changed" git rebase -i A &&
#		git show HEAD^ | grep "D changed" &&
#		FAKE_LINES="reword 1 2 3 4" FAKE_COMMIT_MESSAGE="B changed" git rebase -i A &&
#		git show HEAD~3 | grep "B changed" &&
#		FAKE_LINES="1 reword 2 3 4" FAKE_COMMIT_MESSAGE="C changed" git rebase -i A &&
#		git show HEAD~2 | grep "C changed"
#	
not ok - 45 rebase -i can copy notes
#	
#		git config notes.rewrite.rebase true &&
#		git config notes.rewriteRef "refs/notes/*" &&
#		test_commit n1 &&
#		test_commit n2 &&
#		test_commit n3 &&
#		git notes add -m"a note" n3 &&
#		git rebase --onto n1 n2 &&
#		test "a note" = "$(git notes show HEAD)"
#	
not ok - 46 rebase -i can copy notes over a fixup
#	
#		git reset --hard n3 &&
#		git notes add -m"an earlier note" n2 &&
#		GIT_NOTES_REWRITE_MODE=concatenate FAKE_LINES="1 fixup 2" git rebase -i n1 &&
#		git notes show > output &&
#		test_cmp expect output
#	
not ok - 47 rebase while detaching HEAD
#	
#		git symbolic-ref HEAD &&
#		grandparent=$(git rev-parse HEAD~2) &&
#		test_tick &&
#		FAKE_LINES="2 1" git rebase -i HEAD~2 HEAD^0 &&
#		test $grandparent = $(git rev-parse HEAD~2) &&
#		test_must_fail git symbolic-ref HEAD
#	
not ok - 48 always cherry-pick with --no-ff
#	
#		git checkout no-ff-branch &&
#		git tag original-no-ff-branch &&
#		git rebase -i --no-ff A &&
#		touch empty &&
#		for p in 0 1 2
#		do
#			test ! $(git rev-parse HEAD~$p) = $(git rev-parse original-no-ff-branch~$p) &&
#			git diff HEAD~$p original-no-ff-branch~$p > out &&
#			test_cmp empty out
#		done &&
#		test $(git rev-parse HEAD~3) = $(git rev-parse original-no-ff-branch~3) &&
#		git diff HEAD~3 original-no-ff-branch~3 > out &&
#		test_cmp empty out
#	
not ok - 49 set up commits with funny messages
#	
#		git checkout -b funny A &&
#		echo >>file1 &&
#		test_tick &&
#		git commit -a -m "end with slash\\" &&
#		echo >>file1 &&
#		test_tick &&
#		git commit -a -m "something (\000) that looks like octal" &&
#		echo >>file1 &&
#		test_tick &&
#		git commit -a -m "something (\n) that looks like a newline" &&
#		echo >>file1 &&
#		test_tick &&
#		git commit -a -m "another commit"
#	
not ok - 50 rebase-i history with funny messages
#	
#		git rev-list A..funny >expect &&
#		test_tick &&
#		FAKE_LINES="1 2 3 4" git rebase -i A &&
#		git rev-list A.. >actual &&
#		test_cmp expect actual
#	
# still have 1 known breakage(s)
# failed 46 among remaining 49 test(s)
1..50
