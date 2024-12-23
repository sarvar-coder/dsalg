import UIKit

var greeting = "Hello, playground"
// MARK: - Directed Graph

var graph1 = [String: [String]]()

//["Nazarbek", "Mustafo", "Muzaffar"]  these people are connected to sarvar.
/// Sarvar can go to nazarbek, mustafo, muzaffar, but they can;t come to sarvar , cause it' directed graph
graph1["sarvar"] = ["Nazarbek", "Mustafo", "Muzaffar"]


// MARK: - Directed Graph
var graph = [String: [String]]()
graph["siz"] = ["ali", "vali", "tohir"]
graph["ali"] = ["aziza", "olim"]
graph["vali"] = ["botir", "ziyoda"]
graph["tohir"] = ["elon musk", "mohir"]
graph["olim"] = []
graph["aziza"] = []
graph["botir"] = []
graph["ziyoda"] = ["aziza"]
graph["mohir"] = []
graph["elon musk"] = []


// MARK: - Breadth First seach

func search(
    contacts: [String: [String]],
    startNode: String,
    target: String) -> Bool
{
    
    var searchQueue = [String]()
    searchQueue = contacts[startNode] ?? []
    var searched = Set<String>()
    
    while !searchQueue.isEmpty {
        
        let person = searchQueue.removeFirst()
        print(searchQueue)
        
        if !searched.contains(person) {
            if target == person {
                print("\(person)ni topdik")
                return true
            } else {
                searchQueue += contacts[person] ?? []
                searched.insert(person)
            }
        }
    }
    
    return false
}



func makeQueue(_ dict: [String: [String]]) -> [String] {
    
    var tempArray = Array(Set<String>())
    
    for (_, j) in dict.enumerated() {
        tempArray += j.value
    }
    
    return tempArray
}

search(
    contacts: graph,
    startNode: "siz",
    target: "elon musk")
