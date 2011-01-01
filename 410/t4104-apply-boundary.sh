Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4104-apply-boundary/.git/
expecting success: 
	for i in b c d e f g h i j k l m n o p q r s t u v w x y
	do
		echo $i
	done >victim &&
	cat victim >original &&
	git update-index --add victim &&

	: add to the head
	for i in a b c d e f g h i j k l m n o p q r s t u v w x y
	do
		echo $i
	done >victim &&
	cat victim >add-a-expect &&
	git diff victim >add-a-patch.with &&
	git diff --unified=0 >add-a-patch.without &&

	: insert at line two
	for i in b a c d e f g h i j k l m n o p q r s t u v w x y
	do
		echo $i
	done >victim &&
	cat victim >insert-a-expect &&
	git diff victim >insert-a-patch.with &&
	git diff --unified=0 >insert-a-patch.without &&

	: modify at the head
	for i in a c d e f g h i j k l m n o p q r s t u v w x y
	do
		echo $i
	done >victim &&
	cat victim >mod-a-expect &&
	git diff victim >mod-a-patch.with &&
	git diff --unified=0 >mod-a-patch.without &&

	: remove from the head
	for i in c d e f g h i j k l m n o p q r s t u v w x y
	do
		echo $i
	done >victim &&
	cat victim >del-a-expect &&
	git diff victim >del-a-patch.with
	git diff --unified=0 >del-a-patch.without &&

	: add to the tail
	for i in b c d e f g h i j k l m n o p q r s t u v w x y z
	do
		echo $i
	done >victim &&
	cat victim >add-z-expect &&
	git diff victim >add-z-patch.with &&
	git diff --unified=0 >add-z-patch.without &&

	: modify at the tail
	for i in b c d e f g h i j k l m n o p q r s t u v w x z
	do
		echo $i
	done >victim &&
	cat victim >mod-z-expect &&
	git diff victim >mod-z-patch.with &&
	git diff --unified=0 >mod-z-patch.without &&

	: remove from the tail
	for i in b c d e f g h i j k l m n o p q r s t u v w x
	do
		echo $i
	done >victim &&
	cat victim >del-z-expect &&
	git diff victim >del-z-patch.with
	git diff --unified=0 >del-z-patch.without &&

	: done

ok 1 - setup

expecting success: 
			cat original >victim &&
			git update-index victim &&
			git apply --index add-a-patch.with || {
				cat add-a-patch.with
				(exit 1)
			} &&
			test_cmp add-a-expect victim
		

ok 2 - apply add-a-patch with context

expecting success: 
			cat original >victim &&
			git update-index victim &&
			git apply --index add-z-patch.with || {
				cat add-z-patch.with
				(exit 1)
			} &&
			test_cmp add-z-expect victim
		

ok 3 - apply add-z-patch with context

expecting success: 
			cat original >victim &&
			git update-index victim &&
			git apply --index insert-a-patch.with || {
				cat insert-a-patch.with
				(exit 1)
			} &&
			test_cmp insert-a-expect victim
		

ok 4 - apply insert-a-patch with context

expecting success: 
			cat original >victim &&
			git update-index victim &&
			git apply --index mod-a-patch.with || {
				cat mod-a-patch.with
				(exit 1)
			} &&
			test_cmp mod-a-expect victim
		

ok 5 - apply mod-a-patch with context

expecting success: 
			cat original >victim &&
			git update-index victim &&
			git apply --index mod-z-patch.with || {
				cat mod-z-patch.with
				(exit 1)
			} &&
			test_cmp mod-z-expect victim
		

ok 6 - apply mod-z-patch with context

expecting success: 
			cat original >victim &&
			git update-index victim &&
			git apply --index del-a-patch.with || {
				cat del-a-patch.with
				(exit 1)
			} &&
			test_cmp del-a-expect victim
		

ok 7 - apply del-a-patch with context

expecting success: 
			cat original >victim &&
			git update-index victim &&
			git apply --index del-z-patch.with || {
				cat del-z-patch.with
				(exit 1)
			} &&
			test_cmp del-z-expect victim
		

ok 8 - apply del-z-patch with context

expecting success: 
			cat original >victim &&
			git update-index victim &&
			git apply --index --unidiff-zero add-a-patch.without || {
				cat add-a-patch.without
				(exit 1)
			} &&
			test_cmp add-a-expect victim
		

ok 9 - apply add-a-patch without context

expecting success: 
			cat original >victim &&
			git update-index victim &&
			git apply --index --unidiff-zero add-z-patch.without || {
				cat add-z-patch.without
				(exit 1)
			} &&
			test_cmp add-z-expect victim
		

ok 10 - apply add-z-patch without context

expecting success: 
			cat original >victim &&
			git update-index victim &&
			git apply --index --unidiff-zero insert-a-patch.without || {
				cat insert-a-patch.without
				(exit 1)
			} &&
			test_cmp insert-a-expect victim
		

ok 11 - apply insert-a-patch without context

expecting success: 
			cat original >victim &&
			git update-index victim &&
			git apply --index --unidiff-zero mod-a-patch.without || {
				cat mod-a-patch.without
				(exit 1)
			} &&
			test_cmp mod-a-expect victim
		

ok 12 - apply mod-a-patch without context

expecting success: 
			cat original >victim &&
			git update-index victim &&
			git apply --index --unidiff-zero mod-z-patch.without || {
				cat mod-z-patch.without
				(exit 1)
			} &&
			test_cmp mod-z-expect victim
		

ok 13 - apply mod-z-patch without context

expecting success: 
			cat original >victim &&
			git update-index victim &&
			git apply --index --unidiff-zero del-a-patch.without || {
				cat del-a-patch.without
				(exit 1)
			} &&
			test_cmp del-a-expect victim
		

ok 14 - apply del-a-patch without context

expecting success: 
			cat original >victim &&
			git update-index victim &&
			git apply --index --unidiff-zero del-z-patch.without || {
				cat del-z-patch.without
				(exit 1)
			} &&
			test_cmp del-z-expect victim
		

ok 15 - apply del-z-patch without context
expecting success: 
		cat original >victim &&
		git update-index victim &&
		git apply --unidiff-zero --index add-a-ng.without || {
			cat add-a-ng.without
			(exit 1)
		} &&
		test_cmp add-a-expect victim
	

ok 16 - apply non-git add-a-patch without context
expecting success: 
		cat original >victim &&
		git update-index victim &&
		git apply --unidiff-zero --index add-z-ng.without || {
			cat add-z-ng.without
			(exit 1)
		} &&
		test_cmp add-z-expect victim
	

ok 17 - apply non-git add-z-patch without context

expecting success: 
		cat original >victim &&
		git update-index victim &&
		git apply --unidiff-zero --index insert-a-ng.without || {
			cat insert-a-ng.without
			(exit 1)
		} &&
		test_cmp insert-a-expect victim
	

ok 18 - apply non-git insert-a-patch without context

expecting success: 
		cat original >victim &&
		git update-index victim &&
		git apply --unidiff-zero --index mod-a-ng.without || {
			cat mod-a-ng.without
			(exit 1)
		} &&
		test_cmp mod-a-expect victim
	

ok 19 - apply non-git mod-a-patch without context
expecting success: 
		cat original >victim &&
		git update-index victim &&
		git apply --unidiff-zero --index mod-z-ng.without || {
			cat mod-z-ng.without
			(exit 1)
		} &&
		test_cmp mod-z-expect victim
	

ok 20 - apply non-git mod-z-patch without context

expecting success: 
		cat original >victim &&
		git update-index victim &&
		git apply --unidiff-zero --index del-a-ng.without || {
			cat del-a-ng.without
			(exit 1)
		} &&
		test_cmp del-a-expect victim
	

ok 21 - apply non-git del-a-patch without context

expecting success: 
		cat original >victim &&
		git update-index victim &&
		git apply --unidiff-zero --index del-z-ng.without || {
			cat del-z-ng.without
			(exit 1)
		} &&
		test_cmp del-z-expect victim
	

ok 22 - apply non-git del-z-patch without context

expecting success: 

	>file &&
	git add file &&
	echo aaa >file &&
	git diff >patch &&
	git add file &&
	echo bbb >file &&
	git add file &&
	test_must_fail git apply --check patch



ok 23 - two lines

expecting success: 
	{ echo a; echo b; echo c; echo d; } >file &&
	git add file &&
	echo e >>file &&
	git diff >patch &&
	>file &&
	test_must_fail git apply patch
ok 24 - apply patch with 3 context lines matching at end
# passed all 24 test(s)
1..24
