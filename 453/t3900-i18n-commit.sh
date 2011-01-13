ok 1 - setup
ok 2 - no encoding header for base case
ok 3 - ISO8859-1 setup
ok 4 - eucJP setup
ok 5 - ISO-2022-JP setup
ok 6 - check encoding header for ISO8859-1
ok 7 - check encoding header for eucJP
ok 8 - check encoding header for ISO-2022-JP
ok 9 - config to remove customization
ok 10 - ISO8859-1 should be shown in UTF-8 now
ok 11 - eucJP should be shown in UTF-8 now
ok 12 - ISO-2022-JP should be shown in UTF-8 now
ok 13 - config to add customization
ok 14 - ISO8859-1 should be shown in itself now
ok 15 - eucJP should be shown in itself now
ok 16 - ISO-2022-JP should be shown in itself now
ok 17 - config to tweak customization
ok 18 - ISO8859-1 should be shown in UTF-8 now
ok 19 - eucJP should be shown in UTF-8 now
ok 20 - ISO-2022-JP should be shown in UTF-8 now
ok 21 - eucJP should be shown in eucJP now
ok 22 - ISO-2022-JP should be shown in eucJP now
ok 23 - eucJP should be shown in ISO-2022-JP now
ok 24 - ISO-2022-JP should be shown in ISO-2022-JP now
ok 25 - No conversion with ISO8859-1
ok 26 - No conversion with eucJP
ok 27 - No conversion with ISO-2022-JP
not ok - 28 commit --fixup with eucJP encoding
#	
#			git config i18n.commitencoding $H &&
#			git checkout -b $H-$flag C0 &&
#			echo $H >>F &&
#			git commit -a -F "$TEST_DIRECTORY"/t3900/$H.txt &&
#			test_tick &&
#			echo intermediate stuff >>G &&
#			git add G &&
#			git commit -a -m "intermediate commit" &&
#			test_tick &&
#			echo $H $flag >>F &&
#			git commit -a --$flag HEAD~1 $3 &&
#			E=$(git cat-file commit eucJP-fixup |
#				sed -ne "s/^encoding //p") &&
#			test "z$E" = "z$H" &&
#			git config --unset-all i18n.commitencoding &&
#			git rebase --autosquash -i HEAD^^^ &&
#			git log --oneline >actual &&
#			test 3 = $(wc -l <actual)
#		
not ok - 29 commit --squash with ISO-2022-JP encoding
#	
#			git config i18n.commitencoding $H &&
#			git checkout -b $H-$flag C0 &&
#			echo $H >>F &&
#			git commit -a -F "$TEST_DIRECTORY"/t3900/$H.txt &&
#			test_tick &&
#			echo intermediate stuff >>G &&
#			git add G &&
#			git commit -a -m "intermediate commit" &&
#			test_tick &&
#			echo $H $flag >>F &&
#			git commit -a --$flag HEAD~1 $3 &&
#			E=$(git cat-file commit ISO-2022-JP-squash |
#				sed -ne "s/^encoding //p") &&
#			test "z$E" = "z$H" &&
#			git config --unset-all i18n.commitencoding &&
#			git rebase --autosquash -i HEAD^^^ &&
#			git log --oneline >actual &&
#			test 3 = $(wc -l <actual)
#		
# failed 2 among 29 test(s)
1..29
