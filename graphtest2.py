# Counterexample to 41 nodes for R(5,5) Ramsey number
# Hypothesis: R(5,5) = 42

import networkx as nx
import matplotlib.pyplot as plt
import itertools
import math
import os
import operator as op

def cubic_residues(p):
    """
    Returns the cubic residues mod p.
    """
    return list(set(pow(a,3)%p for a in xrange(1,p)))

def ncr(n, r):
    r = min(r, n-r)
    if r == 0: return 1
    numer = reduce(op.mul, xrange(n, n-r, -1))
    denom = reduce(op.mul, xrange(1, r+1))
    return numer//denom

def is_complete(graph, r):
    #n = len(graph.nodes())
    if len(graph.edges()) == sum(range(r)):
        return True
    else:
        return False

def testR(bluelist, colour='red', n=41, r=5):
    """
	Tests if there are any complete subgraphs of
	size r on a given colour for a two colouring 
	of the complete graph on n nodes.
	
	Generates 2-colouring by joining all arcs of
	length listed in bluelist for blue,
	and takes the complement as red.
	"""
    # Generates node and edge lists
    nodes = range(1,n+1)
    edges = itertools.combinations(nodes, 2)  
    bluelist1 = bluelist
    bluelist2 = [n - i for i in bluelist1]
    superbluelist = bluelist1 + bluelist2

    blue = []
    red = []

    # Generates list of edges for red and blue colourings
    for edge in edges:
        if abs(edge[0] - edge[1]) in superbluelist:
            blue.append(edge)
        else:
            red.append(edge)

    # Draws graph
    G = 0
    G = nx.Graph()
    G.add_nodes_from(nodes)
    if colour == 'red':
        G.add_edges_from(red)
    else:
        G.add_edges_from(blue)

    nx.draw_circular(G)
    plt.show

    i = 0
    length = ncr(n,r)
    print length
    for i, nodeset in enumerate(itertools.combinations(nodes, r)):
        H = G.subgraph(nodeset)
        if is_complete(H, r):
            print '--------------------'
            print 'NOOOOOOOOOOOOOOO' 
            print H.edges()
            print '--------------------'
            return False
            #print H.edges()
        if i%100000 == 0:
            print '{:,} / {:,}'.format(i, length)
        #i+=1
    return True

if __name__ == '__main__':
    #for bluelist in itertools.combinations([1,2,6,9,10,12,13,14,15,16,17,18,19,20], 6):
    #bluelist1 = list(bluelist) + [3,5,7,11]
    bluelist1 = [3,5,7]
    numNodes = 17
    kb = 3  # size of red complete graph
    kr = 6  # size of blue complete graph
	
    if testR(bluelist1, colour='blue', n=numNodes, r=kb) == True:
        if testR(bluelist1, colour='red', n=numNodes, r=kr) == True:
            print bluelist1
            raw_input('YOU DID IT!!!\n R({},{}) > {}'.format(kr,kb,numNodes))
    raw_input('...')