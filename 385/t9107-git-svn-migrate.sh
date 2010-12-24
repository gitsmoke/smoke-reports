Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9107-git-svn-migrate/.git/
expecting success: 
	cp "$GIT_DIR"/config "$GIT_DIR"/config-old-git-svn &&
	mkdir import &&
	(
		cd import &&
		for i in trunk branches/a branches/b tags/0.1 tags/0.2 tags/0.3
		do
			mkdir -p $i &&
			echo hello >>$i/README ||
			exit 1
		done &&
		svn_cmd import -m test . "$svnrepo"
	) &&
	git svn init "$svnrepo" &&
	git svn fetch &&
	rm -rf "$GIT_DIR"/svn &&
	git update-ref refs/heads/git-svn-HEAD refs/${remotes_git_svn} &&
	git update-ref refs/heads/svn-HEAD refs/${remotes_git_svn} &&
	git update-ref -d refs/${remotes_git_svn} refs/${remotes_git_svn}
	
Adding         trunk
Adding         trunk/README
Adding         branches
Adding         branches/a
Adding         branches/a/README
Adding         branches/b
Adding         branches/b/README
Adding         tags
Adding         tags/0.2
Adding         tags/0.2/README
Adding         tags/0.3
Adding         tags/0.3/README
Adding         tags/0.1
Adding         tags/0.1/README

Committed revision 1.
	A	trunk/README
	A	branches/a/README
	A	branches/b/README
	A	tags/0.2/README
	A	tags/0.3/README
	A	tags/0.1/README
r1 = 305860679363f09088f26ffe6aa191c410e96ae6 (refs/remotes/git-svn)
ok 1 - setup old-looking metadata
expecting success: test -n '305860679363f09088f26ffe6aa191c410e96ae6'
ok 2 - git-svn-HEAD is a real HEAD
expecting success: 
	mkdir -p "$GIT_DIR"/git-svn/info "$GIT_DIR"/svn/info &&
	echo "$svnrepo" > "$GIT_DIR"/git-svn/info/url &&
	echo "$svnrepo" > "$GIT_DIR"/svn/info/url &&
	git svn migrate &&
	! test -d "$GIT_DIR"/git svn &&
	git rev-parse --verify refs/${remotes_git_svn}^0 &&
	git rev-parse --verify refs/remotes/svn^0 &&
	test "$(git config --get svn-remote.svn.url)" = "$svnrepo" &&
	test `git config --get svn-remote.svn.fetch` = \
             ":refs/${remotes_git_svn}"
	
305860679363f09088f26ffe6aa191c410e96ae6
305860679363f09088f26ffe6aa191c410e96ae6

ok 3 - initialize old-style (v0) git svn layout

expecting success: 
	git svn init "$svnrepo" -T trunk -t tags -b branches &&
	git config --get-all svn-remote.svn.fetch > fetch.out &&
	grep "^trunk:refs/remotes/trunk$" fetch.out &&
	test -n "`git config --get svn-remote.svn.branches \
	            "^branches/\*:refs/remotes/\*$"`" &&
	test -n "`git config --get svn-remote.svn.tags \
	            "^tags/\*:refs/remotes/tags/\*$"`" &&
	git config --unset svn-remote.svn.branches \
	                        "^branches/\*:refs/remotes/\*$" &&
	git config --unset svn-remote.svn.tags \
	                        "^tags/\*:refs/remotes/tags/\*$" &&
	git config --add svn-remote.svn.fetch "branches/a:refs/remotes/a" &&
	git config --add svn-remote.svn.fetch "branches/b:refs/remotes/b" &&
	for i in tags/0.1 tags/0.2 tags/0.3; do
		git config --add svn-remote.svn.fetch \
		                 $i:refs/remotes/$i || exit 1; done &&
	git config --get-all svn-remote.svn.fetch > fetch.out &&
	grep "^trunk:refs/remotes/trunk$" fetch.out &&
	grep "^branches/a:refs/remotes/a$" fetch.out &&
	grep "^branches/b:refs/remotes/b$" fetch.out &&
	grep "^tags/0\.1:refs/remotes/tags/0\.1$" fetch.out &&
	grep "^tags/0\.2:refs/remotes/tags/0\.2$" fetch.out &&
	grep "^tags/0\.3:refs/remotes/tags/0\.3$" fetch.out &&
	grep "^:refs/${remotes_git_svn}" fetch.out
	
trunk:refs/remotes/trunk
trunk:refs/remotes/trunk
branches/a:refs/remotes/a
branches/b:refs/remotes/b
tags/0.1:refs/remotes/tags/0.1
tags/0.2:refs/remotes/tags/0.2
tags/0.3:refs/remotes/tags/0.3
:refs/remotes/git-svn
ok 4 - initialize a multi-repository repo
expecting success: 
	git svn multi-fetch &&
	for i in trunk a b tags/0.1 tags/0.2 tags/0.3; do
		git rev-parse --verify refs/remotes/$i^0 >> refs.out || exit 1;
	    done &&
	test -z "`sort < refs.out | uniq -d`" &&
	for i in trunk a b tags/0.1 tags/0.2 tags/0.3; do
	  for j in trunk a b tags/0.1 tags/0.2 tags/0.3; do
		if test $j != $i; then continue; fi
	    test -z "`git diff refs/remotes/$i 	                         refs/remotes/$j`" ||exit 1; done; done
	
Rebuilding .git/svn/git-svn/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5 ...
r1 = 305860679363f09088f26ffe6aa191c410e96ae6
Done rebuilding .git/svn/git-svn/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5
	A	README
r1 = 19f69b9b1c2e1bef8d89a9633513b461bc8187a8 (refs/remotes/trunk)
	A	README
r1 = 37e33d3d5a15188b28280b60295e16f423b57365 (refs/remotes/tags/0.3)
	A	README
r1 = 1433549d19c20bd24a9e05f2340e2be4b80d6e33 (refs/remotes/b)
	A	README
r1 = 644dde68459e803248b4c129fba8cc92a8778daf (refs/remotes/tags/0.2)
	A	README
r1 = d79b4ff9531469260706bbaa8ffb843776964093 (refs/remotes/tags/0.1)
	A	README
r1 = a36a8e8d9d91e37b4367407b04b982900563846a (refs/remotes/a)

ok 5 - multi-fetch works on partial urls + paths

expecting success: 
	git config --unset-all svn-remote.svn.fetch &&
	git config --unset-all svn-remote.svn.url &&
	rm -rf "$GIT_DIR"/svn &&
	for i in `cat fetch.out`; do
		path=`expr $i : "\([^:]*\):.*$"`
		ref=`expr $i : "[^:]*:\(refs/remotes/.*\)$"`
		if test -z "$ref"; then continue; fi
		if test -n "$path"; then path="/$path"; fi
		( mkdir -p "$GIT_DIR"/svn/$ref/info/ &&
		echo "$svnrepo"$path > "$GIT_DIR"/svn/$ref/info/url ) || exit 1;
	done &&
	git svn migrate --minimize &&
	test -z "`git config -l | grep "^svn-remote\.git-svn\."`" &&
	git config --get-all svn-remote.svn.fetch > fetch.out &&
	grep "^trunk:refs/remotes/trunk$" fetch.out &&
	grep "^branches/a:refs/remotes/a$" fetch.out &&
	grep "^branches/b:refs/remotes/b$" fetch.out &&
	grep "^tags/0\.1:refs/remotes/tags/0\.1$" fetch.out &&
	grep "^tags/0\.2:refs/remotes/tags/0\.2$" fetch.out &&
	grep "^tags/0\.3:refs/remotes/tags/0\.3$" fetch.out &&
	grep "^:refs/${remotes_git_svn}" fetch.out
	
trunk:refs/remotes/trunk
branches/a:refs/remotes/a
branches/b:refs/remotes/b
tags/0.1:refs/remotes/tags/0.1
tags/0.2:refs/remotes/tags/0.2
tags/0.3:refs/remotes/tags/0.3
:refs/remotes/git-svn

ok 6 - migrate --minimize on old inited layout

expecting success: 
	git svn fetch -i trunk &&
	test -z "$(ls "$GIT_DIR"/svn/refs/remotes/trunk/.rev_db.* 2>/dev/null)" &&
	expect="$(ls "$GIT_DIR"/svn/refs/remotes/trunk/.rev_map.*)" &&
	test -n "$expect" &&
	rev_db="$(echo $expect | sed -e "s,_map,_db,")" &&
	convert_to_rev_db "$expect" "$rev_db" &&
	rm -f "$expect" &&
	test -f "$rev_db" &&
	git svn fetch -i trunk &&
	test -z "$(ls "$GIT_DIR"/svn/refs/remotes/trunk/.rev_db.* 2>/dev/null)" &&
	test ! -e "$GIT_DIR"/svn/refs/remotes/trunk/.rev_db &&
	test -f "$expect"
	
Rebuilding .git/svn/refs/remotes/git-svn/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5 ...
r1 = 305860679363f09088f26ffe6aa191c410e96ae6
Done rebuilding .git/svn/refs/remotes/git-svn/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5
Rebuilding .git/svn/refs/remotes/a/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5 ...
r1 = a36a8e8d9d91e37b4367407b04b982900563846a
Done rebuilding .git/svn/refs/remotes/a/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5
Rebuilding .git/svn/refs/remotes/b/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5 ...
r1 = 1433549d19c20bd24a9e05f2340e2be4b80d6e33
Done rebuilding .git/svn/refs/remotes/b/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5
Rebuilding .git/svn/refs/remotes/tags/0.1/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5 ...
r1 = d79b4ff9531469260706bbaa8ffb843776964093
Done rebuilding .git/svn/refs/remotes/tags/0.1/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5
Rebuilding .git/svn/refs/remotes/tags/0.2/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5 ...
r1 = 644dde68459e803248b4c129fba8cc92a8778daf
Done rebuilding .git/svn/refs/remotes/tags/0.2/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5
Rebuilding .git/svn/refs/remotes/tags/0.3/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5 ...
r1 = 37e33d3d5a15188b28280b60295e16f423b57365
Done rebuilding .git/svn/refs/remotes/tags/0.3/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5
Rebuilding .git/svn/refs/remotes/trunk/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5 ...
r1 = 19f69b9b1c2e1bef8d89a9633513b461bc8187a8
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5
Rebuilding .git/svn/refs/remotes/trunk/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5 ...
r1 = 19f69b9b1c2e1bef8d89a9633513b461bc8187a8
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.25ff631b-7655-4294-be70-431f8bcb64d5

ok 7 - .rev_db auto-converted to .rev_map.UUID

# passed all 7 test(s)
1..7
