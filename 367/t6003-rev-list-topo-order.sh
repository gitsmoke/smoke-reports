ok 1 - rev-list has correct number of entries
ok 2 - simple topo order
ok 3 - two diamonds topo order (g6)
ok 4 - multiple heads
ok 5 - multiple heads, prune at a1
ok 6 - multiple heads, prune at l1
ok 7 - cross-epoch, head at l5, prune at l1
ok 8 - duplicated head arguments
ok 9 - prune near topo
ok 10 - head has no parent
ok 11 - two nodes - one head, one base
ok 12 - three nodes one head, one internal, one base
ok 13 - linear prune l2 ^root
ok 14 - linear prune l2 ^l0
ok 15 - linear prune l2 ^l1
ok 16 - linear prune l5 ^a4
ok 17 - linear prune l5 ^l3
ok 18 - linear prune l5 ^l4
ok 19 - max-count 10 - topo order
ok 20 - max-count 10 - non topo order
ok 21 - --max-age=c3, no --topo-order
ok 22 - one specified head reachable from another a4, c3, --topo-order
ok 23 - one specified head reachable from another c3, a4, --topo-order
ok 24 - one specified head reachable from another a4, c3, no --topo-order
ok 25 - one specified head reachable from another c3, a4, no --topo-order
ok 26 - graph with c3 and a4 parents of head
ok 27 - graph with a4 and c3 parents of head
ok 28 - head ^head --topo-order
ok 29 - head ^head no --topo-order
ok 30 - simple topo order (l5r1)
ok 31 - simple topo order (r1l5)
ok 32 - don't print things unreachable from one branch
ok 33 - --topo-order a4 l3
# passed all 33 test(s)
1..33
