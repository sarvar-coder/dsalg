import UIKit

var greeting = "Hello, playground"

// MARK: - Countdown example of recursion
func countdown(_ n: Int) {
    print(n)
    if n <= 1 {
        return  // base case
    } else {
        countdown(n - 1)  // recursive case
    }
}
//countdown(10)

// MARK: - Factorial example of recursion

func factorialOf(_ n: Int) -> Int {
    if n == 1 {
        return 1
    } else {
     return  n * factorialOf(n - 1)
    }
}

factorialOf(3)
