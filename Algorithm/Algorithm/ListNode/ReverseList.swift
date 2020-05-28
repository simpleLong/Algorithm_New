//
//  ReverseList.swift
//  Algorithm
//
//  Created by 龙晓东 on 2020/5/26.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 206. 反转链表
 反转一个单链表。

 示例:

 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 
 */

 //MARK: 迭代

//public  func reverseList(_ head: ListNode?) -> ListNode? {
//
//    var pre : ListNode? = nil
//    var cur = head
//
//    while cur != nil  {
//
//        (cur!.next,pre,cur) = (pre,cur ,cur?.next)
//
//    }
//
//    return pre
//}
 //MARK: 递归方式
public  func reverseList(_ head: ListNode?) -> ListNode? {

    if head?.next == nil {
        return head
    }
    let p  = reverseList(head?.next)
    head?.next?.next = head
    head?.next = nil
    
    return p
    
}
/**
 92. 反转链表 II
 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。

 说明:
 1 ≤ m ≤ n ≤ 链表长度。

 示例:

 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 输出: 1->4->3->2->5->NULL
 */
func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
if m == 1 {
    return reverseNList(head, n)
}
head?.next = reverseBetween(head?.next, m-1, n-1)
return head
}

var successor : ListNode?

func reverseNList(_ head: ListNode? , _ n : Int) -> ListNode? {
    if n == 1 {
        successor = head?.next
        return head
    }
    let last = reverseNList(head?.next, n-1)
    
    head?.next?.next = head
    head?.next = successor
    return last
    
    
}
