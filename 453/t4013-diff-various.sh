ok 1 - setup
ok 2 - git diff-tree initial
ok 3 - git diff-tree -r initial
ok 4 - git diff-tree -r --abbrev initial
ok 5 - git diff-tree -r --abbrev=4 initial
ok 6 - git diff-tree --root initial
ok 7 - git diff-tree --root --abbrev initial
ok 8 - git diff-tree --root -r initial
ok 9 - git diff-tree --root -r --abbrev initial
ok 10 - git diff-tree --root -r --abbrev=4 initial
ok 11 - git diff-tree -p initial
ok 12 - git diff-tree --root -p initial
ok 13 - git diff-tree --patch-with-stat initial
ok 14 - git diff-tree --root --patch-with-stat initial
ok 15 - git diff-tree --patch-with-raw initial
ok 16 - git diff-tree --root --patch-with-raw initial
ok 17 - git diff-tree --pretty initial
ok 18 - git diff-tree --pretty --root initial
ok 19 - git diff-tree --pretty -p initial
ok 20 - git diff-tree --pretty --stat initial
ok 21 - git diff-tree --pretty --summary initial
ok 22 - git diff-tree --pretty --stat --summary initial
ok 23 - git diff-tree --pretty --root -p initial
ok 24 - git diff-tree --pretty --root --stat initial
ok 25 - git diff-tree --pretty --root --summary initial
ok 26 - git diff-tree --pretty --root --summary -r initial
ok 27 - git diff-tree --pretty --root --stat --summary initial
ok 28 - git diff-tree --pretty --patch-with-stat initial
ok 29 - git diff-tree --pretty --root --patch-with-stat initial
ok 30 - git diff-tree --pretty --patch-with-raw initial
ok 31 - git diff-tree --pretty --root --patch-with-raw initial
ok 32 - git diff-tree --pretty=oneline initial
ok 33 - git diff-tree --pretty=oneline --root initial
ok 34 - git diff-tree --pretty=oneline -p initial
ok 35 - git diff-tree --pretty=oneline --root -p initial
ok 36 - git diff-tree --pretty=oneline --patch-with-stat initial
ok 37 - git diff-tree --pretty=oneline --root --patch-with-stat initial
ok 38 - git diff-tree --pretty=oneline --patch-with-raw initial
ok 39 - git diff-tree --pretty=oneline --root --patch-with-raw initial
ok 40 - git diff-tree --pretty side
ok 41 - git diff-tree --pretty -p side
ok 42 - git diff-tree --pretty --patch-with-stat side
ok 43 - git diff-tree master
ok 44 - git diff-tree -p master
ok 45 - git diff-tree -p -m master
ok 46 - git diff-tree -c master
ok 47 - git diff-tree -c --abbrev master
ok 48 - git diff-tree --cc master
ok 49 - git diff-tree -c --stat master
ok 50 - git diff-tree --cc --stat master
ok 51 - git diff-tree -c --stat --summary master
ok 52 - git diff-tree --cc --stat --summary master
ok 53 - git diff-tree -c --stat --summary side
ok 54 - git diff-tree --cc --stat --summary side
ok 55 - git diff-tree --cc --patch-with-stat master
ok 56 - git diff-tree --cc --patch-with-stat --summary master
ok 57 - git diff-tree --cc --patch-with-stat --summary side
ok 58 - git log master
ok 59 - git log -p master
ok 60 - git log --root master
ok 61 - git log --root -p master
ok 62 - git log --patch-with-stat master
ok 63 - git log --root --patch-with-stat master
ok 64 - git log --root --patch-with-stat --summary master
ok 65 - git log --root -c --patch-with-stat --summary master
ok 66 - git log --root --cc --patch-with-stat --summary master
ok 67 - git log -p --first-parent master
ok 68 - git log -m -p --first-parent master
ok 69 - git log -m -p master
ok 70 - git log -SF master
ok 71 - git log -S F master
ok 72 - git log -SF -p master
not ok - 73 git log -GF master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
#				echo "\$"
#			} >"$actual" &&
#			if test -f "$expect"
#			then
#				test_cmp "$expect" "$actual" &&
#				rm -f "$actual"
#			else
#				# this is to help developing new tests.
#				cp "$actual" "$expect"
#				false
#			fi
#		
not ok - 74 git log -GF -p master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
#				echo "\$"
#			} >"$actual" &&
#			if test -f "$expect"
#			then
#				test_cmp "$expect" "$actual" &&
#				rm -f "$actual"
#			else
#				# this is to help developing new tests.
#				cp "$actual" "$expect"
#				false
#			fi
#		
not ok - 75 git log -GF -p --pickaxe-all master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
#				echo "\$"
#			} >"$actual" &&
#			if test -f "$expect"
#			then
#				test_cmp "$expect" "$actual" &&
#				rm -f "$actual"
#			else
#				# this is to help developing new tests.
#				cp "$actual" "$expect"
#				false
#			fi
#		
ok 76 - git log --decorate --all
ok 77 - git log --decorate=full --all
ok 78 - git rev-list --parents HEAD
ok 79 - git rev-list --children HEAD
ok 80 - git whatchanged master
ok 81 - git whatchanged -p master
ok 82 - git whatchanged --root master
ok 83 - git whatchanged --root -p master
ok 84 - git whatchanged --patch-with-stat master
ok 85 - git whatchanged --root --patch-with-stat master
ok 86 - git whatchanged --root --patch-with-stat --summary master
ok 87 - git whatchanged --root -c --patch-with-stat --summary master
ok 88 - git whatchanged --root --cc --patch-with-stat --summary master
ok 89 - git whatchanged -SF master
ok 90 - git whatchanged -SF -p master
ok 91 - git log --patch-with-stat master -- dir/
ok 92 - git whatchanged --patch-with-stat master -- dir/
ok 93 - git log --patch-with-stat --summary master -- dir/
ok 94 - git whatchanged --patch-with-stat --summary master -- dir/
ok 95 - git show initial
ok 96 - git show --root initial
ok 97 - git show side
ok 98 - git show master
ok 99 - git show -c master
ok 100 - git show -m master
ok 101 - git show --first-parent master
ok 102 - git show --stat side
ok 103 - git show --stat --summary side
ok 104 - git show --patch-with-stat side
ok 105 - git show --patch-with-raw side
ok 106 - git show --patch-with-stat --summary side
ok 107 - git format-patch --stdout initial..side
ok 108 - git format-patch --stdout initial..master^
ok 109 - git format-patch --stdout initial..master
ok 110 - git format-patch --stdout --no-numbered initial..master
ok 111 - git format-patch --stdout --numbered initial..master
ok 112 - git format-patch --attach --stdout initial..side
ok 113 - git format-patch --attach --stdout --suffix=.diff initial..side
ok 114 - git format-patch --attach --stdout initial..master^
ok 115 - git format-patch --attach --stdout initial..master
ok 116 - git format-patch --inline --stdout initial..side
ok 117 - git format-patch --inline --stdout initial..master^
ok 118 - git format-patch --inline --stdout --numbered-files initial..master
ok 119 - git format-patch --inline --stdout initial..master
ok 120 - git format-patch --inline --stdout --subject-prefix=TESTCASE initial..master
ok 121 - git config format.subjectprefix DIFFERENT_PREFIX
ok 122 - git format-patch --inline --stdout initial..master^^
ok 123 - git format-patch --stdout --cover-letter -n initial..master^
ok 124 - git diff --abbrev initial..side
ok 125 - git diff -r initial..side
ok 126 - git diff --stat initial..side
ok 127 - git diff -r --stat initial..side
ok 128 - git diff initial..side
ok 129 - git diff --patch-with-stat initial..side
ok 130 - git diff --patch-with-raw initial..side
ok 131 - git diff --patch-with-stat -r initial..side
ok 132 - git diff --patch-with-raw -r initial..side
ok 133 - git diff --name-status dir2 dir
ok 134 - git diff --no-index --name-status dir2 dir
ok 135 - git diff --no-index --name-status -- dir2 dir
ok 136 - git diff --no-index dir dir3
ok 137 - git diff master master^ side
ok 138 - git diff --dirstat master~1 master~2
ok 139 - log -S requires an argument
# failed 3 among 139 test(s)
1..139
