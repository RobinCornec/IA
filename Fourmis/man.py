import math
import csv
import networkx as nx
import matplotlib.pyplot as plt
 
G=nx.Graph()
nx.draw(G)  # networkx draw()
plt.draw()  # pyplot draw()

with open('VOIES_NM.csv') as csvfile:
	reader = csv.DictReader(csvfile)
	i = 0
	for row in reader:
		i = i + 1
		#print(row['LIBELLE'], row['TENANT'], row['ABOUTISSANT'], row['BI_MAX'])
		rue = row['COMMUNE'] + " " + row['LIBELLE']
		tenant = row['TENANT']
		aboutissant = row['ABOUTISSANT']
		points = row['BI_MAX']
		statut = row['STATUT']
		#if statut == "PRIVEE":
		#	print("privee !!!")
		#else:
		#	print("rue")
		if tenant != "" and aboutissant != "":
			print (tenant + " -> " + aboutissant)
			G.add_edge(tenant,aboutissant, axe=rue)			

nx.draw_circular(G)
#nx.draw_random(G)
plt.show()

def find_path(graph, start, end, path=[]):
	path = path + [start]
        if start == end:
            return path
        if not graph.has_key(start):
            return None
        for node in graph[start]:
            if node not in path:
                newpath = find_path(graph, node, end, path)
                if newpath: return newpath
        return None

find_path(G, )