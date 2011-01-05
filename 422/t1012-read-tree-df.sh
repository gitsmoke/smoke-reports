Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1012-read-tree-df/.git/
expecting success: 
	maketree O-000 a/b-2/c/d a/b/c/d a/x &&
	maketree A-000 a/b-2/c/d a/b/c/d a/x &&
	maketree A-001 a/b-2/c/d a/b/c/d a/b/c/e a/x &&
	maketree B-000 a/b-2/c/d a/b     a/x &&

	maketree O-010 t-0     t/1  t/2 t=3 &&
	maketree A-010 t-0 t            t=3 &&
	maketree B-010         t/1:     t=3: &&

	maketree O-020 ds/dma/ioat.c ds/dma/ioat_dca.c &&
	maketree A-020 ds/dma/ioat/Makefile ds/dma/ioat/registers.h &&
	:

ok 1 - setup

expecting success: 
	settree A-000 &&
	git read-tree -m -u O-000 A-000 B-000 &&
	checkindex <<-EOF
	3 a/b
	0 a/b-2/c/d
	1 a/b/c/d
	2 a/b/c/d
	0 a/x
	EOF

ok 2 - 3-way (1)

expecting success: 
	settree A-001 &&
	git read-tree -m -u O-000 A-001 B-000 &&
	checkindex <<-EOF
	3 a/b
	0 a/b-2/c/d
	1 a/b/c/d
	2 a/b/c/d
	2 a/b/c/e
	0 a/x
	EOF

ok 3 - 3-way (2)

expecting success: 
	settree A-010 &&
	git read-tree -m -u O-010 A-010 B-010 &&
	checkindex <<-EOF
	2 t
	1 t-0
	2 t-0
	1 t/1
	3 t/1
	1 t/2
	0 t=3
	EOF

ok 4 - 3-way (3)

expecting success: 
	settree O-020 &&
	git read-tree -m -u O-020 A-020 &&
	checkindex <<-EOF
	0 ds/dma/ioat/Makefile
	0 ds/dma/ioat/registers.h
	EOF

ok 5 - 2-way (1)

# passed all 5 test(s)
1..5
