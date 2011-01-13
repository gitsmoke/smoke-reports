ok 1 - setup
ok 2 - interactive rebase --continue works with touched file
ok 3 - non-interactive rebase --continue works with touched file
ok 4 - rebase --continue can not be used with other options
not ok - 5 rebase --continue remembers merge strategy and options
#	
#		rm -fr .git/rebase-* &&
#		git reset --hard commit-new-file-F2-on-topic-branch &&
#		test_commit "commit-new-file-F3-on-topic-branch" F3 32 &&
#		test_when_finished "rm -fr test-bin funny.was.run" &&
#		mkdir test-bin &&
#		cat >test-bin/git-merge-funny <<-EOF
#		#!$SHELL_PATH
#		case "\$1" in --opt) ;; *) exit 2 ;; esac
#		shift &&
#		>funny.was.run &&
#		exec git merge-recursive "\$@"
#		EOF
#		chmod +x test-bin/git-merge-funny &&
#		(
#			PATH=./test-bin:$PATH
#			test_must_fail git rebase -s funny -Xopt master topic
#		) &&
#		test -f funny.was.run &&
#		rm funny.was.run &&
#		echo "Resolved" >F2 &&
#		git add F2 &&
#		(
#			PATH=./test-bin:$PATH
#			git rebase --continue
#		) &&
#		test -f funny.was.run
#	
not ok - 6 rebase --continue remembers --rerere-autoupdate
#	
#		rm -fr .git/rebase-* &&
#		git reset --hard commit-new-file-F3-on-topic-branch &&
#		git checkout master
#		test_commit "commit-new-file-F3" F3 3 &&
#		git config rerere.enabled true &&
#		test_must_fail git rebase -m master topic &&
#		echo "Resolved" >F2 &&
#		git add F2 &&
#		test_must_fail git rebase --continue &&
#		echo "Resolved" >F3 &&
#		git add F3 &&
#		git rebase --continue &&
#		git reset --hard topic@{1} &&
#		test_must_fail git rebase -m --rerere-autoupdate master &&
#		test "$(cat F2)" = "Resolved" &&
#		test_must_fail git rebase --continue &&
#		test "$(cat F3)" = "Resolved" &&
#		git rebase --continue
#	
# failed 2 among 6 test(s)
1..6
