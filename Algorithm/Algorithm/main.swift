//
//  main.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/5/22.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

let  array = [1,2,3,4]
productExceptSelf(array)

let numbers = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
 var list = insertionSort(numbers, <)



class A : NSObject {
    public var name  = ""
    override init() {
        
    }
    init(name:String) {
        self.name = name
    }
    
}
var block2: (() -> ())?
if true {
var a: A? = A()
block2 = {
[a] in
print(a?.name)
}
a = A(name: "new name")
}
block2?() //结果是："Optional("old name")"


print("Hello, World!")


var heap =  findKthLargest(array, 2)
print("heap====",heap)

let node1  =  ListNode.init(1)
let node2  =  ListNode.init(2)
let node3  =  ListNode.init(3)
let node4  =  ListNode.init(4)
let node5  =  ListNode.init(5)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

//let res = reverseList(node1)
//let node =   swapPairs(node1)
//successor = node1
//
var isNoNeed = false
let node = reverseKGroup(node1, 3)

//let node = reverseNGroup_new(node1, node1, 4, &isNoNeed)


print("node===",node?.val)





