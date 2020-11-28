//
//  RotateListNode.swift
//  Algorithm
//
//  Created by longxd on 2020/5/30.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 61. 旋转链表
 给定一个链表，旋转链表，将链表每个节点向右移动 k 个位置，其中 k 是非负数。
 
 示例 1:
 
 输入: 1->2->3->4->5->NULL, k = 2
 输出: 4->5->1->2->3->NULL
 解释:
 向右旋转 1 步: 5->1->2->3->4->NULL
 向右旋转 2 步: 4->5->1->2->3->NULL
 示例 2:
 
 输入: 0->1->2->NULL, k = 4
 输出: 2->0->1->NULL
 解释:
 向右旋转 1 步: 2->0->1->NULL
 向右旋转 2 步: 1->2->0->NULL
 向右旋转 3 步: 0->1->2->NULL
 向右旋转 4 步: 2->0->1->NULL
 */
public  func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {//解题思路先把链表变成环,然后找到旋转的地方断开旋转
    if head == nil {
        return head
    }
    var length =  1
    var end = head
    while end?.next != nil {
        end = end?.next
        length += 1
    }
    
    end?.next = head
    var  count = (length - k%length)%length
    var res = head
    while count > 0 {
        res = res?.next
        end = end?.next
        count -= 1
    }
    end?.next = nil

    return res
    
}
