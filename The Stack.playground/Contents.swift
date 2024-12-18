import UIKit

var greeting = "Hello, playground"

class Stack<Element: Equatable> {
    private(set) var container = [Element]()
    
    init(container: [Element]) {
        self.container = container
    }
    
    func isEmpty() {
        container.count == 0
    }
    
    func isNotEmpty() {
        container.count != 0
    }
    
    func push(_ element: Element) {
        container.insert(element, at: 0)
    }
    
    func pop() {
        container.remove(at: 0)
    }
    
    func remove(_ element: Element) {
        guard let index = container.firstIndex(of: element) else { return }
        container.remove(at: index)
    }
}

var stack = Stack(container: ["shshs", "ksjdbv", "n s", "ashdv "])
print(stack.container)
stack.push("bskd")
print(stack.container)
stack.pop()
print(stack.container)
stack.remove("n s")
print(stack.container)
