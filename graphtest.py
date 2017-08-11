# Counterexample to 45 nodes for R(5,5) Ramsey number
# Hypothesis: R(5,5) = 46
 
import networkx as nx
import matplotlib.pyplot as plt
import itertools
import math
import operator as op


def ncr(n, r):
    r = min(r, n-r)
    if r == 0: return 1
    numer = reduce(op.mul, xrange(n, n-r, -1))
    denom = reduce(op.mul, xrange(1, r+1))
    return numer//denom

# Generates node and edge lists
n = 41 # Number of nodes
nodes = range(1,n+1)
edges = itertools.combinations(nodes, 2)
#bluelist = firstNPrimes(1 + (n-1)/2)[1:] # so as to ignore the '2'
#bluelist = [3,5,7,11,13,17,19,23,29]
bluelist = [1,19]
bluelist2 = [n - i for i in bluelist]
superbluelist = bluelist + bluelist2
 
blue = []
red = []
 
# Generates list of edges for red and blue colourings
for edge in edges:
    if abs(edge[0] - edge[1]) in superbluelist:
        blue.append(edge)
    else:
        red.append(edge)
 
# Draws graph
G = nx.Graph()
G.add_nodes_from(nodes)
# Draws either red or blue subgraph
G.add_edges_from(red)
 
nx.draw_circular(G, edge_color='r', node_color='w')
plt.show()
 
def is_complete(graph,n):
    if len(graph.edges()) == sum(range(n)):
        return True
    else:
        return False

i = 0
ksize = 10
length = ncr(n,r)

for nodeset in itertools.combinations(nodes, ksize):
    H = G.subgraph(nodeset)
    if is_complete(H,ksize):
        print '--------------------'
        print 'NOOOOOOOOOOOOOOO'
        print H.edges()
        print '--------------------'
        raw_input('...')
        break
    print '{:,} / {:,}'.format(i, length)
    i+=1
    if i >= length:
        raw_input('...')