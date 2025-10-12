import UIKit

var greeting = "Hello, playground"
var array = [1, 2, 3, 4, 5]

// MARK: - reverseString
func reverseString(_ s: inout [Character]) {
    var left = 0
    var right = s.count - 1
    
    while left <= right {
        s.swapAt(right, left)
        left += 1
        right -= 1
    }
}
// MARK: - isPalindrome
func isPalindrome(_ s: String) -> Bool {
    let s: [Character] = Array(s)
    
    var left = 0
    var right = s.count - 1
    
    while left <= right {
        if s[left] != s[right] {
            return false
        }
        left += 1
        right -= 1
    }
    
    return true
}
// MARK: - validPalindrome
func validPalindrome(_ s: String) -> Bool {
    let s: [Character] = Array(s)
    var left = 0
    var right = s.count - 1
    
    while left <= right {
        if s[left] != s[right] {
            if isPalindrome(s, left + 1, right) || isPalindrome(s, left, right - 1) {
                return false
            }
            
        }
        left += 1
        right -= 1
    }
    
    return true
}
func isPalindrome(_ s: [Character], _ left:  Int, _ right:  Int) -> Bool {
    
    var left = left
    var right = right
    
    while left < right {
        if s[left] != s[right] {
            return false
        }
        left += 1
        right -= 1
    }
    
    return true
}
// MARK: - mergeAlternately
func mergeAlternately(_ word1: String, _ word2: String) -> String {
    let word1: [Character] = Array(word1)
    let word2: [Character] = Array(word2)
    
    var left = 0
    var right = word1.count > word2.count ? word2.count - 1 : word1.count - 1
    
    var ans = ""
    
    while left <= right {
        
        ans += String(word1[left])
        ans += String(word2[left])
        
        left += 1
    }
    if word1.count != word2.count {
        ans += word1.count > word2.count ?
        word1[left...(word1.count - 1)] :
        word2[left...(word2.count - 1)]
    }
    
    return ans
}
// MARK: - Merge sorted array.
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    
    var last = m + n - 1
    var i = m - 1, j = n - 1
    
    while j >= 0 {
        if i >= 0 && nums1[i] > nums2[j] {
            nums1[last] = nums1[i]
            i -= 1
        } else {
            nums1[last] = nums2[j]
            j -= 1
        }
        last -= 1
    }
    
    
}
//MARK: - removeDuplicates
func removeDuplicates(_ nums: inout [Int]) -> Int {
    
    var newNums = [nums[0]]
    var i = 0
    var index = 0
    
    while index < nums.count {
        
        if newNums[i] != nums[index] {
            newNums.append(nums[index])
            i += 1
        }
        
        index += 1
    }
    
    nums = newNums
    return newNums.count
}
// MARK: - Two sum

// MARK: - Three sum
func threeSum(_ nums: [Int]) -> [[Int]] {
    let sortedNums = nums.sorted()
    var i = 0
    var ans = Set<[Int]>()
    
    while i < sortedNums.count - 2 {  // here
        
        //         here
        if i > 0 && sortedNums[i] == sortedNums[i-1] {
            i += 1
            continue
        }
        
        var j = i + 1 // here
        var k = sortedNums.count - 1
        
        
        while j < k {
            let sum = sortedNums[i] + sortedNums[j] + sortedNums[k]
            
            if sum == 0 {
                ans.insert([sortedNums[i], sortedNums[j], sortedNums[k]])
                j += 1
                k -= 1
                
                // here
                while j < k && sortedNums[j] == sortedNums[j-1] {
                    j += 1
                }
                while j < k && sortedNums[k] == sortedNums[k+1] {
                    k -= 1
                }
            } else if sum > 0 {
                k -= 1
            } else {
                j += 1
            }
        }
        
        i += 1
    }
    
    return  Array(ans)
}

func rotate(_ nums: inout [Int], _ k: Int) {
    if nums.count == 1 || k == 0 || k == nums.count {
        return
    }
    
    var newNums = [Int]()
    newNums.reserveCapacity(nums.count)
    var i = 0
    var n = nums.count - 1
    
    var ptr1 = k // it is used to rotate the array
    var ptr2 = k // it is used to add left elements in the array
    
    if k > nums.count {
        ptr1 = k % nums.count
        ptr2 = k % nums.count
    }
    

    while i < n {
        if ptr1 != 0 {
            newNums.append(nums[n - ptr1 + 1])
            ptr1 -= 1
        }
        if ptr1 == 0 {
            newNums.append(nums[i - ptr2 + 1])
        }
        
        i += 1
    }
    
    nums = newNums
}

func maxArea(height: [Int]) -> Int {
    
    var maxSum = 0
    var sum = 0
    var n = height.count
    var left = 0
    var right = n - 1
    
    while left <= right {
        if height[left] > height[right] {
            
            sum = (height[left] - (height[left] - height[right])) * (right - 1)
            maxSum = max(maxSum, sum)
            
            right -= 1
        } else {
            sum = (height[right] - (height[right] - height[left])) * left
            maxSum = max(maxSum, sum)
            left += 1
        }
    }
    return maxSum
}


array = [1, 2]
rotate(&array, 7)
print(array)
