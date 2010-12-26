Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4028-format-patch-mime-headers/.git/
expecting success: 
	echo content >file &&
	git add file &&
	git commit -m one &&
	echo more >>file &&
	git commit -a -m "two

	utf-8 body: ñ"
[master (root-commit) b96def8] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 9b36816] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
ok 1 - create commit with utf-8 body

expecting success: 
	rm -f 0001-two.patch &&
	git format-patch HEAD^ &&
	grep -i "content-type: text/plain; charset=utf-8" 0001-two.patch
0001-two.patch
Content-Type: text/plain; charset=UTF-8
ok 2 - patch has mime headers
expecting success: 
	rm -f 0001-two.patch &&
	git config format.headers "x-foo: bar" &&
	git format-patch HEAD^ &&
	grep -i "x-foo: bar" 0001-two.patch &&
	grep -i "content-type: text/plain; charset=utf-8" 0001-two.patch
0001-two.patch
x-foo: bar
Content-Type: text/plain; charset=UTF-8
ok 3 - patch has mime and extra headers

# passed all 3 test(s)
1..3
