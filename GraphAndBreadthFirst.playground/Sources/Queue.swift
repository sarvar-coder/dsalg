import Foundation

public class Queue<T: Hashable> {
    
    private(set) var elements: Set<T> = []
    
    public init() { }
    
    public func enqueue(_ element: T) {
        elements.insert(element)
    }
    
    public func dequeue() -> T? {
        guard !elements.isEmpty else { return nil }
        
        return elements.removeFirst()
    }
    
    public func peek() -> T? {
        elements.first
    }
    
    public func size() -> Int {
        elements.count
    }
    
    public func isEmpty() -> Bool {
        elements.isEmpty
    }
}
