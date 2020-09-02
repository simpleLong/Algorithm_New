//
//  Circle.swift
//  Algorithm
//
//  Created by longxd on 2020/8/22.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation

func detectCycle(_ head: ListNode?) -> ListNode? {
    if head == nil  {
        return head
    }
    var fast = head
    var slow = head
    
    while fast?.next != nil && fast != nil{
        slow = slow?.next
        fast = fast?.next?.next
        if fast?.val == slow?.val {

            break
        }
    }
    if fast == nil || fast?.next == nil {
        return nil
    }
    slow = head
    while slow?.val != fast?.val {
        slow = slow?.next
        fast = fast?.next
    }
    
    return slow

    
}
