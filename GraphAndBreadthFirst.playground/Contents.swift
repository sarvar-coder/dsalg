import UIKit

var greeting = "Hello, playground"
// MARK: - Directed Graph

var graph1 = [String: [String]]()

//["Nazarbek", "Mustafo", "Muzaffar"]  these people are connected to sarvar.
/// Sarvar can go to nazarbek, mustafo, muzaffar, but they can;t come to sarvar , cause it' directed graph
graph1["sarvar"] = ["Nazarbek", "Mustafo", "Muzaffar"]


// MARK: - Directed Graph
var graph = [String: [String]]()

graph["ali"] = ["aziza", "olim"]
graph["vali"] = ["botir", "ziyoda"]
graph["tohir"] = ["elon musk", "mohir"]
graph["olim"] = []
graph["aziza"] = []
graph["botir"] = []
graph["ziyoda"] = ["aziza"]
graph["mohir"] = []
graph["elon musk"] = []

print(graph.count)

