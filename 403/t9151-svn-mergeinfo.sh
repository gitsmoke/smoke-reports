Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9151-svn-mergeinfo/.git/
expecting success: 
	svnadmin load -q '/Users/trast/git-smoke/t/trash directory.t9151-svn-mergeinfo/svnrepo' 	  < '/Users/trast/git-smoke/t/t9151/svn-mergeinfo.dump' &&
	git svn init --minimize-url -R svnmerge 	  --rewrite-root=http://svn.example.org 	  -T trunk -b branches 'file:///Users/trast/git-smoke/t/trash directory.t9151-svn-mergeinfo/svnrepo' &&
	git svn fetch --all
	
r1 = 7ed7a8721885457b4b334110ca70ed04c4f8166a (refs/remotes/trunk)
	A	Makefile
r2 = 2d5fcce57cec73616f628fbaed5a49ef3d0e42de (refs/remotes/trunk)
	A	Makefile
r3 = f9ab6c8a604f40729e9b681bb3a1e867f9fa3ae8 (refs/remotes/left)
	A	Makefile
r4 = ddaeba46f3443446ad10c8e9f9708015508a3b28 (refs/remotes/right)
	M	Makefile
r5 = aec3f7b969e8f39a07d95041e1a0fa1084a62636 (refs/remotes/left)
	M	Makefile
r6 = 4e8f83f1ab23aef5373017e90af34f1819af8cab (refs/remotes/right)
	M	Makefile
r7 = 6bc3353f7fcec0c37010a59b688fa9d2584a744d (refs/remotes/left)
	M	Makefile
r8 = 3126dfd1119e03e412157f726d08c90a3fd4d7d4 (refs/remotes/left)
	M	Makefile
r9 = 577c6d95762177126ca3068518ff8b75fcf0c25e (refs/remotes/left-sub)
	A	README
r10 = 0f51792c59119f80d15583143eecc11a609f7f4b (refs/remotes/left-sub)
	M	Makefile
r11 = 684711c1a28ba8ad47b8dbcc1fae523e6d7513a6 (refs/remotes/trunk)
	A	zlonk
r12 = 48e21141201f46c911875b76b5656d8baac09a66 (refs/remotes/left)
	A	bang
r13 = 2d65500a924079bcf2a63be861289fc72bc3e87f (refs/remotes/right)
	A	bang
	M	Makefile
r14 = 963722fb11bb2d08a6acd03123060441585c7d97 (refs/remotes/trunk)
r15 = 7a0288891e49f8f764fafb9c51e0da446284f6e3 (refs/remotes/trunk)
	A	urkkk
r16 = acd76c6201c8a7f1ba7539daebe82128902deb28 (refs/remotes/right)
	A	vronk
r17 = 3d987e350cb0b84c1a962f28322075148a4769f9 (refs/remotes/trunk)
	A	bang
	A	urkkk
	M	Makefile
r18 = 33a71c4853e3bc75096416afb6b6a3f84317e11f (refs/remotes/left-sub)
	A	wham_eth
r19 = c18b93e7676efb39156e30479f389f162e075937 (refs/remotes/left-sub)
	A	glurpp
r20 = d3a5e11772cce14223736862eaae254c6361de52 (refs/remotes/left)
	A	wham_eth
r21 = 26f066648b9fbb8d41953f51720855ea7b504643 (refs/remotes/left)
	A	bang
	A	urkkk
	M	Makefile
	A	README
r22 = 873f392f3b5b995738db38ddb497e4133a1eabd6 (refs/remotes/left)
	A	urkkk
	A	glurpp
	A	wham_eth
	A	README
	A	zlonk
r23 = 10f41d438deef69896cd202a8dba696fccb1fc16 (refs/remotes/trunk)
r24 = 8d72d496d3fd4fe5f56c4a458bb6b6bce8074ac3 (refs/remotes/trunk)
r25 = 9583bc1ca96e396c2e8a6afbe0d7677c952e76f9 (refs/remotes/b1)
r26 = b956cd3ea8808cb0732e51412dec60ce5d4c66de (refs/remotes/b2)
	A	b2file
r27 = 689fa6c27d1d57acd4f5e2ed3b78bfd3818cfa48 (refs/remotes/b2)
	A	b1file
r28 = c65e9d2dd0f29cc8756c66041aafca5ae7b40c87 (refs/remotes/b1)
	A	b1file
r29 = 8a70eced3c8b9eb56742bb2b8182d3363ef65c9c (refs/remotes/trunk)
	A	trunkfile
r30 = 94dd10334175598f49a097035fcfba8563928048 (refs/remotes/trunk)
	A	b1file
	A	trunkfile
r31 = a38a7b8623e016fc7fa3d8e86138d2ac45bf8a24 (refs/remotes/b2)
	A	b2file
r32 = 8357602aacc215884be1cae384e21f61dbe8a70f (refs/remotes/trunk)
	A	f1file
r33 = f78f3a5d1e3b322462cb535cfa72092188e5b55f (refs/remotes/f1)
	A	f2file
r34 = 1f35cafcf36f5273f266e0fdf53b2b0e5cae9932 (refs/remotes/f2)
	A	f1file
	A	f2file
r35 = 93881fcc99fb98b085dde9da85df5f471242a3d8 (refs/remotes/trunk)
	A	subdir/cowboy
r36 = 71b29806ce50e7abcebc021bddd47ea9925b62d1 (refs/remotes/left)
	A	subdir/cowboy
r37 = a7818cc97d8d22845c6c4b16c4029f0a19580e17 (refs/remotes/trunk)
	A	cowboy
r36 = 36ab2d3b9d077028fa3d659325ac8ca081e348bc (refs/remotes/partial@36)
r37 = 94ef88aa1ebfb64b5525f3aed8dd36d7ec63cecc (refs/remotes/partial@37)
r38 = 910f886650e45984540884fbce419222d5dbe772 (refs/remotes/partial)
	A	palindromes
r39 = fdb537791ee8ba532e49c3d5a34a30feeb87bd59 (refs/remotes/partial)
	A	subdir/palindromes
r40 = 90411e1b2118e11664e368a24a1eaa5e8749d150 (refs/remotes/trunk)
r41 = f4522c2fc7b8b6ab30592330d961ed5321c3ddc7 (refs/remotes/bugfix@41)
r42 = 21d184ac3dd2fcbc5f88a25abde26db37e05d6db (refs/remotes/bugfix)
	M	subdir/palindromes
r43 = a671eec900764a4ab85a6166def3e0d30f1a2664 (refs/remotes/bugfix)
	M	subdir/palindromes
r44 = a110dec28a4b152b394906b1303fbf19174f7d26 (refs/remotes/trunk)

ok 1 - load svn dump

expecting success: 
	unmarked=$(git rev-list --parents --all --grep=Merge |
		grep -v " .* " | cut -f1 -d" ") &&
	[ -z "$unmarked" ]
	

ok 2 - all svn merges became git merge commits

expecting success: 
	bad_cherries=$(git rev-list --parents --all --grep=Cherry |
		grep " .* " | cut -f1 -d" ") &&
	[ -z "$bad_cherries" ]
	

ok 3 - cherry picks did not become git merge commits

expecting success: 
	bad_non_merges=$(git rev-list --parents --all --grep=non-merge |
		grep " .* " | cut -f1 -d" ") &&
	[ -z "$bad_non_merges" ]
	

ok 4 - svn non-merge merge commits did not become git merge commits

expecting success: 
	before_commit=$(git rev-list --all --grep="trunk commit before merging trunk to b2") &&
	merge_commit=$(git rev-list --all --grep="Merge trunk to b2") &&
	not_reachable=$(git rev-list -1 $before_commit --not $merge_commit) &&
	[ -z "$not_reachable" ]
	

ok 5 - commit made to merged branch is reachable from the merge

expecting success: 
	f1_commit=$(git rev-list --all --grep="make f1 branch from trunk") &&
	f2_commit=$(git rev-list --all --grep="make f2 branch from trunk") &&
	merge_commit=$(git rev-list --all --grep="Merge f1 and f2 to trunk") &&
	not_reachable=$(git rev-list -1 $f1_commit $f2_commit --not $merge_commit) &&
	[ -z "$not_reachable" ]
	

ok 6 - merging two branches in one commit is detected correctly

checking known breakage: 
	unmerged=$(git rev-list --all --not master) &&
	[ -z "$unmerged" ]
	

not ok 7 - everything got merged in the end # TODO known breakage

# still have 1 known breakage(s)
# passed all remaining 6 test(s)
1..7
