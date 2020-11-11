//
//  MergeList.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/5/28.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 21. 合并两个有序链表
 将两个升序链表合并为一个新的升序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

 示例：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 */

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    guard let l1 = l1 else {
        return l2
    }
    guard let l2 = l2 else {
        return l1
    }
    if l1.val < l2.val {
        l1.next = mergeTwoLists(l1.next, l2)
        return l1
    }else{
        l2.next = mergeTwoLists(l2.next, l1)
        return l2
    }
}
/**
 23. 合并K个排序链表
 合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。

 示例:

 输入:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 输出: 1->1->2->3->4->4->5->6
 
 */
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {

   // guard  lists.count  else { return nil }
    
    switch lists.count {
    case 0:
        return nil
    case 1:
        return lists[0]
    case 2:
        return mergeTwoLists(lists[0], lists[1])
    default:
        let count = lists.count
        return mergeTwoLists(mergeKLists(Array(lists[0...count/2])), mergeKLists(Array(lists[count/2+1..<count])))
        
    }
   

    
}
