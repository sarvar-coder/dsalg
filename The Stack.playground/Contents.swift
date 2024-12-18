import UIKit

var greeting = "Hello, playground"

class Stack<Element: Equatable> {
    private(set) var container = [Element]()
    
    
    func isEmpty() -> Bool {
        container.count == 0
    }
    
    func isNotEmpty() -> Bool {
        container.count != 0
    }
    
    func push(_ element: Element) {
        container.insert(element, at: 0)
    }
    
    func pop() {
        if isEmpty() {
            print("Stack is empty")
        } else {
            container.remove(at: 0)
        }
    }
    
    func remove(_ element: Element) {
        guard let index = container.firstIndex(of: element) else { return }
        container.remove(at: index)
    }
    
    func peek()  {
        guard let last = container.last else {
            print("Stack is empty")
            return
        }
        print(last)
    }
}

var stack = Stack<Int>()

var array = [1, 2, 3, 4, 5, 6, 7, 8, 9]

