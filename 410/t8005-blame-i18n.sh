Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t8005-blame-i18n/.git/
expecting success: 
	# Create the file
	echo "UTF-8 LINE" > file &&
	git add file &&
	git commit --author "$UTF8_NAME <utf8@localhost>" -m "$UTF8_MSG" &&

	echo "EUC-JAPAN LINE" >> file &&
	git add file &&
	git config i18n.commitencoding eucJP &&
	git commit --author "$EUC_JAPAN_NAME <euc-japan@localhost>" -m "$EUC_JAPAN_MSG" &&

	echo "SJIS LINE" >> file &&
	git add file &&
	git config i18n.commitencoding SJIS &&
	git commit --author "$SJIS_NAME <sjis@localhost>" -m "$SJIS_MSG"
[master (root-commit) 932e76a] ブレームのテストです。
 Author: 山田 太郎 <utf8@localhost>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master a936686] �֥졼��Υƥ��ȤǤ���
 Author: ���� ��Ϻ <euc-japan@localhost>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 6644eac] �u���[���̃e�X�g�ł��B
 Author: �R�c ���Y <sjis@localhost>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup the repository
expecting success: 
	git blame --incremental file | \
		egrep "^(author|summary) " > actual &&
	test_cmp actual expected

ok 2 - blame respects i18n.commitencoding
expecting success: 
	git config i18n.logoutputencoding eucJP &&
	git blame --incremental file | \
		egrep "^(author|summary) " > actual &&
	test_cmp actual expected

ok 3 - blame respects i18n.logoutputencoding

expecting success: 
	git blame --incremental --encoding=UTF-8 file | \
		egrep "^(author|summary) " > actual &&
	test_cmp actual expected


ok 4 - blame respects --encoding=UTF-8

expecting success: 
	git blame --incremental --encoding=none file | \
		egrep "^(author|summary) " > actual &&
	test_cmp actual expected

ok 5 - blame respects --encoding=none

# passed all 5 test(s)
1..5
