//
//  GetIntersectionNode.swift
//  Algorithm
//
//  Created by longxd on 2020/5/31.
//  Copyright © 2020 longxd. All rights reserved.
//

import Foundation
/**
 https://leetcode-cn.com/problems/intersection-of-two-linked-lists/
 */
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    if  headA != nil ||  headB != nil  {
        return nil
    }
    var pa = headA
    var pb = headB
    
    while pa != pb {
        pa = pa == nil ? headB : pa?.next
        pb = pb == nil ? headA : pb?.next
    }
    return pa
}

extension ListNode :Equatable {
            public static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
                return lhs.val == rhs.val && lhs.next == rhs.next
            }
}

//    public class ListNode: Equatable {
//
//        public var val: Int
//        public var next: ListNode?
//
//        public init(_ val: Int) {
//            self.val = val
//            self.next = nil
//        }
//
//        public static func ==(lhs: Solution.ListNode, rhs: Solution.ListNode) -> Bool {
//            return lhs.val == rhs.val && lhs.next == rhs.next
//        }
//    }

