ok 1 - added submodule
ok 2 - modified submodule(forward)
ok 3 - modified submodule(forward)
ok 4 - modified submodule(forward) --submodule
ok 5 - modified submodule(forward) --submodule=short
ok 6 - modified submodule(backward)
ok 7 - modified submodule(backward and forward)
ok 8 - typechanged submodule(submodule->blob), --cached
ok 9 - typechanged submodule(submodule->blob)
ok 10 - typechanged submodule(submodule->blob)
ok 11 - nonexistent commit
ok 12 - typechanged submodule(blob->submodule)
ok 13 - submodule is up to date
ok 14 - submodule contains untracked content
not ok - 15 submodule contains untracked content (untracked ignored)
#	
#		git diff-index -p --ignore-submodules=untracked --submodule=log HEAD >actual &&
#		! test -s actual
#	
not ok - 16 submodule contains untracked content (dirty ignored)
#	
#		git diff-index -p --ignore-submodules=dirty --submodule=log HEAD >actual &&
#		! test -s actual
#	
not ok - 17 submodule contains untracked content (all ignored)
#	
#		git diff-index -p --ignore-submodules=all --submodule=log HEAD >actual &&
#		! test -s actual
#	
ok 18 - submodule contains untracked and modifed content
not ok - 19 submodule contains untracked and modifed content (untracked ignored)
#	
#		echo new > sm1/foo6 &&
#		git diff-index -p --ignore-submodules=untracked --submodule=log HEAD >actual &&
#		diff actual - <<-EOF
#	Submodule sm1 contains modified content
#	EOF
#	
not ok - 20 submodule contains untracked and modifed content (dirty ignored)
#	
#		echo new > sm1/foo6 &&
#		git diff-index -p --ignore-submodules=dirty --submodule=log HEAD >actual &&
#		! test -s actual
#	
ok 21 - submodule contains untracked and modifed content (all ignored)
ok 22 - submodule contains modifed content
ok 23 - submodule is modified
ok 24 - modified submodule contains untracked content
not ok - 25 modified submodule contains untracked content (untracked ignored)
#	
#		git diff-index -p --ignore-submodules=untracked --submodule=log HEAD >actual &&
#		diff actual - <<-EOF
#	Submodule sm1 6858906..0a95e88:
#	  > change
#	EOF
#	
not ok - 26 modified submodule contains untracked content (dirty ignored)
#	
#		git diff-index -p --ignore-submodules=dirty --submodule=log HEAD >actual &&
#		diff actual - <<-EOF
#	Submodule sm1 6858906..0a95e88:
#	  > change
#	EOF
#	
not ok - 27 modified submodule contains untracked content (all ignored)
#	
#		git diff-index -p --ignore-submodules=all --submodule=log HEAD >actual &&
#		! test -s actual
#	
ok 28 - modified submodule contains untracked and modifed content
not ok - 29 modified submodule contains untracked and modifed content (untracked ignored)
#	
#		echo modification >> sm1/foo6 &&
#		git diff-index -p --ignore-submodules=untracked --submodule=log HEAD >actual &&
#		diff actual - <<-EOF
#	Submodule sm1 contains modified content
#	Submodule sm1 6858906..0a95e88:
#	  > change
#	EOF
#	
not ok - 30 modified submodule contains untracked and modifed content (dirty ignored)
#	
#		echo modification >> sm1/foo6 &&
#		git diff-index -p --ignore-submodules=dirty --submodule=log HEAD >actual &&
#		diff actual - <<-EOF
#	Submodule sm1 6858906..0a95e88:
#	  > change
#	EOF
#	
ok 31 - modified submodule contains untracked and modifed content (all ignored)
ok 32 - modified submodule contains modifed content
ok 33 - deleted submodule
ok 34 - multiple submodules
ok 35 - path filter
ok 36 - given commit
ok 37 - given commit --submodule
ok 38 - given commit --submodule=short
ok 39 - setup .git file for sm2
ok 40 - diff --submodule with .git file
# failed 10 among 40 test(s)
1..40
