Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0003-attributes/.git/
expecting success: 

	mkdir -p a/b/d a/c &&
	(
		echo "[attr]notest !test"
		echo "f	test=f"
		echo "a/i test=a/i"
		echo "onoff test -test"
		echo "offon -test test"
		echo "no notest"
	) >.gitattributes &&
	(
		echo "g test=a/g" &&
		echo "b/g test=a/b/g"
	) >a/.gitattributes &&
	(
		echo "h test=a/b/h" &&
		echo "d/* test=a/b/d/*"
		echo "d/yes notest"
	) >a/b/.gitattributes
	(
		echo "global test=global"
	) >"$HOME"/global-gitattributes

ok 1 - setup

expecting success: 

	attr_check f f &&
	attr_check a/f f &&
	attr_check a/c/f f &&
	attr_check a/g a/g &&
	attr_check a/b/g a/b/g &&
	attr_check b/g unspecified &&
	attr_check a/b/h a/b/h &&
	attr_check a/b/d/g "a/b/d/*" &&
	attr_check onoff unset &&
	attr_check offon set &&
	attr_check no unspecified &&
	attr_check a/b/d/no "a/b/d/*" &&
	attr_check a/b/d/yes unspecified

ok 2 - attribute test

expecting success: 
	attr_check global unspecified &&
	git config core.attributesfile "$HOME/global-gitattributes" &&
	attr_check global global &&
	git config core.attributesfile "~/global-gitattributes" &&
	attr_check global global &&
	echo "global test=precedence" >> .gitattributes &&
	attr_check global precedence

ok 3 - core.attributesfile

expecting success: 

	cat <<EOF > expect &&
f: test: f
a/f: test: f
a/c/f: test: f
a/g: test: a/g
a/b/g: test: a/b/g
b/g: test: unspecified
a/b/h: test: a/b/h
a/b/d/g: test: a/b/d/*
onoff: test: unset
offon: test: set
no: test: unspecified
a/b/d/no: test: a/b/d/*
a/b/d/yes: test: unspecified
EOF

	sed -e "s/:.*//" < expect | git check-attr --stdin test > actual &&
	test_cmp expect actual

ok 4 - attribute test: read paths from stdin

expecting success: 

	attr_check a/i a/i &&
	attr_check subdir/a/i unspecified

ok 5 - root subdir attribute test

expecting success: 

	git clone --bare . bare.git &&
	cd bare.git
Cloning into bare repository bare.git...
done.

ok 6 - setup bare

expecting success: 

	(
		echo "f	test=f"
		echo "a/i test=a/i"
	) >.gitattributes &&
	attr_check f unspecified &&
	attr_check a/f unspecified &&
	attr_check a/c/f unspecified &&
	attr_check a/i unspecified &&
	attr_check subdir/a/i unspecified
ok 7 - bare repository: check that .gitattribute is ignored

expecting success: 

	(
		echo "f	test=f"
		echo "a/i test=a/i"
	) >info/attributes &&
	attr_check f f &&
	attr_check a/f f &&
	attr_check a/c/f f &&
	attr_check a/i a/i &&
	attr_check subdir/a/i unspecified

ok 8 - bare repository: test info/attributes

# passed all 8 test(s)
1..8
