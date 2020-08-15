//
//  main.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/5/22.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation



var successor : ListNode?

func reverNList(head: ListNode? ,n :Int) -> ListNode? {
    if n == 1 || head?.next == nil {
        successor = head?.next
        return head
    }
    let last = reverNList(head: head?.next, n: n-1)
    head?.next?.next = head
    head?.next = successor
    
    return last
    
}
func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {

    
    if head?.next == nil {
        return head
    }

    
    var successor  = head
    var isNeedReverse = true
    
    for i in 0..<k {
        if i == k-1  {
            if successor == nil {
                isNeedReverse = false
            }
        }
        successor = successor?.next
    }
    if isNeedReverse == false {
        return head
    }
    let last = reverseKGroup(successor, k)
    
    let startNode = reverNList(head: head, n: k)
    head?.next = last
    
    return startNode


}
let node1  =  ListNode.init(1)
let node2  =  ListNode.init(2)
let node3  =  ListNode.init(3)
let node4  =  ListNode.init(4)
let node5  =  ListNode.init(5)
//let node6  =  ListNode.init(6)
//let node7  =  ListNode.init(7)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
//node5.next = node6
//node6.next = node7

let result =   reverseKGroup(node1, 3)  //reverNList(head: node1, n: 5)   //reverseKGroup(node1, 3)
print(result)


//let res = reverseList(node1)
//let node =   swapPairs(node1)
//successor = node1
//
//var isNoNeed = false
//let node = reverseKGroup(node1, 3)
//let node = reverseNeighborList(head: node1)

//let node = reverseNGroup_new(node1, node1, 4, &isNoNeed)


//print("node===",node?.val)





