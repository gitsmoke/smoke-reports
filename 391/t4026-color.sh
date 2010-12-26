Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4026-color/.git/
expecting success: 
	color "reset" "[m"

ok 1 - reset
expecting success: 
	color "bold red" "[1;31m"

ok 2 - attribute before color name
expecting success: 
	color "red bold" "[1;31m"

ok 3 - color name before attribute
expecting success: 
	color "ul blue red" "[4;34;41m"

ok 4 - attr fg bg
expecting success: 
	color "blue ul red" "[4;34;41m"

ok 5 - fg attr bg
expecting success: 
	color "blue red ul" "[4;34;41m"

ok 6 - fg bg attr
expecting success: 
	color "blue bold dim ul blink reverse" "[1;2;4;5;7;34m"

ok 7 - fg bg attr...

expecting success: 
	color "254 255 bold dim ul blink reverse" "[1;2;4;5;7;38;5;254;48;5;255m"

ok 8 - long color specification

expecting success: 
	color "254 bold 255" "[1;38;5;254;48;5;255m"

ok 9 - 256 colors

expecting success: 
	invalid_color "-2"
ok 10 - color too small
expecting success: 
	invalid_color "256"
ok 11 - color too big

expecting success: 
	invalid_color "3X"
ok 12 - extra character after color number
expecting success: 
	invalid_color "redX"
ok 13 - extra character after color name
expecting success: 
	invalid_color "dimX"
ok 14 - extra character after attribute
expecting success: 
	git config color.diff.nosuchslotwilleverbedefined white &&
	git diff --color

ok 15 - unknown color slots are ignored (diff)
expecting success: 
	git config color.branch.nosuchslotwilleverbedefined white &&
	git branch -a

ok 16 - unknown color slots are ignored (branch)
expecting success: 
	git config color.status.nosuchslotwilleverbedefined white || exit
	git status
	case $? in 0|1) : ok ;; *) false ;; esac
# On branch master
#
# Initial commit
#
nothing to commit (create/copy files and use "git add" to track)
ok 17 - unknown color slots are ignored (status)

# passed all 17 test(s)
1..17
