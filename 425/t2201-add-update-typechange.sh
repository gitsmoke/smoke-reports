Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2201-add-update-typechange/.git/
expecting success: 
	>xyzzy &&
	_empty=$(git hash-object --stdin <xyzzy) &&
	>yomin &&
	>caskly &&
	if test_have_prereq SYMLINKS; then
		ln -s frotz nitfol &&
		T_letter=T
	else
		printf %s frotz > nitfol &&
		T_letter=M
	fi &&
	mkdir rezrov &&
	>rezrov/bozbar &&
	git add caskly xyzzy yomin nitfol rezrov/bozbar &&

	test_tick &&
	git commit -m initial
[master (root-commit) 8dc0761] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 caskly
 create mode 120000 nitfol
 create mode 100644 rezrov/bozbar
 create mode 100644 xyzzy
 create mode 100644 yomin

ok 1 - setup

expecting success: 
	rm -f xyzzy yomin nitfol caskly &&
	# caskly disappears (not a submodule)
	mkdir caskly &&
	# nitfol changes from symlink to regular
	>nitfol &&
	# rezrov/bozbar disappears
	rm -fr rezrov &&
	if test_have_prereq SYMLINKS; then
		ln -s xyzzy rezrov
	else
		printf %s xyzzy > rezrov
	fi &&
	# xyzzy disappears (not a submodule)
	mkdir xyzzy &&
	echo gnusto >xyzzy/bozbar &&
	# yomin gets replaced with a submodule
	mkdir yomin &&
	>yomin/yomin &&
	(
		cd yomin &&
		git init &&
		git add yomin &&
		git commit -m "sub initial"
	) &&
	yomin=$(GIT_DIR=yomin/.git git rev-parse HEAD) &&
	# yonk is added and then turned into a submodule
	# this should appear as T in diff-files and as A in diff-index
	>yonk &&
	git add yonk &&
	rm -f yonk &&
	mkdir yonk &&
	>yonk/yonk &&
	(
		cd yonk &&
		git init &&
		git add yonk &&
		git commit -m "sub initial"
	) &&
	yonk=$(GIT_DIR=yonk/.git git rev-parse HEAD) &&
	# zifmia is added and then removed
	# this should appear in diff-files but not in diff-index.
	>zifmia &&
	git add zifmia &&
	rm -f zifmia &&
	mkdir zifmia &&
	{
		git ls-tree -r HEAD |
		sed -e "s/^/:/" -e "
			/	caskly/{
				s/	caskly/ $_z40 D&/
				s/blob/000000/
			}
			/	nitfol/{
				s/	nitfol/ $_z40 $T_letter&/
				s/blob/100644/
			}
			/	rezrov.bozbar/{
				s/	rezrov.bozbar/ $_z40 D&/
				s/blob/000000/
			}
			/	xyzzy/{
				s/	xyzzy/ $_z40 D&/
				s/blob/000000/
			}
			/	yomin/{
			    s/	yomin/ $_z40 T&/
				s/blob/160000/
			}
		"
	} >expect &&
	{
		cat expect
		echo ":100644 160000 $_empty $_z40 T	yonk"
		echo ":100644 000000 $_empty $_z40 D	zifmia"
	} >expect-files &&
	{
		cat expect
		echo ":000000 160000 $_z40 $_z40 A	yonk"
	} >expect-index &&
	{
		echo "100644 $_empty 0	nitfol"
		echo "160000 $yomin 0	yomin"
		echo "160000 $yonk 0	yonk"
	} >expect-final
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2201-add-update-typechange/yomin/.git/
[master (root-commit) 9da2848] sub initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 yomin
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2201-add-update-typechange/yonk/.git/
[master (root-commit) 9cc3160] sub initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 yonk

ok 2 - modify
expecting success: 
	git diff-files --raw >actual &&
	test_cmp expect-files actual

ok 3 - diff-files

expecting success: 
	git diff-index --raw HEAD -- >actual &&
	test_cmp expect-index actual

ok 4 - diff-index

expecting success: 
	rm -f ".git/saved-index" &&
	cp -p ".git/index" ".git/saved-index" &&
	git add -u &&
	git ls-files -s >actual &&
	test_cmp expect-final actual

ok 5 - add -u

expecting success: 
	if test -f ".git/saved-index"
	then
		rm -f ".git/index" &&
		mv ".git/saved-index" ".git/index"
	fi &&
	git commit -m "second" -a &&
	git ls-files -s >actual &&
	test_cmp expect-final actual &&
	rm -f .git/index &&
	git read-tree HEAD &&
	git ls-files -s >actual &&
	test_cmp expect-final actual
[master 0f3d2ce] second
 Author: A U Thor <author@example.com>
 3 files changed, 2 insertions(+), 0 deletions(-)
 rename caskly => nitfol (100%)
 delete mode 100644 rezrov/bozbar
 delete mode 100644 xyzzy
 mode change 100644 => 160000 yomin
 create mode 160000 yonk

ok 6 - commit -a

# passed all 6 test(s)
1..6
