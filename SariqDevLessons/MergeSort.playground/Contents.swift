import UIKit

var greeting = "Hello, playground"

func mergeSort(_ array: [Int]) -> [Int] {
    // Base case: If the array has 1 or no elements, it's already sorted
    guard array.count > 1 else {
        return array
    }

    // Split the array into two halves
    let middleIndex = array.count / 2
    let leftArray = Array(array[..<middleIndex])
    let rightArray = Array(array[middleIndex...])

    // Recursively sort both halves
    let sortedLeft = mergeSort(leftArray)
    let sortedRight = mergeSort(rightArray)

    // Merge the sorted halves
    return merge(sortedLeft, sortedRight)
}

// Helper function to merge two sorted arrays
func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var result: [Int] = []

    // Merge elements from both arrays in sorted order
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            result.append(left[leftIndex])
            leftIndex += 1
        } else {
            result.append(right[rightIndex])
            rightIndex += 1
        }
    }

    // Append remaining elements from the left array
    while leftIndex < left.count {
        result.append(left[leftIndex])
        leftIndex += 1
    }

    // Append remaining elements from the right array
    while rightIndex < right.count {
        result.append(right[rightIndex])
        rightIndex += 1
    }

    return result
}

// Example Usage
let unsortedArray = [38, 27, 43, 3, 9, 82, 10]
let sortedArray = mergeSort(unsortedArray)
print(sortedArray) // Output: [3, 9, 10, 27, 38, 43, 82]
