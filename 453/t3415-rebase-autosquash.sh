ok 1 - setup
ok 2 - auto fixup (option)
ok 3 - auto fixup (config)
ok 4 - auto squash (option)
ok 5 - auto squash (config)
ok 6 - misspelled auto squash
not ok - 7 auto squash that matches 2 commits
#	
#		git reset --hard base &&
#		echo 4 >file4 &&
#		git add file4 &&
#		test_tick &&
#		git commit -m "first new commit" &&
#		echo 1 >file1 &&
#		git add -u &&
#		test_tick &&
#		git commit -m "squash! first" &&
#		git tag final-multisquash &&
#		test_tick &&
#		git rebase --autosquash -i HEAD~4 &&
#		git log --oneline >actual &&
#		test 4 = $(wc -l <actual) &&
#		git diff --exit-code final-multisquash &&
#		test 1 = "$(git cat-file blob HEAD^^:file1)" &&
#		test 2 = $(git cat-file commit HEAD^^ | grep first | wc -l) &&
#		test 1 = $(git cat-file commit HEAD | grep first | wc -l)
#	
not ok - 8 auto squash that matches a commit after the squash
#	
#		git reset --hard base &&
#		echo 1 >file1 &&
#		git add -u &&
#		test_tick &&
#		git commit -m "squash! third" &&
#		echo 4 >file4 &&
#		git add file4 &&
#		test_tick &&
#		git commit -m "third commit" &&
#		git tag final-presquash &&
#		test_tick &&
#		git rebase --autosquash -i HEAD~4 &&
#		git log --oneline >actual &&
#		test 5 = $(wc -l <actual) &&
#		git diff --exit-code final-presquash &&
#		test 0 = "$(git cat-file blob HEAD^^:file1)" &&
#		test 1 = "$(git cat-file blob HEAD^:file1)" &&
#		test 1 = $(git cat-file commit HEAD | grep third | wc -l) &&
#		test 1 = $(git cat-file commit HEAD^ | grep third | wc -l)
#	
not ok - 9 auto squash that matches a sha1
#	
#		git reset --hard base &&
#		echo 1 >file1 &&
#		git add -u &&
#		test_tick &&
#		git commit -m "squash! $(git rev-parse --short HEAD^)" &&
#		git tag final-shasquash &&
#		test_tick &&
#		git rebase --autosquash -i HEAD^^^ &&
#		git log --oneline >actual &&
#		test 3 = $(wc -l <actual) &&
#		git diff --exit-code final-shasquash &&
#		test 1 = "$(git cat-file blob HEAD^:file1)" &&
#		test 1 = $(git cat-file commit HEAD^ | grep squash | wc -l)
#	
not ok - 10 auto squash that matches longer sha1
#	
#		git reset --hard base &&
#		echo 1 >file1 &&
#		git add -u &&
#		test_tick &&
#		git commit -m "squash! $(git rev-parse --short=11 HEAD^)" &&
#		git tag final-longshasquash &&
#		test_tick &&
#		git rebase --autosquash -i HEAD^^^ &&
#		git log --oneline >actual &&
#		test 3 = $(wc -l <actual) &&
#		git diff --exit-code final-longshasquash &&
#		test 1 = "$(git cat-file blob HEAD^:file1)" &&
#		test 1 = $(git cat-file commit HEAD^ | grep squash | wc -l)
#	
not ok - 11 use commit --fixup
#	
#		test_auto_commit_flags fixup 1
#	
not ok - 12 use commit --squash
#	
#		test_auto_commit_flags squash 2
#	
# failed 6 among 12 test(s)
1..12
