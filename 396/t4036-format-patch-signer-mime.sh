Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4036-format-patch-signer-mime/.git/
expecting success: 

	>F &&
	git add F &&
	git commit -m initial &&
	echo new line >F &&

	test_tick &&
	git commit -m "This adds some lines to F" F
[master (root-commit) 6e528d0] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 F
[master e15e308] This adds some lines to F
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup
expecting success: 

	git format-patch --stdout -1 >output &&
	! grep Content-Type output

ok 2 - format normally
expecting success: 

	git format-patch -s --stdout -1 >output &&
	! grep Content-Type output

ok 3 - format with signoff without funny signer name
expecting success: 

	GIT_COMMITTER_NAME="はまの ふにおう" \
	git format-patch -s --stdout -1 >output &&
	grep Content-Type output
Content-Type: text/plain; charset=UTF-8

ok 4 - format with non ASCII signer name

expecting success: 

	GIT_COMMITTER_NAME="はまの ふにおう" \
	git format-patch -s --stdout -1 --attach >output &&
	test `grep -ci ^MIME-Version: output` = 1

ok 5 - attach and signoff do not duplicate mime headers

# passed all 5 test(s)
1..5
