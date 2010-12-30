Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5602-clone-remote-exec/.git/
expecting success: 
	echo "#!/bin/sh" > not_ssh &&
	echo "echo \"\$*\" > not_ssh_output" >> not_ssh &&
	echo "exit 1" >> not_ssh &&
	chmod +x not_ssh

ok 1 - setup
expecting success: 
	(
		GIT_SSH=./not_ssh &&
		export GIT_SSH &&
		test_must_fail git clone localhost:/path/to/repo junk
	) &&
	echo "localhost git-upload-pack '/path/to/repo'" >expected &&
	test_cmp expected not_ssh_output
Cloning into junk...

ok 2 - clone calls git upload-pack unqualified with no -u option

expecting success: 
	(
		GIT_SSH=./not_ssh &&
		export GIT_SSH &&
		test_must_fail git clone -u ./something/bin/git-upload-pack localhost:/path/to/repo junk
	) &&
	echo "localhost ./something/bin/git-upload-pack '/path/to/repo'" >expected &&
	test_cmp expected not_ssh_output

Cloning into junk...

ok 3 - clone calls specified git upload-pack with -u option

# passed all 3 test(s)
1..3
