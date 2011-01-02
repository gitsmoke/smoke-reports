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
r1 = f8038fcb4983be2aee9af94d2d03b33cc9f33cbe (refs/remotes/git-svn)

ok 1 - setup old-looking metadata

expecting success: test -n 'f8038fcb4983be2aee9af94d2d03b33cc9f33cbe'

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
	
f8038fcb4983be2aee9af94d2d03b33cc9f33cbe
f8038fcb4983be2aee9af94d2d03b33cc9f33cbe

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
	
Rebuilding .git/svn/git-svn/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2 ...
r1 = f8038fcb4983be2aee9af94d2d03b33cc9f33cbe
Done rebuilding .git/svn/git-svn/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2
	A	README
r1 = 7fd60c8ea845c9dedf2fd48b572ceb58759dcee3 (refs/remotes/trunk)
	A	README
r1 = 809848e274d9682e8d81645c03ef9e84ecf456d6 (refs/remotes/tags/0.3)
	A	README
r1 = 7ef10b02162879e937d5c848160d90b69acb3600 (refs/remotes/b)
	A	README
r1 = 4cd7a50eb16952699971b91369a9864a4975204c (refs/remotes/tags/0.2)
	A	README
r1 = ddfb4f2a510389286351d7c5dec2942d63e19c35 (refs/remotes/tags/0.1)
	A	README
r1 = 20467f32e3b99321d46d6ae000f45045130c93e8 (refs/remotes/a)

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
	
Rebuilding .git/svn/refs/remotes/git-svn/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2 ...
r1 = f8038fcb4983be2aee9af94d2d03b33cc9f33cbe
Done rebuilding .git/svn/refs/remotes/git-svn/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2
Rebuilding .git/svn/refs/remotes/a/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2 ...
r1 = 20467f32e3b99321d46d6ae000f45045130c93e8
Done rebuilding .git/svn/refs/remotes/a/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2
Rebuilding .git/svn/refs/remotes/b/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2 ...
r1 = 7ef10b02162879e937d5c848160d90b69acb3600
Done rebuilding .git/svn/refs/remotes/b/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2
Rebuilding .git/svn/refs/remotes/tags/0.1/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2 ...
r1 = ddfb4f2a510389286351d7c5dec2942d63e19c35
Done rebuilding .git/svn/refs/remotes/tags/0.1/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2
Rebuilding .git/svn/refs/remotes/tags/0.2/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2 ...
r1 = 4cd7a50eb16952699971b91369a9864a4975204c
Done rebuilding .git/svn/refs/remotes/tags/0.2/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2
Rebuilding .git/svn/refs/remotes/tags/0.3/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2 ...
r1 = 809848e274d9682e8d81645c03ef9e84ecf456d6
Done rebuilding .git/svn/refs/remotes/tags/0.3/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2
Rebuilding .git/svn/refs/remotes/trunk/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2 ...
r1 = 7fd60c8ea845c9dedf2fd48b572ceb58759dcee3
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2
Rebuilding .git/svn/refs/remotes/trunk/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2 ...
r1 = 7fd60c8ea845c9dedf2fd48b572ceb58759dcee3
Done rebuilding .git/svn/refs/remotes/trunk/.rev_map.c7bd97ca-6ed1-4c05-bd3b-e5e4f65e9ba2

ok 7 - .rev_db auto-converted to .rev_map.UUID

# passed all 7 test(s)
1..7
