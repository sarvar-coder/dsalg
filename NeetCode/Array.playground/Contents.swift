import UIKit

var greeting = "Hello, playground"


// MARK: - getConcatenation
func getConcatenation(_ nums: [Int]) -> [Int] {
    return nums + nums
}


// MARK: - containsDuplicate
func containsDuplicate(_ nums: [Int]) -> Bool {
    
    /// first solution
    //    var occurencies = [Int: Int]()
    //
    //    for i in 0...(nums.count - 1) {
    //
    //        occurencies[nums[i], default: 0] += 1
    //        let number = occurencies[nums[i]]
    //
    //
    //        if let number, number > 1 {
    //            return true
    //        }
    //    }
    //
    //    return false
    
    /// second solution
    
    
    return nums.count != Set(nums).count
    
    
}

// MARK: isAnagram
func isAnagram(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    
    var sHash = [Character: Int]()
    
    for i in s {
        sHash[i, default: 0] += 1
    }
    
    for i in t {
        
        if sHash[i] != nil {
            sHash[i]! -= 1
            if sHash[i]! == 0 {
                sHash.removeValue(forKey: i)
            }
        }
        
    }
    
    return sHash.isEmpty
}

// MARK: twoSum

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var first = 0
    
    while first < nums.count {
        print(nums[first], 1)
        
        for i in first...(nums.count - 1) {
            if first == i {
                continue
            }
            
            if (nums[first] + nums[i]) == target {
                return [first, i]
            }
        }
        first += 1
        
    }
    
    
    
    return []
}

// MARK: longestCommonPrefix

func longestCommonPrefix(_ strs: [String]) -> String {
    
    var index = 0
    var common = strs[0]
    
    if strs.count == 1 {
        return common
    }
    
    while index != common.count {
        
        for i in strs {
            
            if common.prefix(index + 1) == i.prefix(index + 1)  {
                continue
            } else {
                return String(common.prefix(index))
            }
        }
        index += 1
    }
    
    return common
}


func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dict = [String: [String]]()
    
    for str in strs {
        let key = String(str.sorted())
        dict[key, default: []].append(str)
    }
    
    return Array(dict.values)
}


// MARK: - removeElement
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        
        if nums[left] == val {
            nums.remove(at: left)
            left -= 1
            right = nums.count - 1
        }
        left += 1
    }
    
    print(nums)
    return nums.count
}
// MARK: - majorityElement
func majorityElement(_ nums: [Int]) -> Int {
    
    var count = 0
    var candidate = 0
    
    for num in nums {
        if count == 0 {
            candidate = num
        }
        if candidate == num {
            count += 1
        } else {
            count -= 1
        }
    }
    
    return candidate
}

// MARK: - design hashset

// MARK: - design hashmap

//MARK: - sortArray
func sortArray(_ nums: [Int]) -> [Int] {
    // nums.sorted(by: <) it is very simply but i want give a try to quick sort
    
    var nums = nums
    if  nums.count <= 1 {
        return nums
    }
    let midIndex = nums.count / 2
    
    // Split actual array into two halves
    let left = nums[0..<midIndex]
    let right = nums[midIndex...(nums.count - 1)]
    
    // Recursion part is here
    var leftSorted = sortArray(Array(left))
    var rightSorted = sortArray(Array(right))
    
    var l = 0
    var r = 0
    var n = 0
    
    // merge sort
    while l < leftSorted.count && r < rightSorted.count {
        if leftSorted[l] < rightSorted[r] {
            nums[n] = leftSorted[l]
            l += 1
        } else {
            nums[n] = rightSorted[r]
            r += 1
        }
        n += 1
    }
    
    while l < leftSorted.count {
        nums[n] = leftSorted[l]
        l += 1
        n += 1
    }
    
    while r < rightSorted.count {
        nums[n] = rightSorted[r]
        r += 1
        n += 1
    }
    
    return nums
}

// MARK: - sortColors

func sortColors(_ nums: inout [Int]) {
    var sorted = [Int]()
    
    for _ in 0...(nums.count - 1) {
        sorted.append(nums.remove(at: findMin(nums)))
    }
    nums = sorted
}

func findMin(_ array: [Int]) -> Int {
    var min = 0
    
    for i in 0...(array.count - 1) {
        if array[min] > array[i] {
            min = i
        }
    }
    return min
}

// MARK: - topKFrequent
func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    
    var k = k
    
    var frequncies = [Int: Int]()
    
    nums.forEach { frequncies[$0, default: 0] += 1 }
    
    var ans = [Int]()
    
    while k != 0 {
        var max = 0
        var topK = 0
        for key in frequncies.keys {
            if max < frequncies[key]! {
                max = frequncies[key]!
                topK = key
                
            }
            
        }
        ans.append(topK)
        frequncies.removeValue(forKey: topK)
        k -= 1
    }
    
    
    return ans
}

// MARK:  - NumMatrix
class NumMatrix {
    
    var prefixSum = [[Int]]()
    
    init(_ matrix: [[Int]]) {
        prefixSum = matrix
        prefixSum = makePrefixSum(prefixSum)
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var row1 = row1 + 1
        var row2 = row2 + 1
        var col1 = col1 + 1
        var col2 = col2 + 1
        
        let bottomRight = prefixSum[row2][col2]
        let above = prefixSum[row1 - 1][col2]
        let left = prefixSum[row2][col1 - 1]
        let topLeft = prefixSum[row1 - 1][col1 - 1]
        
        
        return bottomRight - above - left + topLeft
    }
    
    func makePrefixSum(_ matrix: [[Int]]) -> [[Int]] {
        guard !matrix.isEmpty else { return [] }
        let m = matrix.count
        let n = matrix[0].count
        
        self.prefixSum = Array(
            repeating: Array(repeating: 0, count: n + 1),
            count: m + 1
        )
        
        for i in 0..<m {
            var prefix = 0
            for j in 0..<n {
                self.prefixSum[i + 1][j + 1] = self.prefixSum[i][j + 1] + self.prefixSum[i + 1][j] - self.prefixSum[i][j] + matrix[i][j]
                
            }
        }
        
        return prefixSum
    }
}

// MARK:  - productExceptSelf
func productExceptSelf(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var leftProducts = Array(repeating: 1, count: n)
    var rightProducts = Array(repeating: 1, count: n)
    var result = Array(repeating: 0, count: n)
    
    for i in 1...(n - 1) {
        leftProducts[i] = leftProducts[i - 1] * nums[i - 1]
    }
    for i in stride(from: n - 2, through: 0, by: -1) {
        rightProducts[i] = rightProducts[i + 1] * nums[i + 1]
    }
    
    for i in 0...(n - 1) {
        result[i] = leftProducts[i] * rightProducts[i]
    }
    
    return result
}
// MARK:  - checkValid
func checkValid(_ matrix: [[Int]]) -> Bool {
    
    let n = matrix.count
    var col = Set<Int>()
    var row = Set<Int>()
    for i in 0...(n - 1) {
        for j in 0...(n - 1) {
            row.insert(matrix[i][j])
            col.insert(matrix[j][i])
        }
        if row.count != n || col.count != n {
            return false
        }
        col.removeAll(keepingCapacity: true)
        row.removeAll(keepingCapacity: true)
        
    }
    return  true
}

// MARK:  - isValidSudoku
func isValidSudoku(_ board: [[Character]]) -> Bool {
    
    let n = board.count
    var col = [Character: Int]()
    var row = [Character: Int]()
    
    for i in 0...(n - 1) {
        
        for j in 0...(n - 1) {
            
            row[board[i][j], default: 0] += 1
            col[board[j][i], default: 0] += 1
            
            if board[i][j] != "." && row[board[i][j]]! > 1 {
                return false
            }
            
            if board[j][i] != "." && col[board[j][i]]! > 1 {
                return false
            }
        }
        row.removeAll(keepingCapacity: true)
        col.removeAll(keepingCapacity: true)
    }
    
    var x1 = 0, y1 = 0
    var x2 = 2, y2 = 2
    
    var subBoard = [Character: Int]()
    
    for i in 1...n {
        
        for row in x1...x2 {
            
            for col in y1...y2 {
                
                subBoard[board[row][col], default: 0] += 1
                
                if board[row][col] != "." && subBoard[board[row][col]]! > 1 {
                    return false
                }
            }
        }
        
        if i % 3 == 0 {
            y1 += 3
            y2 += 3
            x1 = 0
            x2 = 2
        } else {
            x1 += 3
            x2 += 3
        }
        subBoard.removeAll(keepingCapacity: true)
    }
    
    return true
}

// MARK:  - longestConsecutive
func longestConsecutive(_ nums: [Int]) -> Int {
    var nums1 = Set(nums).sorted()
    var curr = 1
    var longest = 0
    
    if nums1.count <= 1 { return nums1.count }
    
    for i in 0..<(nums1.count - 1) {
        if nums1[i + 1] - 1 == nums1[i] {
            curr += 1
            
        } else {
            longest = max(longest, curr)
            curr = 1
        }
    }
    longest = max(longest, curr)
    return longest
}

// MARK: - majorityElement2
func majorityElement2(_ nums: [Int]) -> [Int] {
    var dict = [Int: Int]()
    nums.forEach { dict[$0, default: 0] += 1 }
    var majorities = [Int]()
    
    for key in dict.keys {
        if dict[key]! > nums.count / 3 {
            majorities.append(key)
        }
    }
    
    return majorities
}

// MARK: - maxProfit
func maxProfit(_ prices: [Int]) -> Int {
    var prices = prices
    
    for i in 0..<(prices.count - 1) {
        prices[i] = prices[i + 1] - prices[i]
    }
    
    
    
    
    return 0
}

// MARK: - maxSubArray
func maxSubArray(_ nums: [Int]) -> Int { Int.max }
var array = [1, 2, 3, 4, 5, 6]

func tribonacci(_ n: Int) -> Int {
    var F = Array(repeating: 0, count: 38)
    
    F[0] = 0
    F[1] = 1
    F[2] = 1
    
    for i in 0...n {
        F[i + 3] = F[i] + F[i+1] + F[i+2]
    }
    
    return F[n]
}

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var opening = 0
    var ending = 0
    var n = nums.count - 1
    var count = 0
    
    for i in 0...n {
        
        for j in 0...i {
           
            
        }
    }
    
    
    return count
}

//subarraySum([1, 2, 3], 3)
//print([1, 2, 3][1...1].reduce(0, +))

array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
var  newArr = [[Int]]()
newArr.reserveCapacity(array.count * (array.count - 1))
var j = 0
for i in 0...(array.count - 1) {
    var array2 = array
    for j in 0...(array.count - 1) {
//        newArr.append(array.removingSubranges(j))
        
    }
}

//print(newArr)
let temp = array.prefix(1)
print(temp)
