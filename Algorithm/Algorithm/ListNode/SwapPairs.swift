//
//  SwapPairs.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/5/28.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 24. 两两交换链表中的节点
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。

 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

  

 示例:

 给定 1->2->3->4, 你应该返回 2->1->4->3.
 */
public func swapPairs(_ head: ListNode?) -> ListNode? {
    
    if head?.next == nil || head == nil {
        return head
    }
    
    let result = head?.next
    
    
    let node =   swapPairs(head?.next?.next)
    
    result?.next = head
    head?.next = node
    
    
    
    return result
}
