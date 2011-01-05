Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5519-push-alternates/.git/
expecting success: 
	mkdir alice-pub &&
	(
		cd alice-pub &&
		GIT_DIR=. git init
	) &&
	mkdir alice-work &&
	(
		cd alice-work &&
		git init &&
		>file &&
		git add . &&
		git commit -m initial &&
		git push ../alice-pub master
	) &&

	# Project Bob is a fork of project Alice
	mkdir bob-pub &&
	(
		cd bob-pub &&
		GIT_DIR=. git init &&
		mkdir -p objects/info &&
		echo ../../alice-pub/objects >objects/info/alternates
	) &&
	git clone alice-pub bob-work &&
	(
		cd bob-work &&
		git push ../bob-pub master
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5519-push-alternates/alice-pub/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5519-push-alternates/alice-work/.git/
[master (root-commit) 334783b] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5519-push-alternates/bob-pub/
Cloning into bob-work...
done.

ok 1 - setup

expecting success: 
	(
		cd alice-work &&
		echo more >file &&
		git commit -a -m second &&
		git push ../alice-pub
	)

[master 40aff3c] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 2 - alice works and pushes

expecting success: 
	(
		# Bob acquires what Alice did in his work tree first.
		# Even though these objects are not directly in
		# the public repository of Bob, this push does not
		# need to send the commit Bob received from Alice
		# to his public repository, as all the object Alice
		# has at her public repository are available to it
		# via its alternates.
		cd bob-work &&
		git pull ../alice-pub master &&
		echo more bob >file &&
		git commit -a -m third &&
		git push ../bob-pub
	) &&

	# Check that the second commit by Alice is not sent
	# to ../bob-pub
	(
		cd bob-pub &&
		second=$(git rev-parse HEAD^) &&
		rm -f objects/info/alternates &&
		test_must_fail git cat-file -t $second &&
		echo ../../alice-pub/objects >objects/info/alternates
	)
Updating 334783b..40aff3c
Fast-forward
 file |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 328bb39] third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 3 - bob fetches from alice, works and pushes

expecting success: 
	(
		cd bob-pub &&
		echo ../../alice-pub/objects >objects/info/alternates
	)


ok 4 - clean-up in case the previous failed

expecting success: 
	(
		# Alice does not care what Bob does.  She does not
		# even have to be aware of his existence.  She just
		# keeps working and pushing
		cd alice-work &&
		echo more alice >file &&
		git commit -a -m fourth &&
		git push ../alice-pub
	)

[master 7aa3f88] fourth
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 5 - alice works and pushes again

expecting success: 
	(
		# This time Bob does not pull from Alice, and
		# the master branch at her public repository points
		# at a commit Bob does not know about.  This should
		# not prevent the push by Bob from succeeding.
		cd bob-work &&
		echo yet more bob >file &&
		git commit -a -m fifth &&
		git push ../bob-pub
	)
[master 16730fc] fifth
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 6 - bob works and pushes

expecting success: 
	(
		# Alice does not care what Bob does.  She does not
		# even have to be aware of his existence.  She just
		# keeps working and pushing
		cd alice-work &&
		echo more and more alice >file &&
		git commit -a -m sixth.1 &&
		echo more and more alice >>file &&
		git commit -a -m sixth.2 &&
		echo more and more alice >>file &&
		git commit -a -m sixth.3 &&
		git push ../alice-pub
	)

[master 6f1770d] sixth.1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 52130da] sixth.2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 5087f07] sixth.3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
ok 7 - alice works and pushes yet again
expecting success: 
	(
		cd alice-pub &&
		git cat-file commit master >../bob-work/commit
	) &&
	(
		# This time Bob does not pull from Alice, and
		# the master branch at her public repository points
		# at a commit Bob does not fully know about, but
		# he happens to have the commit object (but not the
		# necessary tree) in his repository from Alice.
		# This should not prevent the push by Bob from
		# succeeding.
		cd bob-work &&
		git hash-object -t commit -w commit &&
		echo even more bob >file &&
		git commit -a -m seventh &&
		git push ../bob-pub
	)
5087f07db10762df27db28be273100088104ac85
[master 4303f28] seventh
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 8 - bob works and pushes again

# passed all 8 test(s)
1..8
