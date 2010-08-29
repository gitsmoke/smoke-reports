ok 1 - setup
not ok - 2 git diff-tree initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 3 git diff-tree -r initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 4 git diff-tree -r --abbrev initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 5 git diff-tree -r --abbrev=4 initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 6 git diff-tree --root initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 7 git diff-tree --root --abbrev initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 8 git diff-tree --root -r initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 9 git diff-tree --root -r --abbrev initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 10 git diff-tree --root -r --abbrev=4 initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 11 git diff-tree -p initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 12 git diff-tree --root -p initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 13 git diff-tree --patch-with-stat initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 14 git diff-tree --root --patch-with-stat initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 15 git diff-tree --patch-with-raw initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 16 git diff-tree --root --patch-with-raw initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 17 git diff-tree --pretty initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 18 git diff-tree --pretty --root initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 19 git diff-tree --pretty -p initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 20 git diff-tree --pretty --stat initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 21 git diff-tree --pretty --summary initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 22 git diff-tree --pretty --stat --summary initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 23 git diff-tree --pretty --root -p initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 24 git diff-tree --pretty --root --stat initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 25 git diff-tree --pretty --root --summary initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 26 git diff-tree --pretty --root --summary -r initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 27 git diff-tree --pretty --root --stat --summary initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 28 git diff-tree --pretty --patch-with-stat initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 29 git diff-tree --pretty --root --patch-with-stat initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 30 git diff-tree --pretty --patch-with-raw initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 31 git diff-tree --pretty --root --patch-with-raw initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 32 git diff-tree --pretty=oneline initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 33 git diff-tree --pretty=oneline --root initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 34 git diff-tree --pretty=oneline -p initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 35 git diff-tree --pretty=oneline --root -p initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 36 git diff-tree --pretty=oneline --patch-with-stat initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 37 git diff-tree --pretty=oneline --root --patch-with-stat initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 38 git diff-tree --pretty=oneline --patch-with-raw initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 39 git diff-tree --pretty=oneline --root --patch-with-raw initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 40 git diff-tree --pretty side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 41 git diff-tree --pretty -p side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 42 git diff-tree --pretty --patch-with-stat side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 43 git diff-tree master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 44 git diff-tree -p master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 45 git diff-tree -p -m master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 46 git diff-tree -c master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 47 git diff-tree -c --abbrev master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 48 git diff-tree --cc master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 49 git diff-tree -c --stat master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 50 git diff-tree --cc --stat master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 51 git diff-tree -c --stat --summary master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 52 git diff-tree --cc --stat --summary master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 53 git diff-tree -c --stat --summary side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 54 git diff-tree --cc --stat --summary side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 55 git diff-tree --cc --patch-with-stat master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 56 git diff-tree --cc --patch-with-stat --summary master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 57 git diff-tree --cc --patch-with-stat --summary side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 58 git log master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 59 git log -p master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 60 git log --root master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 61 git log --root -p master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 62 git log --patch-with-stat master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 63 git log --root --patch-with-stat master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 64 git log --root --patch-with-stat --summary master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 65 git log --root -c --patch-with-stat --summary master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 66 git log --root --cc --patch-with-stat --summary master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 67 git log -p --first-parent master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 68 git log -m -p --first-parent master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 69 git log -m -p master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 70 git log -SF master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 71 git log -S F master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 72 git log -SF -p master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 73 git log --decorate --all
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 74 git log --decorate=full --all
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 75 git rev-list --parents HEAD
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 76 git rev-list --children HEAD
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 77 git whatchanged master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 78 git whatchanged -p master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 79 git whatchanged --root master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 80 git whatchanged --root -p master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 81 git whatchanged --patch-with-stat master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 82 git whatchanged --root --patch-with-stat master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 83 git whatchanged --root --patch-with-stat --summary master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 84 git whatchanged --root -c --patch-with-stat --summary master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 85 git whatchanged --root --cc --patch-with-stat --summary master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 86 git whatchanged -SF master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 87 git whatchanged -SF -p master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 88 git log --patch-with-stat master -- dir/
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 89 git whatchanged --patch-with-stat master -- dir/
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 90 git log --patch-with-stat --summary master -- dir/
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 91 git whatchanged --patch-with-stat --summary master -- dir/
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 92 git show initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 93 git show --root initial
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 94 git show side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 95 git show master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 96 git show -c master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 97 git show -m master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 98 git show --first-parent master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 99 git show --stat side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 100 git show --stat --summary side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 101 git show --patch-with-stat side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 102 git show --patch-with-raw side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 103 git show --patch-with-stat --summary side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 104 git format-patch --stdout initial..side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 105 git format-patch --stdout initial..master^
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 106 git format-patch --stdout initial..master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 107 git format-patch --stdout --no-numbered initial..master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 108 git format-patch --stdout --numbered initial..master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 109 git format-patch --attach --stdout initial..side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 110 git format-patch --attach --stdout --suffix=.diff initial..side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 111 git format-patch --attach --stdout initial..master^
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 112 git format-patch --attach --stdout initial..master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 113 git format-patch --inline --stdout initial..side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 114 git format-patch --inline --stdout initial..master^
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 115 git format-patch --inline --stdout --numbered-files initial..master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 116 git format-patch --inline --stdout initial..master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 117 git format-patch --inline --stdout --subject-prefix=TESTCASE initial..master
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 118 git config format.subjectprefix DIFFERENT_PREFIX
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 119 git format-patch --inline --stdout initial..master^^
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 120 git format-patch --stdout --cover-letter -n initial..master^
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 121 git diff --abbrev initial..side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 122 git diff -r initial..side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 123 git diff --stat initial..side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 124 git diff -r --stat initial..side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 125 git diff initial..side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 126 git diff --patch-with-stat initial..side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 127 git diff --patch-with-raw initial..side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 128 git diff --patch-with-stat -r initial..side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 129 git diff --patch-with-raw -r initial..side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 130 git diff --name-status dir2 dir
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 131 git diff --no-index --name-status dir2 dir
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 132 git diff --no-index --name-status -- dir2 dir
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 133 git diff --no-index dir dir3
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 134 git diff master master^ side
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 135 git diff --dirstat master~1 master~2
#	
#			{
#				echo "\$ git $cmd"
#				git $cmd |
#				sed -e "s/^\\(-*\\)$V\\(-*\\)\$/\\1g-i-t--v-e-r-s-i-o-n\2/" \
#				    -e "s/^\\(.*mixed; boundary=\"-*\\)$V\\(-*\\)\"\$/\\1g-i-t--v-e-r-s-i-o-n\2\"/"
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
not ok - 136 log -S requires an argument
#	
#		test_must_fail git log -S
#	
# failed 135 among 136 test(s)
1..136
