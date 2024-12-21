import UIKit

var greeting = "Hello, playground"

func bubbleSort(array: inout [Int]) -> [Int] {
    let count = array.count
    
    guard count > 1 else { return array } // If array has 0 or 1 element, it's already sorted.
    
    for i in 0..<count {
        /// The last `i` elements are already sorted, so exclude them in the current pass.
        
        for j in 0..<(count - i - 1) {
            if array[j] > array[j + 1] {
                ///Swap elements if they are in the wrong order
                array.swapAt(j, j + 1)
            }
        }
    }
    
    return array
}
var array = [3, 2, 4, 67, 132]
bubbleSort(array: &array)
