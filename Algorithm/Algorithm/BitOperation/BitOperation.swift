//
//  BitOperation.swift
//  Algorithm
//
//  Created by longxd on 2020/11/15.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

func findDuplicateNumbers(nums : [Int]) -> [Int] {
    if nums.count == 0 {
        return []
    }
    var res : [Int] = []
    let n = nums.count/32 + 1
    var array : [Int] = Array<Int>.init(repeating: 0, count: n)
    
    for num in nums {
        let index = num/32 ,shift = num%32
        if array[index] & (1 << shift) != 0 {
            res.append(num)
        }
        
        array[index] |= 1 << shift
        
    }
    return res
}

func removeDuplicateNodes(node : ListNode?) -> ListNode? {
    //假设Int 为 64 位,链表储存的值都在100以内
    if node == nil {
        return  nil
    }
    var array = [Int].init(repeating: 0, count: 2)
    var removeDupNode = node
    var preNode : ListNode? = ListNode(1)
    preNode?.next = removeDupNode
    
    
    while removeDupNode != nil {
        let num = removeDupNode!.val
        let index = num/64 ,shift =  num%64
        if array[index] & (1 << shift) != 0 {
            let next = removeDupNode!.next
            if next != nil {
                removeDupNode!.val = next!.val
                removeDupNode!.next = next?.next
            }else{

                preNode?.next = nil
                removeDupNode = nil
            }
            
            
        }else{
            removeDupNode = removeDupNode?.next
            preNode = preNode?.next
        }
        array[index] |= 1 << shift

    }
    return node
}
