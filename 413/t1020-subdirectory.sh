Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1020-subdirectory/.git/
expecting success: 
	long="a b c d e f g h i j k l m n o p q r s t u v w x y z" &&
	for c in $long; do echo $c; done >one &&
	mkdir dir &&
	for c in x y z $long a b c; do echo $c; done >dir/two &&
	cp one original.one &&
	cp dir/two original.two

ok 1 - setup

expecting success: 
	git update-index --add one &&
	case "`git ls-files`" in
	one) echo pass one ;;
	*) echo bad one; exit 1 ;;
	esac &&
	(
		cd dir &&
		git update-index --add two &&
		case "`git ls-files`" in
		two) echo pass two ;;
		*) echo bad two; exit 1 ;;
		esac
	) &&
	case "`git ls-files`" in
	dir/two"$LF"one) echo pass both ;;
	*) echo bad; exit 1 ;;
	esac
pass one
pass two
pass both
ok 2 - update-index and ls-files
expecting success: 
	two=`git ls-files -s dir/two` &&
	two=`expr "$two" : "[0-7]* \([0-9a-f]*\)"` &&
	echo "$two" &&
	git cat-file -p "$two" >actual &&
	cmp dir/two actual &&
	(
		cd dir &&
		git cat-file -p "$two" >actual &&
		cmp two actual
	)
c1144d0671912dd26751c1fbf1eac57a907f82c7

ok 3 - cat-file
expecting success: 
	echo a >>one &&
	echo d >>dir/two &&
	case "`git diff-files --name-only`" in
	dir/two"$LF"one) echo pass top ;;
	*) echo bad top; exit 1 ;;
	esac &&
	# diff should not omit leading paths
	(
		cd dir &&
		case "`git diff-files --name-only`" in
		dir/two"$LF"one) echo pass subdir ;;
		*) echo bad subdir; exit 1 ;;
		esac &&
		case "`git diff-files --name-only .`" in
		dir/two) echo pass subdir limited ;;
		*) echo bad subdir limited; exit 1 ;;
		esac
	)
pass top
pass subdir
pass subdir limited

ok 4 - diff-files

expecting success: 
	top=`git write-tree` &&
	echo $top &&
	(
		cd dir &&
		sub=`git write-tree` &&
		echo $sub &&
		test "z$top" = "z$sub"
	)
cf1e35b43464cccd320d58a813e14e25fa36b1d7
cf1e35b43464cccd320d58a813e14e25fa36b1d7
ok 5 - write-tree
expecting success: 
	git checkout-index -f -u one &&
	cmp one original.one &&
	(
		cd dir &&
		git checkout-index -f -u two &&
		cmp two ../original.two
	)

ok 6 - checkout-index

expecting success: 
	rm -f one dir/two &&
	tree=`git write-tree` &&
	git read-tree --reset -u "$tree" &&
	cmp one original.one &&
	cmp dir/two original.two &&
	(
		cd dir &&
		rm -f two &&
		git read-tree --reset -u "$tree" &&
		cmp two ../original.two &&
		cmp ../one ../original.one
	)

ok 7 - read-tree

expecting success: 
	(
		git config alias.ss status &&
		cd dir &&
		git status &&
		git ss
	)
# On branch master
#
# Initial commit
#
# Changes to be committed:
#   (use "git rm --cached <file>..." to unstage)
#
#	new file:   two
#	new file:   ../one
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	../original.one
#	../original.two
# On branch master
#
# Initial commit
#
# Changes to be committed:
#   (use "git rm --cached <file>..." to unstage)
#
#	new file:   two
#	new file:   ../one
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	../original.one
#	../original.two

ok 8 - alias expansion

expecting success: 
	git commit -a -m 1 &&
	(
		cd .git &&
		git show -s HEAD
	)
[master (root-commit) 2949392] 1
 Author: A U Thor <author@example.com>
 2 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 dir/two
 create mode 100644 one
commit 2949392f0e7fcb97778a16006908c3b5b79c118f
Author: A U Thor <author@example.com>
Date:   Sun Jan 2 04:00:19 2011 +0000

    1

ok 9 - no file/rev ambiguity check inside .git

expecting success: 
	git clone -s --bare .git foo.git &&
	(
		cd foo.git &&
		GIT_DIR=. git show -s HEAD
	)

Cloning into bare repository foo.git...
done.
commit 2949392f0e7fcb97778a16006908c3b5b79c118f
Author: A U Thor <author@example.com>
Date:   Sun Jan 2 04:00:19 2011 +0000

    1

ok 10 - no file/rev ambiguity check inside a bare repo

expecting success: 
	rm -fr foo.git &&
	git clone -s .git another &&
	ln -s another yetanother &&
	(
		cd yetanother/.git &&
		git show -s HEAD
	)
Cloning into another...
done.
commit 2949392f0e7fcb97778a16006908c3b5b79c118f
Author: A U Thor <author@example.com>
Date:   Sun Jan 2 04:00:19 2011 +0000

    1

ok 11 - detection should not be fooled by a symlink

# passed all 11 test(s)
1..11
