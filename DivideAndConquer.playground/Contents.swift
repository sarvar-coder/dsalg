import UIKit

var greeting = "Hello, playground"

func sum(_ array: [Int]) -> Int {
    
    var first = array[0]
    var tempArr = array
    tempArr.remove(at: 0)
    
    if tempArr.count == 1 {
        return tempArr[0]
    } else {
       return first + sum(tempArr)
        
    }
    
}
sum([1, 2, 3, 4, 5])
