ok 1 - setup - initial commit
ok 2 - setup - repository in init subdirectory
ok 3 - setup - commit with gitlink
ok 4 - setup - hide init subdirectory
ok 5 - setup - repository to add submodules to
ok 6 - submodule add
ok 7 - submodule add to .gitignored path fails
ok 8 - submodule add to .gitignored path with --force
ok 9 - submodule add --branch
ok 10 - submodule add with ./ in path
ok 11 - submodule add with // in path
ok 12 - submodule add with /.. in path
ok 13 - submodule add with ./, /.. and // in path
ok 14 - setup - add an example entry to .gitmodules
ok 15 - status should fail for unmapped paths
ok 16 - setup - map path in .gitmodules
ok 17 - status should only print one line
ok 18 - setup - fetch commit name from submodule
ok 19 - status should initially be "missing"
ok 20 - init should register submodule url in .git/config
ok 21 - update should fail when path is used by a file
ok 22 - update should fail when path is used by a nonempty directory
ok 23 - update should work when path is an empty dir
ok 24 - status should be "up-to-date" after update
ok 25 - status should be "modified" after submodule commit
ok 26 - the --cached sha1 should be rev1
ok 27 - git diff should report the SHA1 of the new submodule commit
ok 28 - update should checkout rev1
ok 29 - status should be "up-to-date" after update
ok 30 - checkout superproject with subproject already present
ok 31 - apply submodule diff
ok 32 - update --init
ok 33 - do not add files from a submodule
ok 34 - gracefully add submodule with a trailing slash
ok 35 - ls-files gracefully handles trailing slash
ok 36 - moving to a commit without submodule does not leave empty dir
ok 37 - submodule <invalid-path> warns
ok 38 - add submodules without specifying an explicit path
ok 39 - add should fail when path is used by a file
ok 40 - add should fail when path is used by an existing directory
ok 41 - set up for relative path tests
ok 42 - relative path works with URL
not ok - 43 relative path works with user@host:path
#	
#		(
#			cd reltest &&
#			cp pristine-.git-config .git/config &&
#			git config remote.origin.url user@host:repo &&
#			git submodule init &&
#			test "$(git config submodule.sub.url)" = user@host:subrepo
#		)
#	
# failed 1 among 43 test(s)
1..43
