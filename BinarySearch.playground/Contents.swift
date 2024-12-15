import UIKit

print("skjdnvd")

func binarySearchStrings(_ array: [String], item: String) -> Int {
    print("Start")
    var myArr = array.sorted()  // fit with binary search
    
    if array.isEmpty { return -13 }
    print("Not empty")
    if array.count == 1 { return 0 }
    print("Non Single")
    
    var left = 0
    var right = myArr.count - 1
    
    while left <= right {
        
        let mid = (left + right) / 2
        print("define mid")
        let guess = myArr[mid]
        print("define guess")
        if guess.lowercased() == item.lowercased() {
            print("found")
            return mid
        } else if guess.lowercased() < item.lowercased()  {
            print("narrow 1")
            left = mid + 1
        } else {
            print("narrow 2")
            right = mid - 1
        }
    }
print("Stop")
    return -1
}



let words = ["apple", "banana", "cherry", "date", "fig", "grape"]

binarySearchStrings(words, item: "quality")

func linearSearch(_ array: [String], item: String) -> Int {
    
    if array.isEmpty { return -1 }
    
    for elemenet in array {
        if elemenet == item {
            return 3
        }
    }
    return -1
}
