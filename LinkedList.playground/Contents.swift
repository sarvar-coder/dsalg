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
    
    func printList() {
        var temp = self.head
        
        while temp != nil {
            print((temp?.data)!)
            temp = temp?.next
        }
    }
    
    func push(newData: String) {
        // create new Node
        let newNode = Node(data: newData)
        // list boshini keyingi oringa suramiz
        newNode.next = head
        // yangi node list boshiga qoyamiz
        head = newNode
    }
    
    func insertAfter(prevNode: Node?, newData: String) {
        if prevNode == nil { return }
        
        // create new node
        let newNode = Node(data: newData)
        // yangi tugunni keyingi tugunga bog'laymiz
        newNode.next = prevNode?.next
        // avvalgi tugunni yangi tugunga bog'laymiz
        prevNode?.next = newNode
    }
    
    func append(newData: String) {
        
        let newNode = Node(data: newData)
        
        if head == nil {
            head = newNode
            return
        }
        
        var last = head
        
        while last?.next != nil {
            last  = last?.next
        }
        
        last?.next = newNode
    }
    
    func delete(key: String) {
        // defining
        var temp =  head
        var prev = head
        // check out first node
        
        if temp != nil && temp?.data == key {
            head = temp?.next
            temp = nil
            return
        }
        
        while temp?.next != nil {
    
            if temp?.data == key {
                break
            }
            
            prev = temp
            temp = temp?.next
            
        
        }
        
        if temp?.data != key {
            print("not found")
            return
        }
        // if not found
        if temp == nil {
            print("not found")
            return
        }
            // delete the node
            prev?.next = temp?.next
            temp = nil
    }
}

let lList = LinkedList()
lList.head = Node(data: "Ponedelnik")
let vtrornik = Node(data: "Vtornik")
let sreda = Node(data: "Sreda")

lList.head?.next = vtrornik
vtrornik.next = sreda
sreda.next = Node(data: "chetverg")


lList.insertAfter(prevNode: sreda.next, newData: "pyatnistsa")
lList.append(newData: "subota")
lList.delete(key: "d")
lList.printList()

