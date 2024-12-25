import UIKit

var greeting = "Hello, playground"

// MARK: - Grapgh
var graph = ["start": [String: Int]()]
graph["start"]?["a"] = 6
graph["start"]?["b"] = 2

graph["a"] = [:]
graph["a"]?["fin"] = 1

graph["b"] = [:]
graph["b"]?["a"] = 3
graph["b"]?["b"] = 5

graph["fin"] = [:]

print(graph["start"]?["b"] ?? "Nothing")

// MARK: - Costs
var costs = [String: Int]()

costs["a"] = 6
costs["b"] = 2
costs["fin"] = Int.max

// MARK: - Parents
var parents = [String: String]()

parents["a"] = "start"
parents["b"] = "start"
parents["fin"] = ""


var processed = [String]()

// MARK: - Implementaion
var node = findLowestCostNode(costs)

while node != nil {
    let cost = costs[node!]
    let neighbours = graph[node!]
    
    for i in neighbours!.keys {
        let newCost = cost! + neighbours![i]!
        if costs[i]! > newCost {
            costs[i] = newCost
            parents[i] = node
        }
        processed.append(node!)
        node = findLowestCostNode(costs)
        print(newCost)
    }
}





// MARK: - Helper function
func findLowestCostNode(_ costs: [String: Int]) -> String? {
    var lowestCost = Float.infinity
    var lowestCostNode = ""
    
    for node in costs.keys {
        let cost = costs[node]
        if Float(cost!) < (lowestCost) && !processed.contains(node) {
            lowestCost = Float(cost!)
            lowestCostNode = node
        }
    }
    
    return lowestCostNode
}
