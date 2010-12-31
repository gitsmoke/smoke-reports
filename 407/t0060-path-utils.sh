Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0060-path-utils/.git/
expecting success: test "$(test-path-utils normalize_path_copy '')" = ''
ok 1 - normalize path:  => 
expecting success: test "$(test-path-utils normalize_path_copy '.')" = ''
ok 2 - normalize path: . => 
expecting success: test "$(test-path-utils normalize_path_copy './')" = ''

ok 3 - normalize path: ./ => 
expecting success: test "$(test-path-utils normalize_path_copy './.')" = ''
ok 4 - normalize path: ./. => 

expecting success: test "$(test-path-utils normalize_path_copy './..')" = '++failed++'

ok 5 - normalize path: ./.. => ++failed++
expecting success: test "$(test-path-utils normalize_path_copy '../.')" = '++failed++'

ok 6 - normalize path: ../. => ++failed++

expecting success: test "$(test-path-utils normalize_path_copy './.././/')" = '++failed++'

ok 7 - normalize path: ./../.// => ++failed++

expecting success: test "$(test-path-utils normalize_path_copy 'dir/..')" = ''

ok 8 - normalize path: dir/.. => 

expecting success: test "$(test-path-utils normalize_path_copy 'dir/sub/../..')" = ''

ok 9 - normalize path: dir/sub/../.. => 

expecting success: test "$(test-path-utils normalize_path_copy 'dir/sub/../../..')" = '++failed++'

ok 10 - normalize path: dir/sub/../../.. => ++failed++

expecting success: test "$(test-path-utils normalize_path_copy 'dir')" = 'dir'

ok 11 - normalize path: dir => dir

expecting success: test "$(test-path-utils normalize_path_copy 'dir//')" = 'dir/'

ok 12 - normalize path: dir// => dir/

expecting success: test "$(test-path-utils normalize_path_copy './dir')" = 'dir'

ok 13 - normalize path: ./dir => dir

expecting success: test "$(test-path-utils normalize_path_copy 'dir/.')" = 'dir/'

ok 14 - normalize path: dir/. => dir/

expecting success: test "$(test-path-utils normalize_path_copy 'dir///./')" = 'dir/'

ok 15 - normalize path: dir///./ => dir/
expecting success: test "$(test-path-utils normalize_path_copy 'dir//sub/..')" = 'dir/'

ok 16 - normalize path: dir//sub/.. => dir/
expecting success: test "$(test-path-utils normalize_path_copy 'dir/sub/../')" = 'dir/'
ok 17 - normalize path: dir/sub/../ => dir/
expecting success: test "$(test-path-utils normalize_path_copy 'dir/sub/../.')" = 'dir/'
ok 18 - normalize path: dir/sub/../. => dir/
expecting success: test "$(test-path-utils normalize_path_copy 'dir/s1/../s2/')" = 'dir/s2/'
ok 19 - normalize path: dir/s1/../s2/ => dir/s2/
expecting success: test "$(test-path-utils normalize_path_copy 'd1/s1///s2/..//../s3/')" = 'd1/s3/'
ok 20 - normalize path: d1/s1///s2/..//../s3/ => d1/s3/
expecting success: test "$(test-path-utils normalize_path_copy 'd1/s1//../s2/../../d2')" = 'd2'
ok 21 - normalize path: d1/s1//../s2/../../d2 => d2
expecting success: test "$(test-path-utils normalize_path_copy 'd1/.../d2')" = 'd1/.../d2'

ok 22 - normalize path: d1/.../d2 => d1/.../d2

expecting success: test "$(test-path-utils normalize_path_copy 'd1/..././../d2')" = 'd1/d2'

ok 23 - normalize path: d1/..././../d2 => d1/d2

expecting success: test "$(test-path-utils normalize_path_copy '/')" = '/'

ok 24 - normalize path: / => /
expecting success: test "$(test-path-utils normalize_path_copy '//')" = '/'
ok 25 - normalize path: // => /
expecting success: test "$(test-path-utils normalize_path_copy '///')" = '/'
ok 26 - normalize path: /// => /
expecting success: test "$(test-path-utils normalize_path_copy '/.')" = '/'

ok 27 - normalize path: /. => /

expecting success: test "$(test-path-utils normalize_path_copy '/./')" = '/'

ok 28 - normalize path: /./ => /

expecting success: test "$(test-path-utils normalize_path_copy '/./..')" = '++failed++'

ok 29 - normalize path: /./.. => ++failed++

expecting success: test "$(test-path-utils normalize_path_copy '/../.')" = '++failed++'

ok 30 - normalize path: /../. => ++failed++

expecting success: test "$(test-path-utils normalize_path_copy '/./.././/')" = '++failed++'

ok 31 - normalize path: /./../.// => ++failed++

expecting success: test "$(test-path-utils normalize_path_copy '/dir/..')" = '/'

ok 32 - normalize path: /dir/.. => /

expecting success: test "$(test-path-utils normalize_path_copy '/dir/sub/../..')" = '/'

ok 33 - normalize path: /dir/sub/../.. => /
expecting success: test "$(test-path-utils normalize_path_copy '/dir/sub/../../..')" = '++failed++'
ok 34 - normalize path: /dir/sub/../../.. => ++failed++
expecting success: test "$(test-path-utils normalize_path_copy '/dir')" = '/dir'

ok 35 - normalize path: /dir => /dir

expecting success: test "$(test-path-utils normalize_path_copy '/dir//')" = '/dir/'

ok 36 - normalize path: /dir// => /dir/

expecting success: test "$(test-path-utils normalize_path_copy '/./dir')" = '/dir'

ok 37 - normalize path: /./dir => /dir

expecting success: test "$(test-path-utils normalize_path_copy '/dir/.')" = '/dir/'

ok 38 - normalize path: /dir/. => /dir/

expecting success: test "$(test-path-utils normalize_path_copy '/dir///./')" = '/dir/'

ok 39 - normalize path: /dir///./ => /dir/

expecting success: test "$(test-path-utils normalize_path_copy '/dir//sub/..')" = '/dir/'

ok 40 - normalize path: /dir//sub/.. => /dir/

expecting success: test "$(test-path-utils normalize_path_copy '/dir/sub/../')" = '/dir/'

ok 41 - normalize path: /dir/sub/../ => /dir/

expecting success: test "$(test-path-utils normalize_path_copy '//dir/sub/../.')" = '/dir/'

ok 42 - normalize path: //dir/sub/../. => /dir/
expecting success: test "$(test-path-utils normalize_path_copy '/dir/s1/../s2/')" = '/dir/s2/'

ok 43 - normalize path: /dir/s1/../s2/ => /dir/s2/

expecting success: test "$(test-path-utils normalize_path_copy '/d1/s1///s2/..//../s3/')" = '/d1/s3/'

ok 44 - normalize path: /d1/s1///s2/..//../s3/ => /d1/s3/

expecting success: test "$(test-path-utils normalize_path_copy '/d1/s1//../s2/../../d2')" = '/d2'

ok 45 - normalize path: /d1/s1//../s2/../../d2 => /d2

expecting success: test "$(test-path-utils normalize_path_copy '/d1/.../d2')" = '/d1/.../d2'

ok 46 - normalize path: /d1/.../d2 => /d1/.../d2

expecting success: test "$(test-path-utils normalize_path_copy '/d1/..././../d2')" = '/d1/d2'

ok 47 - normalize path: /d1/..././../d2 => /d1/d2

expecting success: actual=$(test-path-utils longest_ancestor_length '/' '') &&
	 test "$actual" = '-1'

ok 48 - longest ancestor: /  => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/' '/') &&
	 test "$actual" = '-1'

ok 49 - longest ancestor: / / => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' '') &&
	 test "$actual" = '-1'

ok 50 - longest ancestor: /foo  => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' ':') &&
	 test "$actual" = '-1'

ok 51 - longest ancestor: /foo : => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' '::.') &&
	 test "$actual" = '-1'

ok 52 - longest ancestor: /foo ::. => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' '::..::') &&
	 test "$actual" = '-1'

ok 53 - longest ancestor: /foo ::..:: => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' '/') &&
	 test "$actual" = '0'

ok 54 - longest ancestor: /foo / => 0

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' '/fo') &&
	 test "$actual" = '-1'

ok 55 - longest ancestor: /foo /fo => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' '/foo') &&
	 test "$actual" = '-1'

ok 56 - longest ancestor: /foo /foo => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' '/foo/') &&
	 test "$actual" = '-1'

ok 57 - longest ancestor: /foo /foo/ => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' '/bar') &&
	 test "$actual" = '-1'

ok 58 - longest ancestor: /foo /bar => -1
expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' '/bar/') &&
	 test "$actual" = '-1'

ok 59 - longest ancestor: /foo /bar/ => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' '/foo/bar') &&
	 test "$actual" = '-1'

ok 60 - longest ancestor: /foo /foo/bar => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' '/foo:/bar/') &&
	 test "$actual" = '-1'

ok 61 - longest ancestor: /foo /foo:/bar/ => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' '/foo/:/bar/') &&
	 test "$actual" = '-1'

ok 62 - longest ancestor: /foo /foo/:/bar/ => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' '/foo::/bar/') &&
	 test "$actual" = '-1'

ok 63 - longest ancestor: /foo /foo::/bar/ => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' '/:/foo:/bar/') &&
	 test "$actual" = '0'

ok 64 - longest ancestor: /foo /:/foo:/bar/ => 0

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' '/foo:/:/bar/') &&
	 test "$actual" = '0'

ok 65 - longest ancestor: /foo /foo:/:/bar/ => 0

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo' '/:/bar/:/foo') &&
	 test "$actual" = '0'

ok 66 - longest ancestor: /foo /:/bar/:/foo => 0

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '') &&
	 test "$actual" = '-1'

ok 67 - longest ancestor: /foo/bar  => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '/') &&
	 test "$actual" = '0'

ok 68 - longest ancestor: /foo/bar / => 0

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '/fo') &&
	 test "$actual" = '-1'

ok 69 - longest ancestor: /foo/bar /fo => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' 'foo') &&
	 test "$actual" = '-1'

ok 70 - longest ancestor: /foo/bar foo => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '/foo') &&
	 test "$actual" = '4'

ok 71 - longest ancestor: /foo/bar /foo => 4
expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '/foo/') &&
	 test "$actual" = '4'

ok 72 - longest ancestor: /foo/bar /foo/ => 4

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '/foo/ba') &&
	 test "$actual" = '-1'

ok 73 - longest ancestor: /foo/bar /foo/ba => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '/:/fo') &&
	 test "$actual" = '0'

ok 74 - longest ancestor: /foo/bar /:/fo => 0

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '/foo:/foo/ba') &&
	 test "$actual" = '4'

ok 75 - longest ancestor: /foo/bar /foo:/foo/ba => 4

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '/bar') &&
	 test "$actual" = '-1'

ok 76 - longest ancestor: /foo/bar /bar => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '/bar/') &&
	 test "$actual" = '-1'

ok 77 - longest ancestor: /foo/bar /bar/ => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '/fo:') &&
	 test "$actual" = '-1'

ok 78 - longest ancestor: /foo/bar /fo: => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' ':/fo') &&
	 test "$actual" = '-1'

ok 79 - longest ancestor: /foo/bar :/fo => -1

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '/foo:/bar/') &&
	 test "$actual" = '4'

ok 80 - longest ancestor: /foo/bar /foo:/bar/ => 4

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '/:/foo:/bar/') &&
	 test "$actual" = '4'

ok 81 - longest ancestor: /foo/bar /:/foo:/bar/ => 4

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '/foo:/:/bar/') &&
	 test "$actual" = '4'

ok 82 - longest ancestor: /foo/bar /foo:/:/bar/ => 4

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '/:/bar/:/fo') &&
	 test "$actual" = '0'

ok 83 - longest ancestor: /foo/bar /:/bar/:/fo => 0

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '/:/bar/') &&
	 test "$actual" = '0'

ok 84 - longest ancestor: /foo/bar /:/bar/ => 0

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '.:/foo/.') &&
	 test "$actual" = '4'

ok 85 - longest ancestor: /foo/bar .:/foo/. => 4

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '.:/foo/.:.:') &&
	 test "$actual" = '4'

ok 86 - longest ancestor: /foo/bar .:/foo/.:.: => 4

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '/foo/./:.:/bar') &&
	 test "$actual" = '4'

ok 87 - longest ancestor: /foo/bar /foo/./:.:/bar => 4

expecting success: actual=$(test-path-utils longest_ancestor_length '/foo/bar' '.:/bar') &&
	 test "$actual" = '-1'

ok 88 - longest ancestor: /foo/bar .:/bar => -1

expecting success: 
	test c:/msysgit = $(test-path-utils strip_path_suffix \
		c:/msysgit/libexec//git-core libexec/git-core)

ok 89 - strip_path_suffix

# passed all 89 test(s)
1..89
