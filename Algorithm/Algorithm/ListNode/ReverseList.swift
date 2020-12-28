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
//
//    if head?.next == nil {
//        return head
//    }
//    let result = reverseList(head?.next)
//
//    head?.next?.next = head
//    head?.next = nil
//
//    return result
//
//}
//
//MARK: 递归方式
public  func reverseList(_ head: ListNode?) -> ListNode? {
    
    if head == nil || head?.next == nil{
        return head
    }

    
    let res = reverseList(head?.next)
    head?.next?.next = head
    head?.next = nil
    
    return res
    
    
    
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
    
    if m == 1{
        return reverseNList(head, n)
    }
    head?.next = reverseBetween(head?.next, m-1, n-1)
    return head
}

var successor : ListNode?

// MARK: -反转前N个节点的链表
func reverseNList(_ head: ListNode? , _ n : Int) -> ListNode? {
    
    
    if n == 1 {
        successor = head?.next
        return head
    }
    
    let next = head?.next
    let last  = reverseNList(head?.next, n-1)
    next?.next = head
    head?.next = successor
    return last
    

    
}
/**
 
 25. K 个一组翻转链表
 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。
 
 k 是一个正整数，它的值小于或等于链表的长度。
 
 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。
 
 
 
 示例：
 
 给你这个链表：1->2->3->4->5
 
 当 k = 2 时，应当返回: 2->1->4->3->5
 
 当 k = 3 时，应当返回: 3->2->1->4->5
 
 
 
 说明：
 
 你的算法只能使用常数的额外空间。
 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。
 通过次数71,150提交次数116,401
 */


var lastHead :ListNode?

public  func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    
    
    var count = k
    var start = 1
    var end  = head
    var res = head
    var succesor : ListNode?
    while end != nil {
        
        while  count > 1 {
            end = end?.next
            
            count = count - 1
            succesor = end?.next
            
        }
        if end != nil {
            res = reverseBetween(res, start, start+k-1)
            
            start = start + k
            count = k
            end = succesor
        }
        
    }
    return res
    
}

func reverseList(head: ListNode?) -> ListNode? {
    
    var pre :ListNode?
    var cur = head
    
    while cur != nil {
        let next = cur?.next
        
        cur?.next = pre
        pre = cur
        cur = next
    }
    
    return pre
}

// MARK: -反转相邻节点

public func reverseNeighborList(head: ListNode?) -> ListNode?{
    var pre : ListNode? = nil
    var cur = head
    if head == nil {
        return nil
    }
    if head?.next == nil {
        return head
    }
    let result = head?.next
    var isHead = true
    
    
    
    while cur != nil {
        
        let next = cur?.next?.next
        if isHead == false {
            pre = cur?.next
        }
        isHead = false
        
        cur?.next?.next = cur
        
        cur?.next = pre
        
        cur = next
        
    }
    return result
    
}
