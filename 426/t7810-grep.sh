Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7810-grep/.git/
expecting success: 
	{
		echo foo mmap bar
		echo foo_mmap bar
		echo foo_mmap bar mmap
		echo foo mmap bar_mmap
		echo foo_mmap bar mmap baz
	} >file &&
	echo vvv >v &&
	echo ww w >w &&
	echo x x xx x >x &&
	echo y yy >y &&
	echo zzz > z &&
	mkdir t &&
	echo test >t/t &&
	echo vvv >t/v &&
	mkdir t/a &&
	echo vvv >t/a/v &&
	git add . &&
	test_tick &&
	git commit -m initial
[master (root-commit) 144bfa8] initial
 Author: A U Thor <author@example.com>
 10 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 file
 create mode 100644 hello.c
 create mode 100644 t/a/v
 create mode 100644 t/t
 create mode 100644 t/v
 create mode 100644 v
 create mode 100644 w
 create mode 100644 x
 create mode 100644 y
 create mode 100644 z

ok 1 - setup

expecting success: 
	test_must_fail git grep "("

ok 2 - grep should not segfault with a bad input

expecting success: 
		{
			echo ${HC}file:1:foo mmap bar
			echo ${HC}file:3:foo_mmap bar mmap
			echo ${HC}file:4:foo mmap bar_mmap
			echo ${HC}file:5:foo_mmap bar mmap baz
		} >expected &&
		git grep -n -w -e mmap $H >actual &&
		test_cmp expected actual
	
ok 3 - grep -w HEAD
expecting success: 
		: >expected &&
		test_must_fail git grep -n -w -e "^w" >actual &&
		test_cmp expected actual
	

ok 4 - grep -w HEAD (w)

expecting success: 
		{
			echo ${HC}x:1:x x xx x
		} >expected &&
		git grep -n -w -e "x xx* x" $H >actual &&
		test_cmp expected actual
	

ok 5 - grep -w HEAD (x)

expecting success: 
		{
			echo ${HC}y:1:y yy
		} >expected &&
		git grep -n -w -e "^y" $H >actual &&
		test_cmp expected actual
	

ok 6 - grep -w HEAD (y-1)

expecting success: 
		: >expected &&
		if git grep -n -w -e "^y y" $H >actual
		then
			echo should not have matched
			cat actual
			false
		else
			test_cmp expected actual
		fi
	

ok 7 - grep -w HEAD (y-2)

expecting success: 
		: >expected &&
		if git grep -n -w -e "^z" $H >actual
		then
			echo should not have matched
			cat actual
			false
		else
			test_cmp expected actual
		fi
	

ok 8 - grep -w HEAD (z)

expecting success: 
		echo "${HC}t/t:1:test" >expected &&
		git grep -n -e test $H >actual &&
		test_cmp expected actual
	

ok 9 - grep HEAD (t-1)

expecting success: 
		echo "${HC}t:1:test" >expected &&
		(
			cd t &&
			git grep -n -e test $H
		) >actual &&
		test_cmp expected actual
	

ok 10 - grep HEAD (t-2)

expecting success: 
		echo "${HC}t/t:1:test" >expected &&
		(
			cd t &&
			git grep --full-name -n -e test $H
		) >actual &&
		test_cmp expected actual
	

ok 11 - grep HEAD (t-3)

expecting success: 
		! git grep -c test $H | grep /dev/null
        

ok 12 - grep -c HEAD (no /dev/null)

expecting success: 
		{
			echo ${HC}t/a/v:1:vvv
			echo ${HC}t/v:1:vvv
			echo ${HC}v:1:vvv
		} >expected &&
		git grep --max-depth -1 -n -e vvv $H >actual &&
		test_cmp expected actual
	

ok 13 - grep --max-depth -1 HEAD

expecting success: 
		{
			echo ${HC}v:1:vvv
		} >expected &&
		git grep --max-depth 0 -n -e vvv $H >actual &&
		test_cmp expected actual
	

ok 14 - grep --max-depth 0 HEAD

expecting success: 
		{
			echo ${HC}t/a/v:1:vvv
			echo ${HC}t/v:1:vvv
			echo ${HC}v:1:vvv
		} >expected &&
		git grep --max-depth 0 -n -e vvv $H -- "*" >actual &&
		test_cmp expected actual
	

ok 15 - grep --max-depth 0 -- '*' HEAD

expecting success: 
		{
			echo ${HC}t/v:1:vvv
			echo ${HC}v:1:vvv
		} >expected &&
		git grep --max-depth 1 -n -e vvv $H >actual &&
		test_cmp expected actual
	

ok 16 - grep --max-depth 1 HEAD

expecting success: 
		{
			echo ${HC}t/v:1:vvv
		} >expected &&
		git grep --max-depth 0 -n -e vvv $H -- t >actual &&
		test_cmp expected actual
	

ok 17 - grep --max-depth 0 -- t HEAD

expecting success: 
		{
			echo ${HC}t/v:1:vvv
			echo ${HC}v:1:vvv
		} >expected &&
		git grep --max-depth 0 -n -e vvv $H -- . t >actual &&
		test_cmp expected actual
	

ok 18 - grep --max-depth 0 -- . t HEAD

expecting success: 
		{
			echo ${HC}t/v:1:vvv
			echo ${HC}v:1:vvv
		} >expected &&
		git grep --max-depth 0 -n -e vvv $H -- t . >actual &&
		test_cmp expected actual
	

ok 19 - grep --max-depth 0 -- t . HEAD

expecting success: 
		{
			echo ${HC}file:1:foo mmap bar
			echo ${HC}file:3:foo_mmap bar mmap
			echo ${HC}file:4:foo mmap bar_mmap
			echo ${HC}file:5:foo_mmap bar mmap baz
		} >expected &&
		git grep -n -w -e mmap $H >actual &&
		test_cmp expected actual
	

ok 20 - grep -w in working tree

expecting success: 
		: >expected &&
		test_must_fail git grep -n -w -e "^w" >actual &&
		test_cmp expected actual
	

ok 21 - grep -w in working tree (w)

expecting success: 
		{
			echo ${HC}x:1:x x xx x
		} >expected &&
		git grep -n -w -e "x xx* x" $H >actual &&
		test_cmp expected actual
	

ok 22 - grep -w in working tree (x)

expecting success: 
		{
			echo ${HC}y:1:y yy
		} >expected &&
		git grep -n -w -e "^y" $H >actual &&
		test_cmp expected actual
	

ok 23 - grep -w in working tree (y-1)

expecting success: 
		: >expected &&
		if git grep -n -w -e "^y y" $H >actual
		then
			echo should not have matched
			cat actual
			false
		else
			test_cmp expected actual
		fi
	

ok 24 - grep -w in working tree (y-2)

expecting success: 
		: >expected &&
		if git grep -n -w -e "^z" $H >actual
		then
			echo should not have matched
			cat actual
			false
		else
			test_cmp expected actual
		fi
	

ok 25 - grep -w in working tree (z)

expecting success: 
		echo "${HC}t/t:1:test" >expected &&
		git grep -n -e test $H >actual &&
		test_cmp expected actual
	

ok 26 - grep in working tree (t-1)

expecting success: 
		echo "${HC}t:1:test" >expected &&
		(
			cd t &&
			git grep -n -e test $H
		) >actual &&
		test_cmp expected actual
	

ok 27 - grep in working tree (t-2)

expecting success: 
		echo "${HC}t/t:1:test" >expected &&
		(
			cd t &&
			git grep --full-name -n -e test $H
		) >actual &&
		test_cmp expected actual
	

ok 28 - grep in working tree (t-3)

expecting success: 
		! git grep -c test $H | grep /dev/null
        

ok 29 - grep -c in working tree (no /dev/null)

expecting success: 
		{
			echo ${HC}t/a/v:1:vvv
			echo ${HC}t/v:1:vvv
			echo ${HC}v:1:vvv
		} >expected &&
		git grep --max-depth -1 -n -e vvv $H >actual &&
		test_cmp expected actual
	

ok 30 - grep --max-depth -1 in working tree

expecting success: 
		{
			echo ${HC}v:1:vvv
		} >expected &&
		git grep --max-depth 0 -n -e vvv $H >actual &&
		test_cmp expected actual
	

ok 31 - grep --max-depth 0 in working tree

expecting success: 
		{
			echo ${HC}t/a/v:1:vvv
			echo ${HC}t/v:1:vvv
			echo ${HC}v:1:vvv
		} >expected &&
		git grep --max-depth 0 -n -e vvv $H -- "*" >actual &&
		test_cmp expected actual
	

ok 32 - grep --max-depth 0 -- '*' in working tree

expecting success: 
		{
			echo ${HC}t/v:1:vvv
			echo ${HC}v:1:vvv
		} >expected &&
		git grep --max-depth 1 -n -e vvv $H >actual &&
		test_cmp expected actual
	

ok 33 - grep --max-depth 1 in working tree

expecting success: 
		{
			echo ${HC}t/v:1:vvv
		} >expected &&
		git grep --max-depth 0 -n -e vvv $H -- t >actual &&
		test_cmp expected actual
	

ok 34 - grep --max-depth 0 -- t in working tree

expecting success: 
		{
			echo ${HC}t/v:1:vvv
			echo ${HC}v:1:vvv
		} >expected &&
		git grep --max-depth 0 -n -e vvv $H -- . t >actual &&
		test_cmp expected actual
	

ok 35 - grep --max-depth 0 -- . t in working tree

expecting success: 
		{
			echo ${HC}t/v:1:vvv
			echo ${HC}v:1:vvv
		} >expected &&
		git grep --max-depth 0 -n -e vvv $H -- t . >actual &&
		test_cmp expected actual
	

ok 36 - grep --max-depth 0 -- t . in working tree

expecting success: 
	git grep -e "foo mmap" --and -e bar_mmap >actual &&
	test_cmp expected actual

ok 37 - grep -e A --and -e B

expecting success: 
	git grep \( -e foo_ --or -e baz \) \
		--and -e " mmap" >actual &&
	test_cmp expected actual

ok 38 - grep ( -e A --or -e B ) --and -e B
expecting success: 
	git grep -e "foo mmap" --and --not -e bar_mmap >actual &&
	test_cmp expected actual

ok 39 - grep -e A --and --not -e B
expecting success: 
	GREP_OPTIONS=-v git grep " mmap bar\$" >actual &&
	test_cmp expected actual

ok 40 - grep should ignore GREP_OPTIONS
expecting success: 
	test_must_fail git grep -f patterns

ok 41 - grep -f, non-existent file

expecting success: 
	git grep -f pattern >actual &&
	test_cmp expected actual


ok 42 - grep -f, one pattern

expecting success: 
	git grep -f patterns >actual &&
	test_cmp expected actual


ok 43 - grep -f, multiple patterns

expecting success: 
	git grep -f patterns >actual &&
	test_cmp expected actual


ok 44 - grep -f, ignore empty lines

expecting success: 
	>empty &&
	git grep -q mmap >actual &&
	test_cmp empty actual &&
	test_must_fail git grep -q qfwfq >actual &&
	test_cmp empty actual
ok 45 - grep -q, silently report matches

expecting success: 
	for a in $c32; do for b in $c32; do : >y-$a$b; done; done &&
	git add y-?? &&
	git grep -C1 "^[yz]" >actual &&
	test_cmp expected actual

ok 46 - grep -C1, hunk mark between files

expecting success: 
	git grep -C1 "^[yz]" >actual &&
	test_cmp expected actual

ok 47 - grep -C1 hunk mark between files

expecting success: 
	echo a >>file &&
	test_tick &&
	GIT_AUTHOR_NAME="With * Asterisk" \
	GIT_AUTHOR_EMAIL="xyzzy@frotz.com" \
	git commit -a -m "second" &&

	echo a >>file &&
	test_tick &&
	git commit -a -m "third" &&

	echo a >>file &&
	test_tick &&
	GIT_AUTHOR_NAME="Night Fall" \
	GIT_AUTHOR_EMAIL="nitfol@frobozz.com" \
	git commit -a -m "fourth"
[master 1c4a2ee] second
 Author: With * Asterisk <xyzzy@frotz.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 y-00
 create mode 100644 y-01
 create mode 100644 y-02
 create mode 100644 y-03
 create mode 100644 y-04
 create mode 100644 y-05
 create mode 100644 y-06
 create mode 100644 y-07
 create mode 100644 y-08
 create mode 100644 y-09
 create mode 100644 y-0a
 create mode 100644 y-0b
 create mode 100644 y-0c
 create mode 100644 y-0d
 create mode 100644 y-0e
 create mode 100644 y-0f
 create mode 100644 y-0g
 create mode 100644 y-0h
 create mode 100644 y-0i
 create mode 100644 y-0j
 create mode 100644 y-0k
 create mode 100644 y-0l
 create mode 100644 y-0m
 create mode 100644 y-0n
 create mode 100644 y-0o
 create mode 100644 y-0p
 create mode 100644 y-0q
 create mode 100644 y-0r
 create mode 100644 y-0s
 create mode 100644 y-0t
 create mode 100644 y-0u
 create mode 100644 y-0v
 create mode 100644 y-10
 create mode 100644 y-11
 create mode 100644 y-12
 create mode 100644 y-13
 create mode 100644 y-14
 create mode 100644 y-15
 create mode 100644 y-16
 create mode 100644 y-17
 create mode 100644 y-18
 create mode 100644 y-19
 create mode 100644 y-1a
 create mode 100644 y-1b
 create mode 100644 y-1c
 create mode 100644 y-1d
 create mode 100644 y-1e
 create mode 100644 y-1f
 create mode 100644 y-1g
 create mode 100644 y-1h
 create mode 100644 y-1i
 create mode 100644 y-1j
 create mode 100644 y-1k
 create mode 100644 y-1l
 create mode 100644 y-1m
 create mode 100644 y-1n
 create mode 100644 y-1o
 create mode 100644 y-1p
 create mode 100644 y-1q
 create mode 100644 y-1r
 create mode 100644 y-1s
 create mode 100644 y-1t
 create mode 100644 y-1u
 create mode 100644 y-1v
 create mode 100644 y-20
 create mode 100644 y-21
 create mode 100644 y-22
 create mode 100644 y-23
 create mode 100644 y-24
 create mode 100644 y-25
 create mode 100644 y-26
 create mode 100644 y-27
 create mode 100644 y-28
 create mode 100644 y-29
 create mode 100644 y-2a
 create mode 100644 y-2b
 create mode 100644 y-2c
 create mode 100644 y-2d
 create mode 100644 y-2e
 create mode 100644 y-2f
 create mode 100644 y-2g
 create mode 100644 y-2h
 create mode 100644 y-2i
 create mode 100644 y-2j
 create mode 100644 y-2k
 create mode 100644 y-2l
 create mode 100644 y-2m
 create mode 100644 y-2n
 create mode 100644 y-2o
 create mode 100644 y-2p
 create mode 100644 y-2q
 create mode 100644 y-2r
 create mode 100644 y-2s
 create mode 100644 y-2t
 create mode 100644 y-2u
 create mode 100644 y-2v
 create mode 100644 y-30
 create mode 100644 y-31
 create mode 100644 y-32
 create mode 100644 y-33
 create mode 100644 y-34
 create mode 100644 y-35
 create mode 100644 y-36
 create mode 100644 y-37
 create mode 100644 y-38
 create mode 100644 y-39
 create mode 100644 y-3a
 create mode 100644 y-3b
 create mode 100644 y-3c
 create mode 100644 y-3d
 create mode 100644 y-3e
 create mode 100644 y-3f
 create mode 100644 y-3g
 create mode 100644 y-3h
 create mode 100644 y-3i
 create mode 100644 y-3j
 create mode 100644 y-3k
 create mode 100644 y-3l
 create mode 100644 y-3m
 create mode 100644 y-3n
 create mode 100644 y-3o
 create mode 100644 y-3p
 create mode 100644 y-3q
 create mode 100644 y-3r
 create mode 100644 y-3s
 create mode 100644 y-3t
 create mode 100644 y-3u
 create mode 100644 y-3v
 create mode 100644 y-40
 create mode 100644 y-41
 create mode 100644 y-42
 create mode 100644 y-43
 create mode 100644 y-44
 create mode 100644 y-45
 create mode 100644 y-46
 create mode 100644 y-47
 create mode 100644 y-48
 create mode 100644 y-49
 create mode 100644 y-4a
 create mode 100644 y-4b
 create mode 100644 y-4c
 create mode 100644 y-4d
 create mode 100644 y-4e
 create mode 100644 y-4f
 create mode 100644 y-4g
 create mode 100644 y-4h
 create mode 100644 y-4i
 create mode 100644 y-4j
 create mode 100644 y-4k
 create mode 100644 y-4l
 create mode 100644 y-4m
 create mode 100644 y-4n
 create mode 100644 y-4o
 create mode 100644 y-4p
 create mode 100644 y-4q
 create mode 100644 y-4r
 create mode 100644 y-4s
 create mode 100644 y-4t
 create mode 100644 y-4u
 create mode 100644 y-4v
 create mode 100644 y-50
 create mode 100644 y-51
 create mode 100644 y-52
 create mode 100644 y-53
 create mode 100644 y-54
 create mode 100644 y-55
 create mode 100644 y-56
 create mode 100644 y-57
 create mode 100644 y-58
 create mode 100644 y-59
 create mode 100644 y-5a
 create mode 100644 y-5b
 create mode 100644 y-5c
 create mode 100644 y-5d
 create mode 100644 y-5e
 create mode 100644 y-5f
 create mode 100644 y-5g
 create mode 100644 y-5h
 create mode 100644 y-5i
 create mode 100644 y-5j
 create mode 100644 y-5k
 create mode 100644 y-5l
 create mode 100644 y-5m
 create mode 100644 y-5n
 create mode 100644 y-5o
 create mode 100644 y-5p
 create mode 100644 y-5q
 create mode 100644 y-5r
 create mode 100644 y-5s
 create mode 100644 y-5t
 create mode 100644 y-5u
 create mode 100644 y-5v
 create mode 100644 y-60
 create mode 100644 y-61
 create mode 100644 y-62
 create mode 100644 y-63
 create mode 100644 y-64
 create mode 100644 y-65
 create mode 100644 y-66
 create mode 100644 y-67
 create mode 100644 y-68
 create mode 100644 y-69
 create mode 100644 y-6a
 create mode 100644 y-6b
 create mode 100644 y-6c
 create mode 100644 y-6d
 create mode 100644 y-6e
 create mode 100644 y-6f
 create mode 100644 y-6g
 create mode 100644 y-6h
 create mode 100644 y-6i
 create mode 100644 y-6j
 create mode 100644 y-6k
 create mode 100644 y-6l
 create mode 100644 y-6m
 create mode 100644 y-6n
 create mode 100644 y-6o
 create mode 100644 y-6p
 create mode 100644 y-6q
 create mode 100644 y-6r
 create mode 100644 y-6s
 create mode 100644 y-6t
 create mode 100644 y-6u
 create mode 100644 y-6v
 create mode 100644 y-70
 create mode 100644 y-71
 create mode 100644 y-72
 create mode 100644 y-73
 create mode 100644 y-74
 create mode 100644 y-75
 create mode 100644 y-76
 create mode 100644 y-77
 create mode 100644 y-78
 create mode 100644 y-79
 create mode 100644 y-7a
 create mode 100644 y-7b
 create mode 100644 y-7c
 create mode 100644 y-7d
 create mode 100644 y-7e
 create mode 100644 y-7f
 create mode 100644 y-7g
 create mode 100644 y-7h
 create mode 100644 y-7i
 create mode 100644 y-7j
 create mode 100644 y-7k
 create mode 100644 y-7l
 create mode 100644 y-7m
 create mode 100644 y-7n
 create mode 100644 y-7o
 create mode 100644 y-7p
 create mode 100644 y-7q
 create mode 100644 y-7r
 create mode 100644 y-7s
 create mode 100644 y-7t
 create mode 100644 y-7u
 create mode 100644 y-7v
 create mode 100644 y-80
 create mode 100644 y-81
 create mode 100644 y-82
 create mode 100644 y-83
 create mode 100644 y-84
 create mode 100644 y-85
 create mode 100644 y-86
 create mode 100644 y-87
 create mode 100644 y-88
 create mode 100644 y-89
 create mode 100644 y-8a
 create mode 100644 y-8b
 create mode 100644 y-8c
 create mode 100644 y-8d
 create mode 100644 y-8e
 create mode 100644 y-8f
 create mode 100644 y-8g
 create mode 100644 y-8h
 create mode 100644 y-8i
 create mode 100644 y-8j
 create mode 100644 y-8k
 create mode 100644 y-8l
 create mode 100644 y-8m
 create mode 100644 y-8n
 create mode 100644 y-8o
 create mode 100644 y-8p
 create mode 100644 y-8q
 create mode 100644 y-8r
 create mode 100644 y-8s
 create mode 100644 y-8t
 create mode 100644 y-8u
 create mode 100644 y-8v
 create mode 100644 y-90
 create mode 100644 y-91
 create mode 100644 y-92
 create mode 100644 y-93
 create mode 100644 y-94
 create mode 100644 y-95
 create mode 100644 y-96
 create mode 100644 y-97
 create mode 100644 y-98
 create mode 100644 y-99
 create mode 100644 y-9a
 create mode 100644 y-9b
 create mode 100644 y-9c
 create mode 100644 y-9d
 create mode 100644 y-9e
 create mode 100644 y-9f
 create mode 100644 y-9g
 create mode 100644 y-9h
 create mode 100644 y-9i
 create mode 100644 y-9j
 create mode 100644 y-9k
 create mode 100644 y-9l
 create mode 100644 y-9m
 create mode 100644 y-9n
 create mode 100644 y-9o
 create mode 100644 y-9p
 create mode 100644 y-9q
 create mode 100644 y-9r
 create mode 100644 y-9s
 create mode 100644 y-9t
 create mode 100644 y-9u
 create mode 100644 y-9v
 create mode 100644 y-a0
 create mode 100644 y-a1
 create mode 100644 y-a2
 create mode 100644 y-a3
 create mode 100644 y-a4
 create mode 100644 y-a5
 create mode 100644 y-a6
 create mode 100644 y-a7
 create mode 100644 y-a8
 create mode 100644 y-a9
 create mode 100644 y-aa
 create mode 100644 y-ab
 create mode 100644 y-ac
 create mode 100644 y-ad
 create mode 100644 y-ae
 create mode 100644 y-af
 create mode 100644 y-ag
 create mode 100644 y-ah
 create mode 100644 y-ai
 create mode 100644 y-aj
 create mode 100644 y-ak
 create mode 100644 y-al
 create mode 100644 y-am
 create mode 100644 y-an
 create mode 100644 y-ao
 create mode 100644 y-ap
 create mode 100644 y-aq
 create mode 100644 y-ar
 create mode 100644 y-as
 create mode 100644 y-at
 create mode 100644 y-au
 create mode 100644 y-av
 create mode 100644 y-b0
 create mode 100644 y-b1
 create mode 100644 y-b2
 create mode 100644 y-b3
 create mode 100644 y-b4
 create mode 100644 y-b5
 create mode 100644 y-b6
 create mode 100644 y-b7
 create mode 100644 y-b8
 create mode 100644 y-b9
 create mode 100644 y-ba
 create mode 100644 y-bb
 create mode 100644 y-bc
 create mode 100644 y-bd
 create mode 100644 y-be
 create mode 100644 y-bf
 create mode 100644 y-bg
 create mode 100644 y-bh
 create mode 100644 y-bi
 create mode 100644 y-bj
 create mode 100644 y-bk
 create mode 100644 y-bl
 create mode 100644 y-bm
 create mode 100644 y-bn
 create mode 100644 y-bo
 create mode 100644 y-bp
 create mode 100644 y-bq
 create mode 100644 y-br
 create mode 100644 y-bs
 create mode 100644 y-bt
 create mode 100644 y-bu
 create mode 100644 y-bv
 create mode 100644 y-c0
 create mode 100644 y-c1
 create mode 100644 y-c2
 create mode 100644 y-c3
 create mode 100644 y-c4
 create mode 100644 y-c5
 create mode 100644 y-c6
 create mode 100644 y-c7
 create mode 100644 y-c8
 create mode 100644 y-c9
 create mode 100644 y-ca
 create mode 100644 y-cb
 create mode 100644 y-cc
 create mode 100644 y-cd
 create mode 100644 y-ce
 create mode 100644 y-cf
 create mode 100644 y-cg
 create mode 100644 y-ch
 create mode 100644 y-ci
 create mode 100644 y-cj
 create mode 100644 y-ck
 create mode 100644 y-cl
 create mode 100644 y-cm
 create mode 100644 y-cn
 create mode 100644 y-co
 create mode 100644 y-cp
 create mode 100644 y-cq
 create mode 100644 y-cr
 create mode 100644 y-cs
 create mode 100644 y-ct
 create mode 100644 y-cu
 create mode 100644 y-cv
 create mode 100644 y-d0
 create mode 100644 y-d1
 create mode 100644 y-d2
 create mode 100644 y-d3
 create mode 100644 y-d4
 create mode 100644 y-d5
 create mode 100644 y-d6
 create mode 100644 y-d7
 create mode 100644 y-d8
 create mode 100644 y-d9
 create mode 100644 y-da
 create mode 100644 y-db
 create mode 100644 y-dc
 create mode 100644 y-dd
 create mode 100644 y-de
 create mode 100644 y-df
 create mode 100644 y-dg
 create mode 100644 y-dh
 create mode 100644 y-di
 create mode 100644 y-dj
 create mode 100644 y-dk
 create mode 100644 y-dl
 create mode 100644 y-dm
 create mode 100644 y-dn
 create mode 100644 y-do
 create mode 100644 y-dp
 create mode 100644 y-dq
 create mode 100644 y-dr
 create mode 100644 y-ds
 create mode 100644 y-dt
 create mode 100644 y-du
 create mode 100644 y-dv
 create mode 100644 y-e0
 create mode 100644 y-e1
 create mode 100644 y-e2
 create mode 100644 y-e3
 create mode 100644 y-e4
 create mode 100644 y-e5
 create mode 100644 y-e6
 create mode 100644 y-e7
 create mode 100644 y-e8
 create mode 100644 y-e9
 create mode 100644 y-ea
 create mode 100644 y-eb
 create mode 100644 y-ec
 create mode 100644 y-ed
 create mode 100644 y-ee
 create mode 100644 y-ef
 create mode 100644 y-eg
 create mode 100644 y-eh
 create mode 100644 y-ei
 create mode 100644 y-ej
 create mode 100644 y-ek
 create mode 100644 y-el
 create mode 100644 y-em
 create mode 100644 y-en
 create mode 100644 y-eo
 create mode 100644 y-ep
 create mode 100644 y-eq
 create mode 100644 y-er
 create mode 100644 y-es
 create mode 100644 y-et
 create mode 100644 y-eu
 create mode 100644 y-ev
 create mode 100644 y-f0
 create mode 100644 y-f1
 create mode 100644 y-f2
 create mode 100644 y-f3
 create mode 100644 y-f4
 create mode 100644 y-f5
 create mode 100644 y-f6
 create mode 100644 y-f7
 create mode 100644 y-f8
 create mode 100644 y-f9
 create mode 100644 y-fa
 create mode 100644 y-fb
 create mode 100644 y-fc
 create mode 100644 y-fd
 create mode 100644 y-fe
 create mode 100644 y-ff
 create mode 100644 y-fg
 create mode 100644 y-fh
 create mode 100644 y-fi
 create mode 100644 y-fj
 create mode 100644 y-fk
 create mode 100644 y-fl
 create mode 100644 y-fm
 create mode 100644 y-fn
 create mode 100644 y-fo
 create mode 100644 y-fp
 create mode 100644 y-fq
 create mode 100644 y-fr
 create mode 100644 y-fs
 create mode 100644 y-ft
 create mode 100644 y-fu
 create mode 100644 y-fv
 create mode 100644 y-g0
 create mode 100644 y-g1
 create mode 100644 y-g2
 create mode 100644 y-g3
 create mode 100644 y-g4
 create mode 100644 y-g5
 create mode 100644 y-g6
 create mode 100644 y-g7
 create mode 100644 y-g8
 create mode 100644 y-g9
 create mode 100644 y-ga
 create mode 100644 y-gb
 create mode 100644 y-gc
 create mode 100644 y-gd
 create mode 100644 y-ge
 create mode 100644 y-gf
 create mode 100644 y-gg
 create mode 100644 y-gh
 create mode 100644 y-gi
 create mode 100644 y-gj
 create mode 100644 y-gk
 create mode 100644 y-gl
 create mode 100644 y-gm
 create mode 100644 y-gn
 create mode 100644 y-go
 create mode 100644 y-gp
 create mode 100644 y-gq
 create mode 100644 y-gr
 create mode 100644 y-gs
 create mode 100644 y-gt
 create mode 100644 y-gu
 create mode 100644 y-gv
 create mode 100644 y-h0
 create mode 100644 y-h1
 create mode 100644 y-h2
 create mode 100644 y-h3
 create mode 100644 y-h4
 create mode 100644 y-h5
 create mode 100644 y-h6
 create mode 100644 y-h7
 create mode 100644 y-h8
 create mode 100644 y-h9
 create mode 100644 y-ha
 create mode 100644 y-hb
 create mode 100644 y-hc
 create mode 100644 y-hd
 create mode 100644 y-he
 create mode 100644 y-hf
 create mode 100644 y-hg
 create mode 100644 y-hh
 create mode 100644 y-hi
 create mode 100644 y-hj
 create mode 100644 y-hk
 create mode 100644 y-hl
 create mode 100644 y-hm
 create mode 100644 y-hn
 create mode 100644 y-ho
 create mode 100644 y-hp
 create mode 100644 y-hq
 create mode 100644 y-hr
 create mode 100644 y-hs
 create mode 100644 y-ht
 create mode 100644 y-hu
 create mode 100644 y-hv
 create mode 100644 y-i0
 create mode 100644 y-i1
 create mode 100644 y-i2
 create mode 100644 y-i3
 create mode 100644 y-i4
 create mode 100644 y-i5
 create mode 100644 y-i6
 create mode 100644 y-i7
 create mode 100644 y-i8
 create mode 100644 y-i9
 create mode 100644 y-ia
 create mode 100644 y-ib
 create mode 100644 y-ic
 create mode 100644 y-id
 create mode 100644 y-ie
 create mode 100644 y-if
 create mode 100644 y-ig
 create mode 100644 y-ih
 create mode 100644 y-ii
 create mode 100644 y-ij
 create mode 100644 y-ik
 create mode 100644 y-il
 create mode 100644 y-im
 create mode 100644 y-in
 create mode 100644 y-io
 create mode 100644 y-ip
 create mode 100644 y-iq
 create mode 100644 y-ir
 create mode 100644 y-is
 create mode 100644 y-it
 create mode 100644 y-iu
 create mode 100644 y-iv
 create mode 100644 y-j0
 create mode 100644 y-j1
 create mode 100644 y-j2
 create mode 100644 y-j3
 create mode 100644 y-j4
 create mode 100644 y-j5
 create mode 100644 y-j6
 create mode 100644 y-j7
 create mode 100644 y-j8
 create mode 100644 y-j9
 create mode 100644 y-ja
 create mode 100644 y-jb
 create mode 100644 y-jc
 create mode 100644 y-jd
 create mode 100644 y-je
 create mode 100644 y-jf
 create mode 100644 y-jg
 create mode 100644 y-jh
 create mode 100644 y-ji
 create mode 100644 y-jj
 create mode 100644 y-jk
 create mode 100644 y-jl
 create mode 100644 y-jm
 create mode 100644 y-jn
 create mode 100644 y-jo
 create mode 100644 y-jp
 create mode 100644 y-jq
 create mode 100644 y-jr
 create mode 100644 y-js
 create mode 100644 y-jt
 create mode 100644 y-ju
 create mode 100644 y-jv
 create mode 100644 y-k0
 create mode 100644 y-k1
 create mode 100644 y-k2
 create mode 100644 y-k3
 create mode 100644 y-k4
 create mode 100644 y-k5
 create mode 100644 y-k6
 create mode 100644 y-k7
 create mode 100644 y-k8
 create mode 100644 y-k9
 create mode 100644 y-ka
 create mode 100644 y-kb
 create mode 100644 y-kc
 create mode 100644 y-kd
 create mode 100644 y-ke
 create mode 100644 y-kf
 create mode 100644 y-kg
 create mode 100644 y-kh
 create mode 100644 y-ki
 create mode 100644 y-kj
 create mode 100644 y-kk
 create mode 100644 y-kl
 create mode 100644 y-km
 create mode 100644 y-kn
 create mode 100644 y-ko
 create mode 100644 y-kp
 create mode 100644 y-kq
 create mode 100644 y-kr
 create mode 100644 y-ks
 create mode 100644 y-kt
 create mode 100644 y-ku
 create mode 100644 y-kv
 create mode 100644 y-l0
 create mode 100644 y-l1
 create mode 100644 y-l2
 create mode 100644 y-l3
 create mode 100644 y-l4
 create mode 100644 y-l5
 create mode 100644 y-l6
 create mode 100644 y-l7
 create mode 100644 y-l8
 create mode 100644 y-l9
 create mode 100644 y-la
 create mode 100644 y-lb
 create mode 100644 y-lc
 create mode 100644 y-ld
 create mode 100644 y-le
 create mode 100644 y-lf
 create mode 100644 y-lg
 create mode 100644 y-lh
 create mode 100644 y-li
 create mode 100644 y-lj
 create mode 100644 y-lk
 create mode 100644 y-ll
 create mode 100644 y-lm
 create mode 100644 y-ln
 create mode 100644 y-lo
 create mode 100644 y-lp
 create mode 100644 y-lq
 create mode 100644 y-lr
 create mode 100644 y-ls
 create mode 100644 y-lt
 create mode 100644 y-lu
 create mode 100644 y-lv
 create mode 100644 y-m0
 create mode 100644 y-m1
 create mode 100644 y-m2
 create mode 100644 y-m3
 create mode 100644 y-m4
 create mode 100644 y-m5
 create mode 100644 y-m6
 create mode 100644 y-m7
 create mode 100644 y-m8
 create mode 100644 y-m9
 create mode 100644 y-ma
 create mode 100644 y-mb
 create mode 100644 y-mc
 create mode 100644 y-md
 create mode 100644 y-me
 create mode 100644 y-mf
 create mode 100644 y-mg
 create mode 100644 y-mh
 create mode 100644 y-mi
 create mode 100644 y-mj
 create mode 100644 y-mk
 create mode 100644 y-ml
 create mode 100644 y-mm
 create mode 100644 y-mn
 create mode 100644 y-mo
 create mode 100644 y-mp
 create mode 100644 y-mq
 create mode 100644 y-mr
 create mode 100644 y-ms
 create mode 100644 y-mt
 create mode 100644 y-mu
 create mode 100644 y-mv
 create mode 100644 y-n0
 create mode 100644 y-n1
 create mode 100644 y-n2
 create mode 100644 y-n3
 create mode 100644 y-n4
 create mode 100644 y-n5
 create mode 100644 y-n6
 create mode 100644 y-n7
 create mode 100644 y-n8
 create mode 100644 y-n9
 create mode 100644 y-na
 create mode 100644 y-nb
 create mode 100644 y-nc
 create mode 100644 y-nd
 create mode 100644 y-ne
 create mode 100644 y-nf
 create mode 100644 y-ng
 create mode 100644 y-nh
 create mode 100644 y-ni
 create mode 100644 y-nj
 create mode 100644 y-nk
 create mode 100644 y-nl
 create mode 100644 y-nm
 create mode 100644 y-nn
 create mode 100644 y-no
 create mode 100644 y-np
 create mode 100644 y-nq
 create mode 100644 y-nr
 create mode 100644 y-ns
 create mode 100644 y-nt
 create mode 100644 y-nu
 create mode 100644 y-nv
 create mode 100644 y-o0
 create mode 100644 y-o1
 create mode 100644 y-o2
 create mode 100644 y-o3
 create mode 100644 y-o4
 create mode 100644 y-o5
 create mode 100644 y-o6
 create mode 100644 y-o7
 create mode 100644 y-o8
 create mode 100644 y-o9
 create mode 100644 y-oa
 create mode 100644 y-ob
 create mode 100644 y-oc
 create mode 100644 y-od
 create mode 100644 y-oe
 create mode 100644 y-of
 create mode 100644 y-og
 create mode 100644 y-oh
 create mode 100644 y-oi
 create mode 100644 y-oj
 create mode 100644 y-ok
 create mode 100644 y-ol
 create mode 100644 y-om
 create mode 100644 y-on
 create mode 100644 y-oo
 create mode 100644 y-op
 create mode 100644 y-oq
 create mode 100644 y-or
 create mode 100644 y-os
 create mode 100644 y-ot
 create mode 100644 y-ou
 create mode 100644 y-ov
 create mode 100644 y-p0
 create mode 100644 y-p1
 create mode 100644 y-p2
 create mode 100644 y-p3
 create mode 100644 y-p4
 create mode 100644 y-p5
 create mode 100644 y-p6
 create mode 100644 y-p7
 create mode 100644 y-p8
 create mode 100644 y-p9
 create mode 100644 y-pa
 create mode 100644 y-pb
 create mode 100644 y-pc
 create mode 100644 y-pd
 create mode 100644 y-pe
 create mode 100644 y-pf
 create mode 100644 y-pg
 create mode 100644 y-ph
 create mode 100644 y-pi
 create mode 100644 y-pj
 create mode 100644 y-pk
 create mode 100644 y-pl
 create mode 100644 y-pm
 create mode 100644 y-pn
 create mode 100644 y-po
 create mode 100644 y-pp
 create mode 100644 y-pq
 create mode 100644 y-pr
 create mode 100644 y-ps
 create mode 100644 y-pt
 create mode 100644 y-pu
 create mode 100644 y-pv
 create mode 100644 y-q0
 create mode 100644 y-q1
 create mode 100644 y-q2
 create mode 100644 y-q3
 create mode 100644 y-q4
 create mode 100644 y-q5
 create mode 100644 y-q6
 create mode 100644 y-q7
 create mode 100644 y-q8
 create mode 100644 y-q9
 create mode 100644 y-qa
 create mode 100644 y-qb
 create mode 100644 y-qc
 create mode 100644 y-qd
 create mode 100644 y-qe
 create mode 100644 y-qf
 create mode 100644 y-qg
 create mode 100644 y-qh
 create mode 100644 y-qi
 create mode 100644 y-qj
 create mode 100644 y-qk
 create mode 100644 y-ql
 create mode 100644 y-qm
 create mode 100644 y-qn
 create mode 100644 y-qo
 create mode 100644 y-qp
 create mode 100644 y-qq
 create mode 100644 y-qr
 create mode 100644 y-qs
 create mode 100644 y-qt
 create mode 100644 y-qu
 create mode 100644 y-qv
 create mode 100644 y-r0
 create mode 100644 y-r1
 create mode 100644 y-r2
 create mode 100644 y-r3
 create mode 100644 y-r4
 create mode 100644 y-r5
 create mode 100644 y-r6
 create mode 100644 y-r7
 create mode 100644 y-r8
 create mode 100644 y-r9
 create mode 100644 y-ra
 create mode 100644 y-rb
 create mode 100644 y-rc
 create mode 100644 y-rd
 create mode 100644 y-re
 create mode 100644 y-rf
 create mode 100644 y-rg
 create mode 100644 y-rh
 create mode 100644 y-ri
 create mode 100644 y-rj
 create mode 100644 y-rk
 create mode 100644 y-rl
 create mode 100644 y-rm
 create mode 100644 y-rn
 create mode 100644 y-ro
 create mode 100644 y-rp
 create mode 100644 y-rq
 create mode 100644 y-rr
 create mode 100644 y-rs
 create mode 100644 y-rt
 create mode 100644 y-ru
 create mode 100644 y-rv
 create mode 100644 y-s0
 create mode 100644 y-s1
 create mode 100644 y-s2
 create mode 100644 y-s3
 create mode 100644 y-s4
 create mode 100644 y-s5
 create mode 100644 y-s6
 create mode 100644 y-s7
 create mode 100644 y-s8
 create mode 100644 y-s9
 create mode 100644 y-sa
 create mode 100644 y-sb
 create mode 100644 y-sc
 create mode 100644 y-sd
 create mode 100644 y-se
 create mode 100644 y-sf
 create mode 100644 y-sg
 create mode 100644 y-sh
 create mode 100644 y-si
 create mode 100644 y-sj
 create mode 100644 y-sk
 create mode 100644 y-sl
 create mode 100644 y-sm
 create mode 100644 y-sn
 create mode 100644 y-so
 create mode 100644 y-sp
 create mode 100644 y-sq
 create mode 100644 y-sr
 create mode 100644 y-ss
 create mode 100644 y-st
 create mode 100644 y-su
 create mode 100644 y-sv
 create mode 100644 y-t0
 create mode 100644 y-t1
 create mode 100644 y-t2
 create mode 100644 y-t3
 create mode 100644 y-t4
 create mode 100644 y-t5
 create mode 100644 y-t6
 create mode 100644 y-t7
 create mode 100644 y-t8
 create mode 100644 y-t9
 create mode 100644 y-ta
 create mode 100644 y-tb
 create mode 100644 y-tc
 create mode 100644 y-td
 create mode 100644 y-te
 create mode 100644 y-tf
 create mode 100644 y-tg
 create mode 100644 y-th
 create mode 100644 y-ti
 create mode 100644 y-tj
 create mode 100644 y-tk
 create mode 100644 y-tl
 create mode 100644 y-tm
 create mode 100644 y-tn
 create mode 100644 y-to
 create mode 100644 y-tp
 create mode 100644 y-tq
 create mode 100644 y-tr
 create mode 100644 y-ts
 create mode 100644 y-tt
 create mode 100644 y-tu
 create mode 100644 y-tv
 create mode 100644 y-u0
 create mode 100644 y-u1
 create mode 100644 y-u2
 create mode 100644 y-u3
 create mode 100644 y-u4
 create mode 100644 y-u5
 create mode 100644 y-u6
 create mode 100644 y-u7
 create mode 100644 y-u8
 create mode 100644 y-u9
 create mode 100644 y-ua
 create mode 100644 y-ub
 create mode 100644 y-uc
 create mode 100644 y-ud
 create mode 100644 y-ue
 create mode 100644 y-uf
 create mode 100644 y-ug
 create mode 100644 y-uh
 create mode 100644 y-ui
 create mode 100644 y-uj
 create mode 100644 y-uk
 create mode 100644 y-ul
 create mode 100644 y-um
 create mode 100644 y-un
 create mode 100644 y-uo
 create mode 100644 y-up
 create mode 100644 y-uq
 create mode 100644 y-ur
 create mode 100644 y-us
 create mode 100644 y-ut
 create mode 100644 y-uu
 create mode 100644 y-uv
 create mode 100644 y-v0
 create mode 100644 y-v1
 create mode 100644 y-v2
 create mode 100644 y-v3
 create mode 100644 y-v4
 create mode 100644 y-v5
 create mode 100644 y-v6
 create mode 100644 y-v7
 create mode 100644 y-v8
 create mode 100644 y-v9
 create mode 100644 y-va
 create mode 100644 y-vb
 create mode 100644 y-vc
 create mode 100644 y-vd
 create mode 100644 y-ve
 create mode 100644 y-vf
 create mode 100644 y-vg
 create mode 100644 y-vh
 create mode 100644 y-vi
 create mode 100644 y-vj
 create mode 100644 y-vk
 create mode 100644 y-vl
 create mode 100644 y-vm
 create mode 100644 y-vn
 create mode 100644 y-vo
 create mode 100644 y-vp
 create mode 100644 y-vq
 create mode 100644 y-vr
 create mode 100644 y-vs
 create mode 100644 y-vt
 create mode 100644 y-vu
 create mode 100644 y-vv
[master d687bb6] third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 0f4a26f] fourth
 Author: Night Fall <nitfol@frobozz.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 48 - log grep setup

expecting success: 
	git log --author=author --pretty=tformat:%s >actual &&
	( echo third ; echo initial ) >expect &&
	test_cmp expect actual


ok 49 - log grep (1)

expecting success: 
	git log --author=" * " -F --pretty=tformat:%s >actual &&
	( echo second ) >expect &&
	test_cmp expect actual


ok 50 - log grep (2)

expecting success: 
	git log --author="^A U" --pretty=tformat:%s >actual &&
	( echo third ; echo initial ) >expect &&
	test_cmp expect actual


ok 51 - log grep (3)

expecting success: 
	git log --author="frotz\.com>$" --pretty=tformat:%s >actual &&
	( echo second ) >expect &&
	test_cmp expect actual


ok 52 - log grep (4)

expecting success: 
	git log --author=Thor -F --pretty=tformat:%s >actual &&
	( echo third ; echo initial ) >expect &&
	test_cmp expect actual


ok 53 - log grep (5)

expecting success: 
	git log --author=-0700  --pretty=tformat:%s >actual &&
	>expect &&
	test_cmp expect actual


ok 54 - log grep (6)

expecting success: 
	# grep matches initial and second but not third
	# author matches only initial and third
	git log --author="A U Thor" --grep=s --grep=l --format=%s >actual &&
	echo initial >expect &&
	test_cmp expect actual


ok 55 - log --grep --author implicitly uses all-match

expecting success: 
	git log --author="Thor" --author="Aster" --format=%s >actual &&
	{
	    echo third && echo second && echo initial
	} >expect &&
	test_cmp expect actual


ok 56 - log with multiple --author uses union

expecting success: 
	git log --author="Thor" --author="Night" --grep=i --format=%s >actual &&
	{
	    echo third && echo initial
	} >expect &&
	test_cmp expect actual


ok 57 - log with --grep and multiple --author uses all-match

expecting success: 
	git log --author="Thor" --author="Night" --grep=q --format=%s >actual &&
	>expect &&
	test_cmp expect actual


ok 58 - log with --grep and multiple --author uses all-match

expecting success: 
	git update-index --assume-unchanged t/t &&
	rm t/t &&
	test "$(git grep test)" = "t/t:test" &&
	git update-index --no-assume-unchanged t/t &&
	git checkout t/t


ok 59 - grep with CE_VALID file

expecting success: 
	git config diff.custom.funcname "^#" &&
	echo "hello.c diff=custom" >.gitattributes &&
	git grep -p return >actual &&
	test_cmp expected actual


ok 60 - grep -p with userdiff

expecting success: 
	rm -f .gitattributes &&
	git grep -p return >actual &&
	test_cmp expected actual


ok 61 - grep -p
expecting success: 
	git grep -p -B5 return >actual &&
	test_cmp expected actual


ok 62 - grep -p -B5

expecting success: 
	mkdir -p s &&
	(
		cd s && git grep "x x x" ..
	)

../x:x x xx x

ok 63 - grep from a subdirectory to search wider area (1)

expecting success: 
	mkdir -p s &&
	(
		cd s || exit 1
		( git grep xxyyzz .. >out ; echo $? >status )
		! test -s out &&
		test 1 = $(cat status)
	)


ok 64 - grep from a subdirectory to search wider area (2)

expecting success: 
	git grep -Fi "CHAR *" >actual &&
	test_cmp expected actual

ok 65 - grep -Fi

expecting success: 
	rm -fr non &&
	mkdir -p non/git/sub &&
	echo hello >non/git/file1 &&
	echo world >non/git/sub/file2 &&
	echo ".*o*" >non/git/.gitignore &&
	{
		echo file1:hello &&
		echo sub/file2:world
	} >non/expect.full &&
	echo file2:world >non/expect.sub &&
	(
		GIT_CEILING_DIRECTORIES="$(pwd)/non/git" &&
		export GIT_CEILING_DIRECTORIES &&
		cd non/git &&
		test_must_fail git grep o &&
		git grep --no-index o >../actual.full &&
		test_cmp ../expect.full ../actual.full
		cd sub &&
		test_must_fail git grep o &&
		git grep --no-index o >../../actual.sub &&
		test_cmp ../../expect.sub ../../actual.sub
	)

ok 66 - outside of git repository

expecting success: 
	rm -fr is &&
	mkdir -p is/git/sub &&
	echo hello >is/git/file1 &&
	echo world >is/git/sub/file2 &&
	echo ".*o*" >is/git/.gitignore &&
	{
		echo file1:hello &&
		echo sub/file2:world
	} >is/expect.full &&
	: >is/expect.empty &&
	echo file2:world >is/expect.sub &&
	(
		cd is/git &&
		git init &&
		test_must_fail git grep o >../actual.full &&
		test_cmp ../expect.empty ../actual.full &&
		git grep --no-index o >../actual.full &&
		test_cmp ../expect.full ../actual.full &&
		cd sub &&
		test_must_fail git grep o >../../actual.sub &&
		test_cmp ../../expect.empty ../../actual.sub &&
		git grep --no-index o >../../actual.sub &&
		test_cmp ../../expect.sub ../../actual.sub
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7810-grep/is/git/.git/
ok 67 - inside git repository but with --no-index
expecting success: 
cat >double-dash <<EOF &&
--
->
other
EOF
git add double-dash

ok 68 - setup double-dash tests
expecting success: 
	git grep -- "->" >actual &&
	test_cmp expected actual

ok 69 - grep -- pattern

expecting success: 
	git grep -- "->" -- double-dash >actual &&
	test_cmp expected actual


ok 70 - grep -- pattern -- pathspec

expecting success: 
	git grep -e "->" -- double-dash >actual &&
	test_cmp expected actual

ok 71 - grep -e pattern -- path

expecting success: 
	git grep -e -- -- double-dash >actual &&
	test_cmp expected actual


ok 72 - grep -e -- -- path

# passed all 72 test(s)
1..72
