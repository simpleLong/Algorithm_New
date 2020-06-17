//
//  SortList.swift
//  Algorithm
//
//  Created by longxd on 2020/5/31.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 148. 排序链表
 在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序。

 示例 1:

 输入: 4->2->1->3
 输出: 1->2->3->4
 示例 2:

 输入: -1->5->3->4->0
 输出: -1->0->3->4->5
 */

 //MARK: 使用二分排序法
func sortList(_ head: ListNode?) -> ListNode? {
    
    if head == nil || head?.next == nil {
        return head
    }

    let middle = middleNode(head)
    let next = middle?.next
    
    middle?.next = nil
    let left = sortList(head)
    let right = sortList(next)
    
    return mergeTwolists(left, right)

}

func middleNode( _ head: ListNode?) -> ListNode? {
    
    guard let head = head else {
        return nil
    }
    var slow : ListNode? = head
    var fast : ListNode? = head.next?.next
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    return slow
}

private func mergeTwolists(_ l1 :ListNode? , _ l2 :ListNode?) -> ListNode? {
    guard let l1 = l1 else {
        return l2
    }
    guard let l2 = l2 else {
        return l1
    }
    if l1.val < l2.val {
        l1.next = mergeTwolists(l1.next, l2)
        return l1
    }else{
        l2.next = mergeTwolists(l2.next, l1)
        return l2
    }
}
