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
    let s = converting(s)
    
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

func converting(_ s: String) -> [Character] {
    
    var temp = [Character]()
    
    for char in s.lowercased() {
        if  String(char).rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil  {
            temp.append(char)
        }
    }
    return temp
}
1
