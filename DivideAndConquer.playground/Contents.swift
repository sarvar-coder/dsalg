import UIKit

var greeting = "Hello, playground"

func sum(_ array: [Int]) -> Int {
    
    if array.isEmpty {
        return 0
    }
    
    return array[0] + sum(Array(array.dropFirst()))
        
}
sum([1, 2, 3, 4, 5])


func length(of array: [Int]) -> Int {
    
    if array.isEmpty { return 0 }
    
    var count = 0
    
    var tempArray = array
    tempArray.removeFirst()
    
    return  1 + length(of: tempArray)
    
}

length(of: [34, 5, 23, 76, 13, 76, 123])


func findMax(in array: [Int]) -> Int {
    
    if array.count == 1 {
        return array[0]
    }
    
    
    
    return 0
}
func ekub(num1: Int, num2: Int) -> Int {
    
    if num1 == num2 {
        
    } else {
        
    }
    
    return 0
}
print("kdjfv")
print("sdnfm vlkjev")

