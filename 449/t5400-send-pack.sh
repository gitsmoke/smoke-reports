Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5400-send-pack/.git/
expecting success: 
	test_tick &&
	mkdir mozart mozart/is &&
	echo "Commit #0" >mozart/is/pink &&
	git update-index --add mozart/is/pink &&
	tree=$(git write-tree) &&
	commit=$(echo "Commit #0" | git commit-tree $tree) &&
	zero=$commit &&
	parent=$zero &&
	i=0 &&
	while test $i -le $cnt
	do
	    i=$(($i+1)) &&
	    test_tick &&
	    echo "Commit #$i" >mozart/is/pink &&
	    git update-index --add mozart/is/pink &&
	    tree=$(git write-tree) &&
	    commit=$(echo "Commit #$i" | git commit-tree $tree -p $parent) &&
	    git update-ref refs/tags/commit$i $commit &&
	    parent=$commit || return 1
	done &&
	git update-ref HEAD "$commit" &&
	git clone ./. victim &&
	( cd victim && git config receive.denyCurrentBranch warn && git log ) &&
	git update-ref HEAD "$zero" &&
	parent=$zero &&
	i=0 &&
	while test $i -le $cnt
	do
	    i=$(($i+1)) &&
	    test_tick &&
	    echo "Rebase #$i" >mozart/is/pink &&
	    git update-index --add mozart/is/pink &&
	    tree=$(git write-tree) &&
	    commit=$(echo "Rebase #$i" | git commit-tree $tree -p $parent) &&
	    git update-ref refs/tags/rebase$i $commit &&
	    parent=$commit || return 1
	done &&
	git update-ref HEAD "$commit" &&
	echo Rebase &&
	git log
Cloning into victim
done.
commit fbc850672173770f17d48f9f2dfcb286d30b70cb
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:18:13 2005 -0700

    Commit #65

commit 940af75942cf34a9fc156d9dc79c8c370e4c3247
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:17:13 2005 -0700

    Commit #64

commit 1fe3a3ebbeaddd1e503ee516a5433a8ebe097112
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:16:13 2005 -0700

    Commit #63

commit 0c78ec36deec72f8c6d458db5b753249a5447dec
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:15:13 2005 -0700

    Commit #62

commit 0ad1da14d02ef96f2c1cb8403952ffddeaaca439
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:14:13 2005 -0700

    Commit #61

commit 15278e4b9b51ca8e00785fff5592d9ba7b8012ea
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:13:13 2005 -0700

    Commit #60

commit d92539d97407cae3ac62cdd1992188ce96a04699
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:12:13 2005 -0700

    Commit #59

commit eeddc69755cde0046432203191b431846124c36d
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:11:13 2005 -0700

    Commit #58

commit 9481eb1cebd4e35080a85eaac0a389e436d174d9
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:10:13 2005 -0700

    Commit #57

commit 9ab7d0c3f85908c1624cc58f67c236b2e5d53c5d
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:09:13 2005 -0700

    Commit #56

commit 070f3c8d7d43c5b9df69498416664b994a36a3e7
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:08:13 2005 -0700

    Commit #55

commit a2f3e1ffc14adb111494e37e857de5428da7230e
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:07:13 2005 -0700

    Commit #54

commit 373ca332c114a8af8262474c0b750133d11c3467
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:06:13 2005 -0700

    Commit #53

commit abddf6c6693561aed51ed7308754360720399450
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:05:13 2005 -0700

    Commit #52

commit e9dc99c35123a1d9dd416eb32975f518f7e52776
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:04:13 2005 -0700

    Commit #51

commit 3efc54f7bd18addc186e565f051c1f57ae499205
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:03:13 2005 -0700

    Commit #50

commit 288f90defdf9f8fe6cafb95c4a53d41e3d2914bc
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:02:13 2005 -0700

    Commit #49

commit 1dfae6503af0ff1c353be39162beb34744556d2d
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:01:13 2005 -0700

    Commit #48

commit c21493faada856b0f2ac0b85de568ffd9f21ad09
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:00:13 2005 -0700

    Commit #47

commit 0e48e7bf42f7c84d1039794461501f4d3e6bef59
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:59:13 2005 -0700

    Commit #46

commit bb0ff093c62b37247e4b570e41e57fa123962ee8
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:58:13 2005 -0700

    Commit #45

commit a2d17f74bfdf7acc0c40e3b228d57a4d68a9c01b
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:57:13 2005 -0700

    Commit #44

commit cbac9fdcb0113800bc9ff62d8c1a0cfd61815b11
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:56:13 2005 -0700

    Commit #43

commit 13eff776535a4d90e14a5ba1239e3bb094fce3ef
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:55:13 2005 -0700

    Commit #42

commit b7592bd14654cc3f437db49791a176d29d3aa8f0
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:54:13 2005 -0700

    Commit #41

commit 83b8bfc7c90441063b251721278b7e8f9c5a201a
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:53:13 2005 -0700

    Commit #40

commit 0b9d55bbcb1a6033be38cb93b03d75e5a78f9c3f
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:52:13 2005 -0700

    Commit #39

commit d453237bfb3140a104f4c3946b562e8b8e9cda13
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:51:13 2005 -0700

    Commit #38

commit 63c4e0264b89e227660dc2fbd7fc8077627ab28e
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:50:13 2005 -0700

    Commit #37

commit 5df897dfd4814feea01849f65e8fc3e81d72728f
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:49:13 2005 -0700

    Commit #36

commit 5e2d0ff7bcf7c8973b325689dd3604bd01d6b075
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:48:13 2005 -0700

    Commit #35

commit cbf881eb049d21325ff0fba1e98746e36f1d46a8
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:47:13 2005 -0700

    Commit #34

commit b8a9eb0e7c8cff2ab2d65d53f5a568dc7b54d5b0
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:46:13 2005 -0700

    Commit #33

commit 20db8c933b4ca134652d077a7a59a12f7653c3a4
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:45:13 2005 -0700

    Commit #32

commit 738136f07b8bf1cff560dc0dbf4a18eee3b1de94
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:44:13 2005 -0700

    Commit #31

commit dd3f1b3396477b30b131d10831090cd58add8a2f
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:43:13 2005 -0700

    Commit #30

commit e7bbe70cb14feebd4d4ceada22d700e1bdcb301f
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:42:13 2005 -0700

    Commit #29

commit 7c932743e94bd2239c435bf5645dccb051f3c5fe
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:41:13 2005 -0700

    Commit #28

commit c3cca0936c775de13190616bf109b3992732f2e1
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:40:13 2005 -0700

    Commit #27

commit 2eb3c6ccb3b91269a09de0d742aecfd52817f72f
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:39:13 2005 -0700

    Commit #26

commit 0f219719c1472626b844e140343f904fa4972bcc
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:38:13 2005 -0700

    Commit #25

commit 03c8ac629a12338cc02e81b17da6d7cb0e1a802b
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:37:13 2005 -0700

    Commit #24

commit 99b081ae6f13358b2cff7faad1b3f2a4c347edad
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:36:13 2005 -0700

    Commit #23

commit 7206ff76323748a074c19dacc097d2ed3b96bfb2
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:35:13 2005 -0700

    Commit #22

commit 490ddb36dddfeffa7779829333c151cbbe9e7366
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:34:13 2005 -0700

    Commit #21

commit a73206b2f61cdf7bf21c8138c9900794f0eab9a5
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:33:13 2005 -0700

    Commit #20

commit 01e16b5ab9e14247c98de5452a4be588930371be
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:32:13 2005 -0700

    Commit #19

commit 9c803e03a40e955e599e8ecb9131651832083f57
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:31:13 2005 -0700

    Commit #18

commit 6fc6ec72c6ce78e654a775f4f659411294f1d4e6
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:30:13 2005 -0700

    Commit #17

commit b601a967eeee6cb91b552c6e43b4bafdf2b1c7ac
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:29:13 2005 -0700

    Commit #16

commit 1747235a5c3fa673cab96b05b46dd97adb0c00c8
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:28:13 2005 -0700

    Commit #15

commit 26bc6342db340ab762645b0b3b83517623b4c675
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:27:13 2005 -0700

    Commit #14

commit b2f646eca1878e3000b6ceabd81b60ce604cb41e
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:26:13 2005 -0700

    Commit #13

commit be3e57a8ad8950e367abdb48fe904d3f965e96fa
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:25:13 2005 -0700

    Commit #12

commit 838c59d0f1f2160aa980e1c58db52403effc9dc6
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:24:13 2005 -0700

    Commit #11

commit 2d04f66a08825b9bd9631a379768ee94d9e35c94
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:23:13 2005 -0700

    Commit #10

commit 3b4907bf685c7f5694fd51989e990218a5844ee6
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:22:13 2005 -0700

    Commit #9

commit e87f17a34ce327a5cef1309626784bc0bcc74743
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:21:13 2005 -0700

    Commit #8

commit b1248b7697c5ba5bd2099f38eee5728f05a07a2c
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:20:13 2005 -0700

    Commit #7

commit a69e0e75ae4b3c7d5954f52f3dc1666d7facf114
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:19:13 2005 -0700

    Commit #6

commit d2559a7d1598c17fb8259ed9c923a40f242edbd7
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:18:13 2005 -0700

    Commit #5

commit c45f8a131dd92e17228868c96e1b0b0b07693331
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:17:13 2005 -0700

    Commit #4

commit 758f634f1b1a066097ec1ee3c9a4aedc0bfb3d46
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:16:13 2005 -0700

    Commit #3

commit 2285e440694323e1c325d1838d97abdecada8ade
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:15:13 2005 -0700

    Commit #2

commit b86cdba23d2682dd459133f2efac8ea660f1dd5b
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:14:13 2005 -0700

    Commit #1

commit e8d9fe63116478156180f7026f6c181cc60432c5
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    Commit #0
Rebase
commit b1a1c97e94b6388c108e195d28a3e89f00c81698
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:23:13 2005 -0700

    Rebase #65

commit b1a473533f3c7654e6aabe20b868f403cc4542c4
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:22:13 2005 -0700

    Rebase #64

commit b44d0fc2fa543aae48a3e88ca2d4bb69b0808618
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:21:13 2005 -0700

    Rebase #63

commit bdb72969f88d60418acc3c5cb69f94a9254e4069
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:20:13 2005 -0700

    Rebase #62

commit f4846c914d90426d0aa7d9ae8c617e23aeb7aadc
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:19:13 2005 -0700

    Rebase #61

commit 5513d6a596bf3937f715bf4c4fa240dae08c1183
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:18:13 2005 -0700

    Rebase #60

commit c17d7284cf4910e76deb07380fdb38db71d239c7
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:17:13 2005 -0700

    Rebase #59

commit 61c422e7618c96824dffec2cbb0cc7ec1933e48e
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:16:13 2005 -0700

    Rebase #58

commit 2d32b535df82e1d77ee22da27287e3a676723ef8
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:15:13 2005 -0700

    Rebase #57

commit d8638fd41e1699aa201527ace01d2ba19815aceb
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:14:13 2005 -0700

    Rebase #56

commit 04fe055c82dc9923f2be842c62ddf3325ed7e4c3
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:13:13 2005 -0700

    Rebase #55

commit 8b3228b708d50b5e797bb375d97082ec7afeace4
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:12:13 2005 -0700

    Rebase #54

commit 5f4c3fe8ed7e4d32b60d7abb0e2af50d1343cca0
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:11:13 2005 -0700

    Rebase #53

commit 7f88d5e9d36769f5c9c65bcdd6b74456be65794b
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:10:13 2005 -0700

    Rebase #52

commit 54fa0318009bc334ce8aa9a83e559582a15df921
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:09:13 2005 -0700

    Rebase #51

commit 874533e6395fa245e3aad590c5b29b113c993d88
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:08:13 2005 -0700

    Rebase #50

commit dc1211213cf96c29abb9e65856f42adb8ae87f44
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:07:13 2005 -0700

    Rebase #49

commit ecc16305000cbf7e0e28eaefa037380923f54f2b
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:06:13 2005 -0700

    Rebase #48

commit 22eb8b0dd79fa78df505878adb615b382c819795
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:05:13 2005 -0700

    Rebase #47

commit e658f744975d593f1d768ae6a252466f3d6f542e
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:04:13 2005 -0700

    Rebase #46

commit 927e9cfe3212295919b60727098c2bcba986c37e
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:03:13 2005 -0700

    Rebase #45

commit 8c6450200d3f0d8d334e87e0d8a8277a2f791251
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:02:13 2005 -0700

    Rebase #44

commit 63e19d3641a395e0933a71af193c8dab5ddf587a
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:01:13 2005 -0700

    Rebase #43

commit dea9ca7996241bf8d256a6207334ab6cb0a2f16d
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 17:00:13 2005 -0700

    Rebase #42

commit 026648f873caf2683546bb4a0bffc8293d8c2a73
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:59:13 2005 -0700

    Rebase #41

commit 614287fbf62149f243db150a29195ddd2552620e
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:58:13 2005 -0700

    Rebase #40

commit 796c2f217a5f8738534fbb7febc3879590747fc2
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:57:13 2005 -0700

    Rebase #39

commit 5aaad3995be7c0de7d694ab11b764a400a4df57f
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:56:13 2005 -0700

    Rebase #38

commit 313b77b49a4baf7c7fe8055753a71c38bdd38b47
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:55:13 2005 -0700

    Rebase #37

commit a59332167314137eb8af8837e16115c9680e018e
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:54:13 2005 -0700

    Rebase #36

commit 0ab0d27b1668006e073534c69e62685f0f9fc4ab
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:53:13 2005 -0700

    Rebase #35

commit 43f966630635e7421592b1564d06becd4329fb7f
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:52:13 2005 -0700

    Rebase #34

commit fe710d4f0305ee6cfcc29f08823ccc6a8eb2e78a
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:51:13 2005 -0700

    Rebase #33

commit 58465df8a64cc8cf28c98afc18e920e03dad9ec8
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:50:13 2005 -0700

    Rebase #32

commit 559f5ec230a71724d6ea3399c0216e52938cba74
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:49:13 2005 -0700

    Rebase #31

commit 423868ae9fccf8a50212b69677d9fe252065eb3b
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:48:13 2005 -0700

    Rebase #30

commit d02b87bdc1b8e96ed634d52ddefb6b7db693b84b
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:47:13 2005 -0700

    Rebase #29

commit 04e55758ac35dc63f899b6c3d526b2b802cee7c9
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:46:13 2005 -0700

    Rebase #28

commit be5fbd2f45796936f2cfa86bb4dffe5b95013f0e
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:45:13 2005 -0700

    Rebase #27

commit 213212c4ff3f0e681db0e061ed02dcc2e3902374
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:44:13 2005 -0700

    Rebase #26

commit 61a890331f2ecf786d50fa8248d4f86345569421
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:43:13 2005 -0700

    Rebase #25

commit a1bfffeeeb67da7d9433dd5d4dcc2876badda7de
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:42:13 2005 -0700

    Rebase #24

commit ade5cf07bd9f8a623762be2b83d5200fd4c23e78
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:41:13 2005 -0700

    Rebase #23

commit 541aba44d5797d319874b1d242c491aecd70072e
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:40:13 2005 -0700

    Rebase #22

commit 8ef186d480959ba1c1950497155e9db2bb5cf262
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:39:13 2005 -0700

    Rebase #21

commit dd1cc8a79dd40f7d83223b2b2293062a17ed60ee
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:38:13 2005 -0700

    Rebase #20

commit 60c8d8288c55de0f0dadd7f570f69a5bd9023e54
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:37:13 2005 -0700

    Rebase #19

commit 2720bed4e6e3a6011714b76356527f5626a8b7bf
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:36:13 2005 -0700

    Rebase #18

commit e4946f6736764ebcc7b4392c98b1916f37a8151c
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:35:13 2005 -0700

    Rebase #17

commit f2a50e2577f679dd6edf5afa77fb0d331cf0e487
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:34:13 2005 -0700

    Rebase #16

commit ba62d05c67970ca150478a6e204c07876eb45310
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:33:13 2005 -0700

    Rebase #15

commit 16bbc537388506c6aa3568aec7a1c295ff664ad8
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:32:13 2005 -0700

    Rebase #14

commit 8ae96d45eca9358820adedc310a2bc6ff331a3e7
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:31:13 2005 -0700

    Rebase #13

commit 2557a8c044e16526b8261947e17623841a0d5a91
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:30:13 2005 -0700

    Rebase #12

commit 3f1275e3115a421a76f0ccbd5dea35b7cf227ce9
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:29:13 2005 -0700

    Rebase #11

commit 6d31feb4517418400c8f76a834f7cff206a2b1ab
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:28:13 2005 -0700

    Rebase #10

commit 054728ce53143ed538a80cc1db2f91642848d9d8
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:27:13 2005 -0700

    Rebase #9

commit dbee1ce0dbeb64756fba483e99628287182a0be1
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:26:13 2005 -0700

    Rebase #8

commit d174cc1075a864f5db77014609f7f9af0240ed0c
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:25:13 2005 -0700

    Rebase #7

commit 18b56d78fb5f32acd1d2a027c139cb14df278e1c
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:24:13 2005 -0700

    Rebase #6

commit 754de5100e6921cb300704183c76e1c65e301beb
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:23:13 2005 -0700

    Rebase #5

commit 9fe752390a117faf8d6f239358fa821b464ff14d
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:22:13 2005 -0700

    Rebase #4

commit 3e9bfb9468271e1707c357a5018af569c2a676d4
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:21:13 2005 -0700

    Rebase #3

commit d15adbaa5fdd6b03140db45c714342b2023152fa
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:20:13 2005 -0700

    Rebase #2

commit 82c2bc152fd9f785c269098549562d289347b2f8
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 16:19:13 2005 -0700

    Rebase #1

commit e8d9fe63116478156180f7026f6c181cc60432c5
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    Commit #0

ok 1 - setup

expecting success: 
	git repack -a -d &&
	git prune

ok 2 - pack the source repository

expecting success: 
    (
	cd victim &&
	git repack -a -d &&
	git prune
    )

ok 3 - pack the destination repository

expecting success: 
	pushed_head=$(git rev-parse --verify master) &&
	victim_orig=$(cd victim && git rev-parse --verify master) &&
	test_must_fail git send-pack ./victim master &&
	victim_head=$(cd victim && git rev-parse --verify master) &&
	test "$victim_head" = "$victim_orig" &&
	# this should update
	git send-pack --force ./victim master &&
	victim_head=$(cd victim && git rev-parse --verify master) &&
	test "$victim_head" = "$pushed_head"


ok 4 - refuse pushing rewound head without --force

expecting success: 
	( cd victim && git branch extra master ) &&
	git send-pack ./victim :extra master &&
	( cd victim &&
	  test_must_fail git rev-parse --verify extra )


ok 5 - push can be used to delete a ref

expecting success: 
	(
	    cd victim &&
	    ( git branch -D extra || : ) &&
	    git config receive.denyDeletes true &&
	    git branch extra master
	) &&
	test_must_fail git send-pack ./victim :extra master


ok 6 - refuse deleting push with denyDeletes

expecting success: 
	(
		cd victim &&
		test_might_fail git branch -D extra &&
		git config receive.denyDeletes true &&
		git branch extra master
	) &&
	test_must_fail git -c receive.denyDeletes=false \
					send-pack ./victim :extra master

Deleted branch extra (was b1a1c97).

ok 7 - cannot override denyDeletes with git -c send-pack

expecting success: 
	(
		cd victim &&
		test_might_fail git branch -D extra &&
		git config receive.denyDeletes true &&
		git branch extra master
	) &&
	git send-pack \
		--receive-pack="git -c receive.denyDeletes=false receive-pack" \
		./victim :extra master

Deleted branch extra (was b1a1c97).

ok 8 - override denyDeletes with git -c receive-pack

expecting success: 
	(
	    cd victim &&
	    ( git branch -D extra || : ) &&
	    git config receive.denyNonFastforwards true
	) &&
	victim_orig=$(cd victim && git rev-parse --verify master) &&
	test_must_fail git send-pack --force ./victim master^:master &&
	victim_head=$(cd victim && git rev-parse --verify master) &&
	test "$victim_orig" = "$victim_head"


ok 9 - denyNonFastforwards trumps --force

expecting success: 
	mkdir parent &&
	(
	    cd parent &&
	    git init && : >file && git add file && git commit -m add
	) &&
	git clone parent child &&
	(
	    cd child && git push --all
	) &&
	(
	    cd parent &&
	    test -z "$(git for-each-ref refs/remotes/origin)"
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5400-send-pack/parent/.git/
[master (root-commit) 9addffa] add
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
Cloning into child
done.
ok 10 - push --all excludes remote-tracking hierarchy

expecting success: 
	rewound_push_setup &&
	parent_orig=$(cd parent && git rev-parse --verify master) &&
	(
	    cd child &&
	    test_must_fail git send-pack ../parent \
		refs/heads/master:refs/heads/master
	) &&
	parent_head=$(cd parent && git rev-parse --verify master) &&
	test "$parent_orig" = "$parent_head" &&
	(
	    cd child &&
	    git send-pack ../parent \
	        +refs/heads/master:refs/heads/master
	) &&
	parent_head=$(cd parent && git rev-parse --verify master) &&
	child_head=$(cd parent && git rev-parse --verify master) &&
	test "$parent_head" = "$child_head"
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5400-send-pack/parent/.git/
[master (root-commit) 14eeca9] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 43ab524] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Cloning into child
done.
HEAD is now at 14eeca9 one
ok 11 - pushing explicit refspecs respects forcing

expecting success: 
	rewound_push_setup &&
	parent_orig=$(cd parent && git rev-parse --verify master) &&
	(
	    cd child &&
	    test_must_fail git send-pack ../parent \
	        "refs/heads/*:refs/heads/*"
	) &&
	parent_head=$(cd parent && git rev-parse --verify master) &&
	test "$parent_orig" = "$parent_head" &&
	(
	    cd child &&
	    git send-pack ../parent \
	        "+refs/heads/*:refs/heads/*"
	) &&
	parent_head=$(cd parent && git rev-parse --verify master) &&
	child_head=$(cd parent && git rev-parse --verify master) &&
	test "$parent_head" = "$child_head"
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5400-send-pack/parent/.git/
[master (root-commit) 14eeca9] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 43ab524] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Cloning into child
done.
HEAD is now at 14eeca9 one
ok 12 - pushing wildcard refspecs respects forcing

expecting success: 
	rewound_push_setup &&
	(
	    cd child &&
	    test_must_fail git send-pack ../parent :refs/heads/master 2>errs
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5400-send-pack/parent/.git/
[master (root-commit) 14eeca9] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 43ab524] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Cloning into child
done.
HEAD is now at 14eeca9 one
ok 13 - deny pushing to delete current branch

# passed all 13 test(s)
1..13
