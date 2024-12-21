import UIKit

var greeting = "Hello, playground"

func bubbleSort(array: inout [Int]) -> [Int] {
    
    for i in 0...(array.count - 1) {
        for j in 0...((array.count - 1) - i) {
            if array[j] > array[j + 1] {
                array[j] = array[j]
                array[j + 1] = array[j + 1]
            }
        }
    }
    
    return array
}
var array = [3, 2, 4, 67, 132]
bubbleSort(array: &array)
