import UIKit

var greeting = "Hello, playground"

func qSort(_ array: [Int]) -> [Int] {
    
    if array.count < 2 {
        return array
    }
    var tempArray = array
    let randomIndex = Int.random(in: 0...(array.count-1))
    let pivot = array[randomIndex]
    
    let less = tempArray.filter({  pivot > $0  })
    let great = tempArray.filter({  pivot < $0  })
    print("\(less) + \([pivot]) + \(great)")
    
    return qSort(less)
    +
    [pivot]
    +
    qSort(great)
}
let myArr = [1, 43, 76, 2, 4, 6, 7, 8]
let result = qSort(myArr)
print(result)
