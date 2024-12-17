import UIKit

var greeting = "Selection Sort"

var collection = [8, 12, 25, 69, 90, 23, 10, 45, 56, 67]

func sort(_ array: [Int]) -> [Int] {
    var tempArray = array
    var newArray = [Int]()
    
    for _ in tempArray.indices {
        let maxndex = findMax(tempArray)
        let max = tempArray.remove(at: maxndex)
        newArray.append(max)
    }

    return newArray
}

func findMax(_ array: [Int]) -> Int {
    var max = array[0]
    var maxIndex = 0
    
    for i in array.indices {
        if array[i] > max {
            max = array[i]
            maxIndex = i
        }
    }
    
    return maxIndex
}
findMax(collection)
print(sort(collection))
