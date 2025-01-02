import UIKit

var greeting = "Hello, playground"

struct Edge {
    let destination: String
    let weight: Int
}

func dijkstraShortestPath(graph: [String: [Edge]], source: String) -> [String: Int] {
    var distances = [String: Int]()
    var visited = Set<String>()
    var priorityQueue = [(node: String, distance: Int)]()

    // Initialize distances
    for node in graph.keys {
        distances[node] = Int.max
    }
    
    distances[source] = 0
    priorityQueue.append((node: source, distance: 0))
    
    while !priorityQueue.isEmpty {
        // Sort queue by distance and pick the smallest
        priorityQueue.sort { $0.distance < $1.distance }
        let current = priorityQueue.removeFirst()

        // Skip if already visited
        if visited.contains(current.node) {
            continue
        }
        visited.insert(current.node)
        
        // Update distances for neighbors

        for edge in graph[current.node, default: []] {
            
            let newDistance = current.distance + edge.weight
            
            if newDistance < distances[edge.destination, default: Int.max] {
                
                distances[edge.destination] = newDistance
                priorityQueue.append((node: edge.destination, distance: newDistance))
            }
        }
    }
    
    return distances
}

// Example Usage
let graph: [String: [Edge]] = [
    "A": [Edge(destination: "B", weight: 4), Edge(destination: "C", weight: 1)],
    "B": [Edge(destination: "E", weight: 4)],
    "C": [Edge(destination: "B", weight: 2), Edge(destination: "D", weight: 4)],
    "D": [Edge(destination: "E", weight: 1)],
    "E": []
]

let shortestPaths = dijkstraShortestPath(graph: graph, source: "A")
print(shortestPaths)
