import UIKit

var greeting = "Hello, playground"
  

class Node {
    let data: String
    var next: Node?
    
    init(data: String, next: Node? = nil) {
        self.data = data
    }
}

class LinkedList {
    var head: Node?
    
    init(head: Node? = nil) {
  
    }
}

let lList = LinkedList()
lList.head = Node(data: "Ponedelnik")
let vtrornik = Node(data: "Vtornik")
let sreda = Node(data: "Sreda")

lList.head?.next = vtrornik
vtrornik.next = sreda
sreda.next = Node(data: "chetverg")

print((lList.head?.next?.data)!)
