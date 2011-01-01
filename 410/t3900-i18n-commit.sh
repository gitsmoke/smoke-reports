Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3900-i18n-commit/.git/
expecting success: 
	: >F &&
	git add F &&
	T=$(git write-tree) &&
	C=$(git commit-tree $T <"$TEST_DIRECTORY"/t3900/1-UTF-8.txt) &&
	git update-ref HEAD $C &&
	git tag C0


ok 1 - setup

expecting success: 
	E=$(git cat-file commit C0 | sed -ne "s/^encoding //p") &&
	test z = "z$E"


ok 2 - no encoding header for base case

expecting success: 
		git config i18n.commitencoding $H &&
		git checkout -b $H C0 &&
		echo $H >F &&
		git commit -a -F "$TEST_DIRECTORY"/t3900/$H.txt
	
[ISO8859-1 f375ec0] ÄËÑÏÖ
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 3 - ISO8859-1 setup

expecting success: 
		git config i18n.commitencoding $H &&
		git checkout -b $H C0 &&
		echo $H >F &&
		git commit -a -F "$TEST_DIRECTORY"/t3900/$H.txt
	
[eucJP ab44519] ¤Ï¤ì¤Ò¤Û¤Õ
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 4 - eucJP setup

expecting success: 
		git config i18n.commitencoding $H &&
		git checkout -b $H C0 &&
		echo $H >F &&
		git commit -a -F "$TEST_DIRECTORY"/t3900/$H.txt
	
[ISO-2022-JP c4cacf1] $B$O$l$R$[$U(B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 5 - ISO-2022-JP setup

expecting success: 
		E=$(git cat-file commit ISO8859-1 | sed -ne "s/^encoding //p") &&
		test "z$E" = "zISO8859-1"
	

ok 6 - check encoding header for ISO8859-1

expecting success: 
		E=$(git cat-file commit eucJP | sed -ne "s/^encoding //p") &&
		test "z$E" = "zeucJP"
	

ok 7 - check encoding header for eucJP

expecting success: 
		E=$(git cat-file commit ISO-2022-JP | sed -ne "s/^encoding //p") &&
		test "z$E" = "zISO-2022-JP"
	

ok 8 - check encoding header for ISO-2022-JP

expecting success: 
	git config --unset-all i18n.commitencoding &&
	if Z=$(git config --get-all i18n.commitencoding)
	then
		echo Oops, should have failed.
		false
	else
		test z = "z$Z"
	fi &&
	git config i18n.commitencoding UTF-8

ok 9 - config to remove customization

expecting success: 
	compare_with ISO8859-1 "$TEST_DIRECTORY"/t3900/1-UTF-8.txt


ok 10 - ISO8859-1 should be shown in UTF-8 now

expecting success: 
		compare_with eucJP "$TEST_DIRECTORY"/t3900/2-UTF-8.txt
	

ok 11 - eucJP should be shown in UTF-8 now

expecting success: 
		compare_with ISO-2022-JP "$TEST_DIRECTORY"/t3900/2-UTF-8.txt
	

ok 12 - ISO-2022-JP should be shown in UTF-8 now

expecting success: 
	git config --unset-all i18n.commitencoding &&
	if Z=$(git config --get-all i18n.commitencoding)
	then
		echo Oops, should have failed.
		false
	else
		test z = "z$Z"
	fi


ok 13 - config to add customization

expecting success: 
		git config i18n.commitencoding ISO8859-1 &&
		compare_with ISO8859-1 "$TEST_DIRECTORY"/t3900/ISO8859-1.txt
	

ok 14 - ISO8859-1 should be shown in itself now

expecting success: 
		git config i18n.commitencoding eucJP &&
		compare_with eucJP "$TEST_DIRECTORY"/t3900/eucJP.txt
	

ok 15 - eucJP should be shown in itself now

expecting success: 
		git config i18n.commitencoding ISO-2022-JP &&
		compare_with ISO-2022-JP "$TEST_DIRECTORY"/t3900/ISO-2022-JP.txt
	

ok 16 - ISO-2022-JP should be shown in itself now

expecting success: 
	git config i18n.logoutputencoding UTF-8


ok 17 - config to tweak customization

expecting success: 
	compare_with ISO8859-1 "$TEST_DIRECTORY"/t3900/1-UTF-8.txt


ok 18 - ISO8859-1 should be shown in UTF-8 now

expecting success: 
		compare_with eucJP "$TEST_DIRECTORY"/t3900/2-UTF-8.txt
	

ok 19 - eucJP should be shown in UTF-8 now

expecting success: 
		compare_with ISO-2022-JP "$TEST_DIRECTORY"/t3900/2-UTF-8.txt
	

ok 20 - ISO-2022-JP should be shown in UTF-8 now
expecting success: 
			compare_with eucJP "$TEST_DIRECTORY"/t3900/eucJP.txt $ICONV
		

ok 21 - eucJP should be shown in eucJP now

expecting success: 
			compare_with ISO-2022-JP "$TEST_DIRECTORY"/t3900/eucJP.txt $ICONV
		

ok 22 - ISO-2022-JP should be shown in eucJP now
expecting success: 
			compare_with eucJP "$TEST_DIRECTORY"/t3900/ISO-2022-JP.txt $ICONV
		
ok 23 - eucJP should be shown in ISO-2022-JP now

expecting success: 
			compare_with ISO-2022-JP "$TEST_DIRECTORY"/t3900/ISO-2022-JP.txt $ICONV
		

ok 24 - ISO-2022-JP should be shown in ISO-2022-JP now

expecting success: 
		compare_with "--encoding=none ISO8859-1" "$TEST_DIRECTORY"/t3900/ISO8859-1.txt
	

ok 25 - No conversion with ISO8859-1

expecting success: 
		compare_with "--encoding=none eucJP" "$TEST_DIRECTORY"/t3900/eucJP.txt
	

ok 26 - No conversion with eucJP

expecting success: 
		compare_with "--encoding=none ISO-2022-JP" "$TEST_DIRECTORY"/t3900/ISO-2022-JP.txt
	

ok 27 - No conversion with ISO-2022-JP

expecting success: 
		git config i18n.commitencoding $H &&
		git checkout -b $H-$flag C0 &&
		echo $H >>F &&
		git commit -a -F "$TEST_DIRECTORY"/t3900/$H.txt &&
		test_tick &&
		echo intermediate stuff >>G &&
		git add G &&
		git commit -a -m "intermediate commit" &&
		test_tick &&
		echo $H $flag >>F &&
		git commit -a --$flag HEAD~1 $3 &&
		E=$(git cat-file commit eucJP-fixup |
			sed -ne "s/^encoding //p") &&
		test "z$E" = "z$H" &&
		git config --unset-all i18n.commitencoding &&
		git rebase --autosquash -i HEAD^^^ &&
		git log --oneline >actual &&
		test 3 = $(wc -l <actual)
	
[eucJP-fixup dddf0b2] ¤Ï¤ì¤Ò¤Û¤Õ
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[eucJP-fixup 0ddcbc3] intermediate commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 G
[eucJP-fixup 930da60] fixup! ¤Ï¤ì¤Ò¤Û¤Õ
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Rebasing (2/3)[detached HEAD a90d62f] ¤Ï¤ì¤Ò¤Û¤Õ
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
Rebasing (3/3)
ok 28 - commit --fixup with eucJP encoding
expecting success: 
		git config i18n.commitencoding $H &&
		git checkout -b $H-$flag C0 &&
		echo $H >>F &&
		git commit -a -F "$TEST_DIRECTORY"/t3900/$H.txt &&
		test_tick &&
		echo intermediate stuff >>G &&
		git add G &&
		git commit -a -m "intermediate commit" &&
		test_tick &&
		echo $H $flag >>F &&
		git commit -a --$flag HEAD~1 $3 &&
		E=$(git cat-file commit ISO-2022-JP-squash |
			sed -ne "s/^encoding //p") &&
		test "z$E" = "z$H" &&
		git config --unset-all i18n.commitencoding &&
		git rebase --autosquash -i HEAD^^^ &&
		git log --oneline >actual &&
		test 3 = $(wc -l <actual)
	
[ISO-2022-JP-squash 8b5a4e3] $B$O$l$R$[$U(B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[ISO-2022-JP-squash 8ec9b13] intermediate commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 G
[ISO-2022-JP-squash b9fe6f4] squash! $B$O$l$R$[$U(B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Rebasing (2/3)[detached HEAD fb4218a] $B$O$l$R$[$U(B
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
Rebasing (3/3)
ok 29 - commit --squash with ISO-2022-JP encoding

# passed all 29 test(s)
1..29
