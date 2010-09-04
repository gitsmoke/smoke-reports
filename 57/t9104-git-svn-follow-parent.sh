ok 1 - initialize repo
ok 2 - init and fetch a moved directory
ok 3 - init and fetch from one svn-remote
not ok - 4 follow deleted parent
#	
#	        (svn_cmd cp -m "resurrecting trunk as junk" \
#	               "$svnrepo"/trunk@2 "$svnrepo"/junk ||
#	         svn cp -m "resurrecting trunk as junk" \
#	               -r2 "$svnrepo"/trunk "$svnrepo"/junk) &&
#	        git config --add svn-remote.svn.fetch \
#	          junk:refs/remotes/svn/junk &&
#	        git svn fetch -i svn/thunk &&
#	        git svn fetch -i svn/junk &&
#	        test -z "`git diff svn/junk svn/trunk`" &&
#	        test "`git merge-base svn/junk svn/trunk`" \
#	           = "`git rev-parse svn/trunk`"
#	        
ok 5 - follow larger parent
not ok - 6 follow higher-level parent
#	
#	        svn mkdir -m "follow higher-level parent" "$svnrepo"/blob &&
#	        svn co "$svnrepo"/blob blob &&
#	        cd blob &&
#	                echo hi > hi &&
#	                svn add hi &&
#	                svn commit -m "hihi" &&
#	                cd ..
#	        svn mkdir -m "new glob at top level" "$svnrepo"/glob &&
#	        svn mv -m "move blob down a level" "$svnrepo"/blob "$svnrepo"/glob/blob &&
#	        git svn init --minimize-url -i blob "$svnrepo"/glob/blob &&
#	        git svn fetch -i blob
#	        
not ok - 7 follow deleted directory
#	
#		svn_cmd mv -m "bye!" "$svnrepo"/glob/blob/hi "$svnrepo"/glob/blob/bye &&
#		svn_cmd rm -m "remove glob" "$svnrepo"/glob &&
#		git svn init --minimize-url -i glob "$svnrepo"/glob &&
#		git svn fetch -i glob &&
#		test "`git cat-file blob refs/remotes/glob:blob/bye`" = hi &&
#		test "`git ls-tree refs/remotes/glob | wc -l `" -eq 1
#		
not ok - 8 follow-parent avoids deleting relevant info
#	
#		mkdir -p import/trunk/subversion/bindings/swig/perl/t &&
#		for i in a b c ; do \
#		  echo $i > import/trunk/subversion/bindings/swig/perl/$i.pm &&
#		  echo _$i > import/trunk/subversion/bindings/swig/perl/t/$i.t; \
#		done &&
#		  echo "bad delete test" > \
#		   import/trunk/subversion/bindings/swig/perl/t/larger-parent &&
#		  echo "bad delete test 2" > \
#		   import/trunk/subversion/bindings/swig/perl/another-larger &&
#		cd import &&
#		  svn import -m "r9270 test" . "$svnrepo"/r9270 &&
#		cd .. &&
#		svn_cmd co "$svnrepo"/r9270/trunk/subversion/bindings/swig/perl r9270 &&
#		cd r9270 &&
#		  svn mkdir native &&
#		  svn mv t native/t &&
#		  for i in a b c; do svn mv $i.pm native/$i.pm; done &&
#		  echo z >> native/t/c.t &&
#		  poke native/t/c.t &&
#		  svn commit -m "reorg test" &&
#		cd .. &&
#		git svn init --minimize-url -i r9270-t \
#		  "$svnrepo"/r9270/trunk/subversion/bindings/swig/perl/native/t &&
#		git svn fetch -i r9270-t &&
#		test `git rev-list r9270-t | wc -l` -eq 2 &&
#		test "`git ls-tree --name-only r9270-t~1`" = \
#		     "`git ls-tree --name-only r9270-t`"
#		
not ok - 9 track initial change if it was only made to parent
#	
#		svn_cmd cp -m "wheee!" "$svnrepo"/r9270/trunk "$svnrepo"/r9270/drunk &&
#		git svn init --minimize-url -i r9270-d \
#		  "$svnrepo"/r9270/drunk/subversion/bindings/swig/perl/native/t &&
#		git svn fetch -i r9270-d &&
#		test `git rev-list r9270-d | wc -l` -eq 3 &&
#		test "`git ls-tree --name-only r9270-t`" = \
#		     "`git ls-tree --name-only r9270-d`" &&
#		test "`git rev-parse r9270-t`" = \
#		     "`git rev-parse r9270-d~1`"
#		
ok 10 - follow-parent is atomic
not ok - 11 track multi-parent paths
#	
#		svn_cmd cp -m "resurrect /glob" "$svnrepo"/r9270 "$svnrepo"/glob &&
#		git svn multi-fetch &&
#		test `git cat-file commit refs/remotes/glob | \
#		       grep "^parent " | wc -l` -eq 2
#		
not ok - 12 multi-fetch continues to work
#	
#		git svn multi-fetch
#		
not ok - 13 multi-fetch works off a 'clean' repository
#	
#		rm -r "$GIT_DIR/svn" "$GIT_DIR/refs/remotes" "$GIT_DIR/logs" &&
#		mkdir "$GIT_DIR/svn" &&
#		git svn multi-fetch
#		
# failed 8 among 13 test(s)
1..13
