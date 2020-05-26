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
public  func reverseList(_ head: ListNode?) -> ListNode? {

    var pre : ListNode? = nil
    var cur = head
    
    while cur != nil  {

        (cur!.next,pre,cur) = (pre,cur ,cur?.next)
        print("cur===",cur?.val)
     
        
    }
    
    return pre
}
