Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3060-ls-files-with-tree/.git/
expecting success: 

	# The bug we are exercising requires a fair number of entries
	# in a sub-directory so that add_index_entry will trigger a
	# realloc.

	echo file >expected &&
	mkdir sub &&
	bad= &&
	for n in 0 1 2 3 4 5
	do
		for m in 0 1 2 3 4 5 6 7 8 9
		do
			num=00$n$m &&
			>sub/file-$num &&
			echo file-$num >>expected || {
				bad=t
				break
			}
		done && test -z "$bad" || {
			bad=t
			break
		}
	done && test -z "$bad" &&
	git add . &&
	git commit -m "add a bunch of files" &&

	# We remove them all so that we will have something to add
	# back with --with-tree and so that we will definitely be
	# under the realloc size to trigger the bug.
	rm -rf sub &&
	git commit -a -m "remove them all" &&

	# The bug also requires some entry before our directory so that
	# prune_path will modify the_index.cache

	mkdir a_directory_that_sorts_before_sub &&
	>a_directory_that_sorts_before_sub/file &&
	mkdir sub &&
	>sub/file &&
	git add .
[master (root-commit) eed32d8] add a bunch of files
 Author: A U Thor <author@example.com>
 1 files changed, 61 insertions(+), 0 deletions(-)
 create mode 100644 expected
 create mode 100644 sub/file-0000
 create mode 100644 sub/file-0001
 create mode 100644 sub/file-0002
 create mode 100644 sub/file-0003
 create mode 100644 sub/file-0004
 create mode 100644 sub/file-0005
 create mode 100644 sub/file-0006
 create mode 100644 sub/file-0007
 create mode 100644 sub/file-0008
 create mode 100644 sub/file-0009
 create mode 100644 sub/file-0010
 create mode 100644 sub/file-0011
 create mode 100644 sub/file-0012
 create mode 100644 sub/file-0013
 create mode 100644 sub/file-0014
 create mode 100644 sub/file-0015
 create mode 100644 sub/file-0016
 create mode 100644 sub/file-0017
 create mode 100644 sub/file-0018
 create mode 100644 sub/file-0019
 create mode 100644 sub/file-0020
 create mode 100644 sub/file-0021
 create mode 100644 sub/file-0022
 create mode 100644 sub/file-0023
 create mode 100644 sub/file-0024
 create mode 100644 sub/file-0025
 create mode 100644 sub/file-0026
 create mode 100644 sub/file-0027
 create mode 100644 sub/file-0028
 create mode 100644 sub/file-0029
 create mode 100644 sub/file-0030
 create mode 100644 sub/file-0031
 create mode 100644 sub/file-0032
 create mode 100644 sub/file-0033
 create mode 100644 sub/file-0034
 create mode 100644 sub/file-0035
 create mode 100644 sub/file-0036
 create mode 100644 sub/file-0037
 create mode 100644 sub/file-0038
 create mode 100644 sub/file-0039
 create mode 100644 sub/file-0040
 create mode 100644 sub/file-0041
 create mode 100644 sub/file-0042
 create mode 100644 sub/file-0043
 create mode 100644 sub/file-0044
 create mode 100644 sub/file-0045
 create mode 100644 sub/file-0046
 create mode 100644 sub/file-0047
 create mode 100644 sub/file-0048
 create mode 100644 sub/file-0049
 create mode 100644 sub/file-0050
 create mode 100644 sub/file-0051
 create mode 100644 sub/file-0052
 create mode 100644 sub/file-0053
 create mode 100644 sub/file-0054
 create mode 100644 sub/file-0055
 create mode 100644 sub/file-0056
 create mode 100644 sub/file-0057
 create mode 100644 sub/file-0058
 create mode 100644 sub/file-0059
[master fa579f3] remove them all
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 sub/file-0000
 delete mode 100644 sub/file-0001
 delete mode 100644 sub/file-0002
 delete mode 100644 sub/file-0003
 delete mode 100644 sub/file-0004
 delete mode 100644 sub/file-0005
 delete mode 100644 sub/file-0006
 delete mode 100644 sub/file-0007
 delete mode 100644 sub/file-0008
 delete mode 100644 sub/file-0009
 delete mode 100644 sub/file-0010
 delete mode 100644 sub/file-0011
 delete mode 100644 sub/file-0012
 delete mode 100644 sub/file-0013
 delete mode 100644 sub/file-0014
 delete mode 100644 sub/file-0015
 delete mode 100644 sub/file-0016
 delete mode 100644 sub/file-0017
 delete mode 100644 sub/file-0018
 delete mode 100644 sub/file-0019
 delete mode 100644 sub/file-0020
 delete mode 100644 sub/file-0021
 delete mode 100644 sub/file-0022
 delete mode 100644 sub/file-0023
 delete mode 100644 sub/file-0024
 delete mode 100644 sub/file-0025
 delete mode 100644 sub/file-0026
 delete mode 100644 sub/file-0027
 delete mode 100644 sub/file-0028
 delete mode 100644 sub/file-0029
 delete mode 100644 sub/file-0030
 delete mode 100644 sub/file-0031
 delete mode 100644 sub/file-0032
 delete mode 100644 sub/file-0033
 delete mode 100644 sub/file-0034
 delete mode 100644 sub/file-0035
 delete mode 100644 sub/file-0036
 delete mode 100644 sub/file-0037
 delete mode 100644 sub/file-0038
 delete mode 100644 sub/file-0039
 delete mode 100644 sub/file-0040
 delete mode 100644 sub/file-0041
 delete mode 100644 sub/file-0042
 delete mode 100644 sub/file-0043
 delete mode 100644 sub/file-0044
 delete mode 100644 sub/file-0045
 delete mode 100644 sub/file-0046
 delete mode 100644 sub/file-0047
 delete mode 100644 sub/file-0048
 delete mode 100644 sub/file-0049
 delete mode 100644 sub/file-0050
 delete mode 100644 sub/file-0051
 delete mode 100644 sub/file-0052
 delete mode 100644 sub/file-0053
 delete mode 100644 sub/file-0054
 delete mode 100644 sub/file-0055
 delete mode 100644 sub/file-0056
 delete mode 100644 sub/file-0057
 delete mode 100644 sub/file-0058
 delete mode 100644 sub/file-0059

ok 1 - setup

expecting success: 
	# We have to run from a sub-directory to trigger prune_path
	# Then we finally get to run our --with-tree test
	(
		cd sub &&
		git ls-files --with-tree=HEAD~1 >../output
	)

ok 2 - git -ls-files --with-tree should succeed from subdir

expecting success: test_cmp expected output

ok 3 - git -ls-files --with-tree should add entries from named tree.

# passed all 3 test(s)
1..3
