import UIKit

var greeting = "Hello, playground"

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
var one = [-1,0,0,3,3,3,0,0,0]
let two = [1,2,3]

merge(&one, 6, two, 3)
print(one)

